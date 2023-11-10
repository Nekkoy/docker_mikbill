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
                <h2><i class="fas fa-video color"></i> <?php echo T_("FLUSSONIC"); ?> </h2>
                <hr/>
            </div>
            <!-- Page title -->
            <div class="awidget" id="step_1">
                <div class="awidget-head">
                    <h3><?php echo T_("Выберите тариф"); ?>:</h3>
                </div>
                
                <div class="awidget-body no-table-bor">
                    <form class="form-horizontal" role="form" id="form_select_channel" enctype="multipart/form-data" method="post" action="/index/main">
                        <input type="hidden" class="form-control" name="lkview" value="flussonic">

                        <ul class="list-group">
                            <?php foreach($this->val['flussonic']['packets'] as $packet){ ?>
                            
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <input
                                                name="<?php echo $packet['name_tag']; ?>[]"
                                                value="<?php echo $packet['id']; ?>"
                                                type="checkbox"
                                                <?php echo $packet['checkbox']; ?>
                                            >
                                            <label> <strong><?php echo $packet["name"]; ?></strong> </label>
                                        </div>
                                        <div class="col-xs-3">
                                            <?php echo T_("Статус"); ?>:
                                            <?php if($packet["connected"] == 1){ ?>
                                            <span class="label label-success"><?php echo T_("Подключен"); ?></span>
                                            <?php }else{ ?>
                                            <span class="label label-default"><?php echo T_("Не подключен"); ?></span>
                                            <?php } ?>
                                        </div>
                                        <div class="col-xs-3">
                                            <span class="click" id="id_<?php echo $packet['id']; ?>">
                                                <span class="label label-default"><?php echo T_("Подробнее"); ?></span>
                                            </span>
                                        </div>
                                    </div>

                                    <?php if( !empty($packet["conditions"]) ) { ?>
                                        <?php foreach($packet["conditions"] as $condition){ ?>
                                            <?php if( $condition["active"] == 1 ) { ?>
                                                <div class="row">
                                                    <div class="col-xs-1" style="margin-top:-4px;">
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &angrt;
                                                    </div>
                                                    
                                                    <div class="col-xs-5">
                                                        <?php echo T_($condition["name"]); ?>
                                                    </div>
                                                    
                                                    <div class="col-xs-3">
                                                        <?php echo T_("Цена"); ?>:
                                                        <?php echo T_($condition["price"]); ?> <?php echo $this->val['UE']; ?>
                                                    </div>
                                                    
                                                    <div class="col-xs-3">
                                                        
                                                    </div>
                                                </div>
                                            <?php } ?>
                                        <?php } ?>
                                    <?php } ?>
                                    
                                    <div id="id_<?php echo $packet['id']; ?>_toggle" style="display: none;" class="row">
                                        <div class="col-xs-12">
                                            <div class="alert alert-info" role="alert">
                                                <?php echo $packet["description"]; ?>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            <?php }  ?>
                        </ul>
                
                        <div class="form-group">
                            <!-- Buttons -->
                            <div class="col-lg-12">
                                <button type="reset" class="btn btn-default"><?php echo T_("Отмена"); ?></button>
                                <button type="submit" class="btn btn-info" id="submit" ><?php echo T_("Подтвердить"); ?></button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>


            <div class="awidget" id="step_2">
                <div class="awidget-head">
                    <h3><?php echo T_("Мои камеры"); ?>:</h3>
                </div>

                <div class="awidget-body no-table-bor">
                    <ul class="list-group">
                        <div class="alert alert-warning">
                            <i class="icon-warning-sign"></i> <?php echo T_("Нет подключенных камер."); ?>
                        </div>
                    </ul>
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