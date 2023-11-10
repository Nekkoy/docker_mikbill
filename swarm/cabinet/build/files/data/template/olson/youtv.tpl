<!DOCTYPE html>
<html>
<head>
    <!-- Title here -->
    <title><?php echo $this->val['company_name']; ?> <?php echo T_("Личный кабинет"); ?></title>
    <!-- Description, Keywords and Author -->
    <meta name="description" content="Your description">
    <meta name="keywords" content="Your,Keywords">
    <meta name="author" content="ResponsiveWebInc">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Styles -->
    <!-- Bootstrap CSS -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animate css -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/animate.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/jquery.gritter.css" rel="stylesheet">
    <!-- Calendar -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/fullcalendar.css" rel="stylesheet">
    <!-- Bootstrap toggable -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/bootstrap-switch.css" rel="stylesheet">
    <!-- Date and Time picker -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <!-- Star rating -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/rateit.css" rel="stylesheet">
    <!-- Star rating -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/jquery.cleditor.css" rel="stylesheet">
    <!-- jQuery UI -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/jquery-ui.css" rel="stylesheet">
    <!-- prettyPhoto -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/prettyPhoto.css" rel="stylesheet">
    <!-- Font awesome CSS -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/font-awesome.min.css" rel="stylesheet">
	<link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/all.css" rel="stylesheet">
	
    <!-- Custom CSS -->
    <?php if (isset($this->val['gui']['template_style']) AND $this->val['gui']['template_style'] == 2){ ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/style-white.css" rel="stylesheet">
    <?php } elseif(isset($this->val['gui']['template_style']) AND $this->val['gui']['template_style'] == 3 AND
    file_exists($this->val['path_template'].'/customtpls/custom.css')) { ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/customtpls/custom.css" rel="stylesheet">
    <?php }else{ ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/style.css" rel="stylesheet">
    <?php }?>

    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/jquery.bootstrap-touchspin.css" rel="stylesheet"
          type="text/css"
          media="all">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/favicon.ico">
</head>

<body>

<!-- Logo & Navigation starts -->

<div class="header">
    <div class="container">
        <?php echo $this->val['header']; ?>
    </div>
</div>

<!-- Logo & Navigation ends -->

<!-- Page content -->

<div class="page-content blocky">
    <div class="container">

        <div class="sidebar-dropdown"><a href="#"><?php echo T_("МЕНЮ"); ?></a></div>

        <!-- Main menu -->
        <?php echo $this->val['main_menu']; ?>

        <div class="mainy">
            <!-- Page title -->
            <div class="page-title">
                <h2><i class="icon-desktop color"></i> <?php echo T_("YouTv"); ?> </h2>
                <hr/>
            </div>
            <!-- Page title -->
            <?php if(empty($this->val['email'])){ ?>
                <div class="alert alert-warning"><?php echo T_("Чтоб воспользоваться услугой youtv у вас должны быть заполнен email. Обратититесь в техподдержку"); ?></div>
            <?php } else { ?>

                <!-- Page title -->
                <div class="awidget" id="step_1">
                    <div class="awidget-head">
                        <h3><?php echo T_("Доступные подписки"); ?>:</h3>
                    </div>
    
                    <div class="awidget-body no-table-bor">
                        <?php foreach($this->val["subscriptions"]["list"] as $groupservices){ ?>
                        <ul class="list-group">
                            <?php foreach($groupservices as $type_services => $servicesArray){ ?>
                            <?php if( empty($servicesArray) ){ continue; } ?>
    
                            <?php foreach($servicesArray as $services) { ?>
                            <li class="list-group-item">
                                <?php echo $services["subscriptionrow"]; ?>
                            </li>
                            <?php } ?>
                            <?php } ?>
                        </ul>
                        <?php } ?>
    
                        <?php if( $this->val["subscriptions"]["disabledAlert"] ){ ?>
                        <div class="col-xs-12">
                            <div class="alert alert-warning" role="alert">
                                <?php echo T_("Дополнительные подписки группы доступны только при наличии подключенной подписки из основной группы"); ?>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                </div>
                
                <!-- Begin. Megogo info -->
                <?php if(isset($this->val['subscriptions']['info']['on']) AND $this->val['subscriptions']['info']['on'] == 1) { ?>
                    <div class="awidget" id="step_2">
                        <div class="awidget-head">
                            <h4> <i class="icon-info"> </i> Info youtv:</h4>
                            <hr>
                        </div>
                        
                        <div class="awidget-body no-table-bor">
                            <div class="alert alert-info">
                                <strong><?php echo T_("Данные для авторизации"); ?>:</strong>
                                <br>
                                <?php echo T_("Логин"); ?>: <?php echo $this->val['subscriptions']['info']['login']; ?>
                                <br>
                                <?php echo T_("Пароль"); ?>: <?php echo $this->val['subscriptions']['info']['password']; ?>
                            </div>
                
                            <!-- yotv -->
                            <style>
                                .space-1, .space-bottom-1 {
                                    padding-bottom: 2rem!important;
                                }
                
                                .btn-dark {
                                    color: #fff;
                                    background-color: #221e1e;
                                    border-color: #221e1e;
                                    border-radius: .3125rem;
                                }
                
                                .transition-3d-hover {
                                    transition: all .2s ease-in-out;
                                }
                
                                .ml-n8, .mx-n8 {
                                    margin-left: -3.5rem!important;
                                }
                                .mr-n8, .mx-n8 {
                                    margin-right: -3.5rem!important;
                                }
                                .mt-4, .my-4 {
                                    margin-top: 1.5rem!important;
                                }
                
                                .mt-2, .my-2 {
                                    margin-top: .5rem!important;
                                }
                                *, ::after, ::before {
                                    box-sizing: border-box;
                                }
                
                                .align-items-center {
                                    -ms-flex-align: center!important;
                                    align-items: center!important;
                                }
                                .media {
                                    display: -ms-flexbox;
                                    display: flex;
                                    -ms-flex-align: start;
                                    align-items: flex-start;
                                }
                                *, ::after, ::before {
                                    box-sizing: border-box;
                                }
                
                                .btn-xs {
                                    font-weight: 400;
                                    padding: .275rem .75rem;
                                }
                
                                .btn-wide {
                                    min-width: 10rem;
                                }
                
                                .btn-wide {
                                    min-width: 15rem;
                                }
                
                                .text-left {
                                    text-align: left!important;
                                }
                
                                .mr-3, .mx-3 {
                                    margin-right: 1rem!important;
                                }
                                .mt-1, .my-1 {
                                    margin-top: .25rem!important;
                                }
                                *, ::after, ::before {
                                    box-sizing: border-box;
                                }
                            </style>
                
                            <div class="text-center"
                                 style="background: url(//youtv.ua/assets/images/svg/components/abstract-shapes-19.svg) center no-repeat;">
                                <h2 class="h3 w-80 text-center mr-auto ml-auto">Зручні додатки</h2>
                                <p class="w-60 w-lg-80 text-center font-size-1 mr-auto ml-auto">Сучасні додатки youtv для різних пристроїв.</p>
                                <div class="mt-2 mx-n8">
                                    <button type="button" class="btn btn-xs btn-dark btn-wide transition-3d-hover text-left mx-1" onclick="window.open ( 'https://play.google.com/store/apps/details?id=ua.youtv.youtv&amp;hl=uk' )">
                                        <span class="media align-items-center">
                                            <span class="mt-1 mr-3">
                                                <svg class="img-fluid" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 512 512">
                                                    <path fill="#fff" d="M325.3 234.3L104.6 13l280.8 161.2-60.1 60.1zM47 0C34 6.8 25.3 19.2 25.3 35.3v441.3c0 16.1 8.7 28.5 21.7 35.3l256.6-256L47 0zm425.2 225.6l-58.9-34.1-65.7 64.5 65.7 64.5 60.1-34.1c18-14.3 18-46.5-1.2-60.8zM104.6 499l280.8-161.2-60.1-60.1L104.6 499z"></path>
                                                </svg>
                                            </span>
                                            
                                            <span class="media-body">
                                                <span class="d-block mb-n1">Доступно в</span>
                                                <br>
                                                <span class="font-size-1">Google Play</span>
                                            </span>
                                        </span>
                                    </button>
                
                                    <button type="button" class="btn btn-xs btn-dark btn-wide transition-3d-hover text-left mx-1" onclick="window.open ( 'https://apps.apple.com/us/app/you-tv-onlajn-tv/id1176282993?l=uk' )">
                                        <span class="media align-items-center">
                                            <span class="mt-1 mr-3">
                                                <svg class="img-fluid" xmlns="http://www.w3.org/2000/svg" width="18" height="24" viewBox="0 0 384 512">
                                                    <path fill="#fff" d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path>
                                                </svg>
                                            </span>
                                            
                                            <span class="media-body">
                                                <span class="d-block mb-n1">Завантажити в</span>
                                                <br>
                                                <span class="font-size-1">App Store</span>
                                            </span>
                                        </span>
                                    </button>
                                </div>
                                <div class="mt-2 mx-n8">
                                    <button type="button" class="btn btn-xs btn-dark btn-wide transition-3d-hover text-left mx-1" onclick="return false;">
                                        <span class="media align-items-center">
                                            <span class="mt-1 mr-3">
                                                <svg class="img-fluid" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                                    <g>
                                                        <g>
                                                            <g>
                                                                <polygon fill="#fff" points="9.3,19.4 7.2,22.2 17.1,22.2 15,19.4"></polygon>
                                                                <path fill="#fff" d="M22.1,2.9H1.9C0.8,2.9,0,3.8,0,4.8v11.5c0,1,0.8,1.9,1.9,1.9h20.3c1,0,1.9-0.8,1.9-1.9V4.8C24,3.8,23.2,2.9,22.1,2.9z"></path>
                                                            </g>
                                                        </g>
                                                    </g>
                                                </svg>
                                            </span>
                                                
                                            <span class="media-body">
                                                <span class="d-block mb-n1">Доступно для</span>
                                                <br>
                                                <span class="font-size-1">Smart TV</span>
                                            </span>
                                        </span>
                                    </button>
                                    <button type="button" class="btn btn-xs btn-dark btn-wide transition-3d-hover text-left mx-1" onclick="window.open ( 'https://appgallery.huawei.com/#/app/C103041047' )">
                                        <span class="media align-items-center">
                                            <span class="mt-1 mr-3">
                                                <svg class="img-fluid" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 18" fill="#fff">
                                                    <path d="M10.34,17a.1.1,0,0,0,0-.09A54.74,54.74,0,0,0,3.68,6.17s-2.1,2-1.95,4a3.5,3.5,0,0,0,1.21,2.39c1.83,1.78,6.27,4,7.3,4.52a.06.06,0,0,0,.09,0m-.68,1.52a.1.1,0,0,0-.09-.07h0l-7.38.25c.8,1.42,2.14,2.53,3.55,2.19a19.19,19.19,0,0,0,3.89-2.28h0c.05-.05,0-.09,0-.09m.11-.66c0-.06,0-.11,0-.11h0C6.49,15.62.21,12.28.21,12.28a4.35,4.35,0,0,0,2.53,5.37A4.88,4.88,0,0,0,4.15,18c.11,0,4.39,0,5.54,0a.08.08,0,0,0,.07-.05M10.25,3c-.32,0-1.19.22-1.19.22A3.44,3.44,0,0,0,6.65,5.49a4.39,4.39,0,0,0,0,2.33c.65,2.88,3.86,7.61,4.55,8.61a.11.11,0,0,0,.09,0,.08.08,0,0,0,.06-.1h0C12.43,5.8,10.25,3,10.25,3m2.44,13.45a.08.08,0,0,0,.11,0h0c.71-1,3.9-5.72,4.55-8.59a4.83,4.83,0,0,0,0-2.33,3.41,3.41,0,0,0-2.44-2.26A10.42,10.42,0,0,0,13.76,3s-2.19,2.8-1.12,13.37h0a.08.08,0,0,0,0,.08m1.75,2.05a.12.12,0,0,0-.08.05.09.09,0,0,0,0,.1h0a19.18,19.18,0,0,0,3.87,2.29s1.91.64,3.57-2.19l-7.39-.26Zm9.35-6.24s-6.27,3.35-9.51,5.53h0a.09.09,0,0,0,0,.11.11.11,0,0,0,.08.05H20a5,5,0,0,0,1.27-.29,4.33,4.33,0,0,0,2.54-5.39M13.68,17a.12.12,0,0,0,.1,0h0c1.06-.53,5.46-2.75,7.28-4.52a3.52,3.52,0,0,0,1.21-2.4c.14-2.06-1.94-4-1.94-4a54.19,54.19,0,0,0-6.67,10.75h0a.09.09,0,0,0,0,.11"
                                                            transform="translate(0 -3)"></path>
                                                </svg>
                                            </span>
                                            
                                            <span class="media-body">
                                                <span class="d-block mb-n1">Завантажити в</span>
                                                <br>
                                                <span class="font-size-1">AppGallery</span>
                                            </span>
                                        </span>
                                    </button>
                                </div>
                            </div>
                            
                            <br><br>
                            <!-- yotv -->
                        </div>
                    </div>
                <?php } ?>
            <?php } ?>
        </div>

    <div class="clearfix"></div>

    </div>
</div>

<!-- Footer starts -->
<div class="navbar-bottom row-fluid">
    <div class="navbar-inner">
        <footer>
            <div class="container">
                <?php echo $this->val['footer']; ?>
            </div>
        </footer>
    </div>
</div>
<!-- Footer ends -->

<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span>

<!-- Форма нового тикета -->
<?php echo $this->val['ticket_new_form']; ?>


<!-- Javascript files -->
<!-- jQuery -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.js"></script>
<!-- Bootstrap JS -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/bootstrap.min.js"></script>
<!-- jQuery UI -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery-ui-1.10.2.custom.min.js"></script>

<!-- jQuery Peity -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/peity.js"></script>
<!-- Calendar -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/fullcalendar.min.js"></script>
<!-- jQuery Star rating -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.rateit.min.js"></script>
<!-- prettyPhoto -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.prettyPhoto.js"></script>
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.bootstrap-touchspin.js"></script>
<!-- jQuery flot -->
<!--[if lte IE 8]>
<script language="javascript" type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.flot.js"></script>
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.flot.pie.js"></script>
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.flot.stack.js"></script>
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.flot.resize.js"></script>

<!-- Gritter plugin -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.gritter.min.js"></script>
<!-- CLEditor -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.cleditor.min.js"></script>
<!-- Date and Time picker -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/bootstrap-datetimepicker.min.js"></script>
<!-- jQuery Toggable -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/bootstrap-switch.min.js"></script>
<!-- Respond JS for IE8 -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/respond.min.js"></script>
<!-- HTML5 Support for IE -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/html5shiv.js"></script>
<!-- Custom JS -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/custom.js"></script>


<script type="text/javascript">


    $(document).ready(function () {

        var tariff_checked  = false;

        $(':input[id="1_tariff_select"]').each(function(index, element){
            if(element.checked){
                tariff_checked = true;
            }
        });

        if(tariff_checked == false){
            $(':input[id="2_packet_select"]').attr('disabled', true);
        }

        $(':input[id="1_tariff_select"]').click(function (event) {

            if (this.checked) {
                $(':input[id="1_tariff_select"]').attr('checked', false);
                $(':input[id="2_packet_select"]').attr('disabled', false);
                this.checked = true;
            } else {
                $(':input[id="2_packet_select"]').attr('checked', false);
                $(':input[id="2_packet_select"]').attr('disabled', true);
                this.checked = false;
            }
        });

        // show/hide packet
        $(".click").click(
            function () {
                $('#' + this.id + '_toggle').toggle('Blind');
            }
        );

    });

</script>

</body>
</html>