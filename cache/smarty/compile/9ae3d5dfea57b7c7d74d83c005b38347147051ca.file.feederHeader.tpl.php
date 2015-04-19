<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:02
         compiled from "/home/han4a2d1/public_html/modules/feeder/feederHeader.tpl" */ ?>
<?php /*%%SmartyHeaderCode:122303399549c684acd45a1-82367719%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9ae3d5dfea57b7c7d74d83c005b38347147051ca' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/feeder/feederHeader.tpl',
      1 => 1427999095,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '122303399549c684acd45a1-82367719',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c684ad97771_49743366',
  'variables' => 
  array (
    'meta_title' => 0,
    'feedUrl' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c684ad97771_49743366')) {function content_549c684ad97771_49743366($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_escape')) include '/home/han4a2d1/public_html/tools/smarty/plugins/modifier.escape.php';
?>

<link rel="alternate" type="application/rss+xml" title="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['meta_title']->value, 'html', 'UTF-8');?>
" href="<?php echo $_smarty_tpl->tpl_vars['feedUrl']->value;?>
" /><?php }} ?>