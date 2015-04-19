<?php /* Smarty version Smarty-3.1.13, created on 2015-01-16 00:17:46
         compiled from "/home/han4a2d1/public_html/themes/gomarket/category-count.tpl" */ ?>
<?php /*%%SmartyHeaderCode:196114630254b89efa9918e5-96707829%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'baab55aff55f814f77f4ce971eca1b5ecadc0985' => 
    array (
      0 => '/home/han4a2d1/public_html/themes/gomarket/category-count.tpl',
      1 => 1419505431,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '196114630254b89efa9918e5-96707829',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'category' => 0,
    'nb_products' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_54b89efa9b6751_44784455',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54b89efa9b6751_44784455')) {function content_54b89efa9b6751_44784455($_smarty_tpl) {?>
<?php if ($_smarty_tpl->tpl_vars['category']->value->id==1||$_smarty_tpl->tpl_vars['nb_products']->value==0){?>
	<?php echo smartyTranslate(array('s'=>'There are no products.'),$_smarty_tpl);?>

<?php }else{ ?>
	<?php if ($_smarty_tpl->tpl_vars['nb_products']->value==1){?>
		<?php echo smartyTranslate(array('s'=>'There is %d product.','sprintf'=>$_smarty_tpl->tpl_vars['nb_products']->value),$_smarty_tpl);?>

	<?php }else{ ?>
		<?php echo smartyTranslate(array('s'=>'There are %d products.','sprintf'=>$_smarty_tpl->tpl_vars['nb_products']->value),$_smarty_tpl);?>

	<?php }?>
<?php }?><?php }} ?>