<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:03
         compiled from "/home/han4a2d1/public_html/modules/csmanufacturer/csmanufacturer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1236634304549c684fdda054-61220191%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'b473c4fe72cd1823077c8629838af8b66c051a8d' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/csmanufacturer/csmanufacturer.tpl',
      1 => 1427999094,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1236634304549c684fdda054-61220191',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c684fe3d683_50198607',
  'variables' => 
  array (
    'manufacs' => 0,
    'ps_manu_img_dir' => 0,
    'manufacturer' => 0,
    'link' => 0,
    'img_manu_dir' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c684fe3d683_50198607')) {function content_549c684fe3d683_50198607($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_escape')) include '/home/han4a2d1/public_html/tools/smarty/plugins/modifier.escape.php';
?><!-- CS Manufacturer module -->
<div class="manufacturerContainer">
	<div class="list_manufacturer responsive">
		<ul id="scroller">
		<?php  $_smarty_tpl->tpl_vars['manufacturer'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['manufacturer']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['manufacs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['manufacturer']->key => $_smarty_tpl->tpl_vars['manufacturer']->value){
$_smarty_tpl->tpl_vars['manufacturer']->_loop = true;
?>
			<?php if (file_exists((($_smarty_tpl->tpl_vars['ps_manu_img_dir']->value).($_smarty_tpl->tpl_vars['manufacturer']->value['id_manufacturer'])).('.jpg'))){?>
			<li class="<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['product_list']['first']){?>first_item<?php }elseif($_smarty_tpl->getVariable('smarty')->value['foreach']['product_list']['last']){?>last_item<?php }?>">
				<a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getmanufacturerLink($_smarty_tpl->tpl_vars['manufacturer']->value['id_manufacturer'],$_smarty_tpl->tpl_vars['manufacturer']->value['link_rewrite']);?>
" title="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['manufacturer']->value['name'], 'htmlall', 'UTF-8');?>
">
				<img src="<?php echo $_smarty_tpl->tpl_vars['img_manu_dir']->value;?>
<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['manufacturer']->value['id_manufacturer'], 'htmlall', 'UTF-8');?>
.jpg" alt="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['manufacturer']->value['name'], 'htmlall', 'UTF-8');?>
" /></a>
			</li>
			<?php }?>
		<?php } ?>
		</ul>
			<a id="prev_cs_manu" class="prev btn" href="#">&lt;</a>
			<a id="next_cs_manu" class="next btn" href="#">&gt;</a>
	</div>
</div>
<script type="text/javascript">
	$(window).load(function(){
		$("#scroller").carouFredSel({
			auto: false,
			responsive: true,
				width: '100%',
				height : 'variable',
				prev: '#prev_cs_manu',
				next: '#next_cs_manu',
				swipe: {
					onTouch : true
				},
				items: {
					width: 200,
					height : 'auto',
					visible: {
						min: 1,
						max: 6
					}
				},
				scroll: {
					items : 2 ,       //  The number of items scrolled.
					direction : 'left'
				}

		});
	});
</script>
<!-- /CS Manufacturer module -->

<?php }} ?>