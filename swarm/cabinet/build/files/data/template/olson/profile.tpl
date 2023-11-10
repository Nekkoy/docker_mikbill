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
                <h2><i class="icon-desktop color"></i> <?php echo T_("Профиль"); ?> </h2>
                <hr/>
            </div>

            <!-- Page title -->
            <div class="row">
                <div class="col-md-12">

                    <div class="awidget">
                        <div class="awidget-head">
                            <h3><?php echo T_("Мой профиль"); ?></h3>
                        </div>
                        <div class="awidget-body">

                            <?php echo $this->val['cabinet_profile_pass_alert']; ?>

                            <div class="row">
                                <div class="col-md-3 col-sm-3">
                                    <div class="form-group">
                                        <center><a href="#"><img src="/data/template/<?php echo $this->val['template_dir']; ?>/img/user.jpg"
                                                         class="img-thumbnail img-circle img-responsive" alt=""/></a></center>
                                    </div>

                                    <?php if ($this->val['use_change_pass']== 1) { ?>
                                    <div class="form-group">
                                        <center><a class="btn btn-info" data-toggle="modal"
                                                   data-target="#compose-modal-pass"><?php echo T_("Изменить пароль"); ?></a></center>
                                    </div>
                                    <?php } ?>
                            </div>
                            <div class="col-md-9 col-sm-9">
                                <table class="table">
                                    <tr>
                                        <td><strong><?php echo T_("Логин"); ?></strong></td>
                                        <td>:</td>
                                        <td><?php echo $this->val['user']; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo T_("Имя"); ?></strong></td>
                                        <td>:</td>
                                        <td><?php echo $this->val['fio']; ?></td>
                                    </tr>

                                    <tr>
                                        <td><strong><?php echo T_("Дата рождения"); ?></strong></td>
                                        <td>:</td>
                                        <td><?php echo $this->val['date_birth']; ?></td>
                                    </tr>

                                    <tr>
                                        <td><strong><?php echo T_("E-mail"); ?></strong></td>
                                        <td>:</td>
                                        <td><?php echo $this->val['email']; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo T_("Телефон (моб.)"); ?></strong></td>
                                        <td>:</td>
                                        <td><?php echo $this->val['mob_tel']; ?></td>
                                    </tr>
                                    <tr>
                                        <td><strong><?php echo T_("Адрес"); ?></strong></td>
                                        <td>:</td>
                                        <td><?php echo $this->val['address']; ?></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <?php if ($this->val['use_change_data']== 1) { ?>
                    <div class="awidget">
                    <div class="awidget-head">
                        <h3><?php echo T_("Редактировать профиль"); ?></h3>
                    </div>
                    <div class="awidget-body">

                    <!-- Profile form -->


                    <div class="form profile">
                        <!-- Edit profile form (not working)-->
                        <form class="form-horizontal" action="/index/main" method="post">

                            <?php echo $this->val['cabinet_profile_alert']; ?>

                            <input name="lkview" value="profile" type="hidden">
                            <input name="changeprofile" value="1" type="hidden">

                            <!-- Telephone -->
                            <div class="form-group">
                                <label class="control-label col-lg-2"><?php echo T_("Телефон (дом.)"); ?></label>

                                <div class="col-lg-6">

                                    <div class="input-group m-b"><span class="input-group-addon">+</span>
                                        <input type="text" name="phone" class="form-control"
                                               value="<?php echo $this->val['phone']; ?>">
                                    </div>
                                </div>
                            </div>

                            <!-- Telephone -->
                            <div class="form-group">
                                <label class="control-label col-lg-2"><?php echo T_("Телефон (моб.)"); ?></label>

                                <div class="col-lg-6">

                                    <div class="input-group m-b"><span class="input-group-addon">+</span>
                                        <input type="text" name="mob_tel" class="form-control"
                                               value="<?php echo $this->val['mob_tel']; ?>">
                                    </div>
                                </div>
                            </div>

                            <!-- Telephone -->
                            <div class="form-group">
                                <label class="control-label col-lg-2"><?php echo T_("Телефон (смс)"); ?></label>

                                <div class="col-lg-6">

                                    <div class="input-group m-b"><span class="input-group-addon">+</span>
                                        <input type="text" name="sms_tel" class="form-control"
                                               value="<?php echo $this->val['sms_tel']; ?>">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2 control-label"><?php echo T_("Дата рождения"); ?>:</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="date_birth" id="date_birth" />
                                </div>
                            </div>

                            <!-- Email -->
                            <div class="form-group">
                                <label class="control-label col-lg-2"><?php echo T_("E-mail"); ?></label>

                                <div class="col-lg-6">
                                    <input type="text" name="email" class="form-control"
                                           value="<?php echo $this->val['email']; ?>">
                                </div>
                            </div>

                            <hr>
                            <!-- Checkbox -->
                            <div class="form-group">
                                <div class="col-lg-6 col-lg-offset-2">

                                    <label class="checkbox inline">
                                        <input type="checkbox" id="i_agree" value="agree"> <?php echo T_("Я согласен с изменениями"); ?>
                                    </label>
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="form-group">
                                <label class="control-label col-lg-2"><?php echo T_("Пароль"); ?></label>

                                <div class="col-lg-6">
                                    <input type="password" name="oldpass" class="form-control" id="password_input"
                                           disabled>
                                </div>
                            </div>

                            <!-- Buttons -->
                            <div class="form-group">
                                <!-- Buttons -->
                                <div class="col-lg-6 col-lg-offset-2">
                                    <button type="submit" class="btn btn-info" id="submit" disabled><?php echo T_("Изменить"); ?></button>
                                    <button type="reset" class="btn btn-default"><?php echo T_("Отменить"); ?></button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
                <?php } ?>
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

<!-- COMPOSE CHANGE PASS MODAL -->
<div class="modal fade" id="compose-modal-pass" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><i class="fa fa-plus-square"></i> <?php echo T_("Изменить пароль"); ?>:</h4>
            </div>
            <div class="box-body">
                <form action="/index/main" method="post">
                    <div class="modal-body">

                        <input name="lkview" value="profile" type="hidden">
                        <input name="changepass" value="1" type="hidden">

                        <div class="form-group">
                            <label class="control-label" for="inputSuccess3"><?php echo T_("Старый пароль"); ?>:</label>
                            <input type="password" class="form-control" name="oldpass" id="oldpass"
                                   placeholder="<?php echo T_("Введите старый пароль"); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="inputSuccess3"><?php echo T_("Новый пароль"); ?>:</label>
                            <input type="password" class="form-control" name="newpass" id="newpass"
                                   placeholder="<?php echo T_("Введите новый пароль"); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="inputSuccess3"><?php echo T_("Повторите пароль"); ?>:</label>
                            <input type="password" class="form-control" name="newpass2" id="newpass2"
                                   placeholder="<?php echo T_("Введите новый пароль еще раз"); ?>">
                        </div>
                    </div>

                    <div class="modal-footer clearfix">
                        <button type="submit" class="btn btn-default pull-left" data-dismiss="modal"><?php echo T_("Отменить"); ?> </button>
                        <button class="btn btn-info" id="do_change_pass"><?php echo T_("Изменить"); ?> </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

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

<!-- Calendar -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/fullcalendar.min.js"></script>
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
<!-- Date and Time picker -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/bootstrap-datepicker.js"></script>

<script type="text/javascript">

    $(document).ready(function () {

        <?php
            $locales = T_("dates");
            if($locales != 'dates'){  ?>
                $.fn.datepicker.dates['custom'] = <?php echo json_encode($locales); ?>;
        <?php  } ?>

        $("#date_birth").datepicker({
            format: 'yyyy-mm-dd',
            language: 'custom'
        });

        $("#i_agree").click(function () {
            if ($("#i_agree").is(':checked')) {
                $("#password_input").attr('disabled', false);
                if ($("#password_input").val().length == 0) {
                    $("#submit").attr('disabled', true);
                }
                else {
                    $("#submit").attr('disabled', false);
                }
            } else {
                $("#password_input").attr('disabled', true);
                $("#submit").attr('disabled', true);
            }
        });

        if ($("#password_input").val().length != 0) {
            $("#submit").attr('disabled', false);
        }

        $("#password_input").keyup(function () {
            if ($("#password_input").val().length == 0) {
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