<!DOCTYPE html>
<html>
<head>
    <!-- Title here -->
    <title><?php echo $this->val['company_name']; ?> <?php echo T_("Регистрация"); ?></title>
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

                    <?php if(isset($this->val['gui']['user_registration_type3_on'], $this->val['register_type']) AND $this->val['gui']['user_registration_type3_on'] == '1' AND $this->val['register_type'] == '3'){ ?>
                        <div class="awidget-body">
                        <!-- Page title -->
                        <div class="page-title text-center">
                            <h2><?php echo T_("Регистрация"); ?></h2>
                            <hr/>
                        </div>
                        <!-- Page title -->

                        <div class="row form-group">
                            <div class="col-xs-12">
                                <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                                    <li id="nav-step-1" class="disabled">
                                        <a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 1"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("Ввод данных"); ?></p>
                                        </a>
                                    </li>
                                    <li id="nav-step-2" class="disabled">
                                        <a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 2"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("Подтверждение"); ?></p>
                                        </a>
                                    </li>
                                    <li id="nav-step-3" class="disabled">
                                        <a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 3"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("Конец регистрации"); ?></p>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                            
                        <div class="row setup-content" id="wiz-3_step-1" style="display:none">
                            <form id="formRegistration" class="form-horizontal" role="form" action="/index/main" method="post">
                                <div class="col-xs-12">
                                    <div class="col-md-12 well text-center">
                                        <h3>  <?php echo T_("Введите Ваш номер телефона"); ?></h3>
                                        <hr/>
                                        
                                        <input name="lkview" value="register" type="hidden">
                                        <input name="type" value="3" type="hidden">
                                        <input id="phone" name="phone" value="error" type="hidden">

                                        <div class="form-group" >
                                            <div class="col-lg-12">
                                                <label for="phone-view" class="col-sm-2 control-label text-left"><?php echo T_("Телефон"); ?></label>
                                                <div id="phone-val" class="col-lg-8">
                                                    <input type="tel" class="form-control" id="phone-view" name="phone-view">
                                                </div>
                                            </div>
                                        </div>
                                        <hr/>
                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <button type="button" id="btn_wiz-2_cancel_step-2" class="btn btn-default "><?php echo T_("Отмена"); ?></button>
                                                <button type="submit" id="btn_wiz-2_next_step-2" class="btn btn-primary "><?php echo T_("Далее"); ?></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                            
                        <div class="row setup-content" id="wiz-3_step-21" style="display:none">
                            <div class="col-xs-12">
                                <div class="col-md-12 well text-center">
                                    <h3>  <?php echo $this->val['register_step_text']; ?></h3>
                                    <hr/>
                                </div>
                            </div>
                        </div>
                            
                        <div class="row setup-content" id="wiz-3_step-22" style="display:none">
                            <div class="col-xs-12">
                                <div class="col-md-12 well text-center">
                                    <h3><?php echo $this->val['register_step_text']; ?></h3>
                                    <hr/>

                                    <form class="form-horizontal" role="form" action="/index/main" method="post">
                                        <input name="lkview" value="register" type="hidden">
                                        <input name="type" value="3" type="hidden">

                                        <div class="form-group" >
                                            <label for="phone" class="col-sm-4 control-label"><?php echo T_("Код активации"); ?>:</label>

                                            <div class="col-sm-8">
                                                <?php if( $this->val['gui']['user_registration_otp_pattern3'] == 2 ) { ?>
                                                    <input type="number" class="form-control" name="otp" id="otp" style="width:165px; text-align:center"  placeholder="########" required>
                                                <?php } else { ?>
                                                    <div class="col-sm-1">
                                                        <input type="text" class="form-control" name="otp1" id="otp1"
                                                               style="width:65px; text-align:center"  placeholder="XX" required>
                                                    </div>
    
                                                    <label class="col-sm-1 control-label" style="width:15px;"></label>
    
                                                    <div class="col-sm-1">
                                                        <input type="text" class="form-control" name="otp2" id="otp2"
                                                               style="width:65px; text-align:center"  placeholder="XX" required>
                                                    </div>
    
                                                    <label class="col-sm-1 control-label" style="width:15px;"></label>
    
                                                    <div class="col-sm-1">
                                                        <input type="text" class="form-control" name="otp3" id="otp3"
                                                               style="width:65px; text-align:center"  placeholder="XX" required>
                                                    </div>
    
                                                    <label class="col-sm-1 control-label" style="width:15px;"></label>
    
                                                    <div class="col-sm-1">
                                                        <input type="text" class="form-control" name="otp4" id="otp4"
                                                               style="width:65px; text-align:center"  placeholder="XX" required>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <hr/>
                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <button type="button" id="cancel-step-2" class="btn btn-default "><?php echo T_("Отмена"); ?></button>
                                                <button type="submit" id="activate-step-3" class="btn btn-primary "><?php echo T_("Далее"); ?></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                            
                        <div class="row setup-content" id="wiz-3_step-3" style="display:none">
                            <div class="col-xs-12">
                                <div class="col-md-12 well text-center">
                                    <h3>  <?php echo $this->val['register_step_text']; ?></h3>
                                    <hr/>

                                    <table class="table table-bordered">
                                        <?php if ($this->val['do_auth_only_pass'] != 1 ) { ?>
                                        <tr>
                                            <td ><h4><?php echo T_("Логин"); ?>:</h4></td>
                                            <td >
                                                <h4>
                                                    <?php if(isset($this->val['register_response']['user'])){
                                                    echo $this->val['register_response']['user'];
                                                    } ?>
                                                </h4>
                                            </td>
                                        </tr>
                                        <?php } ?>

                                        <tr>
                                            <td ><h4><?php echo T_("Пароль"); ?>:</h4></td>
                                            <td >
                                                <h4>
                                                    <?php if(isset($this->val['register_response']['password'])){
                                                    echo $this->val['register_response']['password'];
                                                    } ?>
                                                </h4>
                                            </td>
                                        </tr>
                                    </table>

                                    <hr/>

                                    <form class="form-horizontal" role="form" action="/index/main" method="post">

                                        <input name="auth_login" type="hidden" value="1">
                                        <input name="auth_login_reg" type="hidden" value="1">

                                        <input name="login" value="<?php if(isset($this->val['register_response']['user'])){
                                                        echo $this->val['register_response']['user'];
                                                    } ?>" type="hidden">

                                        <input name="password" value="<?php if(isset($this->val['register_response']['password'])){
                                                        echo $this->val['register_response']['password'];
                                                    } ?>" type="hidden">

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
                    <?php } elseif (isset($this->val['gui']['user_registration_type2_on'], $this->val['register_type']) AND $this->val['gui']['user_registration_type2_on'] == '1' AND $this->val['register_type'] == '2'){ ?>
                        <div class="awidget-body">
                        <!-- Page title -->
                        <div class="page-title text-center">
                            <h2><?php echo T_("Регистрация"); ?></h2>
                            <hr/>
                        </div>
                        <!-- Page title -->

                        <div class="row form-group">
                            <div class="col-xs-12">
                                <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                                    <li id="nav-step-1" class="disabled"><a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 1"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("Выбор тарифа"); ?></p>
                                        </a></li>
                                    <li id="nav-step-2" class="disabled"><a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 2"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("Номер телефона"); ?></p>
                                        </a></li>
                                    <li id="nav-step-3" class="disabled"><a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 3"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("Конец регистрации"); ?></p>
                                        </a></li>
                                </ul>
                            </div>
                        </div>


                        <form id="formRegistration" class="form-horizontal" role="form" action="/index/main" method="post">

                            <div class="row setup-content" id="wiz-2_step-1" style="display:none">
                                <div class="col-xs-12">
                                    <div class="col-md-12 well text-center">

                                        <h3>  <?php echo $this->val['register_step_text']; ?></h3>

                                        <hr/>

                                        <input name="lkview" value="register" type="hidden">

                                            <div class="form-group" >
                                                <div class="col-lg-12">
                                                    <label for="phone-view" class="col-sm-2 control-label text-left"><?php echo T_("Тариф"); ?></label>
                                                    <div class="col-lg-8 text-left">
                                                        <select name="packet_id" class="form-control" id="register_packet_list">
                                                            <?php
                                                                    $desc = array();
                                                                    foreach ($this->val['register_packet_list'] as $key => $item) {
                                                            echo '<option value="'.$item['gid'].'">'.$item['packet'].'</option>';

                                                            $desc[$item['gid']] =  $item['description'];
                                                            }
                                                            $arrayDesc = json_encode($desc);
                                                            ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group" >
                                                <div class="col-lg-12">
                                                    <label class="col-sm-2 control-label text-left"><?php echo T_("Описание"); ?></label>
                                                    <div class="col-lg-8 text-left">
                                                        <div class="bs-docs-example">
                                                            <pre id="packet_description"></pre>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        <?php if(isset($this->val['gui']['user_registration_ask_address']) AND $this->val['gui']['user_registration_ask_address'] == '1'){ ?>

                                        <hr/>
                                        <div class="form-group" >
                                            <div class="col-lg-12">
                                                <label class="col-sm-2 control-label text-left"><?php echo T_("Адрес"); ?></label>
                                                <div class="col-lg-8 text-left">
                                                    <input class="form-control" placeholder="Введите свой адрес" name="address" value="" type="text" >
                                                </div>
                                            </div>
                                        </div>

                                        <?php } ?>

                                        <hr/>

                                        <div class="form-group">
                                                <div class="col-lg-12">
                                                    <button type="button" id="btn_wiz-2_cancel_step-1" class="btn btn-default "><?php echo T_("Отмена"); ?></button>
                                                    <button type="button" id="btn_wiz-2_next_step-1" class="btn btn-primary "><?php echo T_("Далее"); ?></button>
                                                </div>
                                            </div>

                                    </div>
                                </div>
                            </div>

                            <div class="row setup-content" id="wiz-2_step-2" style="display:none">
                                <div class="col-xs-12">
                                    <div class="col-md-12 well text-center">

                                        <h3>  <?php echo T_("Введите Ваш номер телефона"); ?></h3>

                                        <hr/>


                                            <input name="lkview" value="register" type="hidden">
                                            <input name="type" value="2" type="hidden">
                                            <input id="phone" name="phone" value="error" type="hidden">

                                            <?php if (!empty($_GET['mac'])){ ?>
                                                    <input id="mac" name="mac" value="<?php echo $_GET['mac']; ?>" type="hidden">
                                            <?php } ?>


                                            <div class="form-group" >
                                                <div class="col-lg-12">
                                                    <label for="phone-view" class="col-sm-2 control-label text-left"><?php echo T_("Телефон"); ?></label>

                                                    <div id="phone-val" class="col-lg-8">
                                                        <input type="tel" class="form-control" id="phone-view" name="phone-view">
                                                    </div>
                                                </div>

                                            </div>

                                            <hr/>

                                            <div class="form-group">
                                                <div class="col-lg-12">
                                                    <button type="button" id="btn_wiz-2_cancel_step-2" class="btn btn-default "><?php echo T_("Отмена"); ?></button>
                                                    <button type="submit" id="btn_wiz-2_next_step-2" class="btn btn-primary "><?php echo T_("Далее"); ?></button>
                                                </div>
                                            </div>


                                    </div>
                                </div>
                            </div>

                        </form>

                        <div class="row setup-content" id="wiz-2_step-3" style="display:none">
                            <div class="col-xs-12">



                                <div class="col-md-12 well text-center">

                                    <h3>  <?php echo $this->val['register_step_text']; ?></h3>

                                    <hr/>

                                    <form class="form-horizontal" role="form" action="/index/main" method="post">

                                        <input name="auth_login" type="hidden" value="1">
                                        <input name="auth_login_reg" type="hidden" value="1">

                                        <?php if($this->val['do_auth_only_pass'] != 1 ) { ?>
                                        <div class="form-group">
                                            <label for="inputLogin" class="col-lg-2 control-label"><?php echo T_("Логин"); ?></label>

                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="inputLogin" name="login"
                                                       placeholder="<?php echo T_("Введите логин"); ?>"
                                                value="<?php if( isset($this->val['demo']) AND $this->val['demo'] == 1) {echo "demo";} else { echo ""; } ?>" >
                                            </div>
                                        </div>
                                        <?php } ?>

                                        <div class="form-group">
                                            <label for="inputPassword" class="col-lg-2 control-label"><?php echo T_("Пароль"); ?></label>

                                            <div class="col-lg-10">
                                                <input type="password" class="form-control" id="inputPassword" name="password"
                                                       placeholder="<?php echo T_("Введите пароль"); ?>"
                                                value="<?php if( isset($this->val['demo']) AND $this->val['demo'] == 1) {echo "demo";} else { echo ""; } ?>" >
                                            </div>
                                        </div>

                                        <hr/>

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
                    <?php } elseif (isset($this->val['gui']['user_registration_type1_on'], $this->val['register_type']) AND $this->val['gui']['user_registration_type1_on'] == '1' AND $this->val['register_type'] == '1') { ?>
                        <div class="awidget-body">
                        <!-- Page title -->
                        <div class="page-title text-center">
                            <h2><?php echo T_("Регистрация"); ?></h2>
                            <hr/>
                        </div>
                        <!-- Page title -->

                        <div class="row form-group">
                            <div class="col-xs-12">
                                <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                                    <li id="nav-step-1" class="disabled"><a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 1"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("Номер телефона"); ?></p>
                                        </a></li>
                                    <li id="nav-step-2" class="disabled"><a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 2"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("Код активации"); ?></p>
                                        </a></li>
                                    <li id="nav-step-3" class="disabled"><a href="#">
                                            <h4 class="list-group-item-heading"><?php echo T_("ШАГ 3"); ?></h4>
                                            <p class="list-group-item-text"><?php echo T_("Конец регистрации"); ?></p>
                                        </a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="row setup-content" id="step-1" style="display:none">
                            <div class="col-xs-12">
                                <div class="col-md-12 well text-center">


                                    <h3>  <?php echo $this->val['register_step_text']; ?></h3>

                                    <hr/>


                                    <form class="form-horizontal" role="form" action="/index/main" method="post">

                                        <input name="lkview" value="register" type="hidden">
                                        <input name="type" value="1" type="hidden">
                                        <input id="phone" name="phone" value="error" type="hidden">


                                        <div class="form-group" >
                                            <div class="col-lg-12">
                                                <label for="phone-view" class="col-sm-2 control-label text-left"><?php echo T_("Телефон"); ?></label>

                                                <div id="phone-val" class="col-lg-8">
                                                    <input type="tel" class="form-control" id="phone-view" name="phone-view">
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

                                    <h3>  <?php echo $this->val['register_step_text']; ?></h3>

                                    <hr/>
                                    <form class="form-horizontal" role="form" action="/index/main" method="post">

                                        <input name="lkview" value="register" type="hidden">
                                        <input name="type" value="1" type="hidden">

                                        <div class="form-group" >

                                            <label for="phone" class="col-sm-4 control-label"><?php echo T_("Код активации"); ?>:</label>

                                            <div class="col-sm-8">
                                                <?php if( $this->val['gui']['user_registration_otp_pattern'] == 2 ) { ?>
                                                    <input type="number" class="form-control" name="otp" id="otp" style="width:165px; text-align:center"  placeholder="########" required>
                                                <?php } else { ?>
                                                    <div class="col-sm-1">
                                                        <input type="text" class="form-control" name="otp1" id="otp1"
                                                               style="width:65px; text-align:center"  placeholder="XX" required>
                                                    </div>
    
                                                    <label class="col-sm-1 control-label" style="width:15px;"></label>
    
                                                    <div class="col-sm-1">
                                                        <input type="text" class="form-control" name="otp2" id="otp2"
                                                               style="width:65px; text-align:center"  placeholder="XX" required>
                                                    </div>
    
                                                    <label class="col-sm-1 control-label" style="width:15px;"></label>
    
                                                    <div class="col-sm-1">
                                                        <input type="text" class="form-control" name="otp3" id="otp3"
                                                               style="width:65px; text-align:center"  placeholder="XX" required>
                                                    </div>
    
                                                    <label class="col-sm-1 control-label" style="width:15px;"></label>
    
                                                    <div class="col-sm-1">
                                                        <input type="text" class="form-control" name="otp4" id="otp4"
                                                               style="width:65px; text-align:center"  placeholder="XX" required>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>

                                        <hr/>

                                        <div class="form-group">
                                            <div class="col-lg-12">
                                                <button type="button" id="cancel-step-2" class="btn btn-default "><?php echo T_("Отмена"); ?></button>
                                                <button type="submit" id="activate-step-3" class="btn btn-primary "><?php echo T_("Далее"); ?></button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>

                        <div class="row setup-content" id="step-3" style="display:none">
                            <div class="col-xs-12">
                                <div class="col-md-12 well text-center">
                                    <h3>  <?php echo $this->val['register_step_text']; ?></h3>
                                    <?php if (isset($this->val['gui']['user_registration_after_on1']) and $this->val['gui']['user_registration_after_on1'] == '1') { ?>
                                        <h4><?php echo T_("На Ваш телефон отправлено сообщение с данными для авторизации."); ?></h4>
                                    <?php } ?>
                                    <hr/>
                                    
                                    <table class="table table-bordered">
                                        <?php if ($this->val['do_auth_only_pass'] != 1 ) { ?>
                                            <tr>
                                                <td ><h4><?php echo T_("Логин"); ?>:</h4></td>
                                                <td >
                                                    <h4>
                                                        <?php if(isset($this->val['register_response']['user'])){
                                                        echo $this->val['register_response']['user'];
                                                        } ?>
                                                    </h4>
                                                </td>
                                            </tr>
                                        <?php } ?>

                                        <tr>
                                            <td ><h4><?php echo T_("Пароль"); ?>:</h4></td>
                                            <td >
                                                <h4>
                                                    <?php if(isset($this->val['register_response']['password'])){
                                                        echo $this->val['register_response']['password'];
                                                    } ?>
                                                </h4>
                                            </td>
                                        </tr>
                                    </table>

                                    <hr/>

                                    <form class="form-horizontal" role="form" action="/index/main" method="post">

                                        <input name="auth_login" type="hidden" value="1">
                                        <input name="auth_login_reg" type="hidden" value="1">

                                        <input name="login" value="<?php if(isset($this->val['register_response']['user'])){
                                                        echo $this->val['register_response']['user'];
                                                    } ?>" type="hidden">

                                        <input name="password" value="<?php if(isset($this->val['register_response']['password'])){
                                                        echo $this->val['register_response']['password'];
                                                    } ?>" type="hidden">

                                        <div class="form-group">
                                            <div class="col-lg-12 text-center">
                                                <div class="alert alert-info" role="alert">
                                                    <?php echo T_("Теперь Вы можете пользоваться интернетом"); ?>
                                                </div>
                                            </div>
                                            
                                            <div class="col-lg-12 text-center">
                                                <button type="submit" class="btn btn-primary btn-block"> <?php echo T_("Вход в личный кабинет"); ?> </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                    <?php } else { ?>
                        <div class="awidget-body">
                            <!-- Page title -->
                            <div class="page-title text-center">
                                <h2><?php echo T_("Регистрация"); ?></h2>
                                <hr/>
                            </div>
                            <!-- Page title -->
    
                            <div class="row setup-content" >
                                <div class="col-xs-12">
                                    <div class="col-md-12 well text-center">
                                        <h3>  <?php echo T_("Ошибка SMS регистрации"); ?></h3>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                        </div>
                    <?php } ?>
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
function checkStatus(phoneNumber) {
    $.post("/index/main/lkview/register",
    {
    type: 3,
    status: phoneNumber
    },
    function(data, status){
        if( status === 'success' ) {
            const response = JSON.parse(data);
            if( response.data != 1 && response.data != 2 ) {
                location.reload();
            }
        }
    });
}

$(document).ready(function () {
<?php if (isset($this->val['gui']['user_registration_type3_on'], $this->val['register_type']) AND $this->val['gui']['user_registration_type3_on'] == '1' AND $this->val['register_type'] == '3'){ ?>
    var input = document.querySelector("#phone-view");
    var output      = $("#phone"),
        phoneval    = $("#phone-val"),
        navstep1    = $("#nav-step-1"),
        navstep2    = $("#nav-step-2"),
        navstep3    = $("#nav-step-3"),
        step1       = $("#wiz-3_step-1"),
        step21       = $("#wiz-3_step-21"),
        step22       = $("#wiz-3_step-22"),
        step3       = $("#wiz-3_step-3"),
        stepAfterPhone = $("#btn_wiz-3_next_step-3");

    var step = <?php echo $this->val['register_step']; ?>;
    var entered_phone = <?php echo $this->val['register_phone']; ?>;
    stepWizardActivate(step);
    
    if( step == '21' ) {
        setInterval(checkStatus, 5000, entered_phone);
    }
    
    $("#btn_wiz-3_next_step-1").click(function () {
        stepWizardActivate(2);
    });

    $("#btn_wiz-3_cancel_step-1").click(function () {
        location.href= "/index/main/lkview/login";
    });

    $("#btn_wiz-3_cancel_step-2").click(function () {
        location.href= "/index/main/lkview/login";
    });
    
    function stepWizardActivate(step){
        if (step == '1'){
            $("#wiz-3_step-1").show();
            $("#nav-step-1").addClass('active');
            $("#nav-step-1").removeClass('disabled');
        } else if (step == '21') {
            $("#wiz-3_step-1").hide();
            $("#nav-step-1").removeClass('active');
            $("#nav-step-1").addClass('disabled');

            $("#wiz-3_step-21").show();
            $("#nav-step-2").addClass('active');
            $("#nav-step-2").removeClass('disabled');
        } else if (step == '22') {
            $("#wiz-3_step-1").hide();
            $("#nav-step-1").removeClass('active');
            $("#nav-step-1").addClass('disabled');

            $("#wiz-3_step-22").show();
            $("#nav-step-2").addClass('active');
            $("#nav-step-2").removeClass('disabled');
        } else if (step == '3') {
            step3.show();
            navstep3.addClass('active');
            navstep3.removeClass('disabled');
        }
    }

    // Страна по умолчанию, либо AUTO
    var defaultCountry = <?php if(isset($this->val['gui']['user_registration_def_country3']) AND $this->val['gui']['user_registration_def_country3'] <> ''){ echo $this->val['gui']['user_registration_def_country3']; } else { echo '"auto"'; } ?>;

    // Предпочтительные страны в списке
    var preferredCountries = [<?php if(isset($this->val['gui']['user_registration_pref_country3'])){ echo $this->val['gui']['user_registration_pref_country3']; } else { echo ''; } ?>];

    //Список стран для списка
    var onlyCountries = [<?php if(isset($this->val['gui']['user_registration_only_country3']) AND $this->val['gui']['user_registration_only_country3'] <> ''){ echo $this->val['gui']['user_registration_only_country3']; } else { echo ''; } ?>];
    
<?php } elseif (isset($this->val['gui']['user_registration_type2_on'], $this->val['register_type']) AND $this->val['gui']['user_registration_type2_on'] == '1' AND $this->val['register_type'] == '2'){ ?>

    //var input       = $("#phone-view"),
    var input = document.querySelector("#phone-view");
    var output      = $("#phone"),
        phoneval    = $("#phone-val"),
        navstep1    = $("#nav-step-1"),
        navstep2    = $("#nav-step-2"),
        navstep3    = $("#nav-step-3"),
        step1       = $("#wiz-2_step-1"),
        step2       = $("#wiz-2_step-2"),
        step3       = $("#wiz-2_step-3"),
        stepAfterPhone = $("#btn_wiz-2_next_step-2");

    var array = <?php echo $arrayDesc; ?>;
    var step =  <?php echo $this->val['register_step']; ?>;

    viewDescription(array);

    stepWizardActivate(step);

    $("#register_packet_list").change(function () {
        viewDescription(array);
    });

    $("#btn_wiz-2_next_step-1").click(function () {
        stepWizardActivate(2);
    });


    $("#btn_wiz-2_cancel_step-1").click(function () {
        location.href= "/index/main/lkview/login";
    });

    $("#btn_wiz-2_cancel_step-2").click(function () {
        location.href= "/index/main/lkview/login";
    });

    function viewDescription(array){

        now_packet = $("#register_packet_list").val();
        for (var i in array) {
            if (i == now_packet ){
                $('#packet_description').html(array[i]);
            }
        }
    }

    function stepWizardActivate(step){

        if (step == '1'){
            $("#wiz-2_step-1").show();
            $("#nav-step-1").addClass('active');
            $("#nav-step-1").removeClass('disabled');
        }

        if (step == '2') {
            $("#wiz-2_step-1").hide();
            $("#nav-step-1").removeClass('active');
            $("#nav-step-1").addClass('disabled');

            $("#wiz-2_step-2").show();
            $("#nav-step-2").addClass('active');
            $("#nav-step-2").removeClass('disabled');
        }

        if (step == '3') {
            step3.show();
            navstep3.addClass('active');
            navstep3.removeClass('disabled');
        }
    }

    // Страна по умолчанию, либо AUTO
    var defaultCountry = <?php if(isset($this->val['gui']['user_registration_def_country2']) AND $this->val['gui']['user_registration_def_country2'] <> ''){ echo $this->val['gui']['user_registration_def_country2']; } else { echo '"auto"'; } ?>;

    // Предпочтительные страны в списке
    var preferredCountries = [<?php if(isset($this->val['gui']['user_registration_pref_country2'])){ echo $this->val['gui']['user_registration_pref_country2']; } else { echo ''; } ?>];

    //Список стран для списка
    var onlyCountries = [<?php if(isset($this->val['gui']['user_registration_only_country2']) AND $this->val['gui']['user_registration_only_country2'] <> ''){ echo $this->val['gui']['user_registration_only_country2']; } else { echo ''; } ?>];

<?php } elseif (isset($this->val['gui']['user_registration_type1_on'], $this->val['register_type']) AND $this->val['gui']['user_registration_type1_on'] == '1' AND $this->val['register_type'] == '1'){ ?>
        var step =  <?php echo $this->val['register_step']; ?>;

        //var input       = $("#phone-view"),
        var input = document.querySelector("#phone-view");
        var output      = $("#phone"),
            phoneval    = $("#phone-val"),
            navstep1    = $("#nav-step-1"),
            navstep2    = $("#nav-step-2"),
            navstep3    = $("#nav-step-3"),
            step1       = $("#step-1"),
            step2       = $("#step-2"),
            step3       = $("#step-3"),
            stepAfterPhone = $("#activate-step-2");

        if (step == '1'){
            step1.show();
            navstep1.addClass('active');
            navstep1.removeClass('disabled');
        }

        if (step == '2') {
            step2.show();
            navstep2.addClass('active');
            navstep2.removeClass('disabled');
            $('#otp1').focus();
        }

        if (step == '3') {
            step3.show();
            navstep3.addClass('active');
            navstep3.removeClass('disabled');
        }

        $("#cancel-step-1").click(function () {
            location.href= "/index/main/lkview/login";
        });

        $("#cancel-step-2").click(function () {
            location.href= "/index/main/lkview/login";
        });

    // Страна по умолчанию, либо AUTO
    var defaultCountry = <?php if(isset($this->val['gui']['user_registration_def_country1']) AND $this->val['gui']['user_registration_def_country1'] <> ''){ echo $this->val['gui']['user_registration_def_country1']; } else { echo '"auto"'; } ?>;

    // Предпочтительные страны в списке
    var preferredCountries = [<?php if(isset($this->val['gui']['user_registration_pref_country1'])){ echo $this->val['gui']['user_registration_pref_country1']; } else { echo ''; } ?>];

    //Список стран для списка
    var onlyCountries = [<?php if(isset($this->val['gui']['user_registration_only_country1']) AND $this->val['gui']['user_registration_only_country1'] <> ''){ echo $this->val['gui']['user_registration_only_country1']; } else { echo ''; } ?>];

<?php } ?>

        //Делаем не активной кнопку Далее
        stepAfterPhone.addClass('disabled');

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
            stepAfterPhone.addClass('disabled');
        };

        var validate = function() {
            reset();
            
            if (input.value.trim()) {
                if (iti.isValidNumber()) {
                   phoneval.removeClass("has-error");
                   stepAfterPhone.removeClass('disabled');
                   output.val(input.value.trim());
                } else {
                    phoneval.addClass("has-error");
                    stepAfterPhone.addClass('disabled');
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
