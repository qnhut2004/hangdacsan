<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:02
         compiled from "/home/han4a2d1/public_html/modules/csstaticblocks/views/templates/hook/csstaticblocks_footertop.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1908605819549c684d3f5027-80502194%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8202e7183664150b8ed28fdd6d47cbb5868676ca' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/csstaticblocks/views/templates/hook/csstaticblocks_footertop.tpl',
      1 => 1427999094,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1908605819549c684d3f5027-80502194',
  'function' => 
  array (
  ),
  'cache_lifetime' => 31536000,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c684d4620c4_35936044',
  'variables' => 
  array (
    'block_list' => 0,
    'cookie' => 0,
    'block' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c684d4620c4_35936044')) {function content_549c684d4620c4_35936044($_smarty_tpl) {?><!-- Static Block module -->
<?php  $_smarty_tpl->tpl_vars['block'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['block']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['block_list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['block']->key => $_smarty_tpl->tpl_vars['block']->value){
$_smarty_tpl->tpl_vars['block']->_loop = true;
?>
	<?php if (isset($_smarty_tpl->tpl_vars['block']->value->content[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang])){?>
		<?php echo $_smarty_tpl->tpl_vars['block']->value->content[(int)$_smarty_tpl->tpl_vars['cookie']->value->id_lang];?>

	<?php }?>
<?php } ?>
<!-- /Static block module --><?php }} ?>