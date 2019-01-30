<?php

include_once _PS_MODULE_DIR_.'savvy/sdk/SavvySDK.php';

class SavvyStatusModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        $orderReference = Tools::getValue('order');
        $savvyData = SavvyData::getByOrderRefence($orderReference);
        $success = false;
        $allPayments = [];
        if ($savvyData) {
            /** @noinspection PhpUnhandledExceptionInspection */
            $allPayments = $savvyData->getPayments();
            $toPay = $savvyData->amount;
        }
        $unpaidConfirmations = array();
        $sdk = new SavvySDK($this->context);
        $rate = $sdk->getRate($savvyData->token);

        $maxUnderpaymentFiat = Configuration::get('SAVVY_MAX_UNDERPAYMENT');
        $maxUnderpaymentCrypto = $maxUnderpaymentFiat / $rate;
        $maxDifference = max($maxUnderpaymentCrypto, 0.00000001);

        $data = array();
        $coinsPaid = 0;
        foreach ($allPayments as $payment) {
            $coinsPaid += $payment->amount;
            $confirmations = $payment->confirmations;
            $maxConfirmations = $payment->max_confirmations;
            if (!$maxConfirmations) {
                $maxConfirmations = $savvyData->max_confirmations;
            }
            if ($confirmations >= $maxConfirmations) {
                $success = true;
            }
            $unpaidConfirmations[] = $confirmations;
        }
        $data['coinsPaid'] = $coinsPaid;
        $data['success'] = $success && ($toPay > 0 && ($toPay - $coinsPaid) < $maxDifference);
        $data['confirmations'] = null;
        if (!empty($unpaidConfirmations)) {
            $data['confirmations'] = min($unpaidConfirmations);
        }

        echo Tools::jsonEncode($data); //return this data to savvy form
        die();
    }
}
