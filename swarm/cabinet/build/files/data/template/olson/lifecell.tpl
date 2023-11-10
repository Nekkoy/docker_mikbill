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

    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" media="all">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">
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
            <div class="page-title">
                <h2><i class="fas fa-mobile-alt color"></i> <?php echo T_("Lifecell"); ?> </h2>
                <hr/>
            </div>
            
            <?php if(!empty($this->val["alter"])) { ?>
                <div class="awidget">
                    <div class="awidget-head">
                        <h3><?php echo T_($this->val["alter"]["title"]); ?></h3>
                    </div>

                    <div class="awidget-body no-table-bor">
                        <?php if( $this->val["alter"]["type"] == "error" ) { ?>
                            <div class="alert alert-danger">
                                <?php echo T_($this->val["alter"]["msg"]); ?>
                            </div>
                        <?php } else { ?>
                            <div class="alert alert-success">
                                <?php echo T_($this->val["alter"]["msg"]); ?>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            <?php } ?>

            <?php if(!empty($this->val["otp"])) { ?>
                <?php foreach($this->val["otp"] as $otpPhone => $timeleft) { ?>
                    <div class="awidget">
                        <div class="awidget-head">
                            <h3><?php echo T_("Переход на обслуживание к нам"); ?></h3>
                        </div>
        
                        <div class="awidget-body no-table-bor">
                            <div class="alert alert-info">
                                <ul>
                                    <li>
                                        <?php echo T_("На ваш номер"); ?> <strong><?php echo T_($otpPhone); ?></strong>
                                        <?php echo T_("отправлено СМС с кодом, введите его для завершения перехода"); ?>
                                    </li>
                                    <li>
                                        <?php echo T_("Оставшееся время для ввода кода"); ?>:
                                        <span id="otp_timeleft_<?php echo $otpPhone; ?>"><?php echo T_($timeleft); ?></span>
                                        <?php echo T_("сек."); ?>
                                    </li>
                                </ul>
                            </div>
                            <form class="form-horizontal" id="form_code_add" method="post" action="/index/main/lkview/lifecell">
                                <div class="form-group">
                                    <label for="mac" class="col-sm-3 control-label"><?php echo T_("OTP код"); ?>:</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="optcode" name="optcode" value="" required>
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="hidden" id="migrateP2C" name="migrateP2C" value="1"/>
                                        <button type="submit" id="codeaddb" class="btn btn-info"><?php echo T_("Подтвердить"); ?></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                <?php } ?>
            <?php } ?>

            <div class="awidget">
                <?php if( empty($this->val["migratedPhones"]) && empty($this->val["othersPhones"]) ) { ?>
                    <div class="awidget-head">

                    </div>
                    <div class="awidget-body no-table-bor">
                        <div class="alert alert-info">
                            <?php echo T_("Чтоб воспользоваться услугой нужно указать номер оператора Lifecell. Обратититесь в техподдержку"); ?>
                        </div>
                    </div>
                <?php } else { ?>
                    <?php foreach($this->val["migratedPhones"] as $phone => $packet) { ?>
                        <div class="awidget-head">
                            <h3><?php echo T_("Информация о номере"); ?>: <b><?php echo $phone; ?></b></h3>
                        </div>
        
                        <div class="awidget-body no-table-bor">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-xs-12">
                                                <?php echo T_("Баланс (личный)"); ?>: <?php echo $packet["balance"]; ?>
                                            </div>
                                        </div>
                                    </div>
        
                                    <div class="row" style="padding: 10px 0px 10px">
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
                                                <?php echo T_("Тариф"); ?>: <?php echo T_($packet["name"]); ?>
                                            </div>
                                            <div class="col-xs-6">
                                                <?php if( !empty($packet["endDate"]) ) { ?>
                                                <?php echo T_("Действует до"); ?>: <?php echo T_($packet["endDate"]); ?>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <?php if( !empty($packet["additional"]) ) { ?>
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
                                                <?php echo T_("Дополнительный пакет"); ?>: <?php echo T_($packet["name"]); ?>
                                            </div>
                                            <div class="col-xs-6">
                                                <?php if( !empty($packet["endDate"]) ) { ?>
                                                <?php echo T_("Действует до"); ?>: <?php echo T_($packet["endDate"]); ?>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <?php } ?>
                                    </div>
        
                                    <?php if( !empty($packet["voice"]) || !empty($packet["internet"]) || !empty($packet["sms"]) ) { ?>
                                        <div class="row" style="padding: 10px 0px 10px">
                                            <div class="col-xs-12">
                                                <div class="col-xs-12">
                                                    <?php echo T_("Информация по тарифу (контракту)"); ?>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                    
                                    <?php foreach($packet["voice"] as $lineName => $proper) { ?>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
                                                <?php echo T_("Минуты"); ?> (<?php echo T_($lineName); ?>): <?php echo $proper["current"]; ?> / <?php echo $proper["total"]; ?>
                                            </div>
                                            <div class="col-xs-6">
                                                <div class="progress">
                                                    <div role="progressbar" class="progress-bar <?php if($proper['perc'] < 10) { echo 'progress-bar-danger'; } elseif($proper['perc'] < 35) { echo 'progress-bar-warning'; } elseif($proper['perc'] < 70) { echo 'progress-bar-info'; } else { echo 'progress-bar-success'; } ?>"
                                                         aria-valuenow="<?php $proper['current']; ?>"
                                                         aria-valuemin="0"
                                                         aria-valuemax="<?php echo $proper['total']; ?>" style="width:<?php echo $proper['perc']; ?>%">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
        
                                    <?php foreach($packet["internet"] as $lineName => $proper) { ?>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
                                                <?php echo T_("Трафик"); ?> (<?php echo T_($lineName); ?>): <?php echo $proper["current"]; ?> / <?php echo $proper["total"]; ?> Mb
                                            </div>
                                            <div class="col-xs-6">
                                                <div class="progress">
                                                    <div role="progressbar" class="progress-bar <?php if($proper['perc'] < 10) { echo 'progress-bar-danger'; } elseif($proper['perc'] < 35) { echo 'progress-bar-warning'; } elseif($proper['perc'] < 70) { echo 'progress-bar-info'; } else { echo 'progress-bar-success'; } ?>"
                                                         aria-valuenow="<?php echo $proper['current']; ?>"
                                                         aria-valuemin="0"
                                                         aria-valuemax="<?php echo $proper['total']; ?>" style="width:<?php echo $proper['perc']; ?>%">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
        
                                    <?php if( !empty($packet["sms"]) ) { ?>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
                                                <?php echo T_("СМС"); ?>: <?php echo $packet["sms"]["current"]; ?> / <?php echo $packet["sms"]["total"]; ?>
                                            </div>
                                            <div class="col-xs-6">
                                                <div class="progress">
                                                    <div role="progressbar" class="progress-bar <?php if($packet['sms']['perc'] < 10) { echo 'progress-bar-danger'; } elseif($packet['sms']['perc'] < 35) { echo 'progress-bar-warning'; } elseif($packet['sms']['perc'] < 70) { echo 'progress-bar-info'; } else { echo 'progress-bar-success'; } ?>"
                                                         aria-valuenow="<?php echo $packet['sms']['current']; ?>"
                                                         aria-valuemin="0"
                                                         aria-valuemax="<?php echo $packet['sms']['total']; ?>" style="width:<?php echo $packet['sms']['perc']; ?>%">
        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php } ?>
                                </li>
                            </ul>
        
                            <div class="row">
                                <?php if(!empty($packet['disabled'])) { ?>
                                    <div class="col-md-12">
                                        <div class="alert alert-warning">
                                            <?php echo T_("Змiна/активацiя тарифу буде доступна з"); ?> <strong><?php echo $packet['disabledEnd'] ?></strong>
                                        </div>
                                    </div>
                                <?php } ?>
                                
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <!--
                                        <form method="post"
                                              onsubmit="return confirm('<?php echo T_("Вы действительно хотите отказаться от нашего обслуживания и перенести номер обратно на lifecell ?"); ?>');"
                                        action="/index/main/lkview/lifecell">
        
                                        
                                        <input type="hidden" id="migrateC2P" name="migrateC2P" value="1"/>
                                        <button type="submit" class="btn btn-default"><?php echo T_("Вернуть номер на Lifecell"); ?></button>
                                        </form>
                                        -->
                                    </div>
        
                                    <form method="post" action="/index/main/lkview/lifecellconfirm">
                                        <div class="col-md-3">
                                            <input type="hidden" name="gid" value="<?php echo $this->val['gid']; ?>"/>
                                            <button type="submit" class="btn btn-warning" <?php echo $packet['disabled'] ?>><?php echo T_("Активировать повторно"); ?></button>
                                        </div>
                                    </form>
        
                                    <form method="post" action="/index/main/lkview/lifecellmainline">
                                        <div class="col-md-3">
                                            <button type="submit" class="btn btn-primary" <?php echo $packet['disabled'] ?>><?php echo T_("Изменить тариф"); ?></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
    
                    <?php foreach($this->val["othersPhones"] as $phone) { ?>
                        <div class="awidget-head">
                            <h3><?php echo T_("Информация о номере"); ?>: <b><?php echo $phone; ?></b></h3>
                        </div>
        
                        <div class="awidget-body no-table-bor">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="col-xs-12">
                                                <?php echo T_("Похоже что данный номер не перенесен к нам на обслуживание."); ?><br>
                                                <?php echo T_("Если хотите использовать нашу тарифную сетку, необходимо совершить перенос номера к нам на обслуживание."); ?><br>
                                                <?php echo T_("Вам будет отправлено СМС с одноразовым кодом для подтверждения переноса номера."); ?>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
        
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-12">
                                        <form method="post"
                                              onsubmit="return confirm('<?php echo T_("Вы действительно хотите начать перенос номера?"); ?>');"
                                        action="/index/main/lkview/lifecell">
        
                                        <input type="hidden" id="migrateP2C" name="migrateP2C" value="1"/>
                                        <button type="submit" class="btn btn-info"><?php echo T_("Начать перенос номера"); ?></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>
            </div>

            <?php if( !empty(T_("lifecell_bottom_company_text")) && T_("lifecell_bottom_company_text") !== "lifecell_bottom_company_text" ) { ?>
                <div class="awidget">
                    <div class="awidget-head">
                        <h3><?php echo T_("lifecell_bottom_company_text"); ?></h3>
                    </div>
                </div>
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
    window.onload = function() {
        <?php if(!empty($this->val["otp"])) {
            foreach($this->val["otp"] as $otpPhone => $timeleft) {
                echo "var distance_{$otpPhone} = {$timeleft};\n";
                echo "var x_{$otpPhone} = setInterval(function() {
                    distance_{$otpPhone} = distance_{$otpPhone} - 1;
                    document.getElementById('otp_timeleft_{$otpPhone}').innerHTML = distance_{$otpPhone};
                    if (distance_{$otpPhone} < 0) {
                        clearInterval(x_{$otpPhone});
                        window.location.href = window.location.protocol +'//'+ window.location.host + window.location.pathname;
                        //location.reload();
                    }
                }, 1000);";
            }
        } ?>
    }
</script>

</body>
</html>
