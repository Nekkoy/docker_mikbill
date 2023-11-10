<div class="row">
    <form class="form-horizontal" role="form" method="post" action="<?php echo $this->subscription['action_url']; ?>">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="col-xs-6 col-sm-4 col-md-4">
                <table>
                    <tr>
                        <td><strong><?php echo T_($this->subscription['servicename']); ?></strong></td>
                    </tr>
                    <tr>
                        <td>
                            <?php echo T_("Цена"); ?>:
                            <?php echo $this->subscription['service_price']; ?> <?php echo $this->subscription['currency']; ?> /
                            <?php if( $this->subscription['period'] == "d" ) { echo T_("день"); } else { echo T_("месяц"); } ?>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-xs-6 col-sm-4 col-md-4">
                <table>
                    <tr>
                        <td>
                            <?php echo T_("Тип"); ?>:
                            <?php if( $this->subscription['service_activation'] == 0 ) { ?> <span class="label label-info"><?php echo T_("По умолчанию"); ?></span> <?php } ?>
                            <?php if( $this->subscription['service_activation'] == 1 ) { ?> <span class="label label-info"><?php echo T_("Дополнительная"); ?></span> <?php } ?>
                            <?php if( $this->subscription['tarifservice'] == 1 ) { ?> <span class="label label-primary"><?php echo T_("Основная группы"); ?></span> <?php } ?>
                            <?php if( $this->subscription['tarifservice'] == 2 ) { ?> <span class="label label-info"><?php echo T_("Дополнительная группы"); ?></span> <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <?php echo T_("Статус"); ?>:
                            <?php if( $this->subscription['connected'] == 1 ) { ?>
                                <span class="label label-success"><?php echo T_("Подключена"); ?></span>

                                <?php if( $this->subscription['activated'] == 0 ) { ?>
                                    <span class="label label-danger"><?php echo T_("Не оплачена"); ?></span>
                                <?php } ?>
                            <?php }else{ ?>
                                <?php if( $this->subscription['activated'] == 0 ) { ?>
                                    <span class="label label-default"><?php echo T_("Не подключена"); ?></span>
                                <?php } ?>
                            
                                <?php if( $this->subscription['tarifservice'] == 2 && $this->subscription['disabled'] ) { ?>
                                    <span class="label label-default"><?php echo T_("Недоступна"); ?></span>
                                <?php } ?>
                            <?php } ?>

                            <?php if( $this->subscription['activated'] == 2 ) { ?>
                                <span class="label label-warning"><?php echo T_("Ожидает активации"); ?></span>
                            <?php } elseif( $this->subscription['activated'] == 1 ) { ?>
                                <span class="label label-success"><?php echo T_("Активна"); ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <?php if( isset($this->subscription['binding_code']) && !empty($this->subscription['binding_code']) ) { ?>
                    <tr>
                        <td><?php echo T_("Код привязки"); ?>: <?php echo $this->subscription['binding_code']; ?></td>
                    </tr>
                    <?php } ?>
                </table>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <div class="col-xs-6 col-sm-6 col-md-6" style="margin-top: 10px">
                    <span class="click" id="id_<?php echo $this->subscription['serviceid']; ?>">
                        <span class="btn btn-default"><?php echo T_("Описание"); ?></span>
                    </span>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6" style="margin-top: 10px">
                    <span class="" id="">
                        <?php if( $this->subscription['connected'] == 1 || $this->subscription['service_activation'] == 0 ) { ?>
                            <?php if( $this->subscription['disabled'] ) { ?>
                                <span class="btn btn-warning disabled"><?php echo T_("Отключить"); ?></span>
                            <?php } else { ?>
                                <input type="hidden" class="form-control" name="disable" value="<?php echo $this->subscription['serviceid']; ?>">
                                <button type="submit" class="btn btn-warning" id="submit" ><?php echo T_("Отключить"); ?></button>
                            <?php } ?>
                        <?php }else{ ?>
                            <?php if( $this->subscription['disabled'] ) { ?>
                                    <span class="btn btn-success disabled"><?php echo T_("Подключить"); ?></span>
                            <?php } else { ?>
                                <input type="hidden" class="form-control" name="enable" value="<?php echo $this->subscription['serviceid']; ?>">
                                <button type="submit" class="btn btn-success" id="submit" ><?php echo T_("Подключить"); ?></button>
                            <?php } ?>
                        <?php } ?>
                    </span>
                </div>
            </div>
        </div>
    </form>
</div>

<div id="id_<?php echo $this->subscription['serviceid']; ?>_toggle" style="display: none;" class="row">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="alert alert-info" role="alert">
            <?php echo T_($this->subscription['description']); ?>
        </div>
    </div>
</div>