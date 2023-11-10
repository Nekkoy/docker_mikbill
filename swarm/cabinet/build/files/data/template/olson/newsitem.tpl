<?php foreach ($this->newsitem as $key) { ?>

<div class="list-group-item">
    <div class="chat-body clearfix">
        <div>
            <h4><strong class="primary-font"><?php echo $key['@attributes']['subject']; ?></strong>
                <small class="pull-right text-muted">
                    <i class="fa fa-clock-o fa-fw"></i><?php echo $key['@attributes']['start_date']; ?>
                </small>
            </h4>

        </div>
        <p>
            <?php echo $key['@attributes']['text']; ?>
        </p>
    </div>
</div>

<?php }?>