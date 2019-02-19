<div style="margin-bottom: 1.5rem">
    <!--savvy.io code start-->
    <div id="savvy" style="display: none"
         data-currencies="{$currencies}"
         data-status="{$status}"
         data-redirect="{$redirect}"
         data-fiat-value="{$fiatValue}"
         data-currency-iso="{$shopCurrency->iso_code}"
         data-currency-sign="{$shopCurrency->sign}"
         data-min-overpayment-fiat="{$minOverpaymentFiat}"
         data-max-underpayment-fiat="{$maxUnderpaymentFiat}"
         data-timer="{$savvyExchangeLocktime}"
         data-autoopen="true"
    >
        <div class="p30 Savvy-spinner" style="display: none;">
            <p>Loading payment details...</p>
            <div class="Savvy-spinner__container"><span class="Savvy-spinner__item"></span></div>
        </div>

        <div class="p30 Savvy-app-error" style="display: none;">
            This payment method is temporarily unavailable. Please try again in a minute.
            <button class="P-btn P-btn-grey">Retry</button>
        </div>
        <!-- Savvy widget-->
        <div class="Savvy-app" style="display: none;">
            <div class="Savvy-container">
                <div class="Savvy">
                    <!-- Savvy header -->
                    <div class="Savvy__Nav">
                        <a href="/" class="Savvy__Nav__arrow" style="display: none;">
                            <svg height="22" width="22" viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">
                                <path d="m15.605355 8.8542609h-13.7616838c-1.01823148 0-1.8436712.82344-1.8436712 1.8392051 0 1.015764.82543972 1.839205 1.8436712 1.839205h14.3762408l-2.483628 2.47761c-.719998.718254-.719998 1.882774 0 2.601028.719999.718255 1.887347.718255 2.607345 0l5.116373-5.103976c.412815-.411816.588939-.970336.528375-1.507333.06056-.536997-.11556-1.0955171-.528375-1.5073331l-5.116373-5.1039766c-.719998-.718254-1.887346-.718254-2.607345 0-.719998.718255-.719998 1.8827736 0 2.6010286z"></path>
                            </svg>
                        </a>
                        <div class="Savvy__brand-link" style="display: none;">
                        <span>
                            Powered by <a href="https://www.savvy.io" target="_blank" rel="noopener noreferrer">
                            Savvy<svg height="14" viewBox="0 0 14 14" width="14" xmlns="http://www.w3.org/2000/svg"
                                      class="Savvy__Nav__external">
                                <path d="m333.875 38c-.482562 0-.875-.392-.875-.875v-12.25c0-.483.392438-.875.875-.875h5.6875c.241938 0 .4375.1955625.4375.4375v.875c0 .2419375-.195562.4375-.4375.4375h-4.8125v10.5h10.5v-4.8125c0-.2419375.195562-.4375.4375-.4375h.875c.241938 0 .4375.1955625.4375.4375v5.6875c0 .483-.392438.875-.875.875zm12.690554-14c .240249 0 .434446.1933285.434446.4344461v4.3444615c0 .1746474-.10557.3340891-.268053.4005594-.053872.0230256-.11035.0338868-.166393.0338868-.112956 0-.224174-.0443135-.307154-.1272927l-1.557489-1.5579239-4.344027 4.3444615c-.169869.1698684-.444438.1698684-.615176 0l-.614307-.6143069c-.169868-.1698684-.169868-.4444384 0-.6143068l4.344462-4.3444615-1.557924-1.5579239c-.124252-.1246861-.161614-.3114979-.094275-.4735463.066905-.1629173.225912-.2680533.401428-.2680533z"
                                      fill="#b9b9b9" transform="translate(-333 -24)"></path></svg></a>
                        </span>
                        </div>
                    </div>
                    <!-- Select currency -->
                    <div class="Savvy__Icons"></div>
                    <!-- Content -->
                    <div class="P-Payment P-box" style="display: none;">
                        <!-- Header of content-->
                        <div class="P-Payment__header" id="payment-header">
                            <div class="P-Payment__header__timer">--</div>
                            <div class="P-Payment__header__check" style="display: none;"></div>
                            <div class="P-Payment__header__text">
                                <div class="P-Payment__header__title">Waiting on Payment</div>
                                <div class="P-Payment__header__helper">---</div>
                            </div>
                        </div>
                        <div class="P-box__inner">
                            <!-- First payment step -->
                            <div class="P-Payment__start">
                                <div class="P-Payment__value">
                                    <div class="P-Payment__value__icon">
                                        <img src="">
                                    </div>
                                    <div>
                                        <div class="P-Payment__value__pay"><span class="P-Payment__value__coins"></span></div>
                                        <div class="P-Payment__value__price" style="display: none;">---</div>
                                    </div>
                                </div>
                                <div class="P-Tabs" id="savvy-tabs">
                                    <ul class="P-Tabs__Tab-list P-Tabs__Tab-list--second">
                                        <li role="tab" class="P-Tabs__Tab P-Tabs__Tab--wallet">Wallet</li>
                                        <li role="tab" class="P-Tabs__Tab P-Tabs__Tab--selected">Copy</li>
                                        <li role="tab" class="P-Tabs__Tab">Scan</li>
                                    </ul>
                                    <div class="P-Payment__address">
                                        <div class="P-Payment__address__text">---</div>
                                        <code>---</code>
                                    </div>
                                    <div class="P-Tabs__Tab-panel P-Tabs__Tab-panel--wallet">
                                        <div>
                                            <a href="#" class="P-btn-block P-wallet-btn">
                                            <span class="P-btn-block__inner">
                                                <i class="P-wallet-icon"></i>
                                                <span class="P-btn-block__text">Open in Wallet</span>
                                            </span>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="P-Tabs__Tab-panel P-Tabs__Tab-panel--selected">
                                        <div class="P-buttons-flex">
                                            <a class="P-btn-block P-btn-copy-address">
                                            <span class="P-btn-block__copied-text">
                                                <svg height="11" viewBox="0 0 13 11" width="13" xmlns="http://www.w3.org/2000/svg"><path d="m4.42775177 7.85005539 5.97311463-5.97311463c.5359766-.53597656 1.4049663-.53597656 1.9409428 0 .5359766.53597657.5359766 1.40496628 0 1.94094285l-6.93193869 6.93193869c-.5029721.5029721-1.29920739.5339442-1.83829672.0929164-.06892267-.0472373-.13449273-.1014683-.19571746-.1626931l-2.71766557-2.71766553c-.53597656-.53597657-.53597656-1.40496628 0-1.94094285.53597657-.53597656 1.40496628-.53597656 1.94094285 0z" fill-rule="evenodd" fill="#4FBDA6" transform="translate(0 -1)"/></svg>
                                                Copied to Clipboard!
                                            </span>
                                                <span class="P-btn-block__inner">
                                                <span class="P-btn-block__helper">--</span>
                                                Copy Address
                                            </span>
                                            </a>
                                            <a class="P-btn-block P-Payment__value__copy">
                                            <span class="P-btn-block__copied-text">
                                                <svg height="11" viewBox="0 0 13 11" width="13" xmlns="http://www.w3.org/2000/svg"><path d="m4.42775177 7.85005539 5.97311463-5.97311463c.5359766-.53597656 1.4049663-.53597656 1.9409428 0 .5359766.53597657.5359766 1.40496628 0 1.94094285l-6.93193869 6.93193869c-.5029721.5029721-1.29920739.5339442-1.83829672.0929164-.06892267-.0472373-.13449273-.1014683-.19571746-.1626931l-2.71766557-2.71766553c-.53597656-.53597657-.53597656-1.40496628 0-1.94094285.53597657-.53597656 1.40496628-.53597656 1.94094285 0z" fill-rule="evenodd" fill="#4FBDA6" transform="translate(0 -1)"/></svg>
                                                Copied to Clipboard!
                                            </span>
                                                <span class="P-btn-block__inner">
                                                <span class="P-btn-block__helper">--</span>
                                                Copy Amount
                                            </span>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="P-Tabs__Tab-panel">
                                        <div class="P-Payment__qr">
                                            <img src="">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- Payment confirming step -->
                            <div class="P-Payment__unpaid" style="display: none;">
                                <div class="P-Content">
                                    <div class="P-Content__icon">
                                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' height='258.9982' viewBox='0 0 298.32513 258.9982' width='298.32513'%3E%3Cpath d='m278.77419 258.9982h-259.548383c-10.618053 0-19.225807-8.58897-19.225807-19.18518 0-2.94853 0-14.81362 1-10.81362 2.3445102 9.37804 10.562525-18.37157 18.225807-18.37157h259.548383c8.33305 0 16.55808 6.32213 19.22581 16.37157.73152 2.75566 0 10.53344 0 12.81362 0 10.59621-8.60775 19.18518-19.22581 19.18518z' fill='%23cd412d'/%3E%3Cpath d='m134.60408 9.633961c8.26769-12.365451 19.91553-13.316317 28.80566 0l129.59455 206.108839c9.60329 14.37031 4.79684 24.07022-9.60269 24.07022h-268.805608c-14.4007299 0-19.2023751-9.70111-9.6008872-24.07022z' fill='%23f05f50'/%3E%3Cpath d='m138.7013 161.98781h17.55447c2.68503 0 4.8907-2.12068 4.99614-4.80364l3.34016-84.988409c.10844-2.7593-2.0405-5.08406-4.79979-5.1925-.0654-.003-.13088-.004-.19635-.004h-24.23478c-2.76143 0-5 2.23858-5 5 0 .0655.001.13094.004.19636l3.34016 84.988409c.10544 2.68296 2.31111 4.80364 4.99614 4.80364zm-11.0293 30.48755c0 11.19951 8.91813 19.28804 19.49544 19.28804 10.78471 0 19.91023-8.08853 19.91023-19.28804 0-10.99211-9.12552-18.87324-19.91023-18.87324-10.57731 0-19.49544 7.88113-19.49544 18.87324z' fill='%23fff' fill-rule='evenodd'/%3E%3C/svg%3E">
                                    </div>
                                    <h2>Oops. You underpaid by <span class="P-Payment__unpaid__underpaid">---</span>!</h2>
                                    <div class="P-Payment__unpaid__block">
                                        <div>
                                            <div>DUE</div>
                                            <span class="P-Payment__unpaid__due">---</span>
                                        </div>
                                        <div>
                                            <div>YOU PAID</div>
                                            <span class="P-Payment__unpaid__paid">---</span>
                                        </div>
                                        <div>
                                            <div>UNDERPAID</div>
                                            <span class="P-Payment__unpaid__underpaid">---</span>
                                        </div>
                                    </div>
                                    <div>
                                        <a href="#" class="P-btn P-btn--primary">
                                            Continue
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Payment expired step -->
                            <div class="P-Payment__expired" style="display: none;">
                                <div class="P-Content">
                                    <p>
                                        <strong>Your payment window has expired.</strong>
                                        Hit the Refresh button below to lock in
                                        a new exchange rate and start again.
                                    </p>
                                    <div>
                                        <a href="/" class="P-btn">
                                            <i class="P-btn__icon P-btn__icon--refresh-white"></i>
                                            Refresh
                                        </a>
                                    </div>
                                    <button class="P-Payment__helper">What's a payment window?</button>
                                </div>
                            </div>
                            <!-- Payment expired step: Help screen -->
                            <div class="P-Payment__expired-helper" style="display: none;">
                                <div class="P-Content">
                                    <div class="P-Content__icon">
                                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' height='64' viewBox='0 0 58 64' width='58'%3E%3Cg fill='none' transform=''%3E%3Cpath d='m54.5747088 19.1141053 3.1758596-3.1757474-9.5274666-9.52746667-3.1757474 3.17585965 1.5878737 1.58787372-3.4576842 3.4576842c-3.2436772-2.3093895-7.0161965-3.9070316-11.1057965-4.5947509v-4.89521404h2.245614v-4.49122807h-13.4736842v4.49122807h2.245614v4.89532634c-12.7400421 2.1420912-22.45614032 13.1943298-22.45614032 26.5432702 0 14.8826947 12.06467372 26.9473684 26.94736842 26.9473684s26.9473684-12.0646737 26.9473684-26.9473684c0-5.8188351-1.8629614-11.1924772-4.9987368-15.5970246l3.4576842-3.4576842z' fill='%23cdd7de'/%3E%3Cpath d='m27.5805193 9.63357193c1.5337544 0 3.0275368.15786667 4.4912281.40409827v-4.87040002-.02492632h-8.9824562v1.12280702h4.4912281z' fill='%23b8c5cf'/%3E%3Cpath d='m46.6352281 17.5262316c1.0632982 1.0632982 2.0194807 2.2294456 2.8939228 3.4576842l3.4399438-3.4399439.0176281-.017628-6.351607-6.3516071-.7940491.7940492 3.1758596 3.1757473z' fill='%23b8c5cf'/%3E%3Cpath d='m27.5231439 54.5458526c-9.9058527 0-17.96491232-8.0590596-17.96491232-17.9649122 0-9.9058527 8.05905962-17.9649123 17.96491232-17.9649123 9.9058526 0 17.9649122 8.0590596 17.9649122 17.9649123 0 9.9058526-8.0590596 17.9649122-17.9649122 17.9649122z' fill='%23fff'/%3E%3Cpath d='m28.2368281 36.5832982c-.0026948-8.644828-7.0366316-15.682021-15.6820211-15.682021v15.677193z' fill='%23e7b6b1' transform='matrix(-1 0 0 1 40.791636 0)'/%3E%3Cg transform='matrix(-1 0 0 1 32 32)'%3E%3Cpath d='m4.53897544.49583158c-2.2306807 0-4.04210526 1.81142456-4.04210526 4.04210526 0 2.23573334 1.81142456 4.04210527 4.04210526 4.04210527.36581052 0 .71904561-.04828071 1.05184561-.13720702l12.42105265-3.2087579c.7190456-.18548772.7190456-1.20679298 0-1.3922807l-12.42105265-3.20370526c-.33538245-.09150877-.68603509-.14225965-1.05184561-.14225965z' fill='%23d64230'/%3E%3Ccircle cx='4.599944' cy='4.535242' fill='%23a9352a' r='1.684211'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E">
                                    </div>
                                    <h2>What's a Payment Window?</h2>
                                    <p>
                                        A payment window is a pre-set amount of time-usually 15 mins-where the
                                        exchange rate is locked in to ensure a fair rate for customer and
                                        merchant.
                                    </p>
                                    <div>
                                        <button class="P-btn P-btn-grey">
                                            <i class="P-btn__icon P-btn__icon--back-grey"></i>
                                            Got it!
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- Payment confirming step -->
                            <div class="P-Payment__confirming" style="display: none;">
                                <div class="P-Content">
                                    <div class="Confirming__icon">
                                        <svg height="159" viewBox="0 0 255 159" width="255" class="Confirming__pic">

                                            <defs id="svg-Group2-wq2YP3q">
                                                <ellipse id="svg-Group2-1RCLVi9" cx="16.93353" cy="16.953842" rx="16.743816"
                                                         ry="16.748526"></ellipse>
                                                <path id="svg-Group2-3qWaf6Y"
                                                      d="m19.1094113 19.4515481c-.0479576 0-.0954574-.0209934-.1277233-.061378l-2.0300388-2.5383115c-.0231779-.029005-.0358293-.0650078-.0358293-.1021551v-3.5533875c0-.090285.0731949-.1635005.1634545-.1635005.0902595 0 .1634544.0732155.1634544.1635005v3.4960643l1.9942423 2.493545c.0563918.0705014.04495.1734086-.0255316.2297835-.0301736.0241327-.066199.0358393-.1020282.0358393zm-2.0320984 5.671176c-2.2361875 0-4.3385386-.8710976-5.9197969-2.4527681-1.58125831-1.5817032-2.45207821-3.6846784-2.45207821-5.9214951 0-1.164025.23426291-2.2907391.69628324-3.3488158.44626333-1.0219758 1.08298377-1.9325424 1.89250827-2.7063245.0652837-.0623918.1687177-.0600374.2310919.005232.0623742.0653021.0600205.1687978-.0052306.2311569-1.60423996 1.5334705-2.48774392 3.5999525-2.48774392 5.8187514 0 4.4372709 3.60894342 8.0472623 8.04496622 8.0472623 4.4360229 0 8.0450317-3.6099587 8.0450317-8.0472623 0-4.4372709-3.6089761-8.04722958-8.0450317-8.04722958-.6261286 0-1.2496746.07220179-1.8533118.21457796-.0878732.02060106-.175877-.03374648-.1966031-.12161162-.0206933-.08789783.033737-.17592646.1215775-.19665831.6281881-.14813139 1.2769715-.22327619 1.9283374-.22327619 2.2362203 0 4.3386041.87106489 5.9198297 2.45276804 1.5812583 1.5817032 2.4521109 3.6846457 2.4521109 5.9214624s-.8708526 4.3397919-2.4521109 5.9214951c-1.5812256 1.5816378-3.6836094 2.4527354-5.9198297 2.4527354z"
                                                      stroke="#e5e5e5" stroke-width="1.4"></path>
                                                <path id="svg-Group2-3smKeov"
                                                      d="m5.90126337 11.8227744-2.21088172-2.21088175c-.84422585-.84422585-2.2129864-.84422585-3.05721226 0-.84422585.84422585-.84422585 2.21298645 0 3.05721225l3.61123548 3.6112355c.09643612.0964361.19971665.1818563.30827792.2562606.84912883.6946705 2.10329265.6458858 2.8955326-.1463541l10.91861521-10.91861525c.8442259-.84422585.8442259-2.2129864 0-3.05721226-.8442258-.84422585-2.2129864-.84422585-3.0572123 0z"></path>
                                                <filter id="svg-Group2-3RRrZIi" color-interpolation-filters="sRGB">
                                                    <feFlood flood-opacity=".08" result="flood"
                                                             id="svg-Group2-20Qef8x"></feFlood>
                                                    <feComposite in="flood" in2="SourceGraphic" operator="in"
                                                                 result="composite1" id="svg-Group2-1gR8TY7"></feComposite>
                                                    <feGaussianBlur in="composite1" result="blur" stdDeviation="3"
                                                                    id="svg-Group2-3m4KQYT"></feGaussianBlur>
                                                    <feOffset dx="1" dy="0" result="offset"
                                                              id="svg-Group2-3H8OZbG"></feOffset>
                                                    <feComposite in="SourceGraphic" in2="offset" operator="over"
                                                                 result="composite2" id="svg-Group2-mlwIIR2"></feComposite>
                                                </filter>
                                                <filter id="svg-Group2-2c3jl78" color-interpolation-filters="sRGB">
                                                    <feFlood flood-opacity=".08" result="flood"
                                                             id="svg-Group2-2pfCQw0"></feFlood>
                                                    <feComposite in="flood" in2="SourceGraphic" operator="in"
                                                                 result="composite1" id="svg-Group2-20lf6-e"></feComposite>
                                                    <feGaussianBlur in="composite1" result="blur" stdDeviation="99"
                                                                    id="svg-Group2-1T0A3gr"></feGaussianBlur>
                                                    <feOffset dx="0" dy="0" result="offset"
                                                              id="svg-Group2-16kt3IZ"></feOffset>
                                                    <feComposite in="SourceGraphic" in2="offset" operator="over"
                                                                 result="composite2" id="svg-Group2-3CcF-dL"></feComposite>
                                                </filter>
                                            </defs>
                                            <g fill="none" fill-rule="evenodd" id="svg-Group2-2VvHRvC">
                                                <g stroke="#e7e7e7" stroke-width="3"
                                                   transform="translate(1.429195 14.485123)" id="svg-Group2-316PS5E">
                                                    <g id="svg-Group2-1Se2Wzu" transform="translate(0,20)">
                                                        <path id="svg-Group2-15k4HcN" class="Confirming__pic__point--top"
                                                              d="M 51.940975,-3.6429195 15.163168,73.7002"></path>
                                                        <path id="svg-Group2-14SZJkh"
                                                              d="M 15.3316,75.131874 119.18953,95.88984"></path>
                                                        <path id="svg-Group2-2JlcBzH"
                                                              d="M 121.09512,95.88984 224.68903,25.802895"></path>
                                                        <path id="svg-Group2-2jCsKLw" class="Confirming__pic__point--top"
                                                              d="M 223.02164,24.850099 53.793729,-4.8219449"></path>
                                                    </g>
                                                    <path d="m17.264 94.288 208.496-49.136" id="svg-Group2-SPc06lX"></path>
                                                    <path d="m53.12 17.928 65.072 100.264"
                                                          class="Confirming__pic__point--top"
                                                          id="svg-Group2-1cCDDsZ"></path>
                                                </g>
                                                <g id="svg-Group2-3j52qep">

                                                    <g class="Confirming__pic__point" filter="url(#svg-Group2-3RRrZIi)"
                                                       transform="translate(-.094857 91.297632)" id="svg-Group2-2pZ8H5m">
                                                        <use class="circle" fill="#fff" filter="url(#svg-Group2-2c3jl78)"
                                                             height="100%" transform="translate(-.094857)" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-1RCLVi9" id="svg-Group2-1jbqLbQ"></use>
                                                        <use class="time" fill="#eee" height="100%" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-3qWaf6Y" id="svg-Group2-1RPlxfi"></use>
                                                        <use class="check" fill="#fff" height="100%"
                                                             transform="translate(7.338674 7.551509)" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-3smKeov" id="svg-Group2--WIG81x"></use>
                                                    </g>
                                                    <g class="Confirming__pic__point" filter="url(#svg-Group2-3RRrZIi)"
                                                       transform="translate(102.21398 112.91314)" id="svg-Group2-23YW68n">
                                                        <use class="circle" fill="#fff" filter="url(#svg-Group2-2c3jl78)"
                                                             height="100%" transform="translate(-.094857)" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-1RCLVi9" id="svg-Group2-1K0JjZO"></use>
                                                        <use class="time" fill="#eee" height="100%" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-3qWaf6Y" id="svg-Group2-3IuRduH"></use>
                                                        <use class="check" fill="#fff" height="100%"
                                                             transform="translate(7.338674 7.551509)" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-3smKeov" id="svg-Group2-zjo63Vt"></use>
                                                    </g>
                                                    <g class="Confirming__pic__point" filter="url(#svg-Group2-3RRrZIi)"
                                                       transform="translate(206.30508 43.182199)" id="svg-Group2-2e5hs45">
                                                        <use class="circle" fill="#fff" filter="url(#svg-Group2-2c3jl78)"
                                                             height="100%" transform="translate(-.094857)" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-1RCLVi9" id="svg-Group2-3gntfDR"></use>
                                                        <use class="time" fill="#eee" height="100%" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-3qWaf6Y" id="svg-Group2-3aAQ2uI"></use>
                                                        <use class="check" fill="#fff" height="100%"
                                                             transform="translate(7.338674 7.551509)" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-3smKeov" id="svg-Group2-1bs4HhS"></use>
                                                    </g>
                                                    <g class="Confirming__pic__point Confirming__pic__point--top"
                                                       filter="url(#svg-Group2-3RRrZIi)"
                                                       transform="translate(36.71822 15.559321)" id="svg-Group2-23TNxss">
                                                        <use class="circle" fill="#fff" filter="url(#svg-Group2-2c3jl78)"
                                                             height="100%" transform="translate(-.094857)" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-1RCLVi9" id="svg-Group2-RMIL9eH"></use>
                                                        <use class="time" fill="#eee" height="100%" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-3qWaf6Y" id="svg-Group2-3IbT0Fm"></use>
                                                        <use class="check" fill="#fff" height="100%"
                                                             transform="translate(7.338674 7.551509)" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-3smKeov" id="svg-Group2-2D5EIq7"></use>
                                                    </g>
                                                    <g class="Confirming__pic__point Confirming__pic__point--center"
                                                       transform="translate(76.830504,73.911013)" id="svg-Group2-Bbnsjlm"
                                                       filter="url(#svg-Group2-3RRrZIi)">
                                                        <use class="circle" fill="#fff" filter="url(#svg-Group2-2c3jl78)"
                                                             height="100%" transform="translate(-0.094857,0)" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-1RCLVi9"></use>
                                                        <use class="time" height="100%" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-3qWaf6Y" id="svg-Group2-QFaQSla"
                                                             fill="#eee" x="0" y="0"></use>
                                                        <use class="check" height="100%"
                                                             transform="translate(7.338674,7.551509)" width="100%"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink"
                                                             xlink:href="#svg-Group2-3smKeov" id="svg-Group2-VkZrAFL"
                                                             fill="#fff" x="0" y="0"></use>
                                                    </g>
                                                </g>
                                            </g>
                                        </svg>
                                    </div>
                                    <h2 class="P-confirmations">---</h2>
                                    <p>
                                        <strong>Your order will be processed soon.</strong>
                                        You can leave this tab open until your payment is confirmed,
                                        <strong>or</strong> close it and wait for a confirmation email.
                                    </p>
                                    <div>
                                        <button class="P-btn P-btn--sm">
                                            <i class="P-btn__icon--close"></i>
                                            Close
                                        </button>
                                    </div>
                                    <button class="P-Payment__helper">What does this mean?</button>
                                </div>
                            </div>
                            <!-- Payment confirming step: Help screen -->
                            <div class="P-Payment__confirming-helper" style="display: none;">
                                <div class="P-Content">
                                    <div class="P-Content__icon">
                                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' height='280' viewBox='0 0 254 280' width='254'%3E%3Cpath d='m239.48777 82.818842 14.09288-14.092379-42.27814-42.278133-14.09238 14.092877 7.04619 7.046189-15.34347 15.343474c-14.39382-10.247916-31.13437-17.337453-49.28197-20.389207v-21.722512h9.96491v-19.9298247h-59.789473v19.9298247h9.964913v21.72301c-56.533937 9.50553-99.649123 58.549839-99.649123 117.785759 0 66.04196 53.536989 119.57895 119.578943 119.57895 66.04196 0 119.57895-53.53699 119.57895-119.57895 0-25.82108-8.26689-49.66661-22.18189-69.211794l15.34347-15.343473z' fill='%23cdd7de'/%3E%3Cpath d='m119.70105 40.748975c6.80604 0 13.4347.700534 19.92983 1.793186v-21.6124-.11061h-39.85965v4.982456h19.92982z' fill='%23b8c5cf'/%3E%3Cpath d='m204.25632 75.772653c4.71839 4.718386 8.96145 9.893165 12.84179 15.343473l15.26475-15.264751.0782-.07822-28.18525-28.185256-3.5236 3.523593 14.09288 14.092379z' fill='%23b8c5cf'/%3E%3Cpath d='m119.44645 240.04722c-43.95722 0-79.719297-35.76208-79.719297-79.7193s35.762077-79.719295 79.719297-79.719295 79.7193 35.762075 79.7193 79.719295-35.76208 79.7193-79.7193 79.7193z' fill='%23fff'/%3E%3Cpath d='m189.17592 160.33839c-.0119-38.36143-31.22505-69.588972-69.58896-69.588972v69.567542z' fill='%23d5e2f2'/%3E%3Cpath d='m119.5167 142.20025c-9.89864 0-17.93684 8.0382-17.93684 17.93684 0 9.92107 8.0382 17.93685 17.93684 17.93685 1.62329 0 3.19077-.21425 4.66757-.60886l55.11842-14.23886c3.19076-.8231 3.19076-5.35515 0-6.17825l-55.11842-14.21644c-1.48826-.40607-3.04428-.63128-4.66757-.63128z' fill='%23d64230'/%3E%3Ccircle cx='119.78725' cy='160.12514' fill='%23a9352a' r='7.473684'/%3E%3C/svg%3E">
                                    </div>
                                    <h2>Why do I have to wait?</h2>
                                    <ul>
                                        <li>Crypto payments need to be confirmed by several computers on the
                                            network, known as the blockchain.
                                        </li>
                                        <li>Payments usually fully confirm within a few minutes. Or up to an hour in
                                            extreme cases
                                        </li>
                                        <li>Don't worry, your <strong>payment will be processed automatically even
                                                if you close this window</strong>.
                                        </li>
                                        <li class="block-explorer-li" style="display: none;">You can track your payment's
                                            progress with a <a class="P-block-explorer" target="_blank" href="#">block
                                                explorer
                                                <svg height="14" viewBox="0 0 14 14" width="14"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path d="m333.875 38c-.482562 0-.875-.392-.875-.875v-12.25c0-.483.392438-.875.875-.875h5.6875c.241938 0 .4375.1955625.4375.4375v.875c0 .2419375-.195562.4375-.4375.4375h-4.8125v10.5h10.5v-4.8125c0-.2419375.195562-.4375.4375-.4375h.875c.241938 0 .4375.1955625.4375.4375v5.6875c0 .483-.392438.875-.875.875zm12.690554-14c .240249 0 .434446.1933285.434446.4344461v4.3444615c0 .1746474-.10557.3340891-.268053.4005594-.053872.0230256-.11035.0338868-.166393.0338868-.112956 0-.224174-.0443135-.307154-.1272927l-1.557489-1.5579239-4.344027 4.3444615c-.169869.1698684-.444438.1698684-.615176 0l-.614307-.6143069c-.169868-.1698684-.169868-.4444384 0-.6143068l4.344462-4.3444615-1.557924-1.5579239c-.124252-.1246861-.161614-.3114979-.094275-.4735463.066905-.1629173.225912-.2680533.401428-.2680533z"
                                                          fill="#b9b9b9" transform="translate(-333 -24)"></path>
                                                </svg>
                                            </a>
                                        </li>
                                        <li>If for any reason your payment fails to confirm, your money will return
                                            to your wallet automatically.
                                        </li>
                                    </ul>
                                    <div>
                                        <button class="P-btn P-btn-grey">
                                            <i class="P-btn__icon P-btn__icon--back-grey"></i>
                                            Got it!
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- Payment confirmed step -->
                            <div class="P-Payment__confirmed" style="display: none;">
                                <div class="P-Content">
                                    <div class="P-Content__icon">
                                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' height='260' viewBox='0 0 263 260' width='263'%3E%3Cg fill='none'%3E%3Cellipse cx='130.19802' cy='130' fill='%233db39e' rx='130.19802' ry='130'/%3E%3Cpath d='m254.003317 89.7572c-3.687208-11.3178-8.874297-21.9518-15.345139-31.668l-113.967534 118.5236.229148 13.1898 5.379782-.0338z' fill='%2337a18e'/%3E%3Cpath d='m260.593941 51.1732-23.216911-22.9034c-3.16902-3.1278-8.309238-3.1278-11.478258 0l-99.244742 102.0708-42.7986934-42.224c-3.1742277-3.1278-8.3092376-3.1278-11.4808614 0l-20.579099 20.3034c-3.1690198 3.1252-3.1690198 8.1952 0 11.3204l68.6898718 67.7586c1.830584 1.807 4.312158 2.535 6.697386 2.2542 2.385227.2782 4.866802-.4472 6.697386-2.2542l126.713921-125.0028c3.169019-3.1278 3.169019-8.1952 0-11.323z' fill='%23f8f8f8'/%3E%3Cpath d='m133.88002 187.499 126.713921-125.0028c3.169019-3.1278 3.169019-8.1952 0-11.323l-3.788763-3.7388-130.346445 128.011-71.7859805-69.8672-2.8747723 2.8392c-3.1690198 3.1252-3.1690198 8.1952 0 11.3204l68.6872678 67.7612c1.830584 1.807 4.312158 2.535 6.697386 2.2542 2.385227.2808 4.866802-.4446 6.697386-2.2542z' fill='%23ebebeb'/%3E%3C/g%3E%3C/svg%3E">
                                    </div>
                                    <div class="P-Payment__confirmed__title">Payment Processed!</div>
                                    <h2>Thank You For Your Purchase!</h2>
                                    <p>
                                        Redirecting you back in 5 seconds.
                                    </p>
                                    <div>
                                        <a href="#" class="P-btn P-btn-grey">
                                            <i class="P-btn__icon P-btn__icon--refresh"></i>
                                            Redirect Now
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <table class="table table-bordered table-striped" style="margin-bottom: 0">
                    <tbody>
                    <tr>
                        <th>Order</th>
                        <td>#{$order->reference}</td>
                    </tr>
                    <tr>
                        <th>Payment status</th>
                        <td>{ucwords($paymentStatus)}</td>
                    </tr>
                    {if $savvyData}
                        <tr>
                            <th>Selected Token</th>
                            <td>{strtoupper($savvyData->token)}</td>
                        </tr>
                        <tr>
                            <th>
                                Payment address
                            </th>
                            <td><a href="{$blockExplorer}" target="_blank">{$savvyData->address}</a></td>
                        </tr>
                    {/if}
                    <tr>
                        <th>Total</th>
                        <td>{$total}</td>
                    </tr>
                    {if $alreadyPaid}
                        <tr>
                            <th>Paid</th>
                            <td>{$alreadyPaidFiatFormatted}</td>
                        </tr>
                        {if $toPayFiat > $maxUnderpaymentFiat}
                            <tr>
                                <th>To Pay</th>
                                <td>{$toPayFiatFormatted}</td>
                            </tr>
                        {/if}
                    {/if}
                    </tbody>
                </table>
            </div>
            {if $order->current_state == $statusWaitingForConfirmations}
                <a href="" class="btn btn-primary float-right">Refresh</a>
            {elseif $order->current_state == $statusPaymentAccepted}
                <a href="{$redirect}" class="btn btn-primary float-right">Continue</a>
            {else}
                <button id="savvy-all" class="btn btn-primary float-right">Pay with Crypto</button>
            {/if}
        </div>
    </div>
</div>
<div class="clearfix"></div>

<link rel="stylesheet" href="/modules/savvy/views/css/savvy.css">
<script>
    $(function () {
        var $container = $('#savvy');
        $.getScript('/modules/savvy/views/js/savvy.js', function () {
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
                timer: $container.data('timer'),
            });
            var autoopen = $container.data('autoopen');

            if (autoopen && autoopen === true) {
                $('#savvy-all').trigger('click');
            }
        });
    });
</script>
