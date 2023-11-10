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
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/datepicker.css" rel="stylesheet">
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

    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" media="all">

    <!-- Custom CSS -->
    <?php if (isset($this->val['gui']['template_style']) AND $this->val['gui']['template_style'] == 2){ ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/style-white.css" rel="stylesheet">
    <?php } elseif(isset($this->val['gui']['template_style']) AND $this->val['gui']['template_style'] == 3 AND file_exists($this->val['path_template'].'/customtpls/custom.css')) { ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/customtpls/custom.css" rel="stylesheet">
    <?php }else{ ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/style.css" rel="stylesheet">
    <?php }?>

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
                <h2><i class="icon-desktop color"></i> <?php echo T_("Заморозка"); ?> </h2>
                <hr/>
            </div>
            <!-- Page title -->

            <?php if($this->val['frezetable']== 1 ){ ?>
                <div class="awidget" id="step_1">
                    <div class="awidget-head">
                        <h3> <?php echo T_("Подтвердите отказ от услуги Заморозка"); ?>:</h3>
                    </div>
    
                    <div class="awidget-body no-table-bor">
                        <?php echo $this->val['cab_freeze_alert']; ?>
                        
                        <form class="form-horizontal" action="/index/main" method="post">
                            <input type="hidden" class="form-control" name="lkview" value="freeze">
                            <div class="form-group">
                                <label class="control-label col-lg-2" for="telephone"><?php echo T_("Введите пароль"); ?>:</label>
                                <div class="col-lg-4">
                                    <input type="password" class="form-control" name="oldpass" id="oldpass">
                                </div>
                                <button type="submit" class="btn btn-info" id="submit" disabled><?php echo T_("Подтвердить"); ?></button>
                            </div>
                        </form>
                    </div>
                </div>
            <?php } else { ?>
                <?php if( $this->val['freeze_fixed_month'] == 1 ){ ?>
                    <div class="awidget" id="step_1">
                        <div class="awidget-head">
                            <h3> <?php echo T_("Подтвердите заказ услуги Заморозка"); ?>:</h3>
                        </div>
        
                        <div class="awidget-body no-table-bor">
                            <?php echo $this->val['cab_freeze_alert']; ?>
                            <?php echo $this->val['cab_freeze_active_alert']; ?>
                            
                            <form class="form-horizontal" action="/index/main" method="post">
                                <input type="hidden" class="form-control" name="lkview" value="freeze">
        
                                <div class="form-group">
                                    <div class="col-lg-6 col-lg-offset-3">
                                        <label class="checkbox inline">
                                            <input type="checkbox" name="do_freeze_now" id="do_freeze_now" value="1">
                                            <?php echo T_("Немедленная заморозка"); ?>
                                        </label>
                                    </div>
                                </div>
        
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="telephone"><?php echo T_("Заморозить с"); ?>:</label>
        
                                    <div class="col-lg-4">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="icon icon-calendar"></i>
                                            </div>
                                            <input class="form-control pull-right span2" name="freeze_date_start"  id="freeze_date_start" type="text">
                                        </div>
                                    </div>
                                </div>
        
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="telephone"><?php echo T_("Период заморозки"); ?>:</label>
        
                                    <div class="col-lg-4">
                                        <select class="form-control" id="freeze_list" name="freezefixedmonthnum">
                                            <option  value="1">1 месяц</option>
                                            <option  value="2">2 месяца</option>
                                            <option  value="3">3 месяца</option>
                                        </select>
                                    </div>
                                </div>
        
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="telephone"><?php echo T_("Введите пароль"); ?>:</label>
        
                                    <div class="col-lg-4">
                                        <input type="password" class="form-control" name="oldpass" id="oldpass">
                                    </div>
                                </div>
        
                                <div class="form-group">
                                    <!-- Buttons -->
                                    <div class="col-lg-6 col-lg-offset-2">
                                        <button type="reset" class="btn btn-default"><?php echo T_("Назад"); ?></button>
                                        <button type="submit" class="btn btn-info" id="submit" disabled><?php echo T_("Подтвердить"); ?></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                <?php } else { ?>
                    <div class="awidget" id="step_1">
                        <div class="awidget-head">
                            <h3> <?php echo T_("Подтвердите заказ услуги Заморозка"); ?>:</h3>
                        </div>
                        <div class="awidget-body no-table-bor">
                            <?php echo $this->val['cab_freeze_alert']; ?>

                            <form class="form-horizontal" action="/index/main" method="post">
                                <input type="hidden" class="form-control" name="lkview" value="freeze">
                                <div class="form-group">
                                    <div class="col-lg-6 col-lg-offset-2">
                                        <label class="checkbox inline">
                                            <input type="checkbox" name="do_freeze_now" id="do_freeze_now" value="1">
                                            <?php echo T_("Немедленная заморозка"); ?>
                                        </label>
                                        <label class="checkbox inline">
                                            <input type="checkbox" name="freeze_do_ever" id="freeze_do_ever" <?php echo $this->val['cab_freeze_do_ever']; ?> value="1">
                                            <?php echo T_("Бессрочная заморозка"); ?>
                                        </label>
                                    </div>
                                </div>
        
                                <div class="form-group">
                                    <label class="control-label col-lg-2" for="telephone"><?php echo T_("Заморозить с"); ?>:</label>
        
                                    <div class="col-lg-4">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="icon icon-calendar"></i>
                                            </div>
                                            <input class="form-control pull-right span2" name="freeze_date_start" id="freeze_date_start" type="text">
                                        </div>
                                    </div>
                                </div>
        
                                <div class="form-group">
                                    <label class="control-label col-lg-2" for="telephone"><?php echo T_("Отменить заморозку с"); ?>:</label>
                                    </br>
                                    <div class="col-lg-4">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="icon icon-calendar"></i>
                                            </div>
                                            <input class="form-control pull-right span2" name="freeze_date_stop" id="freeze_date_stop" type="text">
                                        </div>
                                    </div>
                                </div>
        
                                <div class="form-group">
                                    <label class="control-label col-lg-2" for="telephone"><?php echo T_("Введите пароль"); ?>:</label>
        
                                    <div class="col-lg-4">
                                        <input type="password" class="form-control" name="oldpass" id="oldpass">
                                    </div>
                                </div>
        
                                <div class="form-group">
                                    <!-- Buttons -->
                                    <div class="col-lg-6 col-lg-offset-2">
                                        <button type="reset" class="btn btn-default"><?php echo T_("Назад"); ?></button>
                                        <button type="submit" class="btn btn-info" id="submit" disabled><?php echo T_("Подтвердить"); ?></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                <?php } ?>
            <?php } ?>

            <div class="awidget" id="turbo_info">
                <div class="awidget-head">
                    <h3> <?php echo T_("Информация по услуге Заморозка"); ?>:</h3>
                </div>

                <div class="awidget-body no-table-bor">
                    <table class="table">
                        <tr>
                            <td><?php echo T_("Стоимость активации услуги"); ?>:</td>
                            <td><?php echo $this->val['cena_freeze']; ?> <?php echo $this->val['UE']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo T_("Стоимость деактивации услуги"); ?>:</td>
                            <td><?php echo $this->val['cena_unfreeze']; ?> <?php echo $this->val['UE']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo T_("Ежедневная стоимость услуги"); ?>:</td>
                            <td><?php echo $this->val['cena_sutok_freeze']; ?> <?php echo $this->val['UE']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo T_("Кол-во бесплатных заморозок в год"); ?>:</td>
                            <td><?php echo $this->val['count_free_freeze']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo T_("Всего использовано заморозок"); ?>:</td>
                            <td><?php echo $this->val['count_free_freeze_use']; ?></td>
                        </tr>
                    </table>
                </div>
            </div>
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

<!-- Date and Time picker -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/bootstrap-datepicker.js"></script>

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
    var startDate = $("#freeze_date_start");
    var endDate = $("#freeze_date_stop");
    var minDate = new Date(); // минимальное значение - сегодняшняя дата
    var minDays = <?php echo $this->val['min_sutok_freeze']; ?>;

    startDate.datepicker({
        autoclose: true,
        format: "yyyy-mm-dd",
        startDate: minDate,
        defaultDate: new Date()
    });
    
    var minEndDate = new Date();
    minEndDate.setDate(minEndDate.getDate() + minDays);
    
    endDate.datepicker({
        autoclose: true,
        format: "yyyy-mm-dd",
        startDate: minEndDate,
        defaultDate: minEndDate
    });
    
    startDate.val(minDate.toISOString().slice(0,10));
    endDate.val(minEndDate.toISOString().slice(0,10));
    
    // Обработчик события change для даты начала услуг
    startDate.on("changeDate", function(e) {
        // Устанавливаем минимальную дату для выбора даты окончания услуги на дату начала + мин дней
        var minEndDate = new Date(e.date);
        minEndDate.setDate(minEndDate.getDate() + minDays);

        // Устанавливаем минимально допустимую дату для выбора даты окончания
        endDate.datepicker("setStartDate", minEndDate);
    });
    
    // Обработчик события change для даты окончания услуг
    endDate.on("changeDate", function(e) {
        // Устанавливаем максимальную дату для выбора даты начала услуги на дату окончания - мин дней
        var maxStartDate = new Date(e.date);
        maxStartDate.setDate(maxStartDate.getDate() - minDays);
        
        // Устанавливаем максимально допустимую дату для выбора даты начала
        startDate.datepicker("setEndDate", maxStartDate);
    });
    
    $("#do_freeze_now").click(function () {
        if ($("#do_freeze_now").is(':checked')) {
            $("#freeze_date_start").attr('disabled', true);
        } else {
            $("#freeze_date_start").attr('disabled', false);
        }
    });
    
    $("#freeze_do_ever").click(function () {
        if ($("#freeze_do_ever").is(':checked')) {
            $("#freeze_date_stop").attr('disabled', true);
        } else {
            $("#freeze_date_stop").attr('disabled', false);
        }
    });
    
    if ($("#oldpass").val().length != 0) {
        $("#submit").attr('disabled', false);
    }
    
    $("#oldpass").keyup(function () {
        if ($("#oldpass").val().length == 0) {
            $("#submit").attr('disabled', true);
        } else {
            $("#submit").attr('disabled', false);
        }
    });
});
</script>

</body>
</html>