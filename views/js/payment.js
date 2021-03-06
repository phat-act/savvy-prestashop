$(function () {
    var $container = $('#savvy');
    window.savvy = new Savvy({
        button: '#savvy-all',
        fiatValue: $container.data('fiat-value'),
        currencies: $container.data('currencies'),
        statusUrl: $container.data('status'),
        redirectTo: $container.data('redirect'),
        fiatCurrency: $container.data('currency-iso'),
        fiatSign: $container.data('currency-sign'),
        minOverpaymentFiat: $container.data('min-overpayment-fiat'),
        maxUnderpaymentFiat: $container.data('max-underpayment-fiat'),
        modal: true,
        enablePoweredBy: true,
        redirectPendingTo: $container.data('redirect'),
        timer: $container.data('timer')
    });

    var autoopen = $container.data('autoopen');

    if (autoopen && autoopen === true) {
        $('#savvy-all').trigger('click');
    }
});
