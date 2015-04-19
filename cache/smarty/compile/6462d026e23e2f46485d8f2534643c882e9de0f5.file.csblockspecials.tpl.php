<?php /* Smarty version Smarty-3.1.13, created on 2014-12-25 20:04:33
         compiled from "/home/han4a2d1/public_html/modules/csblockspecials/csblockspecials.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2109817887549cb4213a8bc8-04406660%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6462d026e23e2f46485d8f2534643c882e9de0f5' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/csblockspecials/csblockspecials.tpl',
      1 => 1419505432,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2109817887549cb4213a8bc8-04406660',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'link' => 0,
    'special' => 0,
    'PS_CATALOG_MODE' => 0,
    'priceDisplay' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549cb4217fcea4_20743633',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549cb4217fcea4_20743633')) {function content_549cb4217fcea4_20743633($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_escape')) include '/home/han4a2d1/public_html/tools/smarty/plugins/modifier.escape.php';
?>

<!-- MODULE Block specials -->
<div id="cs_special_block_right" class="block products_block csblockspecials grid_5 alpha">
	<h4 class="title_block"><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('prices-drop');?>
" title="<?php echo smartyTranslate(array('s'=>'Hot deal of week','mod'=>'csblockspecials'),$_smarty_tpl);?>
"><?php echo smartyTranslate(array('s'=>'Hot deal of week','mod'=>'csblockspecials'),$_smarty_tpl);?>
</a></h4>
	<div class="block_content">

<?php if ($_smarty_tpl->tpl_vars['special']->value){?>
		<ul class="products clearfix">
			<li class="ajax_block_product">
				<a href="<?php echo $_smarty_tpl->tpl_vars['special']->value['link'];?>
" class="product_image"><img src="<?php echo $_smarty_tpl->tpl_vars['link']->value->getImageLink($_smarty_tpl->tpl_vars['special']->value['link_rewrite'],$_smarty_tpl->tpl_vars['special']->value['id_image'],'home_default');?>
" /></a>
				<h3 class="s_title_block"><a href="<?php echo $_smarty_tpl->tpl_vars['special']->value['link'];?>
"><?php echo smarty_modifier_escape($_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_MODIFIER]['truncate'][0][0]->smarty_modifier_truncate($_smarty_tpl->tpl_vars['special']->value['name'],35,'...'), 'html', 'UTF-8');?>
</a></h3>
				<?php if (!$_smarty_tpl->tpl_vars['PS_CATALOG_MODE']->value){?>
					<span class="price"><?php if (!$_smarty_tpl->tpl_vars['priceDisplay']->value){?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['displayWtPrice'][0][0]->displayWtPrice(array('p'=>$_smarty_tpl->tpl_vars['special']->value['price']),$_smarty_tpl);?>
<?php }else{ ?><?php echo $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['displayWtPrice'][0][0]->displayWtPrice(array('p'=>$_smarty_tpl->tpl_vars['special']->value['price_tax_exc']),$_smarty_tpl);?>
<?php }?></span>
				<?php }?>
			</li>
		</ul>
<?php }else{ ?>
		<p><?php echo smartyTranslate(array('s'=>'No product specials are available at this time.','mod'=>'csblockspecials'),$_smarty_tpl);?>
</p>
<?php }?>
	</div>
</div>
<!-- /MODULE Block specials --><?php }} ?>