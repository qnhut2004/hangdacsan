<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 13:16:35
         compiled from "/home/han4a2d1/public_html/themes/gomarket/modules/blocksearch/blocksearch-top.tpl" */ ?>
<?php /*%%SmartyHeaderCode:769910222549c684f04fbe7-94304020%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f165fe42a66ce781059c6f667a199deb84a97d75' => 
    array (
      0 => '/home/han4a2d1/public_html/themes/gomarket/modules/blocksearch/blocksearch-top.tpl',
      1 => 1427999095,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '769910222549c684f04fbe7-94304020',
  'function' => 
  array (
  ),
  'cache_lifetime' => 31536000,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c684f13bda0_68899589',
  'variables' => 
  array (
    'hook_mobile' => 0,
    'link' => 0,
    'ENT_QUOTES' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c684f13bda0_68899589')) {function content_549c684f13bda0_68899589($_smarty_tpl) {?>
<!-- block seach mobile -->
<?php if (isset($_smarty_tpl->tpl_vars['hook_mobile']->value)){?>
<div class="input_search" data-role="fieldcontain">
	<form method="get" action="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('search');?>
" id="searchbox">
		<input type="hidden" name="controller" value="search" />
		<input type="hidden" name="orderby" value="position" />
		<input type="hidden" name="orderway" value="desc" />
		<input class="search_query" type="search" id="search_query_top" name="search_query" placeholder="<?php echo smartyTranslate(array('s'=>'Search','mod'=>'blocksearch'),$_smarty_tpl);?>
" value="<?php if (isset($_GET['search_query'])){?><?php echo stripslashes(htmlentities($_GET['search_query'],$_smarty_tpl->tpl_vars['ENT_QUOTES']->value,'utf-8'));?>
<?php }?>" />
	</form>
</div>
<?php }else{ ?>
<!-- Block search module TOP -->
<div id="search_block_top">

	<form method="get" action="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('search');?>
" id="searchbox">
		<p>
			<label for="search_query_top"><!-- image on background --></label>
			<input type="hidden" name="controller" value="search" />
			<input type="hidden" name="orderby" value="position" />
			<input type="hidden" name="orderway" value="desc" />
			<input class="search_query" type="text" id="search_query_top" name="search_query" value="<?php if (isset($_GET['search_query'])){?><?php echo stripslashes(htmlentities($_GET['search_query'],$_smarty_tpl->tpl_vars['ENT_QUOTES']->value,'utf-8'));?>
<?php }else{ ?><?php echo smartyTranslate(array('s'=>'search entire store here...','mod'=>'blocksearch'),$_smarty_tpl);?>
 <?php }?>"  onfocus="this.value=''" onblur="if (this.value =='') this.value='<?php echo smartyTranslate(array('s'=>'search entire store here...','mod'=>'blocksearch'),$_smarty_tpl);?>
'" />
			<input type="submit" name="submit_search" value="<?php echo smartyTranslate(array('s'=>'Search','mod'=>'blocksearch'),$_smarty_tpl);?>
" class="button" />
	</p>
	</form>
</div>
<?php echo $_smarty_tpl->getSubTemplate (((string)$_smarty_tpl->tpl_vars['self']->value)."/blocksearch-instantsearch.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 9999, null, array(), 0);?>

<?php }?>
<!-- /Block search module TOP -->
<?php }} ?>