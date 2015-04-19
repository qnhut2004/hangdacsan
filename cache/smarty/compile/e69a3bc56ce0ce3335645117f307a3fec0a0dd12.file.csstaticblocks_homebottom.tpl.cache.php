<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:02
         compiled from "/home/han4a2d1/public_html/modules/csstaticblocks/views/templates/hook/csstaticblocks_homebottom.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1556709721549c684d4ce3f5-72223231%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e69a3bc56ce0ce3335645117f307a3fec0a0dd12' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/csstaticblocks/views/templates/hook/csstaticblocks_homebottom.tpl',
      1 => 1427999094,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1556709721549c684d4ce3f5-72223231',
  'function' => 
  array (
  ),
  'cache_lifetime' => 31536000,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c684d4fab30_22123038',
  'variables' => 
  array (
    'block_list' => 0,
    'cookie' => 0,
    'block' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c684d4fab30_22123038')) {function content_549c684d4fab30_22123038($_smarty_tpl) {?><!-- Static Block module -->
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