<?php /* Smarty version Smarty-3.1.13, created on 2014-12-26 03:15:27
         compiled from "/home/han4a2d1/public_html/han4a2d1admin/themes/default/template/helpers/list/list_action_edit.tpl" */ ?>
<?php /*%%SmartyHeaderCode:275923895549d191f313af7-57004225%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4daf9be11c41cdca5434bbf40e96ae4857822c31' => 
    array (
      0 => '/home/han4a2d1/public_html/han4a2d1admin/themes/default/template/helpers/list/list_action_edit.tpl',
      1 => 1397155724,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '275923895549d191f313af7-57004225',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'href' => 0,
    'action' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549d191f31db89_68409043',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549d191f31db89_68409043')) {function content_549d191f31db89_68409043($_smarty_tpl) {?>
<a href="<?php echo $_smarty_tpl->tpl_vars['href']->value;?>
" class="edit" title="<?php echo $_smarty_tpl->tpl_vars['action']->value;?>
">
	<img src="../img/admin/edit.gif" alt="<?php echo $_smarty_tpl->tpl_vars['action']->value;?>
" />
</a><?php }} ?>