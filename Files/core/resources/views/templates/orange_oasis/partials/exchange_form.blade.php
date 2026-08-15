<div class="custom-widget mb-4">
    <form action="{{ route('exchange.start') }}" method="POST" id="exchange-form" class="disableSubmission">
        @csrf
        <div class="row">
            <div class="col-md-6">
                <h6 class="banner__widget-title mb-3 mt-0">@lang('You Send')</h6>
                <div class="form-group mb-3">
                    <div class="select-item">
                        <select required class="select2 form-control form--control" data-type="select"
                                name="sending_currency" id="send">
                            <option value="" selected disabled>@lang('Select One')</option>
                            @foreach ($sellCurrencies as $sellCurrency)
                                <option
                                        data-image="{{ getImage(getFilePath('currency') . '/' . @$sellCurrency->image, getFileSize('currency')) }}"
                                        data-min="{{ $sellCurrency->minimum_limit_for_buy }}"
                                        data-max="{{ $sellCurrency->maximum_limit_for_buy }}"
                                        data-buy="{{ $sellCurrency->buy_at }}"
                                        data-show_number="{{ @$sellCurrency->show_number_after_decimal }}"
                                        data-currency="{{ @$sellCurrency->cur_sym }}" value="{{ $sellCurrency->id }}"
                                        data-select-for="send" @selected(old('sending_currency') == $sellCurrency->id)>
                                    {{ __($sellCurrency->name) }} - {{ __($sellCurrency->cur_sym) }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group mb-3">
                    <label for="" class="form-label fw-medium">@lang('Send Amount')</label>
                    <div class="input-group">
                        <input type="number" step="any" class="form-control form--control rounded"
                               name="sending_amount" id="sending_amount" value="{{ old('sending_amount') }}"
                               placeholder="0.00">
                        <span class="input-group-text d-none bg--base text-white border-0"></span>
                    </div>
                </div>
                <div class="rate--txt d-none">
                    <div>
                        <span>@lang('Limit:')</span>
                        <span class="limit-exchange">
                            <span class="text--base"></span>
                            <span class="currency_name"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <h6 class="mb-3 mt-0">@lang('You Get')</h6>
                <div class="form-group mb-3" id="receiving-currency-wrapper">
                    <div class="select-item ">
                        <select class="select2 form-control form--control" name="receiving_currency" id="receive"
                                required value.bind="selectedThing2">
                            <option value="" selected disabled>@lang('Select One')</option>
                            @foreach ($buyCurrencies as $buyCurrency)
                                <option
                                        data-image="{{ getImage(getFilePath('currency') . '/' . @$buyCurrency->image, getFileSize('currency')) }}"
                                        data-sell="{{ $buyCurrency->sell_at }}"
                                        data-currency="{{ @$buyCurrency->cur_sym }}"
                                        data-min="{{ $buyCurrency->minimum_limit_for_sell }}"
                                        data-max="{{ $buyCurrency->maximum_limit_for_sell }}"
                                        data-reserve="{{ $buyCurrency->reserve }}"
                                        data-show_number="{{ @$buyCurrency->show_number_after_decimal }}"
                                        value="{{ $buyCurrency->id }}" data-select-for="received"
                                        @selected(old('receiving_currency') == $buyCurrency->id)>
                                    {{ __($buyCurrency->name) }} - {{ __($buyCurrency->cur_sym) }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group mb-3">
                    <label for="" class="form-label fw-medium">@lang('Get Amount')</label>
                    <div class="input-group">
                        <input type="number" step="any" class="form-control form--control rounded"
                               id="receiving_amount" name="receiving_amount" value="{{ old('receiving_amount') }}"
                               placeholder="0.00">
                        <span class="input-group-text d-none bg--base text-white border-0"></span>
                    </div>
                </div>
                <div class="rate--txt-received d-none">
                    <div>
                        <span>@lang('Limit:')</span>
                        <span class="limit-received-exchange">
                            <span class="text--base"></span>
                            <span class="currency_name"></span>
                        </span>
                        <span>@lang('| Reserve:')</span>
                        <span class="reserve-amount">
                            <span class="text--base"></span>
                            <span class="currency_name"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-md-12 text-center">
                <button class="btn btn--base mt-2 w-100" type="submit">
                    <span class="me-2"> <i class="las la-exchange-alt"></i></span>@lang('Exchange Now')
                </button>
            </div>
            <div class="card custom--card best-rate-slide d-none mt-3 border-0 shadow-none">
                <div class="card-body p-0">
                    <div class="d-flex flex-column align-items-start">
                        <ul class="best-rate-list w-100 justify-content-center"></ul>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

@push('style-lib')
    <link href="{{ asset('assets/global/css/select2.min.css') }}" rel="stylesheet">
@endpush

@push('script-lib')
    <script src="{{ asset('assets/global/js/select2.min.js') }}"></script>
@endpush

@push('script')
    <script>
        "use strict";
        (function($) {
            let sendId, sendMinAmount, sendMaxAmount, sendAmount, sendCurrency, sendCurrencyBuyRate;
            let receivedId, receivedAmount, receivedCurrency, receiveCurrencySellRate, sendShowNumber, receivingShowNumber;

            $('.select2').select2({
                templateResult: formatState
            });

            function formatState(state) {
                if (!state.id) return state.text;
                let selectType = $(state.element).data('select-for').toUpperCase();

                if (sendId && selectType == 'RECEIVED' && sendId == state.element.value) return false;
                if (receivedId && selectType == 'SEND' && receivedId == state.element.value) return false;

                return $('<img class="ms-1"   src="' + $(state.element).data('image') + '"/> <span class="ms-3">' +
                    state.text + '</span>');
            }

            $(document).ready(function() {
                let selectedSendId = null;
                let selectedReceiveId = null;

                $('[name=sending_currency]').on('change', function() {
                    selectedSendId = $(this).val();
                    selectedReceiveId = $('[name=receiving_currency]').val();

                    if (selectedSendId && selectedReceiveId) {
                        fetchBestRates(selectedSendId, selectedReceiveId);
                    } else {
                        $(".best-rate-slide").addClass("d-none").removeClass("show");
                    }
                });

                $('[name=receiving_currency]').on('change', function() {
                    selectedReceiveId = $(this).val();
                    if (selectedSendId && selectedReceiveId) {
                        fetchBestRates(selectedSendId, selectedReceiveId);
                    } else {
                        $(".best-rate-slide").addClass("d-none").removeClass("show");
                    }
                });

                function fetchBestRates(sendId, receiveId) {
                    $.ajax({
                        url: `{{ route('exchange.best.rates') }}`,
                        type: "GET",
                        data: {
                            sending_currency: sendId,
                            receiving_currency: receiveId
                        },
                        beforeSend: function() {
                            $(".best-rate-list").html(
                                '<li class="list-group-item text-center">Loading...</li>');
                            $(".best-rate-slide").removeClass("d-none").addClass("show");
                        },
                        success: function(response) {
                            if (response.rates && response.rates.length > 0) {
                                updateBestRatesUI(response.rates);
                            } else {
                                $(".best-rate-list").html(
                                    '<li class="list-group-item text-warning text-center">No rates available</li>'
                                );
                                $(".best-rate-slide").removeClass("show").addClass("d-none");
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error("Error fetching best rates:", error);
                            $(".best-rate-list").html(
                                '<li class="list-group-item text-danger text-center">Failed to load rates</li>'
                            );
                            $(".best-rate-slide").removeClass("show").addClass("d-none");
                        }
                    });
                }

                function updateBestRatesUI(rates) {
                    let rateList = $(".best-rate-list");
                    rateList.empty();

                    if (rates.length === 0) {
                        rateList.html(
                            '<li class="list-group-item text-warning text-center">No rates available</li>');
                        return;
                    }

                    rates.forEach(rate => {
                        let rateValue = parseFloat(rate.rate);
                        let listItem = `
                            <li class="list-group-item d-flex justify-content-between">
                                <span class="fw-600">
                                    <span>1</span> ${rate.sending_currency}-${rate.send_currency_symbol}  =  
                                    ${isNaN(rateValue) || rateValue <= 0 ? '<span class="text-danger">N/A</span>' : `<span class="text--base">${rateValue.toFixed(rate.receive_show_number)}</span>`} 
                                    ${rate.receiving_currency}-${rate.receive_currency_symbol}
                                </span>
                            </li>
                        `;
                        rateList.append(listItem);
                    });
                }

            });

            @if (old('sending_currency'))
                sendAmount = "{{ old('sending_amount') }}";
                sendAmount = parseFloat(sendAmount);
                $("#sending_amount").val(sendAmount.toFixed("{{ gs('show_number_after_decimal') }}"));
                setTimeout(() => {
                    $('#send').trigger('change');
                });
            @endif

            @if (old('receiving_currency'))
                receivedAmount = "{{ old('receiving_amount') }}";
                receivedAmount = parseFloat(receivedAmount);
                $("#receiving_amount").val(receivedAmount.toFixed("{{ gs('show_number_after_decimal') }}"));
                setTimeout(() => {
                    $('#receive').trigger('change');
                });
            @endif

            $('[name=sending_currency]').on('change', function(e) {
                sendId = parseInt($(this).val());
                sendMinAmount = parseFloat($(this).find(':selected').data('min'));
                sendMaxAmount = parseFloat($(this).find(':selected').data('max'));
                sendCurrency = $(this).find(':selected').data('currency');
                sendCurrencyBuyRate = $(this).find(':selected').data('buy');
                sendShowNumber = $(this).find(':selected').data('show_number');

                console.log(sendMinAmount, sendShowNumber);


                $('.limit-exchange').find('.text--base').text(
                    `${sendMinAmount.toFixed(sendShowNumber)}- ${sendMaxAmount.toFixed(sendShowNumber)}`);
                $('.limit-exchange').find('.currency_name').text(sendCurrency);
                $('.rate--txt').removeClass('d-none');

                $("#sending_amount").siblings('.input-group-text').removeClass('d-none');
                $("#sending_amount").removeClass('rounded');
                $("#sending_amount").siblings('.input-group-text').text(sendCurrency);

                if (sendId) {
                    $(this).closest('.form-group').find('.select2-selection__rendered').html(
                        `<img src="${$(this).find(':selected').data('image')}" class="currency-image"/> ${$(this).find(':selected').text()}`
                    )
                    calculationReceivedAmount();
                }
            });

            $('[name=receiving_currency]').on('change', function(e) {
                receivedId = parseInt($(this).val());
                receiveCurrencySellRate = $(this).find(':selected').data('sell');
                receivedCurrency = $(this).find(':selected').data('currency');

                let minAmount = parseFloat($(this).find(':selected').data('min'));
                let maxAmount = parseFloat($(this).find(':selected').data('max'));
                let reserveAmount = parseFloat($(this).find(':selected').data('reserve'))
                receivingShowNumber = $(this).find(':selected').data('show_number');

                $('.limit-received-exchange').find('.text--base').text(
                    `${minAmount.toFixed(receivingShowNumber)} - ${maxAmount.toFixed(receivingShowNumber)}`);
                $('.reserve-amount').find('.text--base').text(`${reserveAmount.toFixed(receivingShowNumber)}`);
                $('.limit-received-exchange').find('.currency_name').text(receivedCurrency);
                $('.reserve-amount').find('.currency_name').text(receivedCurrency);
                $('.rate--txt-received').removeClass('d-none');

                $("#receiving_amount").siblings('.input-group-text').removeClass('d-none');
                $("#receiving_amount").removeClass('rounded');
                $("#receiving_amount").siblings('.input-group-text').text(receivedCurrency);

                if (receivedId) {
                    $(this).closest('.form-group').find('.select2-selection__rendered').html(
                        `<img src="${$(this).find(':selected').data('image')}" class="currency-image"/> ${$(this).find(':selected').text()}`
                    )
                    calculationReceivedAmount();
                }
            });

            $('#exchange-form').on('input', '#sending_amount', function(e) {
                sendAmount = parseFloat(this.value);
                if (sendAmount < 0) {
                    sendAmount = 0;
                    notify('error', 'Negative amount is not allowed');
                    $(this).val('');
                    $('input[name="receiving_amount"]').val('');
                } else {
                    calculationReceivedAmount();
                }
            });

            $('#exchange-form').on('input', '#receiving_amount', function(e) {
                receivedAmount = parseFloat(this.value);
                if (receivedAmount < 0) {
                    notify('error', 'Negative amount is not allowed');
                    receivedAmount = 0;
                    $(this).val('');
                    $('input[name="sending_amount"]').val('');
                } else {
                    calculationSendAmount();
                }
            });

            const calculationReceivedAmount = () => {
                if (!sendId && !receivedId && !sendCurrencyBuyRate && !receiveCurrencySellRate) {
                    return false;
                }
                let amountReceived = sendCurrencyBuyRate / receiveCurrencySellRate * sendAmount;
                $("#receiving_amount").val(parseFloat(amountReceived).toFixed(receivingShowNumber));
            }

            const calculationSendAmount = () => {
                if (!sendId && !receivedId && !sendCurrencyBuyRate && !receiveCurrencySellRate) {
                    return false;
                }
                let amountReceived = (receiveCurrencySellRate / sendCurrencyBuyRate) * receivedAmount;
                $("#sending_amount").val(amountReceived.toFixed(sendShowNumber));
            }
        })(jQuery);
    </script>
@endpush

@push('style')
    <style>
        .select2-container .select2-selection--single {
            height: 46px;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 40px;
        }

        .select2-container--default img {
            width: 28px;
            height: 28px;
            object-fit: contain;
        }

        .select2-results__option--selectable {
            display: flex;
        }

        .select2-container--default .select2-selection--single .select2-selection__arrow b {
            top: 80%;
        }

        img.currency-image {
            width: 25px;
            height: 25px;
            margin-right: 8px;
        }

        .select2-container--default .select2-selection--single {
            border: 1px solid hsl(var(--border));
        }

        .select2-results__option:empty {
            display: none !important;
        }

        .best-rate-slide {
            transition: all 0.3s ease-in-out;
            opacity: 0;
            transform: translateY(10px);
            display: none;
        }

        .best-rate-slide.show {
            opacity: 1;
            transform: translateY(0);
            display: block;
        }

        .best-rate-item {
            cursor: pointer;
        }

        /* style best rate list design  */

        .best-rate-list {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            font-size: 14px;
        }

        .best-rate-list .list-group-item {
            position: relative;
            font-size: 0.875rem;
            background: #f2f2f2;
            padding: 7px 13px;
            border-radius: 5px;
        }

        .fw-600 {
            font-weight: 600;
        }
    </style>
@endpush
