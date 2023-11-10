<!-- COMPOSE MESSAGE MODAL -->
<div class="modal fade" id="compose-modal-new-tiket" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><i class="fa fa-plus-square"></i> <?php echo T_("Задать вопрос"); ?>:</h4>
            </div>
            <div class="box-body">
                <form action="/index/main" method="post">
                    <div class="modal-body">

                        <input name="lkview" value="ticket" type="hidden">

                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><?php echo T_("Вопрос"); ?>:</span>
                                <textarea name="new_ticket_text" id="mess_new_text" class="form-control"
                                          placeholder="<?php echo T_("Текст сообщения"); ?>" style="height: 120px;"></textarea>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer clearfix">
                        <button type="button" class="btn btn-danger pull-left" data-dismiss="modal"><i
                                    class="fa fa-times"></i> <?php echo T_("Отменить"); ?>
                        </button>
                        <button class="btn btn-primary" type="submit" onClick="this.disabled=true; this.form.submit();" ><i class="fa fa-envelope"></i> <?php echo T_("Отправить"); ?></button>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->