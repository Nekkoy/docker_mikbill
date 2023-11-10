<div class="awidget" >

    <div class="awidget-head">
        <h3> <?php echo T_("Информация о текущем тарифе"); ?>:</h3>
    </div>

    <div class="awidget-body no-table-bor">
        <table class="table">
            <tr>
                <td><?php echo T_("Название текущего тарифа"); ?>:</td>
                <td><?php echo $this->tariffitem['user']['tarif']; ?></td>
            </tr>
            <tr>
                <td><?php echo T_("Абонплата в текущем тарифе"); ?>:</td>
                <td><?php echo  round($this->tariffitem['user']['tarif_fixed_cost'], 2); ?> <?php echo $this->tariffitem['user']['UE']; ?></td>
            </tr>
        </table>
    </div>
</div>


<?php foreach ($this->tariffitem['tariffitem'] as $key) { ?>

<div class="awidget" id="info_tariff_<?php echo $key['gid']; ?>" style="display:none">

    <div class="awidget-head">
        <h3> <?php echo T_("Информация о выбранном тарифе"); ?>:</h3>
    </div>

    <div class="awidget-body no-table-bor">
        <table class="table">
            <tr>
                <td><?php echo T_("Название выбранного тарифа"); ?>:</td>
                <td><?php echo $key['packet']; ?></td>
            </tr>
            <tr>
                <td><?php echo T_("Абонплата в новом тарифе"); ?>:</td>
                <td><?php echo $key['tarif_abonka_new']; ?> <?php echo $this->tariffitem['user']['UE']; ?></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><b><?php echo T_("Сумма к оплате"); ?>:</b></td>
                <td><b><?php echo $key['itog_summa']; ?> <?php echo $this->tariffitem['user']['UE']; ?></b></td>
            </tr>
        </table>
        <div class="alert alert-info"><i class="icon-warning-sign"></i> <?php echo T_("Для правильной работы услуги необходимо переподключиться к интернету."); ?></div>

    </div>

</div>

<?php }?>