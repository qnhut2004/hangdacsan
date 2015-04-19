<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:04
         compiled from "/home/han4a2d1/public_html/themes/gomarket/header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1570733847549c6850c95c02-45651166%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '513569735a0519fc28dc4f27a277a1c7b33ef4a6' => 
    array (
      0 => '/home/han4a2d1/public_html/themes/gomarket/header.tpl',
      1 => 1427999095,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1570733847549c6850c95c02-45651166',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c6850e0dee6_48961846',
  'variables' => 
  array (
    'meta_title' => 0,
    'meta_description' => 0,
    'meta_keywords' => 0,
    'meta_language' => 0,
    'nobots' => 0,
    'nofollow' => 0,
    'favicon_url' => 0,
    'img_update_time' => 0,
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
    'css_dir' => 0,
    'js_files' => 0,
    'js_uri' => 0,
    'js_dir' => 0,
    'page_name' => 0,
    'HOOK_HEADER' => 0,
    'hide_left_column' => 0,
    'hide_right_column' => 0,
    'content_only' => 0,
    'restricted_country_mode' => 0,
    'geolocation_country' => 0,
    'HOOK_TOP' => 0,
    'base_dir' => 0,
    'shop_name' => 0,
    'logo_url' => 0,
    'CS_MEGA_MENU' => 0,
    'HOOK_CS_SLIDESHOW' => 0,
    'grid_column' => 0,
    'settings' => 0,
    'HOOK_LEFT_COLUMN' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c6850e0dee6_48961846')) {function content_549c6850e0dee6_48961846($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_escape')) include '/home/han4a2d1/public_html/tools/smarty/plugins/modifier.escape.php';
?>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
		<title><?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['meta_title']->value, 'htmlall', 'UTF-8');?>
</title>
<?php if (isset($_smarty_tpl->tpl_vars['meta_description']->value)&&$_smarty_tpl->tpl_vars['meta_description']->value){?>
		<meta name="description" content="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['meta_description']->value, 'html', 'UTF-8');?>
" />
<?php }?>
<?php if (isset($_smarty_tpl->tpl_vars['meta_keywords']->value)&&$_smarty_tpl->tpl_vars['meta_keywords']->value){?>
		<meta name="keywords" content="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['meta_keywords']->value, 'html', 'UTF-8');?>
" />
<?php }?>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
		<meta http-equiv="content-language" content="<?php echo $_smarty_tpl->tpl_vars['meta_language']->value;?>
" />
		<meta name="generator" content="PrestaShop" />
		<meta name="robots" content="<?php if (isset($_smarty_tpl->tpl_vars['nobots']->value)){?>no<?php }?>index,<?php if (isset($_smarty_tpl->tpl_vars['nofollow']->value)&&$_smarty_tpl->tpl_vars['nofollow']->value){?>no<?php }?>follow" />
		<meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport"/>
				
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
		
		<link rel="icon" type="image/vnd.microsoft.icon" href="<?php echo $_smarty_tpl->tpl_vars['favicon_url']->value;?>
?<?php echo $_smarty_tpl->tpl_vars['img_update_time']->value;?>
" />
		<link rel="shortcut icon" type="image/x-icon" href="<?php echo $_smarty_tpl->tpl_vars['favicon_url']->value;?>
?<?php echo $_smarty_tpl->tpl_vars['img_update_time']->value;?>
" />
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

<link href="<?php echo $_smarty_tpl->tpl_vars['css_dir']->value;?>
reponsive.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<?php echo $_smarty_tpl->tpl_vars['css_dir']->value;?>
ui.totop.css" rel="stylesheet" type="text/css" media="screen" />
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
<!--[if IE 7]><link href="<?php echo $_smarty_tpl->tpl_vars['css_dir']->value;?>
global-ie.css" rel="stylesheet" type="text/css" media="<?php echo $_smarty_tpl->tpl_vars['media']->value;?>
" /><![endif]-->
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/csjquery.cookie.js"></script> 
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/jquery.carouFredSel-6.1.0.js"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/getwidthbrowser.js"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/jquery.ui.totop.js"></script>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/easing.js"></script>
<?php if ($_smarty_tpl->tpl_vars['page_name']->value=="category"||$_smarty_tpl->tpl_vars['page_name']->value=="new-products"||$_smarty_tpl->tpl_vars['page_name']->value=="prices-drop"||$_smarty_tpl->tpl_vars['page_name']->value=="best-sales"||$_smarty_tpl->tpl_vars['page_name']->value=="search"||$_smarty_tpl->tpl_vars['page_name']->value=="manufacturer"){?><!--list - gird-->
	<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/list.gird.js"></script>
<?php }?>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/codespot.js"></script>

<!--<?php if ($_smarty_tpl->tpl_vars['page_name']->value!='index'){?>
<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/custom-form-elements.js"></script>
<?php }?>-->
<?php if ($_smarty_tpl->tpl_vars['page_name']->value=='products-comparison'){?>
	<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['js_dir']->value;?>
codespot/jquery.nicescroll.min.js"></script>
<?php }?>
		<?php echo $_smarty_tpl->tpl_vars['HOOK_HEADER']->value;?>

	</head>
	
	<body <?php if (isset($_smarty_tpl->tpl_vars['page_name']->value)){?>id="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['page_name']->value, 'htmlall', 'UTF-8');?>
"<?php }?> class="<?php if ($_smarty_tpl->tpl_vars['hide_left_column']->value){?>hide-left-column<?php }?> <?php if ($_smarty_tpl->tpl_vars['hide_right_column']->value){?>hide-right-column<?php }?> <?php if ($_smarty_tpl->tpl_vars['content_only']->value){?> content_only <?php }?>">
	<?php if (!$_smarty_tpl->tpl_vars['content_only']->value){?>
		<?php if (isset($_smarty_tpl->tpl_vars['restricted_country_mode']->value)&&$_smarty_tpl->tpl_vars['restricted_country_mode']->value){?>
		<div id="restricted-country">
			<p><?php echo smartyTranslate(array('s'=>'You cannot place a new order from your country.'),$_smarty_tpl);?>
 <span class="bold"><?php echo $_smarty_tpl->tpl_vars['geolocation_country']->value;?>
</span></p>
		</div>
		<?php }?>
		<div id="page">
			<!-- Header -->
			<div class="mode_header" id="mode_header">
				<div class="container_24">
					<div id="header" class="grid_24 clearfix omega alpha">						
						<div id="header_right">
							<?php echo $_smarty_tpl->tpl_vars['HOOK_TOP']->value;?>
							
						</div>
						<a id="header_logo" href="<?php echo $_smarty_tpl->tpl_vars['base_dir']->value;?>
" title="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['shop_name']->value, 'htmlall', 'UTF-8');?>
">
							<img class="logo" src="<?php echo $_smarty_tpl->tpl_vars['logo_url']->value;?>
" alt="<?php echo smarty_modifier_escape($_smarty_tpl->tpl_vars['shop_name']->value, 'htmlall', 'UTF-8');?>
" />
						</a>
						<?php if ($_smarty_tpl->tpl_vars['page_name']->value!='index'){?>
						<?php if (isset($_smarty_tpl->tpl_vars['CS_MEGA_MENU']->value)){?><?php echo $_smarty_tpl->tpl_vars['CS_MEGA_MENU']->value;?>
<?php }?>
						<?php }?>
					</div>
				</div>
			</div>
			
			<?php if ($_smarty_tpl->tpl_vars['page_name']->value=='index'){?>
			<div class="container_24">
				<div class="hook_csslide_new">
				<?php if (isset($_smarty_tpl->tpl_vars['HOOK_CS_SLIDESHOW']->value)){?><?php echo $_smarty_tpl->tpl_vars['HOOK_CS_SLIDESHOW']->value;?>
<?php }?>
				</div>
				<?php if (isset($_smarty_tpl->tpl_vars['CS_MEGA_MENU']->value)){?><?php echo $_smarty_tpl->tpl_vars['CS_MEGA_MENU']->value;?>
<?php }?>
			</div>
			<?php }?>
			
			<div class="mode_container">
				<div class="container_24">
				<div id="columns" class="<?php if (isset($_smarty_tpl->tpl_vars['grid_column']->value)){?><?php echo $_smarty_tpl->tpl_vars['grid_column']->value;?>
<?php }?> grid_24 omega alpha">
				<?php if ($_smarty_tpl->tpl_vars['page_name']->value!='index'){?>
					<?php if (isset($_smarty_tpl->tpl_vars['settings']->value)){?>
						<?php if ((($_smarty_tpl->tpl_vars['settings']->value->column=='2_column_left'||$_smarty_tpl->tpl_vars['settings']->value->column=='3_column'))){?>
							<!-- Left -->
							<div id="left_column" class="<?php echo $_smarty_tpl->tpl_vars['settings']->value->left_class;?>
 alpha">				
								<?php echo $_smarty_tpl->tpl_vars['HOOK_LEFT_COLUMN']->value;?>

							</div>
						<?php }?>
					<?php }else{ ?>
						<!-- Left -->
							<div id="left_column" class="grid_5 alpha">
								
								<?php echo $_smarty_tpl->tpl_vars['HOOK_LEFT_COLUMN']->value;?>

							</div>
					<?php }?>
				<?php }?>
					<!-- Center -->
					<div id="center_column" class="<?php if ($_smarty_tpl->tpl_vars['page_name']->value=='index'){?>grid_24 omega alpha<?php }else{ ?><?php if (isset($_smarty_tpl->tpl_vars['settings']->value)){?><?php echo $_smarty_tpl->tpl_vars['settings']->value->center_class;?>
 <?php }else{ ?>grid_19 omega<?php }?><?php }?>">
		<?php }?>
<?php }} ?>