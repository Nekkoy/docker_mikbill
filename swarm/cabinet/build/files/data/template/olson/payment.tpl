<!DOCTYPE html>
<html>
<head>
    <!-- Title here-->
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
    <link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" media="all">

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

<!-- Page content -->
<div class="sidebar-dropdown"><a href="#"><?php echo T_("МЕНЮ"); ?></a></div>
	<div class="page-content blocky">
		<div class="container">
			<!-- Main menu -->
			<?php echo $this->val['main_menu']; ?>
	
			<div class="mainy">
				<!-- Page title -->
				<div class="page-title">
					<h2><i class="icon-desktop color"></i> <?php echo T_("Пополнение счета"); ?> </h2>
					<hr/>
				</div>
	
				<!-- Page title -->
				<div class="row">
					<div class="col-md-12" id="block_select" style="display:none">
						<!-- Browser widget -->
						<div class="awidget">
							<div class="awidget-head">
								<h3> <?php echo T_("Выберите способ пополнения"); ?></h3>
							</div>
	
							<div class="awidget-body no-table-bor">
								<form class="form-horizontal" role="form">
	
									<div class="form-group">
										<?php if ( $this->val['show']['payments_tile'] == 1 ) {
											echo '<div class="col-lg-8">';
										
											echo '<select class="form-control" id="money_option" style="display: none;"></select>';
											echo '<div id="pay_list">';
												foreach ($this->val['paymentType'] as $key => $item) {
													echo "<span value='{$key}' class='money_options' ><img src='/data/template/{$this->val['template_dir']}/img/paysystems/{$key}.png' alt='{$item}' /></span>";
												}
											echo '</div>';
										} else {
											echo '<label class="control-label col-lg-3" for="telephone">'; echo T_("Способ пополнения"); echo ':</label>';
											echo '<div class="col-lg-8">';
											echo '<select class="form-control" id="money_option">';
												foreach ($this->val['paymentType'] as $key => $item) {
													echo '<option value="'.$key.'">'.$item.'</option>';
												}
											echo '</select>';
										} ?>
												</div>
											</div>
									</div>
								</form>
							</div>
						</div>
	
						<div class="col-md-12" id="block_vaucher" style="display:none">
							<!-- Browser widget -->
							<div class="awidget">
								<div class="awidget-head">
									<h3> <?php echo T_("Пополнение ваучером"); ?></h3>
								</div>
	
								<div class="awidget-body no-table-bor">
								
									<?php if($this->val['gui']['accountinfo_payment'] == 1 ){ ?>
									<div class="alert alert-info" id="cabinet_turbo_active_alert" title="<?php echo T_("Текущий баланс"); ?>(<?php echo $this->val['deposit']; ?>) - <?php echo T_("Тариф"); ?>(<?php echo $this->val['fee']['total_with_discount']; ?>) = <?php echo floor($this->val['itog_summa'] * 100) / 100 ?>">
										<?php echo T_("Рекомендованная сумма платежа составляет: "); ?> <?php   echo floor($this->val['itog_summa'] * 100) / 100; ?> <?php echo $this->val['UE']; ?>
									</div>
									<?php } ?>
	
									<?php echo $this->val['cabinet_card_alert']; ?>
	
	
									<form class="form-horizontal" action="/index/main" method="post">
	
										<input name="lkview" value="payment" type="hidden">
	
										<div class="form-group">
											<label for="phone" class="col-sm-3 control-label"><?php echo T_("Код ваучера"); ?>
												:</label>
	
											<div class="col-sm-1" style="width:65px;">
												<input type="text" class="form-control" name="card1" id="card1"
													   style="width:65px; text-align:center" required>
											</div>
	
											<label class="col-sm-1 control-label" style="width:15px;"></label>
	
											<div class="col-sm-1" style="width:65px;">
												<input type="text" class="form-control" name="card2" id="card2"
													   style="width:65px; text-align:center" required>
											</div>
	
											<label class="col-sm-1 control-label" style="width:15px;"></label>
	
											<div class="col-sm-1" style="width:65px;">
												<input type="text" class="form-control" name="card3" id="card3"
													   style="width:65px; text-align:center" required>
											</div>
	
											<label class="col-sm-1 control-label" style="width:15px;"></label>
	
											<div class="col-sm-1" style="width:65px;">
												<input type="text" class="form-control" name="card4" id="card4"
													   style="width:65px; text-align:center" required>
											</div>
	
											<label class="col-sm-1 control-label" style="width:15px;"></label>
	
											<div class="col-sm-1" style="width:65px;">
												<input type="text" class="form-control" name="card5" id="card5"
													   style="width:65px; text-align:center" required>
											</div>
	
											<label class="col-sm-1 control-label" style="width:15px;"></label>
	
											<div class="col-sm-1" style="width:65px;" id="card6_visible" style="display:none">
												<input type="text" class="form-control" name="card6" id="card6"
													   style="width:65px; text-align:center">
											</div>
	
										</div>
	
										<div class="form-group">
											<div class="col-sm-offset-3 col-sm-10">
												<button type="reset"
														class="btn btn-default"><?php echo T_("Отменить"); ?></button>
												<button type="submit"
														class="btn btn-info" onClick="this.disabled=true; this.form.submit();" ><?php echo T_("Пополнить"); ?></button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
	
						<!-- Browser widget -->
						<div class="col-md-12" id="block_ps" style="display:none">
							<div class="awidget">
								<div class="awidget-head">
									<h3 id="name_ps"> <?php echo T_("Пополнение"); ?> Приват24</h3>
								</div>
	
								<div class="awidget-body no-table-bor">

									<div class="alert alert-success" style="display: none" id="auto_payment_connected" >
										<form class="form-horizontal" action="/index/main/lkview/payment/autopayment/disable" id="auto_payment_form" method="post">
											<div id="auto_payment_content">
												<table>
													<tr>
														<td colspan="3" class="col-lg-12 col-md-12 col-sm-12">
															Мы не храним данные карт (за исключением последних 4-ех цифр)
														</td>
													</tr>
													
													<tr>
														<td class="col-lg-1 col-md-2 col-sm-3">
															<?php echo T_("Автоплатеж"); ?>: <?php echo T_("Подключен"); ?>
														</td>
														<td class="col-lg-1 col-md-2 col-sm-3">
															<?php echo T_("Номер карты"); ?>: <?php echo $this->val['autopayment_card']; ?>
														</td>
														<td class="col-lg-1 col-md-2 col-sm-3">
															<button class="btn btn-default">Отключить</button>
														</td>
													</tr>
												</table>
											</div>
										</form>
									</div>
									
									<?php if($this->val['gui']['accountinfo_payment'] == 1 ){ ?>
										<div class="alert alert-info" id="cabinet_turbo_active_alert" title="<?php echo T_("Текущий баланс"); ?>(<?php echo $this->val['deposit']; ?>) - <?php echo T_("Тариф"); ?>(<?php echo $this->val['fee']['total_with_discount']; ?>) = <?php echo floor($this->val['itog_summa'] * 100) / 100 ?>">
											<?php echo T_("Рекомендованная сумма платежа составляет: "); ?> <?php echo $this->val['erec_payment']; ?> <?php echo $this->val['UE']; ?>
										</div>
									<?php } ?>
								
									<form class="form-horizontal" id="form_payment_ps" action="/index/main" method="post">
	
										<input name="uid" id="uid" type="hidden" value="<?php echo $this->val['uid']; ?>">
										<input name="fio" id="fio" type="hidden" value="<?php echo $this->val['fio']; ?>">
										<input id="amount_with_kommiss" type="hidden">
										<input id="kommiss_percent" type="hidden">
										<input name="paygateway" id="paygateway" type="hidden" value="unknow" >


										<div class="form-group" id="show_autopayment" style="display:none">
											<label for="autopayment" class="col-sm-3 control-label"><?php echo T_("Автоплатеж"); ?>:</label>
											<input style="margin-top: 12px; margin-left: 15px;" type="checkbox" name="autopayment" id="autopayment">
										</div>
										
										<div class="form-group" id="show_summa">
											<label for="summa" class="col-sm-3 control-label"><?php echo T_("Сумма пополнения"); ?>:</label>
	
											<div class="col-sm-4">
												<input type="number" class="form-control" id="summa" name="summa" step="0.01"
													   min="<?php if(isset($this->val['gui']['terminals_minimumamount'])){ echo $this->val['gui']['terminals_minimumamount']; } else { echo "
													   1"; } ?>" value="<?php if(isset($this->
												val['gui']['terminals_minimumamount'])){ echo
												$this->val['gui']['terminals_minimumamount']; } else { echo
												"1"; } ?>" required>
											</div>
										</div>
										
										<div class="form-group" id="show_phone" style="display:none">
	
											<label for="phone" class="col-sm-3 control-label"><?php echo T_("Телефон"); ?>
												:  <?php if(isset($this->val['gui']['wqiwiru_prompt'])){ echo
												$this->val['gui']['wqiwiru_prompt']; } ?></label>
	
											<div class="col-sm-4">
	
												<?php if(!empty($this->val['gui']['wqiwiru_prompt'])){  ?>
													<input name="wqiwiru_prompt" id="wqiwiru_prompt" type="hidden" value="<?php echo $this->val['gui']['wqiwiru_prompt']; ?>">
												<?php } ?>
	
												<input type="tel" class="form-control" name="phone" id="phone"
													   maxlength="<?php if(isset($this->val['gui']['wqiwiru_length'])){ echo $this->val['gui']['wqiwiru_length']; } else { echo "
													   15"; } ?>" placeholder="<?php echo T_("Телефон"); ?>" disabled required>
											</div>
										</div>
	
										<div class="form-group" id="show_email" style="display:none">
											<label for="email" class="col-sm-3 control-label"><?php echo T_("E-mail"); ?>
												:</label>
	
											<div class="col-sm-4">
												<input type="email" class="form-control" name="email" id="email"
													   value="<?php if(isset($this->val['email'])){ echo $this->val['email']; } ?>"
													   disabled>
											</div>
										</div>
										
										<hr>
										<table class="table" id="show_commission"  style="display:none">
											<tr>
												<td class="col-sm-3 control-label"><?php echo T_("Комиссия"); ?>:</td>
												<td><span id="label_kommiss">0</span>%</td>
											</tr>
											<tr>
												<td class="col-sm-3 control-label"><?php echo T_("Итого к оплате"); ?>:</td>
												<td><span id="label_itogo">0</span> <?php echo $this->val['UE']; ?></td>
											</tr>
										</table>
	
										<div class="form-group">
											<div class="col-sm-offset-3 col-sm-9">
												<button type="reset" id="reset_btn" class="btn btn-default"><?php echo T_("Отменить"); ?></button>
												<button type="submit" class="btn btn-info"><?php echo T_("Пополнить"); ?></button>
											</div>
										</div>
									</form>
	
								</div>
							</div>
						</div>
						
						<?php if ( $this->val['show']['fee'] == 1 ) { ?>
						<div class="col-md-12">
							<!-- Browser widget -->
							<div class="awidget">
								<div class="awidget-head">
									<h3><?php echo T_("Информация по абонплате"); ?></h3>
								</div>
	
								<div class="awidget-body no-table-bor">
									<table class="table">
											<tr>
												<td> <?php echo T_("Наименование"); ?> </td>
												<td> <?php echo T_("Цена"); ?> </td>
												<?php if ( $this->val['fee']['total'] - $this->val['fee']['total_with_discount'] > 0 ) { ?>
												<td> <?php echo T_("Скидка"); ?> </td>
												<?php } ?>
												<td> <?php echo T_("К оплате"); ?> </td>
											</tr>
											
											<tr>
												<td> <?php echo T_("Интернет"); echo ":"; ?> <?php echo $this->val['tarif'];?>  </td>
												<td> <?php echo $this->val['fee']['packet']['price']; ?> <?php echo $this->val['UE']; ?> </td>
												<?php if ( $this->val['fee']['total'] - $this->val['fee']['total_with_discount'] > 0 ) { ?>
												<td> <?php echo $this->val['fee']['packet']['discount']['value']; ?> <?php if ( $this->val['fee']['packet']['discount']['sign'] == '%' ) echo "%"; else echo $this->val['UE']; ?> </td>
												<?php } ?>
												<td> <?php echo $this->val['fee']['packet']['price_with_discount']; ?> <?php echo $this->val['UE']; ?> </td>
											</tr>
	
											<?php if( $this->val['real_ip'] <> '0' and $this->val['gui']['accountinfo_ipfee'] == '1'){ ?>
												<?php if ( $this->val['fee']['realip'] > 0 ) { ?>
												<tr>
													<td><?php echo T_("Абонплата за реальный IP"); ?></td>
													<td><?php echo $this->val['fee']['realip']; ?> <?php echo $this->val['UE']; ?></td>
													<?php if ( $this->val['fee']['total'] - $this->val['fee']['total_with_discount'] > 0 ) { ?>
													<td> </td>
													<?php } ?>
													<td><?php echo $this->val['fee']['realip']; ?> <?php echo $this->val['UE']; ?></td>
												</tr>
												<?php } ?>
											<?php } ?>
										
											<?php if ( count($this->val['fee']['subscriptions']['detailed']) > 0) { ?>
												<?php foreach( $this->val['fee']['subscriptions']['detailed'] as $sub ) { ?>
													<?php echo "<tr>"; ?>
													<?php echo "<td>"; echo T_("Подписка"); echo ":"; ?> <?php echo $sub['name']; echo "</td>"; ?>
													<?php echo "<td>"; echo $sub['price']; ?> <?php echo $this->val['UE']; echo "</td>"; ?>
													<?php if ( $this->val['fee']['total'] - $this->val['fee']['total_with_discount'] > 0 ) { ?>
													<?php echo "<td>"; if ($sub["discount"] == 1) echo $this->val['fee']['subscriptions']['discount']['value']; ?> <?php
																	   if ($sub["discount"] == 1)
																			if ( $this->val['fee']['subscriptions']['discount']['sign'] == '%' ) echo "%"; else echo $this->val['UE']; echo "</td>"; ?>
													<?php } ?>						
													<?php echo "<td>"; echo $sub['price_with_discount']; ?> <?php echo $this->val['UE']; echo "</td>"; ?>
													<?php echo "</tr>"; ?>
												<?php } ?>
											<?php } ?>
	
											<?php if ( count($this->val['fee']['devices']['detailed']) > 0) { ?>
												<?php foreach( $this->val['fee']['devices']['detailed'] as $sub ) { ?>
													<?php echo "<tr>"; ?>
													<?php echo "<td>"; echo T_("Устройство"); echo ":"; ?> <?php echo $sub['name']; echo "</td>"; ?>
													<?php echo "<td>"; echo $sub['price']; ?> <?php echo $this->val['UE']; echo "</td>"; ?>
													<?php if ( $this->val['fee']['total'] - $this->val['fee']['total_with_discount'] > 0 ) { ?>
													<?php echo "<td>"; echo $this->val['fee']['devices']['discount']['value']; ?> <?php if ( $this->val['fee']['devices']['discount']['sign'] == '%' ) echo "%"; else echo $this->val['UE']; echo "</td>"; ?>
													<?php } ?>	
													<?php echo "<td>"; echo $sub['price_with_discount']; ?> <?php echo $this->val['UE']; echo "</td>"; ?>
													<?php echo "</tr>"; ?>
												<?php } ?>
											<?php } ?>
	
											<?php if ( $this->val['fee']['installments'] > 0) { ?>
											<tr>
												<td><?php echo T_("Рассрочка"); ?></td>
												<td><?php echo $this->val['fee']['installments']; echo '&nbsp;';  echo $this->val['UE']; ?></td>
												<td><?php echo $this->val['fee']['installments']; echo '&nbsp;';  echo $this->val['UE']; ?></td>
											</tr>
											<?php } ?>
										
											<tr>
												<td> &nbsp; </td>
												<td> &nbsp; </td>
												<td> &nbsp; </td>
												<td> &nbsp; </td>
											</tr>
											
											<tr>
												<td> <b><?php echo T_("Итого"); ?> :</b> </td>
												<td> <?php echo $this->val['fee']['total']; ?> <?php echo $this->val['UE']; ?> </td>
												<?php if ( $this->val['fee']['total'] - $this->val['fee']['total_with_discount'] > 0 ) { ?>
												<td> <?php echo $this->val['fee']['total'] - $this->val['fee']['total_with_discount']; ?> <?php echo $this->val['UE']; ?> </td>
												<?php } ?>
												<td> <b><?php echo $this->val['fee']['total_with_discount']; ?> <?php echo $this->val['UE']; ?></b> </td>
											</tr>
									</table>
								</div>
							</div>
						</div>
						<?php } ?>
	
						<!-- Browser widget -->
						<div class="col-md-12" id="block_imagecode" style="display:none">
							<div class="awidget">
								<div class="awidget-head">
									<h3 id="name_ps_code"> <?php echo T_("Пополнение"); ?></h3>
								</div>
	
								<div class="awidget-body no-table-bor">
	
								<form class="form-horizontal" id="form_payment_imagecode" action="" method="post">
	
									<div class="form-group">
										<label for="summa"
											   class="col-sm-3 control-label"><?php echo T_("Сумма пополнения"); ?>:</label>
	
										<div class="col-sm-4">
											<input type="number" class="form-control" name="amount" step="0.01"
												   min="<?php if(isset($this->val['gui']['terminals_minimumamount'])){ echo $this->val['gui']['terminals_minimumamount']; } else { echo "
												   1"; } ?>" value="<?php if(isset($this->
											val['gui']['terminals_minimumamount'])){ echo
											$this->val['gui']['terminals_minimumamount']; } else { echo
											"1"; } ?>" required>
										</div>
									</div>
									<hr>
	
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-4">
											<img id="image_code" src="">
										</div>
									</div>
	
									<hr>
	
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-10">
											<button type="reset" id="reset_btn"
													class="btn btn-default"><?php echo T_("Отменить"); ?></button>
											<button type="submit" id="submitBarcode"
													class="btn btn-info"><?php echo T_("Пополнить"); ?></button>
										</div>
									</div>
								</form>
							</div>
						</div>
						</div>
				
					<div class="clearfix"></div>
				
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

<!-- AutoTab JS -->
<script src="/data/template/<?php echo $this->val['template_dir']; ?>/js/jquery.autotab.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        // Показать блок выбора если доступен больше 1 способ пополнения (по умолчанию скрыт)
        <?php if (count($this->val['paymentType']) > 1 ){ ?>
            $("#block_select").show();
        <?php  } ?>

        var cab_vaucher_type = Number(<?php

        if (isset($this->val['gui']['user_vaucher_type']) and $this->val['gui']['user_vaucher_type'] <> ''){
            echo $this->val['gui']['user_vaucher_type'];
        } elseif (isset($this->val['xml']['vaucher']['@attributes']['type'])) {
            echo $this->val['xml']['vaucher']['@attributes']['type'];
        } else {
            echo "4";
        } ?>);



        var cab_vaucher_length = Number(<?php

        if (isset($this->val['gui']['user_vaucher_length']) and $this->val['gui']['user_vaucher_length'] <> ''){
            echo $this->val['gui']['user_vaucher_length'];
        }elseif (isset($this->val['xml']['vaucher']['@attributes']['length'])) {
            echo $this->val['xml']['vaucher']['@attributes']['length'];
        } else {
            echo "18";
        } ?>);

        // Тип ваучера
        if (cab_vaucher_type == 3) {
            $("#card6_visible").show();
            $('#card1').autotab({target: '#card2', format: 'alphanumeric', maxlength: 3});
            $('#card2').autotab({target: '#card3', previous: '#card1', format: 'numeric', maxlength: 3});
            $('#card3').autotab({target: '#card4', previous: '#card2', format: 'numeric', maxlength: 3});
            $('#card4').autotab({target: '#card5', previous: '#card3', format: 'numeric', maxlength: 3});
            $('#card5').autotab({target: '#card6', previous: '#card4', format: 'numeric', maxlength: 3});
            $('#card6').autotab({previous: '#card5', format: 'numeric', maxlength: cab_vaucher_length - 15});
        }
        else {
            $("#card6_visible").hide();
            $('#card1').autotab({target: '#card2', format: 'alphanumeric', maxlength: 4});
            $('#card2').autotab({target: '#card3', previous: '#card1', format: 'numeric', maxlength: 4});
            $('#card3').autotab({target: '#card4', previous: '#card2', format: 'numeric', maxlength: 4});
            $('#card4').autotab({target: '#card5', previous: '#card3', format: 'numeric', maxlength: 4});
            $('#card5').autotab({previous: '#card4', format: 'numeric', maxlength: cab_vaucher_length - 16});
        }

        // Автозаполнение ваучера
        <?php if (isset($this->val['gui']['user_vaucher_auto_value']) and $this->val['gui']['user_vaucher_auto_value'] <> '') {
            $vauchArray = explode('-', $this->val['gui']['user_vaucher_auto_value']);

            foreach($vauchArray as $k=>$v){
                $key =  $k+ 1; ?>
            $("#card<?php echo $key; ?>").attr("value", "<?php echo $v; ?>");

            <?php if (isset($this->val['gui']['user_vaucher_auto_read_only']) and $this->val['gui']['user_vaucher_auto_read_only'] == '1') { ?>
            $('#card<?php echo $key; ?>').prop('readonly', true);

		<?php } } } ?>

        // Инициализации ПС при загрузке страницы
        getPaymentSystem();

        // Оброботчик выпадающего списка
		$('#money_option').change(function () {
            getPaymentSystem();
        });

        $("#summa").change(function () {
              do_change_summ();
        });

		
		$('.money_options').click(function () {
			$('.money_options').css("font-weight", "normal");
			$(this).css("font-weight", "Bold");
			
			var selected = $(this).attr("value");
			getPaymentSystem(selected);
		});
			
        $("#reset_btn").click(function () {
            $('#form_payment_ps').trigger("reset");
            do_change_summ();
        });

        do_change_summ();

        // Расчет коммиссии платежа
        function do_change_summ() {

			var summa = Number(document.getElementById('summa').value);
			var kommiss_percent = Number(document.getElementById('kommiss_percent').value);
            var itogo = (summa + (summa * kommiss_percent) /100).toFixed(2);

            $("#label_kommiss").html(kommiss_percent);
            $("#label_itogo").html(itogo);
            $("#amount_with_kommiss").val(itogo);
        }

        function getPaymentSystem() {

            $("#phone").attr('disabled', true);
            $("#email").attr('disabled', true);
            $("#show_phone").hide();
            $("#show_email").hide();
            $("#show_summa").show();
            $("#show_commission").hide();
            $("#amount_with_kommiss").attr("name", "amount2");
            $("#summa").attr("name", "summa");
            $("#uid").attr("name", "uid");

			var payment_system_id =   $('#money_option').val();
			if( arguments.length >= 1 ) {
				payment_system_id = arguments[0];
			} else {
				if ( $( ".money_options" ).length ) {
					payment_system_id = $(".money_options:first").attr('value');
				}
			}


			$("#block_ps").hide();
			$("#auto_payment_connected").hide();
			$("#show_autopayment").hide();
			$("#block_vaucher").hide();
			$("#block_imagecode").hide();


			if(payment_system_id == 0){
				$("#block_vaucher").show();

			} else if (payment_system_id == 2) {
				//LiqPay
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> LiqPay');
				$("#form_payment_ps").attr("action", "/index/payment");
				$("#paygateway").attr("value", "liqpay");

				<?php if (isset($this->val['liqpay_kommiss_on']) and $this->val['liqpay_kommiss_on'] == 1) { ?>
					$('#show_commission').show();
					$("#kommiss_percent").val(Number( <?php echo $this->val['liqpay_kommiss_percent']; ?>));
					$("#amount_with_kommiss").attr("name", "amount");
				<?php } else { ?>
					$("#summa").attr("name", "amount");
				<?php } ?>

				$("#block_ps").show();

			} else if (payment_system_id == 3) {
				//OnPay
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> OnPay');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/onpay");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 4) {
				//PSCB
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> PSCB');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/pscb");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();


			} else if (payment_system_id == 5) {
				//PayMaster
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> PayMaster');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/paymaster");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();


			} else if (payment_system_id == 6) {
				//RoboKassa
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> RoboKassa');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/robokassa");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();


			} else if (payment_system_id == 7) {
				//w.qiwi.ru
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> w.qiwi.ru');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/wqiwiru");
				$("#summa").attr("name", "amount");
				$("#phone").attr('disabled', false);
				$("#show_phone").show();
				$("#block_ps").show();


			} else if (payment_system_id == 9) {
				//  Stripe

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Stripe');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/stripe");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 10) {
				//  PayPal

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> PayPal');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/paypal");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();


			} else if (payment_system_id == 11) {
				//  PayKeeper

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> PayKeeper');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/paykeeper");
				$("#email").attr('disabled', false);
				$("#summa").attr("name", "amount");
				$("#show_email").show();
				$("#block_ps").show();


			} else if (payment_system_id == 12) {
				//  UkrPays

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> UkrPays');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/ukrpays");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 13) {
				//  Yandex

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Яндекс.Касса');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/yandex");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 14) {
				//  Uniteller

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Uniteller');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/uniteller");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 15) {
				//  Portmone

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Portmone');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/portmone");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 16) {
				//  iPay

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> iPay');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/ipay");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 17) {
				//  SberBank.ru

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> SberBank.ru');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/sberbankrumrch");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

				const autopayment_value = <?php echo $this->val['autopayment'] ?>;
				if( Number(autopayment_value) == 2 ) {
					$("#auto_payment_connected").show();
				} else if( Number(autopayment_value) == 1 ) {
					$("#show_autopayment").show();
				}
			} else if (payment_system_id == 18) {
				//  Fondy

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Fondy');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/fondy");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 19) {
				//SimplePay

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> SimplePay');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/simplepay");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 20) {
				//Яндекс.Деньги

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Яндекс.Деньги');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/yandexmoney");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 21) {
				//CloudPayments

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> CloudPayments');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/cloudpayments");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 22) {
				//ISBANK

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> ISBANK');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/isbank");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 23) {
				//Tinkoff

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Tinkoff');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/tinkoff");

				$('#show_commission').show();
				$("#kommiss_percent").val(Number( <?php echo $this->val['tinkoff_kommiss_percent']; ?>));
				$("#amount_with_kommiss").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 24) {
				//AlfaBank.ru

				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Альфа-Банк');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/alfabankru");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 25) {
				//ПриватБанк v2

				// $('#show_summa').hide();
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> ПриватБанк');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/privat_v2");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 26) {
				//PaySoft\
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> PaySoft');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/paysoft");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 27) {
				//ckassa.ru\
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Центральная Касса');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/ckassa");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 28) {
				//mastercard
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> MasterPass');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/masterpass");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 29) {
				//easypay
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> EasyPay');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/easypay");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 30) {
				//PAYMO
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> PAYMO');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/paymo");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 31) {
				//PAYME
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Payme');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/payme");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 32) {
				//Click.uz
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Click.uz');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/click");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 33) {
				//PayCell
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> PayCell');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/paycell");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();
			} else if (payment_system_id == 34) {
				//Barcode
				$('#name_ps_code').html('<?php echo T_("Пополнение"); ?> Barcode');
				$("#form_payment_imagecode").attr("action", "/ajax/users/barcode");
				$("#block_imagecode").show();
			} else if (payment_system_id == 35) {
				//QR Code
				$('#name_ps_code').html('<?php echo T_("Пополнение"); ?> QR Code');
				$("#form_payment_imagecode").attr("action", "/ajax/users/qrcode");
				$("#block_imagecode").show();
			} else if (payment_system_id == 36) {
				//PaySera
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> PaySera');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/paysera");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();
			} else if (payment_system_id == 37) {
				//PaySera
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Qiwi');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/qiwi");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();
			} else if (payment_system_id == 38) {
				//PaySera
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Reeves');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/reeves");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();
			} else if (payment_system_id == 39) {
				//Platon
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> Platon');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/platon");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();

			} else if (payment_system_id == 40) {
				//FreedomPay
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> FreedomPay');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/freedompay");
				$("#summa").attr("name", "amount");
				$("#summa").attr("min", "100");
				$("#summa").attr("value", "100");
				$("#block_ps").show();
			} else if (payment_system_id == 41) {
				//PSBank
				$('#name_ps').html('<?php echo T_("Платежная система"); ?> PSBank');
				$("#form_payment_ps").attr("action", "/index/payment/paygateway/psbank");
				$("#summa").attr("name", "amount");
				$("#block_ps").show();
			}

			// Пересчитываем сумму и комиссию после выбора платежки
			do_change_summ();
        }




		$("#form_payment_imagecode").submit(function(event) {

			/* stop form from submitting normally */
			event.preventDefault();

			/* get some values from elements on the page: */
			var $form = $(this),
					amount = $form.find('input[name="amount"]').val(),
					url = $form.attr( 'action' );

			//отправляю POST запрос и получаю ответ
			$.post(url, { amount: amount }, function (data) {
				if (data.result == '0') {
					$("#image_code").attr('src', 'data:image/jpeg;base64,' + data.response.imageBase64);
				}
			});

		});

    });

</script>

</body>
</html>