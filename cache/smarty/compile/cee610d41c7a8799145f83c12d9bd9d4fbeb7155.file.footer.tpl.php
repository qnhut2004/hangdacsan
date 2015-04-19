<?php /* Smarty version Smarty-3.1.13, created on 2015-04-02 11:30:04
         compiled from "/home/han4a2d1/public_html/themes/gomarket/footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:974483758549c6850e12e97-64357320%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'cee610d41c7a8799145f83c12d9bd9d4fbeb7155' => 
    array (
      0 => '/home/han4a2d1/public_html/themes/gomarket/footer.tpl',
      1 => 1427999095,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '974483758549c6850e12e97-64357320',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_549c6850e598d0_70438510',
  'variables' => 
  array (
    'content_only' => 0,
    'settings' => 0,
    'page_name' => 0,
    'HOOK_RIGHT_COLUMN' => 0,
    'HOOK_CS_FOOTER_TOP' => 0,
    'HOOK_FOOTER' => 0,
    'HOOK_CS_FOOTER_BOTTOM' => 0,
    'PS_ALLOW_MOBILE_DEVICE' => 0,
    'link' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_549c6850e598d0_70438510')) {function content_549c6850e598d0_70438510($_smarty_tpl) {?>

			<?php if (!$_smarty_tpl->tpl_vars['content_only']->value){?>
					</div><!-- /Center -->
			<?php if (isset($_smarty_tpl->tpl_vars['settings']->value)){?>
				<?php if ($_smarty_tpl->tpl_vars['page_name']->value!='index'){?>
					<?php if ((($_smarty_tpl->tpl_vars['settings']->value->column=='2_column_right'||$_smarty_tpl->tpl_vars['settings']->value->column=='3_column'))){?>
						<!-- Left -->
						<div id="right_column" class="<?php echo $_smarty_tpl->tpl_vars['settings']->value->right_class;?>
 omega">
							<?php echo $_smarty_tpl->tpl_vars['HOOK_RIGHT_COLUMN']->value;?>

						</div>
					<?php }?>
				<?php }?>
			<?php }?>
				</div><!--/columns-->
			</div><!--/container_24-->
			</div>
<!-- Footer -->
			
			<div class="mode_footer">
				<div class="container_24">
					<div id="footer" class="grid_24 clearfix  omega alpha">
						<?php if (isset($_smarty_tpl->tpl_vars['HOOK_CS_FOOTER_TOP']->value)&&$_smarty_tpl->tpl_vars['HOOK_CS_FOOTER_TOP']->value){?><?php echo $_smarty_tpl->tpl_vars['HOOK_CS_FOOTER_TOP']->value;?>
<?php }?>
						<?php echo $_smarty_tpl->tpl_vars['HOOK_FOOTER']->value;?>

						<?php if (isset($_smarty_tpl->tpl_vars['HOOK_CS_FOOTER_BOTTOM']->value)&&$_smarty_tpl->tpl_vars['HOOK_CS_FOOTER_BOTTOM']->value){?><?php echo $_smarty_tpl->tpl_vars['HOOK_CS_FOOTER_BOTTOM']->value;?>
<?php }?>
						<?php if ($_smarty_tpl->tpl_vars['PS_ALLOW_MOBILE_DEVICE']->value){?>
							<p class="center clearBoth"><a href="<?php echo $_smarty_tpl->tpl_vars['link']->value->getPageLink('index',true);?>
?mobile_theme_ok"><?php echo smartyTranslate(array('s'=>'Browse the mobile site'),$_smarty_tpl);?>
</a></p>
						<?php }?>
					</div>
				</div>
			</div>
			<div id="toTop">top</div>
		</div><!--/page-->
	<?php }?>
	</body>
</html>
<?php }} ?>