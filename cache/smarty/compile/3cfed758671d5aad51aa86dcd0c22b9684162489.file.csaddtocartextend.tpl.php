<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:03
         compiled from "/home/han4a2d1/public_html/modules/csaddtocartextend/csaddtocartextend.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1770952333549c684ed347a6-82327242%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3cfed758671d5aad51aa86dcd0c22b9684162489' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/csaddtocartextend/csaddtocartextend.tpl',
      1 => 1427999095,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1770952333549c684ed347a6-82327242',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c684ed4e548_95642733',
  'variables' => 
  array (
    '__PS_BASE_URI__' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c684ed4e548_95642733')) {function content_549c684ed4e548_95642733($_smarty_tpl) {?><!-- CS add to cart extend module -->
<script type="text/javascript">
//<![CDATA[
	$(window).ready(function(){
		$('#add_to_cart input').attr('onclick', 'return OnAddclickDetail();');
		$('a.ajax_add_to_cart_button').attr('onclick', 'return OnAddclickCategory($(this));');
	});
	
	function OnAddclickDetail() {
		var image_detail = $('#view_full_size img').attr('src');
		image_detail = image_detail.replace("large_default", "small_default"); 
		var name_detail = $('div#pb-left-column h1').html();
		var id_detailt = $("input[name=id_product]").val();
		var link_detail = "<?php echo $_smarty_tpl->tpl_vars['__PS_BASE_URI__']->value;?>
index.php?id_product=" + id_detailt + "&controller=product";
		var string_info = "<a href=" + link_detail + " class=\"product_img_link\"><img src='" +  image_detail + "'/></a>" + "<h3><a href=" + link_detail + ">" + name_detail + "</a></h3> <?php echo smartyTranslate(array('s'=>'has been added to ','mod'=>'csaddtocartextend'),$_smarty_tpl);?>
<a href='<?php echo $_smarty_tpl->tpl_vars['__PS_BASE_URI__']->value;?>
index.php?controller=order' class='your_cart'><?php echo smartyTranslate(array('s'=>'Your Cart','mod'=>'csaddtocartextend'),$_smarty_tpl);?>
</a>" ;
		$.ambiance({
			message: string_info, 
			type: "success",
			timeout: 7
		});
	}
	
	function OnAddclickCategory(element) {
		var id_product = element.attr('rel').substring(16);
		var html_product = element.parent().html();
		$("body").append("<div id=\"add_to_card_extend_"+ id_product + "\" style=\"display:none\">" + html_product + "</div>")
		var image_p = $("#add_to_card_extend_" + id_product + " div.image").html();
		image_p = image_p.replace("home_default", "small_default"); 
		var name_p = $("#add_to_card_extend_" + id_product + " div.name_product").html();
		$('div').remove("#add_to_card_extend_" + id_product + "");
		$.ambiance({
			message: image_p + name_p + "<?php echo smartyTranslate(array('s'=>'has been added to ','mod'=>'csaddtocartextend'),$_smarty_tpl);?>
<a href='<?php echo $_smarty_tpl->tpl_vars['__PS_BASE_URI__']->value;?>
index.php?controller=order' class='your_cart'><?php echo smartyTranslate(array('s'=>'Your Cart','mod'=>'csaddtocartextend'),$_smarty_tpl);?>
</a>", 
			type: "success",
			timeout:7
		});
		
	}
//]]
</script>
<!-- /CS add to cart extend module -->

<?php }} ?>