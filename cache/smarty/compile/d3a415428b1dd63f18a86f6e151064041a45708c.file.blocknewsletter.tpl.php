<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:03
         compiled from "/home/han4a2d1/public_html/modules/blocknewsletter/views/templates/hook/blocknewsletter.tpl" */ ?>
<?php /*%%SmartyHeaderCode:618556645549c684f9d7eb5-20477742%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd3a415428b1dd63f18a86f6e151064041a45708c' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/blocknewsletter/views/templates/hook/blocknewsletter.tpl',
      1 => 1427999094,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '618556645549c684f9d7eb5-20477742',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c684fa7d8b7_19032597',
  'variables' => 
  array (
    'msg' => 0,
    'nw_error' => 0,
    'link' => 0,
    'value' => 0,
    'action' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c684fa7d8b7_19032597')) {function content_549c684fa7d8b7_19032597($_smarty_tpl) {?>

<!-- Block Newsletter module-->

<div id="newsletter_block_left" class="block">
	<h4 class="title_block"><?php echo smartyTranslate(array('s'=>'Newsletter','mod'=>'blocknewsletter'),$_smarty_tpl);?>
</h4>
	<div class="block_content">
	<?php if (isset($_smarty_tpl->tpl_vars['msg']->value)&&$_smarty_tpl->tpl_vars['msg']->value){?>
		<p class="<?php if ($_smarty_tpl->tpl_vars['nw_error']->value){?>warning_inline<?php }else{ ?>success_inline<?php }?>"><?php echo $_smarty_tpl->tpl_vars['msg']->value;?>
</p>
	<?php }?>
		<form action="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('index');?>
" method="post">
			<p>
				
				<input type="text" name="email" size="18" 
					value="<?php if (isset($_smarty_tpl->tpl_vars['value']->value)&&$_smarty_tpl->tpl_vars['value']->value){?><?php echo $_smarty_tpl->tpl_vars['value']->value;?>
<?php }else{ ?><?php echo smartyTranslate(array('s'=>'Your email address','mod'=>'blocknewsletter'),$_smarty_tpl);?>
<?php }?>" 
					onfocus="javascript:if(this.value=='<?php echo smartyTranslate(array('s'=>'Your email address','mod'=>'blocknewsletter','js'=>1),$_smarty_tpl);?>
')this.value='';" 
					onblur="javascript:if(this.value=='')this.value='<?php echo smartyTranslate(array('s'=>'Your email address','mod'=>'blocknewsletter','js'=>1),$_smarty_tpl);?>
';" 
					class="inputNew" />
				<!--<select name="action">
					<option value="0"<?php if (isset($_smarty_tpl->tpl_vars['action']->value)&&$_smarty_tpl->tpl_vars['action']->value==0){?> selected="selected"<?php }?>><?php echo smartyTranslate(array('s'=>'Subscribe','mod'=>'blocknewsletter'),$_smarty_tpl);?>
</option>
					<option value="1"<?php if (isset($_smarty_tpl->tpl_vars['action']->value)&&$_smarty_tpl->tpl_vars['action']->value==1){?> selected="selected"<?php }?>><?php echo smartyTranslate(array('s'=>'Unsubscribe','mod'=>'blocknewsletter'),$_smarty_tpl);?>
</option>
				</select>-->
					<input type="submit" value="ok" class="button_mini" name="submitNewsletter" />
				<input type="hidden" name="action" value="0" />
			</p>
		</form>
	</div>
</div>
<!-- /Block Newsletter module-->
<?php }} ?>