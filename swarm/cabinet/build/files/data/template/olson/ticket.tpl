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
                    <h2><i class="icon-desktop color"></i> <?php echo T_("On-line поддержка"); ?> </h2>
                    <hr/>
                </div>
                <!-- Page title -->
    
                <div class="row">
                    <div class="col-md-12">
                        <div class="awidget">
                            <div class="awidget-head">
                                <h3><?php echo T_("Диалог ID "); ?> <?php echo $this->val['ticket_id']; ?>:</h3>
                           </div>
                            <div class="awidget-body">
                                <ul class="chats">
                                    <div id="dialog_body">
                                        <div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                            </div>
                                        </div>
    
                                    </div>
                                </ul>
    
                                <hr>
    
                                    <?php if($this->val['ticket_status'] != 'closed'){ ?>
    
                                        <form action="/index/main" method="post"><!-- Chat input box -->
                                            <input name="lkview" value="ticket" type="hidden">
                                            <input name="ticketid" value="<?php echo $this->val['ticket_id']; ?>" type="hidden">
    
                                            <div class="input-group">
    
                                                <input name="add_ticket_text" class="form-control" type="text">
    
                                                <span class="input-group-btn">
                                                  <button class="btn btn-info" type="submit"><?php echo T_("Отправить"); ?></button>
                                                </span>
    
                                            </div>
                                        </form>
                                    <!-- /input-group -->
                                    <br>
                                <?php } ?>
                            </div>
                        </div>
    
                    </div>
                </div>
    
                <div class="clearfix"></div>
    
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

    <!-- Custom CSS -->
    <?php if (isset($this->val['gui']['template_style']) AND $this->val['gui']['template_style'] == 2){ ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/style-white.css" rel="stylesheet">
    <?php } elseif(isset($this->val['gui']['template_style']) AND $this->val['gui']['template_style'] == 3 AND file_exists($this->val['path_template'].'/customtpls/custom.css')) { ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/customtpls/custom.css" rel="stylesheet">
    <?php }else{ ?>
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/style.css" rel="stylesheet">
    <?php }?>

    <!-- Javascript for graph -->

    <script type="text/javascript">

        $(document).ready(function () {

            // Получить диалог СТАРТ
            getDialog();

            function getDialog() {

                $.get("/index/main/lkview/ticket/ticketid/<?php echo $this->val['ticket_id']; ?>/dialog/1", function (data) {

                    console.log(data);
                    console.log(data[0]);
                    
                    var dialog = data[0];
                    var dialog_code = '';
                    $.each(dialog, function (i, item) {

                        if (item.useruid == '0') {

                            dialog_code += ' <li class="by-me"> <div class="avatar pull-left"> <img src="/data/template/<?php echo $this->val['template_dir']; ?>/img/user.jpg" alt="" class="img-responsive"> </div>  <div class="chat-content"> <div class="chat-meta"> ' + item.fio + ' <span class="pull-right"> ' + item.date + ' </span> </div> ' + item.message + ' <div class="clearfix"></div> </div> </li> ';
                        } else {
                            dialog_code += ' <li class="by-other"> <div class="avatar pull-right"> <img src="/data/template/<?php echo $this->val['template_dir']; ?>/img/user.jpg" alt="" class="img-responsive"> </div> <div class="chat-content"> <div class="chat-meta"> ' + item.date + ' <span class="pull-right"> ' + item.fio + ' </span></div> ' + item.message + ' <div class="clearfix"></div> </div> </li>';
                        }
                    });

                    $("#dialog_body").html(dialog_code);

                    setTimeout(getDialog, 5000)
                });
            }

        });


    </script>

</body>
</html>