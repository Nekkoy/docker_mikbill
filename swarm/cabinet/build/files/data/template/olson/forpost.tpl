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
                <h2><i class="fas fa-camera color"></i> <?php echo T_("Forpost"); ?> </h2>
                <hr/>
            </div>
            
            <?php if( $this->val["subscriptions"]["error"]["number"] == 0 ) { ?>
                <div class="awidget" id="step_2">
                    <div class="awidget-head">
                        <h3><?php echo T_("Регистрация"); ?>:</h3>
                    </div>
    
                    <div class="awidget-body no-table-bor">
                        <div class="alert alert-warning"><?php echo T_("Что бы воспользоваться сервисом необходимо создать учетную запись. Создать её сейчас ?"); ?></div>
                        <form class="form-horizontal" id="form_code_add" method="post" action="/index/main/lkview/forpost">
                            <div class="form-group">
                                <input type="hidden" class="form-control" id="create" name="create" value="1" required>
                                <div class="col-sm-4">
                                    <button type="submit" id="codeaddb" class="btn btn-info"><?php echo T_("Создать учетную запись"); ?></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            <?php } ?>
            
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

                    <?php if( $this->val["subscriptions"]["notify"] ){ ?>
                        <div class="col-xs-12">
                            <div class="alert alert-warning" role="alert">
                                <?php echo T_("Что бы воспользоваться услугой видеонаблюдения обратитесь в службу поддержки"); ?>
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
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/excanvas.min.js"></script><![endif]-->
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
        $(".click").click(
            function () {
                $('#' + this.id + '_toggle').toggle('Blind');
            }
        );

        <?php if($this->val["subscriptions"]["OTP"]["timeleft"] > 0) { ?>
            <?php echo 'var distance = ' . $this->val["subscriptions"]["OTP"]["timeleft"] . ';'; ?>
            
            var x = setInterval(function() {
              distance = distance - 1;
              document.getElementById("otp_timeleft").innerHTML = distance;
              if (distance < 0) {
                clearInterval(x);
                window.location.href = window.location.protocol +'//'+ window.location.host + window.location.pathname;
                //location.reload();
              }
            }, 1000);
        <?php } ?>
    })
</script>

</body>
</html>
