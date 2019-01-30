<?php

include_once(_PS_MODULE_DIR_.'savvy/sdk/SavvySDK.php');

class SavvyCurrenciesModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        $this->ajax = true;
        $sdk = new SavvySDK($this->context);

        $orderId = Tools::getValue('order');

        if (isset($_GET['token'])) {
            $token = $_GET['token'];
            $data = $sdk->getCurrency($token, $orderId, true);
        } else {
            $data = [];
            $currencies = $sdk->getCurrencies();
            $getAddress = false;
            if (count($currencies) === 1) {
                $getAddress = true;
            }

            $savvyData = SavvyData::getByOrderRefence($orderId);
            $currentCurrencyToken = null;
            if ($savvyData) {
                /** @noinspection PhpUnhandledExceptionInspection */
                $allsavvyPayments = $savvyData->getPayments();
                if (!empty($allsavvyPayments)) {
                    $firstPayment = current($allsavvyPayments);
                    $currentCurrencyToken = $firstPayment->blockchain;
                }
            }

            // tmp solution
            if ($currentCurrencyToken) {
                $getAddress = true;
                $currency = $sdk->getCurrency($currentCurrencyToken, $orderId, true);
                $currencies = array();
                $currencies[$currentCurrencyToken] = $currency;
            }

            foreach ($currencies as $token => $currency) {
                $currency = $sdk->getCurrency($token, $orderId, $getAddress);
                if ($currency) {
                    $coinsPaid = 0;
                    if ($savvyData && !empty($allsavvyPayments)) {
                        foreach ($allsavvyPayments as $payment) {
                            if ($payment->blockchain === strtolower($currency->code)) {
                                $coinsPaid += $payment->amount;
                            }
                        }
                    }
                    $currency->coinsPaid = $coinsPaid;
                    $data[] = $currency;
                }
            }
        }

        echo Tools::jsonEncode($data);
        die();
    }
}
