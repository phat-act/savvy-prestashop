<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

include_once _PS_MODULE_DIR_.'savvy/sdk/SavvySDK.php';
include_once 'classes/SavvyData.php';

/**
 * @property int  is_eu_compatible
 * @property bool bootstrap
 */
class Savvy extends PaymentModule
{
    protected $_html = '';
    protected $_postErrors = array();

    public $details;
    public $owner;
    public $address;
    public $extra_mail_vars;

    public function __construct()
    {
        $this->name = 'savvy';
        $this->tab = 'payments_gateways';
        $this->version = '1.0.1';
        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
        $this->author = 'savvy';
        $this->controllers = array('validation', 'currencies', 'payment', 'callback', 'status');
        $this->is_eu_compatible = 1;

        $this->currencies = true;
        $this->currencies_mode = 'checkbox';

        $this->bootstrap = true;
        parent::__construct();

        $this->displayName = $this->l('Crypto Payments by Savvytech.com');
        $this->description = $this->l('Allows to accept crypto payments such as Bitcoin (BTC), Ethereum (ETH) and other crypto currencies');

        if (!count(Currency::checkPaymentCurrencies($this->id))) {
            $this->warning = $this->l('No currency has been set for this module.');
        }

        if (!Configuration::get('SAVVY_API_SECRET') || !Configuration::get('SAVVY_API_PUBLIC')) {
            $this->warning = $this->l('Please set your API keys');
        }
    }

    /**
     * @return bool
     * @throws PrestaShopDatabaseException
     * @throws PrestaShopException
     */
    public function install()
    {
        if (!$this->installOrderState()) {
            return false;
        }

        if (!$this->installSQL()) {
            return false;
        }


        if ((float) _PS_VERSION_ < 1.7) {
            // hooks for 1.6
            if (!parent::install() || !$this->registerHook('payment') || !$this->registerHook('header')) {
                return false;
            }
        } else {
            // hooks for 1.7
            if (!parent::install()
                || !$this->registerHook('paymentOptions')
                || !$this->registerHook('paymentReturn')
                || !$this->registerHook('header')
            ) {
                return false;
            }
        }

        Configuration::updateValue('SAVVY_TITLE', 'Pay with Crypto via Savvy (BTC/ETH/LTC and more)');
        Configuration::updateValue('SAVVY_DESCRIPTION', '');
        Configuration::updateValue('SAVVY_EXCHANGE_LOCKTIME', '15');
        Configuration::updateValue('SAVVY_MAX_UNDERPAYMENT', '0.01');
        Configuration::updateValue('SAVVY_MIN_OVERPAYMENT', '1');
        Configuration::updateValue('LOCK_ADDRESS_TIMEOUT', '86400');

        return true;
    }

    public function hookHeader()
    {
        if ((float) _PS_VERSION_ >= 1.7 && Tools::getValue('controller') === 'pay') {
            $this->context->controller->registerStylesheet($this->name . '-css', 'modules/' . $this->name . '/views/css/savvy.css');
            $this->context->controller->registerJavascript($this->name . '-lib-js', 'modules/' . $this->name . '/views/js/savvy.js');
            $this->context->controller->registerJavascript($this->name . '-js', 'modules/' . $this->name . '/views/js/payment.js');
        }
    }

    public function hookPayment($params)
    {
        if (!$this->active) {
            return null;
        }

        if (!$this->checkCurrency($params['cart'])) {
            return null;
        }

        if (!Configuration::get('SAVVY_API_SECRET')) {
            return null;
        }

        $this->smarty->assign(array(
            'this_path' => $this->_path,
            'this_path_bw' => $this->_path,
        ));
        return $this->display(__FILE__, 'payment.tpl');
    }

    public function hookPaymentOptions($params)
    {
        if (!$this->active) {
            return [];
        }

        if (!$this->checkCurrency($params['cart'])) {
            return [];
        }

        if (!Configuration::get('SAVVY_API_SECRET')) {
            return [];
        }

        return [
            $this->getEmbeddedPaymentOption(),
        ];
    }

    public function checkCurrency($cart)
    {
        $currency_order = new Currency($cart->id_currency);
        $currencies_module = $this->getCurrency($cart->id_currency);

        $sdk = new SavvySDK($this->context);

        $availableCurrencies = $sdk->getCurrencies();
        if (empty($availableCurrencies)) {
            return false;
        }

        if (is_array($currencies_module)) {
            foreach ($currencies_module as $currency_module) {
                if ($currency_order->id == $currency_module['id_currency']) {
                    return true;
                }
            }
        }
        return false;
    }

    public function getEmbeddedPaymentOption()
    {
        libxml_use_internal_errors(true);
        $embeddedOption = new \PrestaShop\PrestaShop\Core\Payment\PaymentOption();
        $embeddedOption
            ->setModuleName($this->name)
            ->setCallToActionText(Configuration::get('SAVVY_TITLE'))
            ->setAction($this->context->link->getModuleLink($this->name, 'validation', array(), true))
            ->setAdditionalInformation(Configuration::get('SAVVY_DESCRIPTION'))
            // ->setLogo(Media::getMediaPath(_PS_MODULE_DIR_.$this->name.'/crypto.png'))
        ;

        return $embeddedOption;
    }

    public function getContent()
    {
        $output = null;

        if (Tools::isSubmit('submit'.$this->name))
        {
            /** @var array $values */
            $values = Tools::getAllValues();
            foreach ($values as $name => $value) {
                if (strpos($name, 'savvy_') !== false) {
                    Configuration::updateValue(strtoupper($name), $value);
                }
            }
            $output .= $this->displayConfirmation($this->l('Settings updated'));
        }
        return $output.$this->displayForm();
    }


    public function displayForm()
    {
        // Get default language
        $defaultLang = (int) Configuration::get('PS_LANG_DEFAULT');
        $defaultCurrency = new Currency((int) Configuration::get('PS_CURRENCY_DEFAULT'));

        // Init Fields form array
        $fields_form[0]['form'] = array(
            'legend' => array(
                'title' => $this->l('Settings'),
            ),
            'submit' => array(
                'title' => $this->l('Save'),
                'class' => 'btn btn-default pull-right'
            )
        );

        $fields_form[0]['form']['input'] = array(
            array(
                'type' => 'text',
                'required' => true,
                'label' => 'Title',
                'name' => 'savvy_title',
            ),
            array(
                'type' => 'textarea',
                'label' => 'Description',
                'name' => 'savvy_description'
            ),
            array(
                'type' => 'text',
                'required' => true,
                'label' => 'API Key (Secret)',
                'name' => 'savvy_api_secret'
            ),
            array(
                'type' => 'text',
                'label' => 'API Key (Public)',
                'name' => 'savvy_api_public'
            ),
            array(
                'type' => 'text',
                'label' => 'API Key (Testnet)',
                'name' => 'savvy_api_testnet',
                'desc' => 'Testnet API key. Make sure that you enabled Testnet'
            ),
            array(
                'type' => 'text',
                'label' => 'Exchange Rate Lock Time',
                'name' => 'savvy_exchange_locktime',
                'desc' => 'Lock Fiat to Crypto exchange rate for this long (in minutes, 15 is the recommended minimum)'
            ),
            array(
                'type' => 'text',
                'label' => sprintf('Underpayment (%s)', $defaultCurrency->iso_code),
                'name' => 'savvy_max_underpayment',
                'desc' => 'The client will be notified and required to pay the balance owed for underpayments greater than this specified amount'
            ),
            array(
                'type' => 'text',
                'label' => sprintf('Overpayment (%s)', $defaultCurrency->iso_code),
                'name' => 'savvy_min_overpayment',
                'desc' => ' The client will be notified about their overpayment if it is greater than this amount. You will then need to issue the overpayment refund.'
            ),
            array(
                'type' => 'text',
                'label' => 'Lock Address Timeout',
                'name' => 'savvy_lock_address_timeout',
                'desc' => 'Time interval in seconds during which the address is locked for this invoice only. 86400 seconds by default. Set ‑1 for infinite lock.'
            ),
            array(
                'type' => 'switch',
                'label' => 'Enable Testnet',
                'name' => 'savvy_testnet',
                'desc' => 'Enable Testnet',
                'is_bool' => true,
                'values' => array(
                    array(
                        'id' => 'testnet_on',
                        'value' => 1,
                        'label' => $this->trans('Enabled', [], 'Admin.Global')
                    ),
                    array(
                        'id' => 'testnet_off',
                        'value' => 0,
                        'label' => $this->trans('Disabled', [], 'Admin.Global')
                    )
                )

            )
        );

        $helper = new HelperForm();

        // Module, token and currentIndex
        $helper->module = $this;
        $helper->name_controller = $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->currentIndex = AdminController::$currentIndex.'&configure='.$this->name;

        // Language
        $helper->default_form_language = $defaultLang;
        $helper->allow_employee_form_lang = $defaultLang;

        // Title and toolbar
        $helper->title = $this->displayName;
        $helper->show_toolbar = true;        // false -> remove toolbar
        $helper->toolbar_scroll = true;      // yes - > Toolbar is always visible on the top of the screen.
        $helper->submit_action = 'submit'.$this->name;
        $helper->toolbar_btn = array(
            'save' =>
                array(
                    'desc' => $this->l('Save'),
                    'href' => AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
                        '&token='.Tools::getAdminTokenLite('AdminModules'),
                ),
            'back' => array(
                'href' => AdminController::$currentIndex.'&token='.Tools::getAdminTokenLite('AdminModules'),
                'desc' => $this->l('Back to list')
            )
        );

        // Load current value
        $helper->fields_value['savvy_title'] = Configuration::get('SAVVY_TITLE');
        $helper->fields_value['savvy_description'] = Configuration::get('SAVVY_DESCRIPTION');
        $helper->fields_value['savvy_exchange_locktime'] = Configuration::get('SAVVY_EXCHANGE_LOCKTIME');
        $helper->fields_value['savvy_api_secret'] = Configuration::get('SAVVY_API_SECRET');
        $helper->fields_value['savvy_api_public'] = Configuration::get('SAVVY_API_PUBLIC');
        $helper->fields_value['savvy_api_testnet'] = Configuration::get('SAVVY_API_TESTNET');
        $helper->fields_value['savvy_max_underpayment'] = Configuration::get('SAVVY_MAX_UNDERPAYMENT');
        $helper->fields_value['savvy_min_overpayment'] = Configuration::get('SAVVY_MIN_OVERPAYMENT');
        $helper->fields_value['savvy_lock_address_timeout'] = Configuration::get('SAVVY_LOCK_ADDRESS_TIMEOUT');
        $helper->fields_value['savvy_testnet'] = Configuration::get('SAVVY_TESTNET');

        return $helper->generateForm($fields_form);
    }

    private function installSQL()
    {
        $sql = array();

        $sql[] = 'CREATE TABLE IF NOT EXISTS `' ._DB_PREFIX_. 'savvy_data` (
              `id_savvy` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
              `order_reference` VARCHAR(9) NOT NULL,
              `token` VARCHAR(256) NULL DEFAULT NULL,
              `address` VARCHAR(256),
              `invoice` VARCHAR(256),
              `amount` DECIMAL(20, 8),
              `confirmations` INT(2) NULL DEFAULT NULL,
              `max_confirmations` INT(2) NULL DEFAULT NULL,
              `date_add` DATETIME NULL DEFAULT NULL,
              `date_upd` DATETIME NULL DEFAULT NULL,
              KEY `order_reference` (`order_reference`),
              KEY `token` (`token`)
        ) ENGINE = ' ._MYSQL_ENGINE_;

        $sql[] = 'CREATE TABLE IF NOT EXISTS `' ._DB_PREFIX_. 'savvy_transaction` (
              `id_savvy_transaction` INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
              `order_reference` VARCHAR(9) NOT NULL,
              `invoice` VARCHAR(255) NULL DEFAULT NULL,
              `blockchain` VARCHAR(255) NULL DEFAULT NULL,
              `address` VARCHAR(255) NULL DEFAULT NULL,
              `amount` DECIMAL(20, 8),
              `currency` VARCHAR(255) NULL DEFAULT NULL,
              `rate` DECIMAL(20, 8) NULL DEFAULT NULL,
              `transaction_hash` VARCHAR(255) NULL DEFAULT NULL,
              `confirmations` INT(2) NULL DEFAULT NULL,
              `max_confirmations` INT(2) NULL DEFAULT NULL,
              `date_add` DATETIME NULL DEFAULT NULL,
              `date_upd` DATETIME NULL DEFAULT NULL,
              KEY `order_reference` (`order_reference`),
              KEY `blockchain` (`blockchain`),
              KEY `transaction_hash` (`transaction_hash`)
        ) ENGINE = ' ._MYSQL_ENGINE_;

        foreach ($sql as $q) {
            if (!DB::getInstance()->execute($q)) {
                return false;
            }
        }

        return true;
    }

    /**
     * Create order state
     *
     * @return boolean
     * @throws PrestaShopDatabaseException
     * @throws PrestaShopException
     */
    public function installOrderState()
    {
        $states = array(
            array(
                'name' => 'SAVVY_OS_WAITING',
                'color' => '#4775de',
                'title' => 'Awaiting for savvy payment'
            ),
            array(
                'name' => 'SAVVY_OS_WAITING_CONFIRMATIONS',
                'color' => '#4775de',
                'title' => 'Awaiting for savvy payment confirmations'
            ),
            array(
                'name' => 'SAVVY_OS_MISPAID',
                'color' => '#8f0621',
                'title' => 'Mispaid'
            ),
            array(
                'name' => 'SAVVY_OS_LATE_PAYMENT_RATE_CHANGED',
                'color' => '#8f0621',
                'title' => 'Late Payment/Rate changed'
            ),
        );

        $allOrderStates = OrderState::getOrderStates($this->context->language->id);
        $allOrderStatesOrdered = [];

        foreach ($allOrderStates as $orderState) {
            $allOrderStatesOrdered[$orderState['name']] = $orderState;
        }

        foreach ($states as $state) {
            if (!Configuration::get($state['name'])
                || !Validate::isLoadedObject(new OrderState(Configuration::get($state['name'])))) {
                if (!isset($allOrderStatesOrdered[$state['title']])) {
                    $orderState = new OrderState();
                    $orderState->name = array();
                    foreach (Language::getLanguages() as $language) {
                        $orderState->name[$language['id_lang']] = $state['title'];
                    }
                    $orderState->send_email = false;
                    $orderState->color = $state['color'];
                    $orderState->hidden = false;
                    $orderState->delivery = false;
                    $orderState->logable = false;
                    $orderState->invoice = false;
                    if ($orderState->add()) {
                        $source = _PS_MODULE_DIR_.'savvy/logo_os.png';
                        $destination = _PS_ROOT_DIR_.'/img/os/'.(int) $orderState->id.'.gif';
                        copy($source, $destination);
                    }
                } else {
                    $orderState = new OrderState($allOrderStatesOrdered[$state['title']]['id_order_state']);
                }

                Configuration::updateValue($state['name'], (int) $orderState->id);
            }
        }

        return true;
    }
}
