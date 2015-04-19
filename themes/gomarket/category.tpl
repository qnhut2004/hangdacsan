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

{include file="$tpl_dir./breadcrumb.tpl"}
{include file="$tpl_dir./errors.tpl"}

{if isset($category)}
	{if $category->id AND $category->active}
		{if $scenes || $category->description || $category->id_image}
		<div class="content_scene_cat">
			{if $scenes}
				<!-- Scenes -->
				{include file="$tpl_dir./scenes.tpl" scenes=$scenes}
			{else}
				<!-- Category image -->
				{if $category->id_image}
				<div class="align_center">
					<img src="{$link->getCatImageLink($category->link_rewrite, $category->id_image, 'category_default')}" alt="{$category->name|escape:'htmlall':'UTF-8'}" title="{$category->name|escape:'htmlall':'UTF-8'}" id="categoryImage"/>
				</div>
				{/if}
			{/if}

			
				<div class="cat_desc">
				<h2>
				{strip}
					{$category->name|escape:'htmlall':'UTF-8'}
					{if isset($categoryNameComplement)}
						{$categoryNameComplement|escape:'htmlall':'UTF-8'}
					{/if}
				{/strip}
				</h2>
				{if $category->description}
				{if strlen($category->description) > 120}
					<p id="category_description_short">{$category->description|truncate:120}</p>
					<p id="category_description_full" style="display:none">{$category->description}</p>
					
				{else}
					<p>{$category->description}</p>
				{/if}
				{/if}
				</div>
			
		</div>
		{/if}
		<!-- Breadcumb -->
		<script type="text/javascript">
			jQuery(document).ready(function() {
				if (jQuery("#old_bc").html()) {
					jQuery("#bc").html(jQuery("#old_bc").html());
					jQuery("#old_bc").hide();
				}
			});
		</script>
		<div class="bc_line">
			<div id="bc" class="breadcrumb"></div>
		</div>
		{if isset($subcategories)}
		<!-- Subcategories -->
		<div id="subcategories">
			<h3>{l s='Subcategories'}</h3>
			<ul class="inline_list" id="ul_subcategories">
			{foreach from=$subcategories item=subcategory}
				<li class="clearfix">
					<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{$subcategory.name|escape:'htmlall':'UTF-8'}" class="img">
						{if $subcategory.id_image}
							<img src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'medium_default')}" alt="" />
						{else}
							<img src="{$img_cat_dir}default-medium_default.jpg" alt="" />
						{/if}
					</a>
					<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" class="cat_name">{$subcategory.name|escape:'htmlall':'UTF-8'}</a>
					{if $subcategory.description}
						<p class="cat_desc">
						{$subcategory.description}</p>
					{/if}
				</li>
			{/foreach}
			</ul>
			<a id="prev_sub_cat" class="btn prev" href="#">&lt;</a>
			<a id="next_sub_cat" class="btn next" href="#">&gt;</a>
			<br class="clear"/>
		</div>
		{/if}
		<div class="resumecat category-product-count">
			{include file="$tpl_dir./category-count.tpl"}
		</div>
		{if $products}
			<div class="content_sortPagiBar">
				<div class="sortPagiBar">
					{include file="./product-compare.tpl"}
					{include file="./product-sort.tpl"}					
					{include file="./nbr-product-page.tpl"}
				</div>
			</div>
			<h1>
			{l s='Categories'}
			{strip}
				{$category->name|escape:'htmlall':'UTF-8'}
				{if isset($categoryNameComplement)}
					{$categoryNameComplement|escape:'htmlall':'UTF-8'}
				{/if}
			{/strip}
			</h1>
			{include file="./product-list.tpl" products=$products}
			
			<div class="content_sortPagiBar bottom">
				<div class="sortPagiBar">
					{include file="./product-sort.tpl"}
					{include file="./pagination.tpl"}
				</div>				
			</div>
		{/if}
	{elseif $category->id}
		<p class="warning">{l s='This category is currently unavailable.'}</p>
	{/if}
{if isset($subcategories)}
<script type="text/javascript">
// <![CDATA[
$(window).load(function(){
			//	Responsive layout, resizing the items
			$('ul#ul_subcategories').carouFredSel({
				responsive: true,
				width:'100%',
				prev: '#prev_sub_cat',
				next: '#next_sub_cat',
				auto: false,
				swipe: {
					onTouch : true
				},
				items: {
					width:140,
					height : 155,
					visible: {
						min: 2,
						max: 6
					}
				}
			});
		});
//]]>
</script>
{/if}
{/if}
