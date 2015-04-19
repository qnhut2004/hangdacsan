{*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
		<title>{$meta_title|escape:'htmlall':'UTF-8'}</title>
{if isset($meta_description) AND $meta_description}
		<meta name="description" content="{$meta_description|escape:html:'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:html:'UTF-8'}" />
{/if}
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
		<meta http-equiv="content-language" content="{$meta_language}" />
		<meta name="generator" content="PrestaShop" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
		<meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport"/>
				
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
		
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
		<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
		<script type="text/javascript">
			var baseDir = '{$content_dir}';
			var baseUri = '{$base_uri}';
			var static_token = '{$static_token}';
			var token = '{$token}';
			var priceDisplayPrecision = {$priceDisplayPrecision*$currency->decimals};
			var priceDisplayMethod = {$priceDisplay};
			var roundMode = {$roundMode};
		</script>

{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
	<link href="{$css_uri}" rel="stylesheet" type="text/css" media="{$media}" />
	{/foreach}
{/if}

<link href="{$css_dir}reponsive.css" rel="stylesheet" type="text/css" media="screen" />
<link href="{$css_dir}ui.totop.css" rel="stylesheet" type="text/css" media="screen" />
{if isset($js_files)}
	{foreach from=$js_files item=js_uri}
	<script type="text/javascript" src="{$js_uri}"></script>
	{/foreach}
{/if}
<!--[if IE 7]><link href="{$css_dir}global-ie.css" rel="stylesheet" type="text/css" media="{$media}" /><![endif]-->
<script type="text/javascript" src="{$js_dir}codespot/csjquery.cookie.js"></script> 
<script type="text/javascript" src="{$js_dir}codespot/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="{$js_dir}codespot/jquery.carouFredSel-6.1.0.js"></script>
<script type="text/javascript" src="{$js_dir}codespot/getwidthbrowser.js"></script>
<script type="text/javascript" src="{$js_dir}codespot/jquery.ui.totop.js"></script>
<script type="text/javascript" src="{$js_dir}codespot/easing.js"></script>
{if $page_name == "category" OR $page_name == "new-products" OR $page_name == "prices-drop" OR $page_name == "best-sales" OR $page_name == "search" OR $page_name == "manufacturer"}<!--list - gird-->
	<script type="text/javascript" src="{$js_dir}codespot/list.gird.js"></script>
{/if}
<script type="text/javascript" src="{$js_dir}codespot/codespot.js"></script>

<!--{if $page_name != 'index'}
<script type="text/javascript" src="{$js_dir}codespot/custom-form-elements.js"></script>
{/if}-->
{if $page_name == 'products-comparison'}
	<script type="text/javascript" src="{$js_dir}codespot/jquery.nicescroll.min.js"></script>
{/if}
		{$HOOK_HEADER}
	</head>
	
	<body {if isset($page_name)}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if} class="{if $hide_left_column}hide-left-column{/if} {if $hide_right_column}hide-right-column{/if} {if $content_only} content_only {/if}">
	{if !$content_only}
		{if isset($restricted_country_mode) && $restricted_country_mode}
		<div id="restricted-country">
			<p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country}</span></p>
		</div>
		{/if}
		<div id="page">
			<!-- Header -->
			<div class="mode_header" id="mode_header">
				<div class="container_24">
					<div id="header" class="grid_24 clearfix omega alpha">						
						<div id="header_right">
							{$HOOK_TOP}							
						</div>
						<a id="header_logo" href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}">
							<img class="logo" src="{$logo_url}" alt="{$shop_name|escape:'htmlall':'UTF-8'}" />
						</a>
						{if $page_name != 'index'}
						{if isset($CS_MEGA_MENU)}{$CS_MEGA_MENU}{/if}
						{/if}
					</div>
				</div>
			</div>
			
			{if $page_name == 'index'}
			<div class="container_24">
				<div class="hook_csslide_new">
				{if isset($HOOK_CS_SLIDESHOW)}{$HOOK_CS_SLIDESHOW}{/if}
				</div>
				{if isset($CS_MEGA_MENU)}{$CS_MEGA_MENU}{/if}
			</div>
			{/if}
			
			<div class="mode_container">
				<div class="container_24">
				<div id="columns" class="{if isset($grid_column)}{$grid_column}{/if} grid_24 omega alpha">
				{if $page_name != 'index'}
					{if isset($settings)}
						{if (($settings->column == '2_column_left' || $settings->column == '3_column'))}
							<!-- Left -->
							<div id="left_column" class="{$settings->left_class} alpha">				
								{$HOOK_LEFT_COLUMN}
							</div>
						{/if}
					{else}
						<!-- Left -->
							<div id="left_column" class="grid_5 alpha">
								
								{$HOOK_LEFT_COLUMN}
							</div>
					{/if}
				{/if}
					<!-- Center -->
					<div id="center_column" class="{if $page_name == 'index'}grid_24 omega alpha{else}{if isset($settings)}{$settings->center_class} {else}grid_19 omega{/if}{/if}">
		{/if}
