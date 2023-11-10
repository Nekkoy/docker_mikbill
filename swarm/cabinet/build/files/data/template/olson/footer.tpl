<div class="copy text-center">
    Copyright <?php echo date("Y"); ?> &copy; - <a href="<?php echo $this->val['config']['company_site']; ?>"><?php echo $this->val['config']['company_name']; ?></a>
    
    <div>
		<table align="center">
 		<tr>
 		
        <?php
        if(isset($this->val['config']['gui']['menu_show_language']) AND $this->val['config']['gui']['menu_show_language'] == 1){

        foreach ($this->val['config']['locales'] as $k => $v) {
        if (stristr($k, 'name_') !== false) {
        $key_name = str_replace('name_', '', $k);
        $val_en = 'enable_' . $key_name;
        $val_file = 'file_' . $key_name;

        if (isset($this->val['config']['locales'][$val_en]) AND $this->val['config']['locales'][$val_en] == 1){

        $attachment = '';

        if(isset($_GET['action'], $_GET['type']) AND $_GET['action'] == 'register'){
        $attachment = '&action='.$_GET['action'].'&type='.$_GET['type'];
        }

        ?>

 		<td>
		<form action="/index/main" method="post">
			<input class="inputBox" type="hidden" name="lang" value="<?php echo $v.$attachment; ?>" />
			
			<button type="submit" style="border:1px solid black; background-color: transparent;">
        	<img src="/data/locale/<?php echo $v; ?>/flag.png" width="20" height="14" style="margin-top:8px;"/>
      		</button>
      		
		</form>
		</td>
		
        <?php }
                }
            }
        }
    ?>
    </tr>
	</table>
    
    </div>
	
</div>
