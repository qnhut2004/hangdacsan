<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:03
         compiled from "/home/han4a2d1/public_html/themes/gomarket/modules/blockadvertising/blockadvertising.tpl" */ ?>
<?php /*%%SmartyHeaderCode:798170147549c684fa87be6-37906111%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'af146d36fe01af09e78b7aff97594a464e6d37e6' => 
    array (
      0 => '/home/han4a2d1/public_html/themes/gomarket/modules/blockadvertising/blockadvertising.tpl',
      1 => 1427999095,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '798170147549c684fa87be6-37906111',
  'function' => 
  array (
  ),
  'cache_lifetime' => 31536000,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c684fa97713_64142998',
  'variables' => 
  array (
    'adv_link' => 0,
    'adv_title' => 0,
    'image' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c684fa97713_64142998')) {function content_549c684fa97713_64142998($_smarty_tpl) {?>

<!-- MODULE Block advertising -->
<div class="advertising_block">
	<a href="<?php echo $_smarty_tpl->tpl_vars['adv_link']->value;?>
" title="<?php echo $_smarty_tpl->tpl_vars['adv_title']->value;?>
"><img src="<?php echo $_smarty_tpl->tpl_vars['image']->value;?>
" alt="<?php echo $_smarty_tpl->tpl_vars['adv_title']->value;?>
" title="<?php echo $_smarty_tpl->tpl_vars['adv_title']->value;?>
"/></a>
</div>
<!-- /MODULE Block advertising -->
<?php }} ?>