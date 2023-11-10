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
    <!-- dataTables CSS -->
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/jquery.dataTables.css" rel="stylesheet">
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
                    <h2><i class="icon-desktop color"></i> <?php echo T_("Invoices"); ?> </h2>
                    <hr/>
                </div>
                <!-- Page title -->
    
                <div class="row">
                    <div class="col-md-12">
                        <!-- Browser widget -->
    
                        <div class="panel panel-default">
    
                            <!-- /.panel-heading -->
                            <div class="panel-body">
    
                                <!-- /.panel-body -->
                                <h4></h4>
    
                                <div class="dataTable_wrapper">
                                    <table class="display table compact table-striped table-bordered" id="dataTables-example">
                                        <thead>
                                        <tr>
                                            <th><?php echo T_("ID"); ?></th>
                                            <th><?php echo T_("ФИО"); ?></th>
                                            <th><?php echo T_("Сумма"); ?></th>
                                            <th><?php echo T_("Период"); ?></th>
                                            <th><?php echo T_("#"); ?></th>
                                        </tr>
                                        </thead>
                                        <tbody>
    
                                        <?php foreach($this->val['invoices'] as $row){ ?>
                                            <tr>
                                                <td><?php echo $row['id']; ?></td>
                                                <td><?php echo $row['customer_name']; ?></td>
                                                <td><?php echo $row['summa']; ?></td>
                                                <td><?php echo $row['date_period']; ?></td>
                                                <td><a href="/index/main/lkview/invoices/download/<?php echo $row['id']; ?>"><?php echo T_("Скачать"); ?></a></td>
                                            </tr>
                                        <?php } ?>
                                        </tbody>
                                    </table>
    
                                </div>
    
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
    
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
    <!-- Custom JS -->
    <script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/custom.js"></script>

    <!-- dataTables  -->
    <script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.dataTables.min.js"></script>

    <!-- Javascript for graph -->

    <script type="text/javascript">

        $(document).ready(function () {
            $('#dataTables-example').dataTable({
                "aaSorting": [[0, "desc"]],
                "language": {
                    "processing": "<?php echo T_("Подождите"); ?>...",
                    "search": "<?php echo T_("Поиск"); ?>:",
                    "lengthMenu": "<?php echo T_("Показать _MENU_ записей"); ?>",
                    "info": "<?php echo T_("Записи с _START_ до _END_ из _TOTAL_ записей"); ?>",
                    "infoEmpty": "<?php echo T_("Записи с 0 до 0 из 0 записей"); ?>",
                    "infoFiltered": "(<?php echo T_("отфильтровано из _MAX_ записей"); ?>)",
                    "infoPostFix": "",
                    "loadingRecords": "<?php echo T_("Загрузка записей"); ?>...",
                    "zeroRecords": "<?php echo T_("Записи отсутствуют"); ?>.",
                    "emptyTable:": "<?php echo T_("В таблице отсутствуют данные"); ?>",
                    "paginate": {
                        "first": "<?php echo T_("Первая"); ?>",
                        "previous": "<?php echo T_("Предыдущая"); ?>",
                        "next": "<?php echo T_("Следующая"); ?>",
                        "last": "<?php echo T_("Последняя"); ?>"
                    },
                    "aria": {
                        "sortAscending": ": <?php echo T_("активировать для сортировки столбца по возрастанию"); ?>",
                        "sortDescending": ": <?php echo T_("активировать для сортировки столбца по убыванию"); ?>"
                    }
                }
            });
        });

    </script>

</body>
</html>