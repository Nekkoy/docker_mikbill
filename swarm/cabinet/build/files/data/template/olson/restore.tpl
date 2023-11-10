<!DOCTYPE html>
<html>
<head>
    <!-- Title here -->
    <title><?php echo $this->val['company_name']; ?> <?php echo T_("Восстановление пароля"); ?></title>
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
    <?php } elseif(isset($this->val['gui']['template_style']) AND $this->val['gui']['template_style'] == 3 AND file_exists($this->val['path_template'].'/customtpls/custom.css')) { ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/customtpls/custom.css" rel="stylesheet">
    <?php }else{ ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/style.css" rel="stylesheet">
    <?php }?>

    <!-- intlTelInput CSS -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/intlTelInput.css" rel="stylesheet">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/favicon.ico">
</head>

<body>


<!-- Logo & Navigation starts -->

<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- Logo -->
                <div class="logo text-center">
                    <h1><a href="#"><?php echo $this->val['company_name']; ?></a></h1>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Logo & Navigation ends -->


<!-- Page content -->

<div class="page-content blocky">
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <div class="awidget login-reg">
                    <div class="awidget-head">

                    </div>
                    <div class="awidget-body">
                        <!-- Page title -->
                        <div class="page-title text-center">
                            <h2><?php echo T_("Восстановление пароля"); ?></h2>
                            <hr/>
                        </div>
                        <!-- Page title -->

                        <div class="row form-group">
                            <div class="col-xs-12">
                                <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                                    <li id="nav-step-1" class="disabled"><a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 1"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("Номер телефона"); ?></p>
                                        </a>
                                    </li>
                                    <li id="nav-step-2" class="disabled"><a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 2"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("СМС с данными"); ?></p>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="row setup-content" id="step-1" style="display:none">
                            <div class="col-xs-12">
                                <div class="col-md-12 well text-center">


                                    <h3>  <?php echo $this->val['restore_step_text']; ?></h3>

                                    <hr/>


                                    <form class="form-horizontal" role="form" action="/index/main" method="post">

                                        <input name="lkview" value="restore" type="hidden">

                                        <input id="phone" name="phone" value="error" type="hidden">

                                        <div class="form-group" >
                                            <div class="col-lg-12">
                                                <label for="phone-view" class="col-sm-2 control-label text-left"><?php echo T_("Телефон"); ?></label>

                                                <div id="phone-val" class="col-lg-8">
                                                    <input type="tel" class="form-control" id="phone-view" name="phone-view" >
                                                </div>
                                            </div>

                                        </div>

                                        <hr/>

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <button type="button" id="cancel-step-1" class="btn btn-default "><?php echo T_("Отмена"); ?></button>
                                                <button type="submit" id="activate-step-2" class="btn btn-primary "><?php echo T_("Далее"); ?></button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>

                        <div class="row setup-content" id="step-2" style="display:none">
                            <div class="col-xs-12">
                                <div class="col-md-12 well text-center">

                                    <h3>  <?php echo $this->val['restore_step_text']; ?></h3>

                                    <hr/>

                                    <form class="form-horizontal" role="form" action="/index/main" method="post">
                                        <input name="lkview" value="login" type="hidden">

                                        <div class="form-group">
                                            <div class="col-lg-12 text-center">
                                                <button type="submit" class="btn btn-primary btn-block"> <?php echo T_("Вход в личный кабинет"); ?> </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

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
<!-- AutoTab JS -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.autotab.js"></script>

<!-- IntlTelInput JS -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/intlTelInput.js"></script>
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/utils.js"></script>

<script type="text/javascript">

    $(document).ready(function () {

        var step =  <?php echo $this->val['restore_step']; ?>;

        var input = document.querySelector("#phone-view");
        var output      = $("#phone"),
            phoneval    = $("#phone-val"),
            navstep1    = $("#nav-step-1"),
            navstep2    = $("#nav-step-2"),
            step1       = $("#step-1"),
            step2       = $("#step-2"),
            activateStep2 = $("#activate-step-2");

        if (step == '1'){
            step1.show();
            navstep1.addClass('active');
            navstep1.removeClass('disabled');
        }

        if (step == '2') {
            step2.show();
            navstep2.addClass('active');
            navstep2.removeClass('disabled');
        }


        $("#cancel-step-1").click(function () {
            location.href= "/index/main/lkview/login";
        });

        $("#cancel-step-2").click(function () {
            location.href= "/index/main/lkview/login";
        });


        // Страна по умолчанию, либо AUTO
        var defaultCountry = <?php if(isset($this->val['gui']['restore_pass_def_country']) AND $this->val['gui']['restore_pass_def_country'] <> ''){ echo $this->val['gui']['restore_pass_def_country']; } else { echo '"auto"'; } ?>;

        // Предпочтительные страны в списке
        var preferredCountries = [<?php if(isset($this->val['gui']['restore_pass_pref_country'])){ echo $this->val['gui']['restore_pass_pref_country']; } else { echo ''; } ?>];

        //Список стран для списка
        var onlyCountries = [<?php if(isset($this->val['gui']['restore_pass_only_country']) AND $this->val['gui']['restore_pass_only_country'] <> ''){ echo $this->val['gui']['restore_pass_only_country']; } else { echo ''; } ?>];


        //Делаем не активной кнопку Далее
        activateStep2.addClass('disabled');

        var intlTelInputParam = {
            autoPlaceholder: true,
            autoHideDialCode: false,
            showCountryDialCode: true,
            nationalMode: false,
            initialCountry: defaultCountry,
            defaultCountry: defaultCountry,
            preferredCountries: preferredCountries,
            utilsScript: "/data/template/<?php echo $this->val['template_dir']; ?>/js/utils.js"
        };

        if(onlyCountries != ''){
            intlTelInputParam['onlyCountries'] = onlyCountries;
        }

        var iti = window.intlTelInput(input, intlTelInputParam);

        // here, the index maps to the error code returned from getValidationError - see readme
        var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];

        var reset = function() {
            phoneval.addClass("has-error");
            activateStep2.addClass('disabled');
        };

        var validate = function() {
            reset();
            
            if (input.value.trim()) {
                if (iti.isValidNumber()) {
                   phoneval.removeClass("has-error");
                   activateStep2.removeClass('disabled');
                   output.val(input.value.trim());
                } else {
                    phoneval.addClass("has-error");
                    activateStep2.addClass('disabled');
                }
            }
        };
        
        input.addEventListener('blur', validate);
        
        // on keyup / change flag
        input.addEventListener('change', validate);
        input.addEventListener('keyup', validate);
    });
</script>

</body>
</html>
