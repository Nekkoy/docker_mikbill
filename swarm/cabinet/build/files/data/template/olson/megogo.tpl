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

    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/jquery.bootstrap-touchspin.css" rel="stylesheet"
          type="text/css"
          media="all">

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
            <!-- Page title -->
            <div class="page-title">
                <h2><i class="icon-desktop color"></i> <?php echo T_("Megogo"); ?> </h2>
                <hr/>
            </div>
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
                    <h4> <i class="icon-info"> </i> MEGOGO:</h4>
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

                    <form class="form-horizontal" role="form">
                        <hr>
                        <div class="form-group">
                            <!-- Buttons -->
                            <div class="col-lg-6 ">
                                <a href="https://megogo.net/ru/login" class="btn btn-success" target="_blank">
                                    <i class="icon-signin"></i> <?php echo T_("Вход в MEGOGO"); ?></a>

                                <button class="btn btn-default" data-toggle="modal" data-target="#reset_pass_megogo">
                                    <i class="icon-key"></i> <?php echo T_("Сброс пароля"); ?></button>
                            </div>
                        </div>
                    </form>

                    <!-- Begin. Megogo reset pass modal -->
                    <div id="reset_pass_megogo" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title"><?php echo T_("Сброс пароля"); ?></h4>
                                </div>

                                <form class="form-horizontal" role="form" id="form_select_channel" method="post" action="/index/main">
                                    <input type="hidden" class="form-control" name="lkview" value="megogo">
                                    <input type="hidden" class="form-control" name="megogo_action" value="resetpass">
                                    <div class="modal-body" id="modal_text">
                                        <center><p><?php echo T_("Уважаемый"); ?> <?php echo $this->val['fio']; ?>!</p></center>
                                        <p><?php echo T_('Для подтверждения изменений данных авторизации в портале MEGOGO нажмите кнопку "Подтвердить"'); ?>.</p>

                                        </br>

                                        <div class="alert alert-info">
                                            <strong><?php echo T_("Данные для авторизации"); ?>:</strong>
                                            <br>
                                            <?php echo T_("Логин"); ?>: <?php echo $this->val['subscriptions']['info']['login']; ?>
                                            <br>
                                            <?php echo T_("Пароль"); ?>: <?php echo $this->val['subscriptions']['info']['password']; ?>
                                        </div>

                                        <p class="text-warning"><small><?php echo T_("За более детальной информацией Вы можете обратиться в Отдел технической поддержки."); ?></small></p>

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo T_("Закрыть"); ?></button>
                                        <button type="submit" class="btn btn-primary"><?php echo T_("Подтвердить"); ?></button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                    <!-- End. Megogo reset pass modal -->
                </div>
            </div>
            <?php } ?>
            <!-- End. Megogo info -->
        </div>
    </div>
    <div class="clearfix"></div>
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