<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:03
         compiled from "/home/han4a2d1/public_html/modules/cshometab/cshometab.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1039234569549cb4222fd265-05289593%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '40f2d6cf36d5187f20ff9c6c10381815ab8e1b8a' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/cshometab/cshometab.tpl',
      1 => 1427999094,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1039234569549cb4222fd265-05289593',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549cb4224cedd0_96110804',
  'variables' => 
  array (
    'tabs' => 0,
    'ftab' => 0,
    'cookie' => 0,
    'tab' => 0,
    'category' => 0,
    'link' => 0,
    'product' => 0,
    'restricted_country_mode' => 0,
    'priceDisplay' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549cb4224cedd0_96110804')) {function content_549cb4224cedd0_96110804($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_escape')) include '/home/han4a2d1/public_html/tools/smarty/plugins/modifier.escape.php';
?><!-- CS Home Tab module -->
<div class="home_top_tab_category">
<?php if (count($_smarty_tpl->tpl_vars['tabs']->value)>0){?>
<div id="tabs">
	<ul id="ul_cs_tab">
		<?php  $_smarty_tpl->tpl_vars['ftab'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ftab']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['tabs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['ftab']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['ftab']->iteration=0;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['tabs']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['ftab']->key => $_smarty_tpl->tpl_vars['ftab']->value){
$_smarty_tpl->tpl_vars['ftab']->_loop = true;
 $_smarty_tpl->tpl_vars['ftab']->iteration++;
 $_smarty_tpl->tpl_vars['ftab']->last = $_smarty_tpl->tpl_vars['ftab']->iteration === $_smarty_tpl->tpl_vars['ftab']->total;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['tabs']['iteration']++;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['tabs']['last'] = $_smarty_tpl->tpl_vars['ftab']->last;
?>
		<?php $_smarty_tpl->tpl_vars["tab"] = new Smarty_variable($_smarty_tpl->tpl_vars['ftab']->value['info'], null, 0);?>
			<li class="<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['tabs']['last']){?>last<?php }?> refreshCarousel">
				<a href="#tabs-<?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['tabs']['iteration'];?>
"><?php echo $_smarty_tpl->tpl_vars['tab']->value->title[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang];?>
</a>
			</li>
		<?php } ?>
	</ul>
	<?php  $_smarty_tpl->tpl_vars['ftab'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['ftab']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['tabs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['ftab']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['ftab']->iteration=0;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['tabs']['iteration']=0;
foreach ($_from as $_smarty_tpl->tpl_vars['ftab']->key => $_smarty_tpl->tpl_vars['ftab']->value){
$_smarty_tpl->tpl_vars['ftab']->_loop = true;
 $_smarty_tpl->tpl_vars['ftab']->iteration++;
 $_smarty_tpl->tpl_vars['ftab']->last = $_smarty_tpl->tpl_vars['ftab']->iteration === $_smarty_tpl->tpl_vars['ftab']->total;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['tabs']['iteration']++;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['tabs']['last'] = $_smarty_tpl->tpl_vars['ftab']->last;
?>
	<?php $_smarty_tpl->tpl_vars["tab"] = new Smarty_variable($_smarty_tpl->tpl_vars['ftab']->value['info'], null, 0);?>
	<?php $_smarty_tpl->tpl_vars["category"] = new Smarty_variable($_smarty_tpl->tpl_vars['ftab']->value['category'], null, 0);?>
		<div class="title_tab_hide_show" style="display:none">
			<?php echo $_smarty_tpl->tpl_vars['tab']->value->title[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang];?>

			<input type='hidden' value='<?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['tabs']['iteration'];?>
' />
		</div>
		<div id="tabs-<?php echo $_smarty_tpl->getVariable('smarty')->value['foreach']['tabs']['iteration'];?>
">
		<?php if ($_smarty_tpl->tpl_vars['category']->value->id_image){?>
			<div class="cat_banner">
			<img src="<?php echo $_smarty_tpl->tpl_vars['link']->value->getCatImageLink($_smarty_tpl->tpl_vars['category']->value->link_rewrite[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang],$_smarty_tpl->tpl_vars['category']->value->id_image,'category_default');?>
" alt="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['category']->value->name[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang], 'htmlall', 'UTF-8');?>
" title="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['category']->value->name[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang], 'htmlall', 'UTF-8');?>
"/>
			</div>
		<?php }?>
		<div class="cs_right_cat_tab">
			<div class="products">
				<?php if ($_smarty_tpl->tpl_vars['tab']->value->product_list){?>
				<div class="list_carousel responsive">
					<ul class="product-list">
					<?php  $_smarty_tpl->tpl_vars['product'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['product']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['tab']->value->product_list; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['product']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['product']->iteration=0;
 $_smarty_tpl->tpl_vars['product']->index=-1;
foreach ($_from as $_smarty_tpl->tpl_vars['product']->key => $_smarty_tpl->tpl_vars['product']->value){
$_smarty_tpl->tpl_vars['product']->_loop = true;
 $_smarty_tpl->tpl_vars['product']->iteration++;
 $_smarty_tpl->tpl_vars['product']->index++;
 $_smarty_tpl->tpl_vars['product']->first = $_smarty_tpl->tpl_vars['product']->index === 0;
 $_smarty_tpl->tpl_vars['product']->last = $_smarty_tpl->tpl_vars['product']->iteration === $_smarty_tpl->tpl_vars['product']->total;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['product_list']['first'] = $_smarty_tpl->tpl_vars['product']->first;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['product_list']['last'] = $_smarty_tpl->tpl_vars['product']->last;
?>
						<li class="ajax_block_product <?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['product_list']['first']){?>first_item<?php }elseif($_smarty_tpl->getVariable('smarty')->value['foreach']['product_list']['last']){?>last_item<?php }?>">
						<a href="<?php echo $_smarty_tpl->tpl_vars['product']->value['link'];?>
" class="product_image"><img src="<?php echo $_smarty_tpl->tpl_vars['link']->value->getImageLink($_smarty_tpl->tpl_vars['product']->value['link_rewrite'],$_smarty_tpl->tpl_vars['product']->value['id_image'],'home_default');?>
" alt="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['product']->value['name'], 'html', 'UTF-8');?>
" /></a>
						<h3 class="name_product"><a href="<?php echo $_smarty_tpl->tpl_vars['product']->value['link'];?>
"><?php echo smarty_modifier_escape($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['product']->value['name'],25,'...'), 'htmlall', 'UTF-8');?>
</a></h3>
					
						<div class="products_list_price">
							<?php if (isset($_smarty_tpl->tpl_vars['product']->value['show_price'])&&$_smarty_tpl->tpl_vars['product']->value['show_price']&&!isset($_smarty_tpl->tpl_vars['restricted_country_mode']->value)){?>
								<span class="price"><?php if (!$_smarty_tpl->tpl_vars['priceDisplay']->value){?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['product']->value['price']),$_smarty_tpl);?>
<?php }else{ ?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['convertPrice'][0][0]->convertPrice(array('price'=>$_smarty_tpl->tpl_vars['product']->value['price_tax_exc']),$_smarty_tpl);?>
<?php }?></span>
							<?php }?>
						</div>
					</li>
					<?php } ?>
					</ul>
					<div class="clearfix"></div>
				</div>
				<?php }?>
			</div>
				<h1>
				<a href="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['link']->value->getCategoryLink($_smarty_tpl->tpl_vars['category']->value->id_category,$_smarty_tpl->tpl_vars['category']->value->link_rewrite), 'htmlall', 'UTF-8');?>
" title="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['category']->value->name[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang], 'htmlall', 'UTF-8');?>
" class="img">
				<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['category']->value->name[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang], 'htmlall', 'UTF-8');?>
</a></h1>
			<?php if ($_smarty_tpl->tpl_vars['category']->value->description){?>
				<div class="info_cat">
				<?php if (strlen($_smarty_tpl->tpl_vars['category']->value->description[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang])>120){?>
					<p><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['category']->value->description[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang],120);?>
</p>
				<?php }else{ ?>
					<p><?php echo $_smarty_tpl->tpl_vars['category']->value->description[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang];?>
</p>
				<?php }?>
				</div>
			<?php }?>
		</div>
	</div>
	<?php } ?>
</div>
<script type="text/javascript">
	$('div.title_tab_hide_show').first().addClass('selected');
	$(document).ready(function() {
		cs_resize();
		$('#tabs').on('click', '.title_tab_hide_show', function() {
			if($(this).hasClass('selected')) {
				$(this).removeClass('selected');
				var id = $(this).find('input').val();
				$('#tabs-'+id).hide();
			} else {
				$(this).addClass('selected');
				var id = $(this).find('input').val();
				$('#tabs-'+id).show();
			}
		});
	});

	$(window).resize(function() {
		cs_resize();
	});
	function cs_resize()	{
		if(getWidthBrowser() < 767){ //767
			$('#tabs').tabs('destroy');
			$('.title_tab').hide();
			$('#ul_cs_tab').hide();
			$('#tabs div.title_tab_hide_show').show();
			$('#tabs div.title_tab_hide_show').addClass('selected');
		} else {
			$('#ul_cs_tab').show();
			$('#tabs div.title_tab_hide_show').hide();
			$('#tabs').tabs();
		}
	}
</script>
<?php }?>
</div>
<!-- /CS Home Tab module -->
<?php }} ?>