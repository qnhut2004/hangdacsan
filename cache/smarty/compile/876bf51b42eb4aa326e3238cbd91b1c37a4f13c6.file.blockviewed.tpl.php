<?php /* Smarty version Smarty-3.1.13, created on 2015-01-29 14:05:31
         compiled from "/home/han4a2d1/public_html/modules/csblockviewed/blockviewed.tpl" */ ?>
<?php /*%%SmartyHeaderCode:48173546354ca847baba147-38905813%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '876bf51b42eb4aa326e3238cbd91b1c37a4f13c6' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/csblockviewed/blockviewed.tpl',
      1 => 1419505432,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '48173546354ca847baba147-38905813',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'productsViewedObj' => 0,
    'viewedProduct' => 0,
    'link' => 0,
    'img_prod_dir' => 0,
    'lang_iso' => 0,
    'priceDisplay' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_54ca847bbd6429_59022136',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54ca847bbd6429_59022136')) {function content_54ca847bbd6429_59022136($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_escape')) include '/home/han4a2d1/public_html/tools/smarty/plugins/modifier.escape.php';
?>

<!-- CS Block Viewed products -->
<div id="viewed-products_block_left" class="block products_block">
	<h4 class="title_block"><?php echo smartyTranslate(array('s'=>'Lastest views','mod'=>'csblockviewed'),$_smarty_tpl);?>
</h4>
	<div class="block_content">
		<ul class="products clearfix">
			<?php  $_smarty_tpl->tpl_vars['viewedProduct'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['viewedProduct']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['productsViewedObj']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
 $_smarty_tpl->tpl_vars['viewedProduct']->total= $_smarty_tpl->_count($_from);
 $_smarty_tpl->tpl_vars['viewedProduct']->iteration=0;
 $_smarty_tpl->tpl_vars['viewedProduct']->index=-1;
foreach ($_from as $_smarty_tpl->tpl_vars['viewedProduct']->key => $_smarty_tpl->tpl_vars['viewedProduct']->value){
$_smarty_tpl->tpl_vars['viewedProduct']->_loop = true;
 $_smarty_tpl->tpl_vars['viewedProduct']->iteration++;
 $_smarty_tpl->tpl_vars['viewedProduct']->index++;
 $_smarty_tpl->tpl_vars['viewedProduct']->first = $_smarty_tpl->tpl_vars['viewedProduct']->index === 0;
 $_smarty_tpl->tpl_vars['viewedProduct']->last = $_smarty_tpl->tpl_vars['viewedProduct']->iteration === $_smarty_tpl->tpl_vars['viewedProduct']->total;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['myLoop']['first'] = $_smarty_tpl->tpl_vars['viewedProduct']->first;
 $_smarty_tpl->tpl_vars['smarty']->value['foreach']['myLoop']['last'] = $_smarty_tpl->tpl_vars['viewedProduct']->last;
?>
				<li class="clearfix<?php if ($_smarty_tpl->getVariable('smarty')->value['foreach']['myLoop']['last']){?> last_item<?php }elseif($_smarty_tpl->getVariable('smarty')->value['foreach']['myLoop']['first']){?> first_item<?php }else{ ?> item<?php }?>">
					<a href="<?php echo $_smarty_tpl->tpl_vars['viewedProduct']->value['link'];?>
" title="<?php echo smartyTranslate(array('s'=>'About','mod'=>'csblockviewed'),$_smarty_tpl);?>
 <?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['viewedProduct']->value['name'], 'html', 'UTF-8');?>
" class="content_img">
						<img src="<?php if (isset($_smarty_tpl->tpl_vars['viewedProduct']->value['id_image'])&&$_smarty_tpl->tpl_vars['viewedProduct']->value['id_image']){?><?php echo $_smarty_tpl->tpl_vars['link']->value->getImageLink($_smarty_tpl->tpl_vars['viewedProduct']->value['link_rewrite'],$_smarty_tpl->tpl_vars['viewedProduct']->value['id_image'],'small_default');?>
<?php }else{ ?><?php echo $_smarty_tpl->tpl_vars['img_prod_dir']->value;?>
<?php echo $_smarty_tpl->tpl_vars['lang_iso']->value;?>
-default-small_default.jpg<?php }?>" alt="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['viewedProduct']->value['legend'], 'html', 'UTF-8');?>
" />
					</a>		
					<h3 class="name_product"><a href="<?php echo $_smarty_tpl->tpl_vars['viewedProduct']->value['link'];?>
" title="<?php echo smartyTranslate(array('s'=>'About','mod'=>'csblockviewed'),$_smarty_tpl);?>
 <?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['viewedProduct']->value['name'], 'html', 'UTF-8');?>
"><?php echo smarty_modifier_escape($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['viewedProduct']->value['name'],35,'...'), 'html', 'UTF-8');?>
</a></h3>
					<div class="products_list_price">
					<span class="price"><?php if (!$_smarty_tpl->tpl_vars['priceDisplay']->value){?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['displayWtPrice'][0][0]->displayWtPrice(array('p'=>$_smarty_tpl->tpl_vars['viewedProduct']->value['price']),$_smarty_tpl);?>
<?php }else{ ?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['displayWtPrice'][0][0]->displayWtPrice(array('p'=>$_smarty_tpl->tpl_vars['viewedProduct']->value['price_tax_exc']),$_smarty_tpl);?>
<?php }?></span>
					
				</div>
						
				</li>
			<?php } ?>
		</ul>
	</div>
</div>
<!-- CS Block Viewed products -->
<?php }} ?>