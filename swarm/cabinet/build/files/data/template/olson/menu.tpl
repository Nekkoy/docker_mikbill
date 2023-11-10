<div class="sidey">
    <div class="side-cont">
        <ul class="nav">
            <?php foreach ($this->val['main_menu'] as $key => $item) { if (empty($item['child'])){ ?>
            <li><a href="<?php echo $item['link']; ?>"><i class="<?php echo $item['icon']; ?>"></i><?php echo T_($item['name']); ?></a></li>
            <?php } else{ ?>
            <li class="has_submenu"><a href="<?php echo $item['link']; ?>"><i class="<?php echo $item['icon']; ?>"></i><?php echo T_($item['name']); ?>
                    <span class="caret pull-right"></span></a>
                <ul>
                    <?php foreach ($item['child'] as $key => $item) { ?>
                    <li><a href="<?php echo $item['link']; ?>"><i class="<?php echo $item['icon']; ?>"></i> <?php echo T_($item['name']); ?></a></li>
                    <?php  } ?>
                </ul>
            </li>
            <?php }
          }?>
        </ul>
    </div>
</div>