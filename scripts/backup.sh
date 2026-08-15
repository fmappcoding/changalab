#!/usr/bin/env bash
# =============================================================================
# ChangaLab — Database backup & restore utility
#
# Takes a timestamped, gzipped dump of the `changalab` database and stores it
# under `backups/`. Also supports restoring from a dump.
#
# How to use inside the Codespace (local):
#   bash scripts/backup.sh backup            # create a new dump
#   bash scripts/backup.sh restore backups/changalab-20260815-221000.sql.gz
#   bash scripts/backup.sh list
#
# How to use FROM YOUR MACHINE (remote Codespace):
#   CODESAPCE=laughing-yodel-g4r75gx69x5whv4p7
#   # 1) dump remotely then pull it locally
#   gh codespace ssh --codespace $CODESAPCE -- "bash /workspaces/changalab/scripts/backup.sh backup"
#   gh codespace cp $CODESAPCE:/workspaces/changalab/backups/<file>.sql.gz ./backups/
#
# This protects you if the Codespace is DELETED: the dump lives on your local
# disk and can be restored into a fresh Codespace later.
# =============================================================================
set -euo pipefail

# ---- Config (match your installer / .env values) ----------------------------
DB_NAME="${DB_NAME:-changalab}"
DB_USER="${DB_USER:-changalab}"
DB_PASS="${DB_PASS:-changalab123}"
DB_HOST="${DB_HOST:-127.0.0.1}"
DB_PORT="${DB_PORT:-3306}"
BACKUP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/backups"

# mysqldump may live outside PATH on the Codespace image
MYSQLDUMP="$(command -v mysqldump 2>/dev/null || true)"
MYSQL="$(command -v mysql 2>/dev/null || true)"
if [ -z "$MYSQLDUMP" ] && [ -x "/home/codespace/.php/current/bin/mysqldump" ]; then
  MYSQLDUMP="/home/codespace/.php/current/bin/mysqldump"
  MYSQL="/home/codespace/.php/current/bin/mysql"
fi

mkdir -p "$BACKUP_DIR"

usage() {
  grep '^#' "$0" | sed 's/^# \{0,1\}//'
  exit 1
}

cmd="${1:-}"

case "$cmd" in
  backup)
    ts="$(date +%Y%m%d-%H%M%S)"
    out="$BACKUP_DIR/${DB_NAME}-${ts}.sql.gz"
    echo "==> Dumping database '$DB_NAME' -> $out"
    # --no-tablespaces avoids needing global privileges; --single-transaction
    # keeps the dump consistent for InnoDB.
    MYSQL_PWD="$DB_PASS" "$MYSQLDUMP" \
      -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" \
      --no-tablespaces --single-transaction "$DB_NAME" \
      | gzip > "$out"
    echo "==> Done: $(du -h "$out" | cut -f1) written to $out"
    ;;

  restore)
    src="${2:-}"
    [ -n "$src" ] || { echo "ERROR: provide a dump file to restore"; usage; }
    [ -f "$src" ] || { echo "ERROR: file not found: $src"; exit 1; }
    echo "==> Restoring '$DB_NAME' from $src"
    if [[ "$src" == *.gz ]]; then
      gunzip -c "$src"
    else
      cat "$src"
    fi | MYSQL_PWD="$DB_PASS" "$MYSQL" -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" "$DB_NAME"
    echo "==> Restore complete."
    ;;

  list)
    echo "==> Backups in $BACKUP_DIR:"
    ls -lh "$BACKUP_DIR" 2>/dev/null | awk 'NR>1{print $5, $9}'
    ;;

  *)
    usage
    ;;
esac
