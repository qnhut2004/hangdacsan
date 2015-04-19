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
    'd26a19184bc8b99c6eb92a8d2cf22a9a3e564663' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/blocksearch/blocksearch-instantsearch.tpl',
      1 => 1427999094,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '769910222549c684f04fbe7-94304020',
  'cache_lifetime' => 31536000,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_551d8aab468de5_97342050',
  'variables' => 
  array (
    'hook_mobile' => 0,
    'link' => 0,
    'ENT_QUOTES' => 0,
  ),
  'has_nocache_code' => false,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_551d8aab468de5_97342050')) {function content_551d8aab468de5_97342050($_smarty_tpl) {?><!-- block seach mobile -->
<!-- Block search module TOP -->
<div id="search_block_top">

	<form method="get" action="http://hangdacsan.com/index.php?controller=search" id="searchbox">
		<p>
			<label for="search_query_top"><!-- image on background --></label>
			<input type="hidden" name="controller" value="search" />
			<input type="hidden" name="orderby" value="position" />
			<input type="hidden" name="orderway" value="desc" />
			<input class="search_query" type="text" id="search_query_top" name="search_query" value="search entire store here... "  onfocus="this.value=''" onblur="if (this.value =='') this.value='search entire store here...'" />
			<input type="submit" name="submit_search" value="Tìm kiếm" class="button" />
	</p>
	</form>
</div>
	<script type="text/javascript">
	// <![CDATA[
		$('document').ready( function() {
			$("#search_query_top")
				.autocomplete(
					'http://hangdacsan.com/index.php?controller=search', {
						minChars: 3,
						max: 10,
						width: 500,
						selectFirst: false,
						scroll: false,
						dataType: "json",
						formatItem: function(data, i, max, value, term) {
							return value;
						},
						parse: function(data) {
							var mytab = new Array();
							for (var i = 0; i < data.length; i++)
								mytab[mytab.length] = { data: data[i], value: data[i].cname + ' > ' + data[i].pname };
							return mytab;
						},
						extraParams: {
							ajaxSearch: 1,
							id_lang: 3
						}
					}
				)
				.result(function(event, data, formatted) {
					$('#search_query_top').val(data.pname);
					document.location.href = data.product_link;
				})
		});
	// ]]>
	</script>

<!-- /Block search module TOP -->
<?php }} ?>