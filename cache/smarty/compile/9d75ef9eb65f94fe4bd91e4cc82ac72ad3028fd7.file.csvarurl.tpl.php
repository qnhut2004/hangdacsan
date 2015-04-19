<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:03
         compiled from "/home/han4a2d1/public_html/modules/csquickview/views/templates/front/csvarurl.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1345054228549c684eae8149-13809716%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9d75ef9eb65f94fe4bd91e4cc82ac72ad3028fd7' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/csquickview/views/templates/front/csvarurl.tpl',
      1 => 1427999094,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1345054228549c684eae8149-13809716',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c684eb85620_50915370',
  'variables' => 
  array (
    'resize_type' => 0,
    'resize_width' => 0,
    'resize_height' => 0,
    'itemsclass' => 0,
    'base_dir' => 0,
    'num_item' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c684eb85620_50915370')) {function content_549c684eb85620_50915370($_smarty_tpl) {?><?php if (!isset($_smarty_tpl->tpl_vars['resize_type']->value)){?><?php $_smarty_tpl->tpl_vars['resize_type'] = new Smarty_variable(0, null, 0);?><?php }?>
<?php if (!isset($_smarty_tpl->tpl_vars['resize_width']->value)){?><?php $_smarty_tpl->tpl_vars['resize_width'] = new Smarty_variable(50, null, 0);?><?php }?>
<?php if (!isset($_smarty_tpl->tpl_vars['resize_height']->value)){?><?php $_smarty_tpl->tpl_vars['resize_height'] = new Smarty_variable(65, null, 0);?><?php }?>
<?php if (!isset($_smarty_tpl->tpl_vars['itemsclass']->value)){?><?php $_smarty_tpl->tpl_vars['itemsclass'] = new Smarty_variable('', null, 0);?><?php $_smarty_tpl->tpl_vars['num_item'] = new Smarty_variable(0, null, 0);?><?php }?>
<script type="text/javascript">
//<![CDATA[
function isMobile() {
		if( navigator.userAgent.match(/Android/i) ||
			navigator.userAgent.match(/webOS/i) ||
			navigator.userAgent.match(/iPad/i) ||
			navigator.userAgent.match(/iPhone/i) ||
			navigator.userAgent.match(/iPod/i)
			){
				return true;
		}
		return false;
	}
if(!isMobile())
{
	if (typeof CS == 'undefined') CS = {};
	CS.QuickView = {
		BASE_URL : '<?php echo $_smarty_tpl->tpl_vars['base_dir']->value;?>
',
		QS_FRM_TYPE : <?php echo $_smarty_tpl->tpl_vars['resize_type']->value;?>
,
		QS_FRM_WIDTH : <?php echo $_smarty_tpl->tpl_vars['resize_width']->value;?>
,
		QS_FRM_HEIGHT : <?php echo $_smarty_tpl->tpl_vars['resize_height']->value;?>

	};
	if(CS.QuickView.QS_FRM_TYPE == 0 ){
		CS.QuickView.QS_FRM_WIDTH = CS.QuickView.QS_FRM_WIDTH + "%";
		CS.QuickView.QS_FRM_HEIGHT = CS.QuickView.QS_FRM_HEIGHT + "%";
	}
	var strItem='<?php echo $_smarty_tpl->tpl_vars['itemsclass']->value;?>
';
	
	var n=<?php echo $_smarty_tpl->tpl_vars['num_item']->value;?>
;
	var IS={};
	if(n>1)
	{
		var arrItem=strItem.split(',');
		
		for(var i=0;i<n;i++)
		{
			IS[i]={
				itemClass:$.trim(arrItem[i])
			}
		}
	}
	else if(n==1)
	{
		IS[0]={
				itemClass:$.trim(strItem)
			}		
	}
	else
	{
		n=0;
		IS[0]={
				itemClass:''
			}
	}
}
//]]
</script><?php }} ?>