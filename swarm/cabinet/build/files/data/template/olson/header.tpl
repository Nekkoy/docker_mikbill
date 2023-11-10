<div class="row">
    <div class="col-md-4">
        <!-- Logo -->
        <div class="logo">
            <h1><a href="/index/main"><?php echo $this->val['config']['company_name']; ?></a></h1>
        </div>
    </div>
    <div class="col-md-1">
        <div class="row">
            <div class="col-lg-10">
            </div>
        </div>
    </div>
    <div class="col-md-7">
        <!-- Header menu -->
        <div class="navbar navbar-inverse" role="banner">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                    <span>Menu</span>
                </button>
            </div>

            <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                <ul class="nav navbar-nav">

                    <?php if(isset($this->val['config']['gui']['menu_show_news']) AND $this->val['config']['gui']['menu_show_news'] == 1 ){ ?>
                    <li>
                        <a href="/index/main/lkview/news"><i class="icon-calendar"></i> <?php echo T_("Новости"); ?></a>
                    </li>
                    <?php } ?>



                    <?php if(isset($this->val['config']['gui']['menu_show_tickets']) AND $this->val['config']['gui']['menu_show_tickets'] == 1){ ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-comments"></i>
                            <?php echo T_("On-line поддержка"); ?>
                            <?php 	if (count($this->val['ticketMenu']['activeTicket']) <> 0 ){ ?>
                            <span
                                class="label label-warning"><?php echo count($this->val['ticketMenu']['activeTicket']); ?></span>
                            <?php } ?><b class="caret"></b></a>
                        <!-- Big dropdown menu -->
                        <ul class="dropdown-menu dropdown-big animated fadeInUp">
                            <!-- Dropdown menu header -->
                            <div class="dropdown-head">
                                <span class="dropdown-title"><?php echo T_("Активные диалоги:"); ?></span>
                            </div>
                            <!-- Dropdown menu body -->
                            <div class="dropdown-body">
                                <?php 	if (count($this->val['ticketMenu']['activeTicket']) == 0 ){ ?>
                                <li><i class="icon-comments color"></i> <a
                                        href="#"><?php echo T_("Активные диалоги отсутствуют"); ?></a><span
                                        class="label label-info pull-right">0</span></li>
                                <?php } else {
									foreach ($this->val['ticketMenu']['activeTicket'] as $key => $item) { ?>
                                <a href="/index/main/lkview/ticket/ticketid/<?php echo $item['ticketid']; ?>">
                                    <li>
                                        <i class="icon-comments color"></i>
                                        <?php echo $item['cause']; ?>

                                        <?php if ( isset($item['messages']) ) { ?>
                                        <span
                                            class="label label-info pull-right"><?php echo $item['messages']; ?></span>
                                        <?php } ?>
                                    </li>
                                </a>
                                <?php } } ?>
                            </div>

                            <!-- Dropdown menu footer -->
                            <div class="dropdown-foot text-center">
                                <a
                                    href="/index/main/lkview/ticketall"><?php echo T_("Показать все диалоги"); ?></a><span
                                    class="label label-info pull-right"><?php echo $this->val['ticketMenu']['allTicketCount']; ?></span>
                            </div>
                            <div class="dropdown-foot text-center">
                                <a href="" data-toggle="modal"
                                    data-target="#compose-modal-new-tiket"><?php echo T_("Задать вопрос"); ?></a><span
                                    class="label label-success pull-right">new</span>

                            </div>
                        </ul>
                    </li>

                    <?php } ?>


                    <?php if(isset($this->val['config']['gui']['menu_show_bookmark'], $this->val['config']['gui']['bookmarks']) AND $this->val['config']['gui']['menu_show_bookmark'] == 1 AND is_array($this->val['config']['gui']['bookmarks'])){ ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                class="icon-heart"></i><?php echo T_("Закладки"); ?><b class="caret"></b></a>
                        <!-- Big dropdown menu -->
                        <ul class="dropdown-menu dropdown-big animated fadeInUp">
                            <!-- Dropdown menu body -->
                            <div class="dropdown-body">
                                <?php foreach ($this->val['config']['gui']['bookmarks'] as $bookmark) { ?>
                                <li><a href="<?php echo $bookmark['url']; ?>" target="_blank">
                                        <?php echo $bookmark['name']; ?> </a></li>
                                <?php } ?>
                            </div>
                        </ul>
                    </li>
                    <?php } ?>


                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                class="icon-user"></i><?php echo $this->val['user']['user']; ?><b class="caret"></b></a>
                        <!-- Big dropdown menu -->
                        <ul class="dropdown-menu dropdown-big animated fadeInUp">
                            <!-- Dropdown menu body -->
                            <div class="dropdown-body">
                                <?php if($this->val['user']['do_print_dogovor'] == "1") { ?>

                                <li><i class="icon-print color"></i><a href="/ajax/users/gendogovor" target="_blank">
                                        <?php echo T_("Печать договора"); ?> </a></li>
                                <?php } ?>


                                <?php if($this->val['user']['invoice_print_on'] == "1") { ?>

                                <li><i class="icon-print color"></i><a href="/ajax/users/geninvoice" target="_blank">
                                        <?php echo T_("Печать квитанции"); ?> </a></li>
                                <?php } ?>

                                <?php if($this->val['user']['otkluchentable'] == "0" and $this->val['user']['deletedtable'] == "0") { ?>
                                <li><i class="icon-user color"></i><a href="/index/main/lkview/profile">
                                        <?php echo T_("Профиль"); ?></a></li>
                                <?php } ?>

                                <li><i class="icon-signout color"></i><a href="/index/main/lkview/exit">
                                        <?php echo T_("Выйти"); ?></a></li>
                            </div>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>