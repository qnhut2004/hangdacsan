<?php /*%%SmartyHeaderCode:84338240549c684b178f86-14893278%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '40dd2d3f732d1482784121bbe98e29f3d7d27e90' => 
    array (
      0 => '/home/han4a2d1/public_html/modules/csslider/csslider.tpl',
      1 => 1427999095,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '84338240549c684b178f86-14893278',
  'cache_lifetime' => 31536000,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_551da3a18bf0c7_11698875',
  'has_nocache_code' => false,
),true); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_551da3a18bf0c7_11698875')) {function content_551da3a18bf0c7_11698875($_smarty_tpl) {?><!-- CS Slider module -->
<script type="text/javascript">
				var api;
			jQuery(window).ready(function() {
			api =  jQuery(".banner").revolution(
				{
					delay:9000,
					startheight:280,
					startwidth:680,

					hideThumbs:10,

					thumbWidth:100,		// Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
					thumbHeight:50,
					thumbAmount:5,

					navigationType:"bullet",		// bullet, thumb, none - trong
					navigationArrows:"nexttobullets",	// nexttobullets, solo (old name verticalcentered), none - mui ten

					navigationStyle:"round",				//round,square,navbar,round-old,square-old,navbar-old, or any from the list in the docu (choose between 50+ different item), custom - hinh cua icon tron
					navigationHAlign:"right",				// Vertical Align top,center,bottom
					navigationVAlign:"bottom",					// Horizontal Align left,center,right
					navigationHOffset:10,
					navigationVOffset:10,

					soloArrowLeftHalign:"right",
					soloArrowLeftValign:"bottom",
					soloArrowLeftHOffset:10,
					soloArrowLeftVOffset:12,

					soloArrowRightHalign:"right",
					soloArrowRightValign:"bottom",
					soloArrowRightHOffset:10,
					soloArrowRightVOffset:12,

					touchenabled:"on",	// Enable Swipe Function : on/off
					onHoverStop:"on",	// Stop Banner Timet at Hover on Slide on/off

					stopAtSlide:3,
					stopAfterLoops:3,
					
					hideCaptionAtLimit:600,					// It Defines if a caption should be shown under a Screen Resolution ( Basod on The Width of Browser)
					hideAllCaptionAtLilmit:0,				// Hide all The Captions if Width of Browser is less then this value
					hideSliderAtLimit:0,					// Hide the whole slider, and stop also functions if Width of Browser is less than this value

					
					shadow:0,								//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows  (No Shadow in Fullwidth Version !)
					fullWidth:"off"							// Turns On or Off the Fullwidth Image Centering in FullWidth Modus
						});
					});
			</script>
<div class="cs_revolution"> 
	<div class="bannercontainer responsive">
		<div class="banner">
		
			<ul>
																														<li data-transition="slidehorizontal" data-masterspeed="300" data-slotamount="7" data-delay="9000"  data-thumb="/modules/csslider/images/thumbs/1_1.jpg" >
					 <a class="cs_slidelink" href="#" target="_self"></a> 
					<img src="/modules/csslider/images/1_1.jpg" />
																		<div class="caption  lft ltb"
							data-x="415" data-y="2"  data-easing="easeOutBack" data-endeasing="easeInQuad" data-speed="900" data-start="500">
							
																	<img src="/modules/csslider/images/captions/1_1.png" alt=""/>
																
							</div>
													<div class="caption big_white sfr randomrotateout"
							data-x="415" data-y="75"  data-easing="easeOutExpo" data-endeasing="easeInExpo" data-speed="300" data-start="700">
							
																	Responsive<br/> Design
																
							</div>
													<div class="caption  lfl randomrotateout"
							data-x="415" data-y="145"  data-easing="easeOutQuart" data-endeasing="easeOutBack" data-speed="300" data-start="900">
							
																	Design is optimized for all<br/> the most popular screen resolutions.<br/> When screen is resized,<br/> design elements are transformed <br/>smoothly on each breakpoin.
																
							</div>
													<div class="caption  sfl ltb"
							data-x="415" data-y="230"  data-easing="easeInCirc" data-endeasing="easeInCirc" data-speed="300" data-start="1100">
							
																	<img src="/modules/csslider/images/captions/13_1.png" alt=""/>
																
							</div>
																</li>
																														<li data-transition="curtain-1" data-masterspeed="300" data-slotamount="7" data-delay="9400"  data-thumb="/modules/csslider/images/thumbs/1_7.jpg" >
					 <a class="cs_slidelink" href="#" target="_self"></a> 
					<img src="/modules/csslider/images/1_7.jpg" />
																		<div class="caption  randomrotate str"
							data-x="415" data-y="2"  data-easing="easeOutBack" data-endeasing="easeInBack" data-speed="300" data-start="500">
							
																	<img src="/modules/csslider/images/captions/14_1.png" alt=""/>
																
							</div>
													<div class="caption big_white randomrotate ltr"
							data-x="415" data-y="80"  data-easing="easeInSine" data-endeasing="easeOutSine" data-speed="300" data-start="700">
							
																	Mega Menu
																
							</div>
													<div class="caption  randomrotate ltr"
							data-x="415" data-y="130"  data-easing="easeInQuart" data-endeasing="easeInElastic" data-speed="300" data-start="900">
							
																	Configure many types of flexible<br/> menu by combining options together<br/>
Configure width and columns <br/>of dropdown menu
Configure <br/>columns for each option

																
							</div>
													<div class="caption  sfr ltt"
							data-x="415" data-y="220"  data-easing="easeInQuart" data-endeasing="easeInOutElastic" data-speed="300" data-start="1100">
							
																	<img src="/modules/csslider/images/captions/17_1.png" alt=""/>
																
							</div>
																</li>
																														<li data-transition="slotslide-vertical" data-masterspeed="300" data-slotamount="7" data-delay="9000"  data-thumb="/modules/csslider/images/thumbs/1_8.jpg" >
					 <a class="cs_slidelink" href="#" target="_self"></a> 
					<img src="/modules/csslider/images/1_8.jpg" />
																		<div class="caption  sft stt"
							data-x="415" data-y="2"  data-easing="easeOutBack" data-endeasing="easeOutBack" data-speed="300" data-start="500">
							
																	<img src="/modules/csslider/images/captions/18_1.png" alt=""/>
																
							</div>
													<div class="caption big_white sfl stt"
							data-x="415" data-y="80"  data-easing="easeInCubic" data-endeasing="easeOutBack" data-speed="300" data-start="700">
							
																	Slideshow<br/>Revolution
																
							</div>
													<div class="caption  lft fadeout"
							data-x="415" data-y="158"  data-easing="easeOutSine" data-endeasing="easeInSine" data-speed="300" data-start="900">
							
																	On top of that, <br/>Slider Revolution is fully responsive <br/>and mobile optimized <br/>and can take on any dimensions.
																
							</div>
													<div class="caption  sft stt"
							data-x="415" data-y="230"  data-easing="easeOutBack" data-endeasing="easeOutBack" data-speed="300" data-start="1100">
							
																	<img src="/modules/csslider/images/captions/21_1.png" alt=""/>
																
							</div>
																</li>
							</ul>
					</div>
	</div>
</div>
<!-- /CS Slider module --><?php }} ?>