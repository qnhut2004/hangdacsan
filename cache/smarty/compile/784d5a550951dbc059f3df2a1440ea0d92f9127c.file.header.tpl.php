<?php /* Smarty version Smarty-3.1.13, created on 2014-12-26 01:49:11
         compiled from "/home/han4a2d1/public_html/modules/csquickview/views/templates/front/header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1241025408549d04e7121293-67596480%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '784d5a550951dbc059f3df2a1440ea0d92f9127c' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/csquickview/views/templates/front/header.tpl',
      1 => 1419505432,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1241025408549d04e7121293-67596480',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'lang_iso' => 0,
    'content_dir' => 0,
    'base_uri' => 0,
    'static_token' => 0,
    'token' => 0,
    'priceDisplayPrecision' => 0,
    'currency' => 0,
    'priceDisplay' => 0,
    'roundMode' => 0,
    'css_files' => 0,
    'css_uri' => 0,
    'media' => 0,
    'base_dir' => 0,
    'js_files' => 0,
    'js_uri' => 0,
    'js_dir' => 0,
    'page_name' => 0,
    'hide_left_column' => 0,
    'hide_right_column' => 0,
    'content_only' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549d04e71b8f04_26380079',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549d04e71b8f04_26380079')) {function content_549d04e71b8f04_26380079($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_escape')) include '/home/han4a2d1/public_html/tools/smarty/plugins/modifier.escape.php';
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7 lt-ie6 " lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8 ie7" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9 ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]> <html lang="fr" class="no-js ie9" lang="en"> <![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $_smarty_tpl->tpl_vars['lang_iso']->value;?>
">
	<head>
		
		<script type="text/javascript">
			var baseDir = '<?php echo $_smarty_tpl->tpl_vars['content_dir']->value;?>
';
			var baseUri = '<?php echo $_smarty_tpl->tpl_vars['base_uri']->value;?>
';
			var static_token = '<?php echo $_smarty_tpl->tpl_vars['static_token']->value;?>
';
			var token = '<?php echo $_smarty_tpl->tpl_vars['token']->value;?>
';
			var priceDisplayPrecision = <?php echo $_smarty_tpl->tpl_vars['priceDisplayPrecision']->value*$_smarty_tpl->tpl_vars['currency']->value->decimals;?>
;
			var priceDisplayMethod = <?php echo $_smarty_tpl->tpl_vars['priceDisplay']->value;?>
;
			var roundMode = <?php echo $_smarty_tpl->tpl_vars['roundMode']->value;?>
;
		</script>
<?php if (isset($_smarty_tpl->tpl_vars['css_files']->value)){?>
	<?php  $_smarty_tpl->tpl_vars['media'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['media']->_loop = false;
 $_smarty_tpl->tpl_vars['css_uri'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['css_files']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['media']->key => $_smarty_tpl->tpl_vars['media']->value){
$_smarty_tpl->tpl_vars['media']->_loop = true;
 $_smarty_tpl->tpl_vars['css_uri']->value = $_smarty_tpl->tpl_vars['media']->key;
?>
	<link href="<?php echo $_smarty_tpl->tpl_vars['css_uri']->value;?>
" rel="stylesheet" type="text/css" media="<?php echo $_smarty_tpl->tpl_vars['media']->value;?>
" />
	<?php } ?>
<?php }?>
<link href="<?php echo $_smarty_tpl->tpl_vars['base_dir']->value;?>
modules/csthemeeditor/config.css.php" rel="stylesheet" type="text/css" media="<?php echo $_smarty_tpl->tpl_vars['media']->value;?>
" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<?php if (isset($_smarty_tpl->tpl_vars['js_files']->value)){?>
	<?php  $_smarty_tpl->tpl_vars['js_uri'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['js_uri']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['js_files']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['js_uri']->key => $_smarty_tpl->tpl_vars['js_uri']->value){
$_smarty_tpl->tpl_vars['js_uri']->_loop = true;
?>
	<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_uri']->value;?>
"></script>
	<?php } ?>
<?php }?>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/jquery.carouFredSel-6.1.0.js"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/jquery.ba-throttle-debounce.min.js"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['base_dir']->value;?>
modules/csthemeeditor/config.js.php"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['base_dir']->value;?>
modules/csthemeeditor/js/frontend/jquery.cookie.js"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['base_dir']->value;?>
modules/csthemeeditor/js/frontend/setconfig.js"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['base_dir']->value;?>
modules/csthemeeditor/js/colorpicker.js"></script>
	</head>
	
	<body <?php if (isset($_smarty_tpl->tpl_vars['page_name']->value)){?>id="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['page_name']->value, 'htmlall', 'UTF-8');?>
"<?php }?> class="<?php if ($_smarty_tpl->tpl_vars['hide_left_column']->value){?>hide-left-column<?php }?> <?php if ($_smarty_tpl->tpl_vars['hide_right_column']->value){?>hide-right-column<?php }?> <?php if ($_smarty_tpl->tpl_vars['content_only']->value){?> content_only <?php }?>">
	<?php if (!$_smarty_tpl->tpl_vars['content_only']->value){?>
		<div id="page" class="cs_quickshop">

			<div id="columns">

				<!-- Center -->
				<div id="center_column">
	<?php }?>
<?php }} ?>