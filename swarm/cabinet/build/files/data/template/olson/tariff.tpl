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
    <?php } elseif(isset($this->val['gui']['template_style']) AND $this->val['gui']['template_style'] == 3 AND file_exists($this->val['path_template'].'/customtpls/custom.css')) { ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/customtpls/custom.css" rel="stylesheet">
    <?php }else{ ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/style.css" rel="stylesheet">
    <?php }?>


    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css"
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
                <h2><i class="icon-desktop color"></i> <?php echo T_("Смена тарифа"); ?> </h2>
                <hr/>
            </div>
            <!-- Page title -->

            <?php if( $this->val['gidd'] > 0 ) { ?>
            <div class="awidget" id="step_0">
                <div class="awidget-head">
                    <h3> <?php echo T_("Ваш будущий тариф"); ?>:</h3>
                </div>

                <div class="awidget-body no-table-bor">
                    <table class="table">
                        <tr>
                            <td><?php echo T_("Название будущего тарифа"); ?>:</td>
                            <td><?php echo $this->val['gidd_name']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo T_("Абонплата в будущем тарифе"); ?>:</td>
                            <td><?php echo $this->val['gidd_price']; ?> <?php echo $this->val['UE']; ?></td>
                        </tr>
                    </table>
                    <?php echo $this->val['cabinet_tarif_alert']; ?>
                </div>
            </div>
            <?php } ?>
            
            <div class="awidget" id="step_1">
                <div class="awidget-head">
                    <h3> <?php echo T_("Шаг 1. Выберите тариф"); ?>:</h3>
                </div>

                <div class="awidget-body no-table-bor">
                    <?php if ( $this->val['gidd'] == 0 ) { ?>
                        <?php echo $this->val['cabinet_tarif_alert']; ?>
                    <?php } ?>
                    
                    <form class="form-inline" role="form">

                        <div class="form-group">
                            <label class="control-label"><?php echo T_("Выбор тарифа"); ?>: </label>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-12 ">
                                <select class="form-control" id="tariff_list">
                                    <?php echo $this->val['cab_tariff_list']; ?>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="button" class="btn btn-info" id="next_step_tariff"><?php echo T_("Далее"); ?></button>
                        </div>

                    </form>
                </div>
            </div>

            <div class="awidget" style="display:none" id="step_2">
                <div class="awidget-head">
                    <h3> <?php echo T_("Шаг 2. Подтвердите смену тарифа"); ?>:</h3>
                </div>

                <div class="awidget-body no-table-bor">
                    <form class="form-horizontal" action="/index/main" method="post">

                        <input name="lkview" value="tariff" type="hidden">
                        <input name="gidd" id="gidd" value="0" type="hidden">


                        <!-- Checkbox -->
                        <div class="form-group" style="display:none" id="tariff_option">
                            <div class="col-lg-6 col-lg-offset-2">
                                <label class="radio inline">
                                    <input name="from_next_month" id="change_now" value="0" checked type="radio">
                                    <?php echo T_("Перейти сейчас"); ?>
                                </label>

                                <label class="radio inline">
                                    <input name="from_next_month" id="change_from_next_month" value="1" type="radio"><?php echo T_("Перейти со следующего месяца"); ?>
                                </label>
                            </div>
                        </div>

                        <!-- Telephone -->
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="telephone"><?php echo T_("Введите пароль"); ?>:</label>

                            <div class="col-lg-4">
                                <input type="password" class="form-control" id="oldpass"  name="oldpass">
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="form-group">
                            <!-- Buttons -->
                            <div class="col-lg-6 col-lg-offset-2">
                                <button type="button" class="btn btn-default" id="back_step_tariff"><?php echo T_("Назад"); ?></button>
                                <button type="submit" class="btn btn-info" id="submit" disabled><?php echo T_("Подтвердить"); ?></button>

                            </div>
                        </div>
                    </form>


                </div>

            </div>

            <?php echo $this->val['cab_tariff_how_match']; ?>

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

        var tariff_option_show = Number(<?php if(isset($this->val['gui']['changetariffoptions_visible'])){ echo $this->val['gui']['changetariffoptions_visible']; } else { echo "0"; } ?>);

        if(tariff_option_show == 1){
            $("#tariff_option").show();
        }else{
            $("#tariff_option").hide();
        }

        var tariff_option_deff = Number(<?php if(isset($this->val['gui']['changetariffoptions_default'])){ echo $this->val['gui']['changetariffoptions_default']; } else {echo "1" ;} ?>);

        if(tariff_option_deff == '1'){
            $("#change_now").attr('checked', true);
        }else{
            $("#change_from_next_month").attr('checked', true);
        }

        $("#next_step_tariff").click(function () {
            $("#step_1").hide();
            $("#info_tariff").hide();
            $("#step_2").show();

            $("#gidd").val($("#tariff_list").val());
        });

        $("#back_step_tariff").click(function () {
            $("#step_2").hide();
            $("#step_1").show();
            $("#info_tariff").show();
        });

        if ($("#tariff_list").val() < 1) {
            $("#next_step_tariff").attr('disabled', true);
        } else {
            $("#next_step_tariff").attr('disabled', false);
        }

        old_info = $("#tariff_list").val();
        $("#info_tariff_" + old_info).show();

        $("#tariff_list").change(function () {
            now_info = $("#tariff_list").val();
            $("#info_tariff_" + old_info).hide();
            $("#info_tariff_" + now_info).show();
            old_info = $("#tariff_list").val();
        });



        if ($("#oldpass").val().length != 0) {
            $("#submit").attr('disabled', false);
        }

        $("#oldpass").keyup(function () {
            if ($("#oldpass").val().length == 0) {
                $("#submit").attr('disabled', true);
            }
            else {
                $("#submit").attr('disabled', false);
            }
        });

    });
</script>

</body>
</html>