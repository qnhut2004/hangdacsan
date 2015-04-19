<?php /* Smarty version Smarty-3.1.13, created on 2014-12-26 01:49:10
         compiled from "/home/han4a2d1/public_html/modules/blocksharefb/blocksharefb.tpl" */ ?>
<?php /*%%SmartyHeaderCode:74352625549d04e6dc4a28-46082767%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a2da74f15736152660dd6dff53b41c4e3d201602' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/blocksharefb/blocksharefb.tpl',
      1 => 1419505432,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '74352625549d04e6dc4a28-46082767',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'product_link' => 0,
    'product_title' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549d04e6dcfa22_69130355',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549d04e6dcfa22_69130355')) {function content_549d04e6dcfa22_69130355($_smarty_tpl) {?>

<li id="left_share_fb">
	<a href="http://www.facebook.com/sharer.php?u=<?php echo $_smarty_tpl->tpl_vars['product_link']->value;?>
&amp;t=<?php echo $_smarty_tpl->tpl_vars['product_title']->value;?>
" class="js-new-window"><?php echo smartyTranslate(array('s'=>'Share on Facebook!','mod'=>'blocksharefb'),$_smarty_tpl);?>
</a>
</li><?php }} ?>