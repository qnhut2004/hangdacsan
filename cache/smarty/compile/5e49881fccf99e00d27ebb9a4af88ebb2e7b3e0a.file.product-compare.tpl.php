<?php /* Smarty version Smarty-3.1.13, created on 2014-12-25 20:23:51
         compiled from "/home/han4a2d1/public_html/themes/gomarket/product-compare.tpl" */ ?>
<?php /*%%SmartyHeaderCode:532093399549cb8a7368c27-67741520%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5e49881fccf99e00d27ebb9a4af88ebb2e7b3e0a' => 
    array (
      0 => '/home/han4a2d1/public_html/themes/gomarket/product-compare.tpl',
      1 => 1419505431,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '532093399549cb8a7368c27-67741520',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'comparator_max_item' => 0,
    'link' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549cb8a7380167_85659781',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549cb8a7380167_85659781')) {function content_549cb8a7380167_85659781($_smarty_tpl) {?>

<?php if ($_smarty_tpl->tpl_vars['comparator_max_item']->value){?>
<script type="text/javascript">
// <![CDATA[
	var min_item = '<?php echo smartyTranslate(array('s'=>'Please select at least one product','js'=>1),$_smarty_tpl);?>
';
	var max_item = "<?php echo smartyTranslate(array('s'=>'You cannot add more than %d product(s) to the product comparison','sprintf'=>$_smarty_tpl->tpl_vars['comparator_max_item']->value,'js'=>1),$_smarty_tpl);?>
";
//]]>
</script>

	<form method="post" action="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('products-comparison');?>
" onsubmit="true" class="compare">
		<p>
		<input type="submit" id="bt_compare" class="button" value="<?php echo smartyTranslate(array('s'=>'Compare'),$_smarty_tpl);?>
" />
		<input type="hidden" name="compare_product_list" class="compare_product_list" value="" />
		</p>
	</form>
<?php }?>

<?php }} ?>