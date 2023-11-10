<!DOCTYPE html>
<html>

<head>
	<!-- Title here -->
	<title><?php echo $this->val['company_name']; ?> <?php echo T_("Личный кабинет"); ?></title>
	<!-- Description, Keywords and Author -->
	<meta name="description" content="Your description">
	<meta name="keywords" content="Your,Keywords">
	<meta name="author" content="ForBill">
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
	<!-- Favicon -->
	<link rel="shortcut icon" href="/favicon.ico">

	<!-- Custom CSS -->
	<?php if (isset($this->val['gui']['template_style']) AND $this->val['gui']['template_style'] == 2){ ?>
	<link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/style-white.css" rel="stylesheet">
	<?php } elseif(isset($this->val['gui']['template_style']) AND $this->val['gui']['template_style'] == 3 AND file_exists($this->val['path_template'].'/customtpls/custom.css')) { ?>
	<link href="/data/template/<?php echo $this->val['template_dir']; ?>/customtpls/custom.css" rel="stylesheet">
	<?php }else{ ?>
	<link href="/data/template/<?php echo $this->val['template_dir']; ?>/css/style.css" rel="stylesheet">
	<?php }?>

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
			<div class="sidebar-dropdown">
				<a href="#">
					<?php echo T_("МЕНЮ"); ?>
				</a>
			</div>

			<!-- Main menu -->
			<?php echo $this->val['main_menu']; ?>

			<div class="mainy">
				<!-- Page title -->
				<div class="page-title">
					<h2>
						<i class="icon-desktop color"></i> <?php echo T_("Личный кабинет"); ?>
					</h2>
					<hr />
				</div>

				<!-- Page title -->
				<?php
					if(isset($_GET['success_mess'])){
						echo '<div class="alert alert-success">' .$_GET['success_mess']. '</div>';
					}
		
					if(isset($_GET['error_mess'])){
						echo '<div class="alert alert-danger">' .$_GET['error_mess']. '</div>';
					}
				?>

				<div class="row">
					<div class="col-md-6">
						<div class="awidget">
							<div class="awidget-head">
								<h3><?php echo T_("Данные пользователя"); ?></h3>
							</div>

							<div class="awidget-body no-table-bor">
								<table class="table">
									<tr>
										<td><?php echo T_("Ф.И.О."); ?>:</td>
										<td><?php echo $this->val['fio']; ?></td>
									</tr>

									<?php if ( !isset($this->val['gui']['user_hide_uid']) || $this->val['gui']['user_hide_uid'] == '0' ){ ?>
									<tr>
										<td><?php echo T_("UID"); ?>:</td>
										<td><?php echo $this->val['uid']; ?></td>
									</tr>
									<?php } ?>

									<?php if ( !isset($this->val['gui']['user_show_inn']) || $this->val['gui']['user_show_inn'] == '1' ){ ?>
									<tr>
										<td><?php echo T_("ИНН"); ?>:</td>
										<td><?php echo $this->val['inn']; ?></td>
									</tr>
									<?php } ?>

									<?php if ( !isset($this->val['gui']['user_hide_numdogovor']) || $this->val['gui']['user_hide_numdogovor'] == '0' ){ ?>
									<tr>
										<td><?php echo T_("Договор"); ?>:</td>
										<td><?php echo $this->val['numdogovor']; ?></td>
									</tr>
									<?php } ?>
									
									<tr>
										<td><?php echo T_("Статус пользователя"); ?>:</td>
										<td>
											<?php if (isset($this->val['frezetable']) AND $this->val['frezetable'] == '1'){ ?>
											<button class="btn btn-xs btn-primary"><i class="icon-asterisk"></i>
												<?php echo T_("Заморожен"); ?> </button>

											<?php } elseif(isset($this->val['otkluchentable']) AND $this->val['otkluchentable'] == '1') { ?>
											<button class="btn btn-xs btn-danger"><i class="icon-off"></i>
												<?php echo T_("Отключен"); ?> </button>

											<?php } elseif(isset($this->val['deletedtable']) AND $this->val['deletedtable'] == '1') { ?>
											<button class="btn btn-xs btn-danger"><i class="icon-trash"></i>
												<?php echo T_("Удален"); ?> </button>

											<?php } elseif($this->val['blocked'] == '1') { ?>
											<button class="btn btn-xs btn-warning"><i
													class="fa fa-exclamation-triangle"></i>
												<?php echo T_("Заблокирован"); ?> </button>

											<?php } else { ?>
											<button class="btn btn-xs btn-success"><i class="icon-ok"></i>
												<?php echo T_("Активен"); ?> </button>
											<?php } ?>
										</td>
									</tr>

									<?php if($this->val['gui']['accountinfo_balance'] == 1){ ?>
									<tr>
										<td><?php echo T_("Текущий баланс"); ?>:</td>
										<td><?php echo $this->val['deposit']; ?> <?php echo $this->val['UE']; ?></td>
									</tr>
									<?php } ?>

									<tr>
										<td><?php echo T_("Кредит"); ?>:</td>
										<td><?php echo $this->val['credit']; ?> <?php echo $this->val['UE']; ?></td>
									</tr>

									<?php if($this->val['days_left'] == '-1'){ ?>
									<tr>
										<td><?php echo T_("Статус услуги"); ?>:</td>
										<td><?php echo T_("Услуга Интернет недоступна"); ?></td>
									</tr>
									<?php } elseif ($this->val['days_left'] == '-2') { ?>
									<tr>
										<td><?php echo T_("Статус услуги"); ?>:</td>
										<td><?php echo T_("Бесконечный Интернет"); ?></td>
									</tr>
									<?php } else {
								if ($this->val['show']['index_daysleft'] == '1' ){ ?>
									<tr>
										<td><?php echo T_("Интернет отключится через"); ?>:</td>
										<td><?php echo $this->val['days_left']; ?> <?php echo T_("дней"); ?></td>
									</tr>
									<?php } ?>
									<?php } ?>

									<?php if($this->val['show']['index_enddate'] == '1' AND $this->val['date_itog'] <> ''){ ?>
									<tr>
										<td><?php echo T_("Дата окончания услуг"); ?>:</td>
										<td><?php echo $this->val['date_itog']; ?></td>
									</tr>
									<?php } ?>

									<?php if($this->val['real_ip'] == '1'){ ?>
									<tr>
										<td><?php echo T_("Ваш реальный IP"); ?></td>
										<td><?php echo $this->val['framed_ip']; ?></td>
									</tr>
									<?php } ?>

									<?php if( $this->val['do_turbo'] == 1 or $this->val['do_turbo'] == '2'){ ?>
									<tr>
										<td><?php echo T_("Услуга Турбо"); ?>:</td>
										<td><?php if(isset($this->val['turbo_active']) and $this->val['turbo_active'] == 1) echo T_("Активна"); else echo T_("Отключена"); ?>
										</td>
									</tr>
									<?php } ?>
								</table>
							</div>
						</div>

						<?php if( $this->val['gidd'] > 0 ) { ?>
							<div class="awidget">
								<div class="awidget-head">
									<h3><?php echo T_("Ваш будущий тариф"); ?></h3>
								</div>
	
								<div class="awidget-body no-table-bor">
									<table class="table">
										<tr>
											<td><?php echo T_("Название будущего тарифа"); ?>:</td>
											<td><?php echo $this->val['gidd_name']; ?></td>
										</tr>
										<tr>
											<td><?php echo T_("Абонплата в будущем тарифе"); ?>:</td>
											<td><?php echo $this->val['gidd_price']; ?> <?php echo $this->val['UE']; ?></td>
										</tr>
									</table>
									<?php echo $this->val['cabinet_tarif_alert']; ?>
								</div>
							</div>
						<?php } ?>
					</div>
					
					<div class="col-md-6">
						<div class="awidget">
							<div class="awidget-head">
								<h3><?php echo T_("Тарифный план"); ?></h3>
							</div>

							<div class="awidget-body no-table-bor">
								<table class="table">
									<tr>
										<td><?php echo T_("Тариф"); ?>:</td>
										<td><?php echo $this->val['tarif']; ?></td>
									</tr>


									<?php if($this->val['gui']['accountinfo_fee'] == 1){ ?>
									<tr>
										<td><?php echo T_("Абонплата по тарифу"); ?>:</td>
										<td><?php echo $this->val['fee']['total_with_discount']; ?>
											<?php echo $this->val['UE']; ?></td>
									</tr>
									<?php } else { echo '<td>&nbsp</td>'; } ?>

									<?php if(isset($this->val['dontshowspeed'], $this->val['dont_show_speed_tarif']) and $this->val['dontshowspeed'] != 1 and $this->val['dont_show_speed_tarif'] != 1){ ?>
									<?php if( isset($this->val['show']['speed_out'], $this->val['show']['speed_in']) and ($this->val['show']['speed_out'] + $this->val['show']['speed_in'] >= 1) ){ ?>
									<tr>
										<td><?php echo T_("Скорость"); ?>:</td>
										<td>
											<?php if(isset($this->val['shapers_day_night_active']) and $this->val['shapers_day_night_active'] == 1) { ?>
											<span class="click" id="tarif_speed_info"><span
													class="badge">?</span></span>
											<?php } ?>
										</td>
									</tr>

									<?php if( isset($this->val['show']['speed_in']) and $this->val['show']['speed_in'] == 1 ){ ?>
									<tr>
										<td><?php echo T_("Входящая скорость"); echo ':'; ?></td>
										<td><?php echo $this->val['tarif_speed_dw_format']; ?></td>
									</tr>
									<?php } ?>

									<?php if( isset($this->val['show']['speed_out']) and $this->val['show']['speed_out'] == 1 ){ ?>
									<tr>
										<td><?php echo T_("Исходящая скорость"); echo ':'; ?></td>
										<td><?php echo $this->val['tarif_speed_up_format']; ?></td>
									</tr>
									<?php } ?>
									<?php } ?>
									<?php } ?>

									<?php if ( $this->val['show']['fee'] == 1 && $this->val['fee']['total'] - $this->val['fee']['total_with_discount'] == 0 ) { ?>
									<tr>
										<td> &nbsp; </td>
										<td> &nbsp; </td>
									</tr>
									<tr>
										<td> <?php echo T_("Информация по абонплате"); ?> : </td>
										<td> &nbsp; </td>
									</tr>
									<tr>
										<td><?php echo T_("Интернет"); echo ":"; echo $this->val['tarif'];?></td>
										<td><?php echo $this->val['fee']['packet']['price']; echo '&nbsp;'; echo $this->val['UE']; ?>
										</td>
									</tr>

									<?php if( $this->val['real_ip'] <> '0' and $this->val['gui']['accountinfo_ipfee'] == '1'){ ?>
									<?php if ( $this->val['fee']['realip'] > 0 ) { ?>
									<tr>
										<td><?php echo T_("Абонплата за реальный IP"); ?></td>
										<td><?php echo $this->val['fee']['realip']; echo '&nbsp;'; echo $this->val['UE']; ?>
										</td>
									</tr>
									<?php } ?>
									<?php } ?>

									<?php if ( count($this->val['fee']['subscriptions']['detailed']) > 0) { ?>
									<?php foreach( $this->val['fee']['subscriptions']['detailed'] as $sub ) { ?>
									<tr>
										<td><?php echo T_("Подписка"); echo ":"; echo $sub['name']; ?> </td>
										<td><?php echo $sub['price']; echo '&nbsp;'; echo $this->val['UE']; ?> </td>
									</tr>
									<?php } ?>
									<?php } ?>

									<?php if ( count($this->val['fee']['devices']['detailed']) > 0) { ?>
									<?php foreach( $this->val['fee']['devices']['detailed'] as $sub ) { ?>
									<tr>
										<td><?php echo T_("Устройство"); echo ":"; echo $sub['name']; ?></td>
										<td><?php echo $sub['price']; echo '&nbsp;';  echo $this->val['UE']; ?></td>
									</tr>
									<?php } ?>
									<?php } ?>

									<?php if ( $this->val['fee']['installments'] > 0) { ?>
									<tr>
										<td><?php echo T_("Рассрочка"); ?></td>
										<td><?php echo $this->val['fee']['installments']; echo '&nbsp;';  echo $this->val['UE']; ?></td>
									</tr>
									<?php } ?>
									
									<tr>
										<td> &nbsp; </td>
										<td> &nbsp; </td>
									</tr>

									<tr>
										<td> <b><?php echo T_("Итого"); ?> :</b> </td>
										<td> <?php echo $this->val['fee']['total']; echo '&nbsp;'; echo $this->val['UE']; ?>
										</td>
									</tr>

									<?php } ?>
								</table>

								<div id="tarif_speed_info_toggle" style="display: none;" class="row">
									<div class="col-xs-12">
										<div class="alert alert-info no-table-bor" role="alert">
											<?php if( isset($this->val['shapers_day_night_active']) and $this->val['shapers_day_night_active'] == 1 ) { ?>
											<table class="table">
												<?php if(isset($this->val['shapers_dn_1_enabled']) and $this->val['shapers_dn_1_enabled'] == 1) { ?>
												<tr>
													<td><?php echo "с {$this->val['shapers_dn_1_start']} до {$this->val['shapers_dn_1_stop']}"; ?>
													</td>
													<td><?php echo "in:{$this->val['shapers_dn_1_in']}, out:{$this->val['shapers_dn_1_out']}"; ?>
													</td>
												</tr>
												<?php } ?>

												<?php if(isset($this->val['shapers_dn_2_enabled']) and $this->val['shapers_dn_2_enabled'] == 1) { ?>
												<tr>
													<td><?php echo "с {$this->val['shapers_dn_2_start']} до {$this->val['shapers_dn_2_stop']}"; ?>
													</td>
													<td><?php echo "in:{$this->val['shapers_dn_2_in']}, out:{$this->val['shapers_dn_2_out']}"; ?>
													</td>
												</tr>
												<?php } ?>

												<?php if(isset($this->val['shapers_dn_3_enabled']) and $this->val['shapers_dn_3_enabled'] == 1) { ?>
												<tr>
													<td><?php echo "с {$this->val['shapers_dn_3_start']} до {$this->val['shapers_dn_3_stop']}"; ?>
													</td>
													<td><?php echo "in:{$this->val['shapers_dn_3_in']}, out:{$this->val['shapers_dn_3_out']}"; ?>
													</td>
												</tr>
												<?php } ?>
											</table>
											<?php } ?>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<?php if ( isset($this->val['show']['discount']) && $this->val['show']['discount'] == 1 ) { ?>
					<?php if ( $this->val['discount']['ext_discount_global']['value'] > 0 ||
								$this->val['discount']['ext_discount_packet']['value'] > 0 ||
								$this->val['discount']['ext_discount_subs']['value'] > 0 ||
								$this->val['discount']['ext_discount_device']['value'] > 0 ) { ?>
					<div class="col-md-6">
						<!-- Browser widget -->
						<div class="awidget">
							<div class="awidget-head">
								<h3><?php echo T_("Информация о скидках"); ?></h3>
							</div>

							<div class="awidget-body no-table-bor">
								<table class="table">
									<?php if ( isset($this->val['discount']['extended']) && $this->val['discount']['extended'] == 0 ) { ?>
									<?php if ( $this->val['discount']['ext_discount_global']['value'] > 0 ) { ?>
									<tr>
										<td> <?php echo T_("Глобальная скидка") ?> </td>
										<td> <?php echo $this->val['discount']['ext_discount_global']['value']; ?>
											&nbsp;
											<?php if ( $this->val['discount']['ext_discount_global']['sign'] == '%' ) { 
															echo "%";
														} else {
															echo $this->val['UE'];
														}
														
													?>
											&nbsp;
											<?php if( isset($this->val['discount']['ext_discount_global']['date']) ) { ?>
											<span
												title="<?php echo T_("действует до"); ?> <?php echo $this->val['discount']['ext_discount_global']['date']; ?>"><span
													class="badge">?</span></span>
											<?php } ?>
										</td>
									</tr>
									<?php } ?>
									<?php } else { ?>

									<?php if ( $this->val['discount']['ext_discount_packet']['value'] > 0 ) { ?>
									<tr>
										<td> <?php echo T_("Интернет") ?> </td>
										<td><?php echo $this->val['discount']['ext_discount_packet']['value']; ?>
											&nbsp;
											<?php if ( $this->val['discount']['ext_discount_packet']['sign'] == '%' ) { 
															echo "%";
														} else {
															echo $this->val['UE'];
														}
													?>
											&nbsp;
											<?php if( isset($this->val['discount']['ext_discount_packet']['date']) ) { ?>
											<span title=""><?php echo T_("действует до"); ?>
												<?php echo $this->val['discount']['ext_discount_packet']['date']; ?></span>
											<?php } ?>
										</td>
									</tr>
									<?php } ?>

									<?php if ( $this->val['discount']['ext_discount_subs']['value'] > 0 ) { ?>
									<tr>
										<td> <?php echo T_("Подписка") ?> </td>
										<td><?php echo $this->val['discount']['ext_discount_subs']['value']; ?>
											&nbsp;
											<?php if ( $this->val['discount']['ext_discount_subs']['sign'] == '%' ) { 
															echo "%";
														} else {
															echo $this->val['UE'];
														}
													?>
											&nbsp;
											<?php if( isset($this->val['discount']['ext_discount_subs']['date']) ) { ?>
											<span
												title="<?php echo T_("действует до"); ?> <?php echo $this->val['discount']['ext_discount_subs']['date']; ?>"><span
													class="badge">?</span></span>
											<?php } ?>
										</td>
									</tr>
									<?php } ?>

									<?php if ( $this->val['discount']['ext_discount_device']['value'] > 0 ) { ?>
									<tr>
										<td> <?php echo T_("Устройство") ?> </td>
										<td><?php echo $this->val['discount']['ext_discount_device']['value']; ?>
											&nbsp;
											<?php if ( $this->val['discount']['ext_discount_device']['sign'] == '%' ) { 
															echo "%";
														} else {
															echo $this->val['UE'];
														}
													?>
											&nbsp;
											<?php if( isset($this->val['discount']['ext_discount_device']['date']) ) { ?>
											<span
												title="<?php echo T_("действует до"); ?> <?php echo $this->val['discount']['ext_discount_device']['date']; ?>"><span
													class="badge">?</span></span>
											<?php } ?>
										</td>
									</tr>
									<?php } ?>
									<?php } ?>
								</table>
							</div>
						</div>
					</div>
					<?php } ?>
					<?php } ?>
				</div>

				<?php if ( $this->val['show']['fee'] == 1 && $this->val['fee']['total'] - $this->val['fee']['total_with_discount'] > 0 ) { ?>
				<div class="row">
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
										<td> <?php echo T_("Скидка"); ?> </td>
										<td> <?php echo T_("К оплате"); ?> </td>
									</tr>

									<tr>
										<td> <?php echo T_("Интернет"); echo ":"; ?> <?php echo $this->val['tarif'];?>
										</td>
										<td> <?php echo $this->val['fee']['packet']['price']; ?>
											<?php echo $this->val['UE']; ?> </td>
										<td> <?php echo $this->val['fee']['packet']['discount']['value']; ?>
											<?php if ( $this->val['fee']['packet']['discount']['sign'] == '%' ) echo "%"; else echo $this->val['UE']; ?>
										</td>
										<td> <?php echo $this->val['fee']['packet']['price_with_discount']; ?>
											<?php echo $this->val['UE']; ?> </td>
									</tr>

									<?php if( $this->val['real_ip'] <> '0' and $this->val['gui']['accountinfo_ipfee'] == '1'){ ?>
									<?php if ( $this->val['fee']['realip'] > 0 ) { ?>
									<tr>
										<td><?php echo T_("Абонплата за реальный IP"); ?></td>
										<td><?php echo $this->val['fee']['realip']; ?>
											<?php echo $this->val['UE']; ?></td>
										<td> </td>
										<td><?php echo $this->val['fee']['realip']; ?>
											<?php echo $this->val['UE']; ?></td>
									</tr>
									<?php } ?>
									<?php } ?>

									<?php if ( count($this->val['fee']['subscriptions']['detailed']) > 0) { ?>
									<?php foreach( $this->val['fee']['subscriptions']['detailed'] as $sub ) { ?>
									<?php echo "<tr>"; ?>
									<?php echo "<td>"; echo T_("Подписка"); echo ":"; ?>
									<?php echo $sub['name']; echo "</td>"; ?>
									<?php echo "<td>"; echo $sub['price']; ?>
									<?php echo $this->val['UE']; echo "</td>"; ?>
									<?php echo "<td>"; if ($sub["discount"] == 1) echo $this->val['fee']['subscriptions']['discount']['value']; ?>
									<?php if ($sub["discount"] == 1) if ( $this->val['fee']['subscriptions']['discount']['sign'] == '%' ) echo "%"; else echo $this->val['UE']; echo "</td>"; ?>
									<?php echo "<td>"; echo $sub['price_with_discount']; ?>
									<?php echo $this->val['UE']; echo "</td>"; ?>
									<?php echo "</tr>"; ?>
									<?php } ?>
									<?php } ?>

									<?php if ( count($this->val['fee']['devices']['detailed']) > 0) { ?>
									<?php foreach( $this->val['fee']['devices']['detailed'] as $sub ) { ?>
									<?php echo "<tr>"; ?>
									<?php echo "<td>"; echo T_("Устройство"); echo ":"; ?>
									<?php echo $sub['name']; echo "</td>"; ?>
									<?php echo "<td>"; echo $sub['price']; ?>
									<?php echo $this->val['UE']; echo "</td>"; ?>
									<?php echo "<td>"; echo $this->val['fee']['devices']['discount']['value']; ?>
									<?php if ( $this->val['fee']['devices']['discount']['sign'] == '%' ) echo "%"; else echo $this->val['UE']; echo "</td>"; ?>
									<?php echo "<td>"; echo $sub['price_with_discount']; ?>
									<?php echo $this->val['UE']; echo "</td>"; ?>
									<?php echo "</tr>"; ?>
									<?php } ?>
									<?php } ?>

									<tr>
										<td> &nbsp; </td>
										<td> &nbsp; </td>
										<td> &nbsp; </td>
										<td> &nbsp; </td>
									</tr>

									<tr>
										<td> <b><?php echo T_("Итого"); ?> :</b> </td>
										<td> <?php echo $this->val['fee']['total']; ?> <?php echo $this->val['UE']; ?>
										</td>
										<td> <?php echo $this->val['fee']['total'] - $this->val['fee']['total_with_discount']; ?>
											<?php echo $this->val['UE']; ?> </td>
										<td> <b><?php echo $this->val['fee']['total_with_discount']; ?>
												<?php echo $this->val['UE']; ?></b> </td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<?php } ?>

				<?php if($this->val['show_company_name'] == 1){ ?>
				<div class="row">
					<div class="col-md-12">
						<!-- Browser widget -->
						<div class="awidget">
							<div class="awidget-head">
								<h3><?php echo T_("Информация о компании"); ?></h3>
							</div>

							<div class="awidget-body no-table-bor">
								<b><?php echo T_("Вас обслуживает"); ?>:</b>
								<?php echo $this->val['show_company_name_text']; ?>
							</div>
						</div>
					</div>
				</div>
				<?php } ?>
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
	<span class="totop">
		<a href="#"><i class="icon-chevron-up"></i></a>
	</span>

	<!-- Форма нового тикета -->
	<?php echo $this->val['ticket_new_form']; ?>
	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title"><?php echo T_("Изменение MAC адреса"); ?></h4>
				</div>

				<div class="modal-body" id="modal_text">
					<center>
						<p><?php echo T_("Уважаемый"); ?> <?php echo $this->val['fio']; ?>!</p>
					</center>
					<p><?php echo T_('Мы заметили что Вы авторизовались с неизвестного (нового) устройства. Если Вы желаете использовать данное устройство для выхода в Интернет нажмите кнопку <b>"Изменить MAC"</b>, в противном случае выход в Интернет не возможен.'); ?>
					</p>
					</br>
					<p class="text-warning">
						<small><?php echo T_("За более детальной информацией Вы можете обратиться в Отдел технической поддержки."); ?></small>
					</p>
				</div>

				<div class="modal-footer">
					<button type="button" id="cancelChangeMac" class="btn btn-default"
						data-dismiss="modal"><?php echo T_("Закрыть"); ?></button>
					<button type="button" id="submitChangeMac"
						class="btn btn-primary"><?php echo T_("Изменить MAC"); ?></button>
				</div>
			</div>
		</div>
	</div>

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

	<script type="text/javascript">
		$(document).ready(function () {
        <?php if (isset($this -> val['showChangeMac']) and $this -> val['showChangeMac']) { ?>
			$("#myModal").modal('show');
			$("#submitChangeMac").click(function () {
				//отправляю POST запрос и получаю ответ
				$.post("/ajax/users/applychangemac", { user_ip: "127.0.0.1" }, function (data) {
					if (data.result == '0') {
						$("#modal_text").html('<div class="alert alert-success"><?php echo T_("MAC адрес успешно изменен"); ?>.</div> <p><?php echo T_("Услуга Интернет будет доступна в течении 1-5 минут. <br> Для мгновенного получения услуги - перезагрузите Ваш роутер/подключение."); ?></p>');
						$.post("/ajax/users/userkick");
					} else {
						$("#modal_text").html('<div class="alert alert-danger"><?php echo T_("Ошибка изменения MAC адреса"); ?> (' + data.result + ').</b></div>');
					}
				});
				$("#submitChangeMac").hide();
			});
        <?php } ?>
	});

		// show/hide packet
		$(".click").click(
			function () {
				$('#' + this.id + '_toggle').toggle('Blind');
			}
		);
	</script>
</body>

</html>