<?php /* Smarty version 3.0rc1, created on 2011-06-18 20:11:17
         compiled from "templates/wow/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:14553677434dfcf855a20677-28355867%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'e28abf2f955278eaaecce5383344f4f4fdc85811' => 
    array (
      0 => 'templates/wow/index.tpl',
      1 => 1308424274,
    ),
  ),
  'nocache_hash' => '14553677434dfcf855a20677-28355867',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
)); /*/%%SmartyHeaderCode%%*/?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl-pl" lang="pl-pl" > 
<head> 

<meta name="Description" content="Avernus Server is a Open Tibia Server" />
<meta name="Keywords" content="Avernus, server, tibia, ot" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="Distribution" content="Global" />
<meta name="author" content="Pyromaniack" />
<meta name="Robots" content="index,follow" />

<title><?php echo $_smarty_tpl->getVariable('title')->value;?>
</title>
	
  <link rel="stylesheet" href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/templates/wow/plugins/content/extravote/extravote.css" type="text/css" /> 
  <script type="text/javascript" src="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/templates/wow/media/system/js/mootools.js"></script> 
  <script type="text/javascript" src="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/templates/wow/media/system/js/caption.js"></script> 
  <script type="text/javascript" src="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/templates/wow/plugins/content/extravote/extravote.js"></script> 
<link href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/templates/wow/css/reset.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/templates/wow/css/ie5x6x.css" rel="stylesheet" type="text/css" media="all" /> 
<?php echo $_smarty_tpl->getVariable('head')->value;?>

<!-- Envolve Chat -->
<script type="text/javascript">
var envoSn=20020;
var envProtoType = (("https:" == document.location.protocol) ? "https://" : "http://");
document.write(unescape("%3Cscript src='" + envProtoType + "d.envolve.com/env.nocache.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- -->

	</head> 
<body>
<!-- ESTE ES EL REPRODUCTOR --> 
<div style="position:fixed; top:-1%; left:0%; width:100%; z-index:99" align="center">
<iframe src="http://www.tiesto.com/index/music_player" name="topFrame" scrolling="No" width="66%" height="28" noresize="noresize" id="musicplayer" title="musicplayer"></iframe>
</div>
<!-- AKI TERMINA REPRODUCTOR -->
<div id="wrapper">
	<div id="bg_up">
		<div id="masthead_container">
			<div id="masthead"> 
                  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
				   codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,24"
				   width="1000" height="400"> 
				   
					<param name="movie" value="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/templates/wow/fl/wow3_header.swf" /> 
					<param name="quality" value="high" /> 
					<param name="menu" value="false" /> 
					<param name="wmode" value="transparent" /> 
					<param name="allowScriptAccess" value="sameDomain" /> 
				    	<object data="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/templates/wow/fl/wow3_header.swf"

									width="1000" height="400" type="application/x-shockwave-flash"> 
							 <param name="quality" value="high" /> 
							 <param name="menu" value="false" /> 
							 <param name="allowScriptAccess" value="sameDomain" /> 
							 <param name="pluginurl" value="http://www.macromedia.com/go/getflashplayer" /> 
							 <param name="wmode" value="transparent" /> 
						</object> 
				</object> 
			</div> 
		</div>
		<div id="container">
<!-- Begin Container -->	

			<!-- Begin Page Content -->
			<div id="page_content">
				<!-- Begin Content Upside -->
				<div id="content_up">
					<div id="content_up_left">
							<div id="breadcrumbs">
						    </div>
						<div id="content_up_right">
								<div id="search">
									<div id="search_inner">
									</div>
								</div>
						</div>
					</div>
				</div>
<!-- End Content Upside --> 
											<div id="sidebar_left"> 
				             		<div class="module"> 
			<div> 
				<div> 

				</div> 
			</div> 
		</div> 
			<div class="module_menu"> 
			<div> 
				<div> 
					<div> 
													<h3>Account</h3> 
											<ul class="menu">
	<li id="current" class="item40"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/account/create">Create Account</a></li>
      <li class="item41"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/account/login">Login</a></li>
	    <li class="item41">  <a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/account/">Manage Account</a></li>
	    <li class="item41">  <a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/bugtracker">Bug Tracker</a></li>
	
	<li class="item41"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/account/lost"><span>Account Lost?</span></a></li>
											</ul></div> 
				</div> 
			</div> 
		</div> 
					<div class="module_menu"> 
			<div> 
				<div> 
					<div> 
													<h3>Server</h3> 
											<ul class="menu">
											<li id="current" class="item40"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/character/online">Who is Online</a></li>
											<li class="item41"><a href="?subtopic=tibiarules"><span>Rules</span></a></li>
											<li class="item54"><a href="?subtopic=team"><span>Administration</span></a></li>
											<li class="item54"><a href="?subtopic=serverinfo"><span>Server info</span></a></li>

											</ul></div> 
				</div> 
			</div> 
		</div> 
					<div class="module_menu"> 
			<div> 
				<div> 
					<div> 
													<h3>Player</h3> 
											<ul class="menu">
											<li id="current" class="item40"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/character/view">Characters</a></li>
											<li class="item41"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/guilds">Guilds</a></li>
											<li class="item41"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/highscores">Highscores</a></li>
											<li class="item41"><a href="?subtopic=houses"><span>Houses</span></a></li>
											<li class="item41"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/forum">Forum</a></li>
											<li class="item41"><a href="?subtopic=exphist"><span>TOP EXP</span></a></li>
											<li class="item41"><a href="?subtopic=onlinetime"><span>TOP ONLINE</span></a></li>
											<li class="item41"><a href="?subtopic=bans"><span>Bans</span></a></li>

											<li class="item41"><a href="?subtopic=bonusy"><span>Addon Bonus System</span></a></li>
											<li class="item41"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/p/v/fragers">Top fraggers</a></li>
											</ul></div> 
				</div> 
			</div> 
		</div> 
					<div class="module_menu"> 
			<div> 
				<div> 
					<div> 
													<h3>SHOP</h3> 
											<ul class="menu">

											<li class="item41"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/p/v/gifts"><span>Donation Shop</span></a></li>
				<li class="item41"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/p/v/gifts2/history"><span>Transaction History</span></a></li>
											<li class="item41"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/p/v/gifts2/donate"><blink><span>Donate</span></a></li></blink>
											<li class="item41"><a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/p/v/gifts2/donate/history"><span>Donate History</span></a></li>
							

											</ul></div> 
				</div> 
			</div> 
		</div> 



			<div class="module"> 
			<div> 
				<div> 
				</div> 
				</div> 
			</div> 
		</div> 
	
						</div> 
							
											<div id="sidebar_right"> 
				             		<div class="module"> 
			<div> 
				<div> 

				</div> 
			</div> 
		</div> 

			<div class="module"> 
			<div> 
				<div> 
					<div> 
													<h3>Server Status:</h3> 
					<?php  $_smarty_tpl->tpl_vars['world'] = new Smarty_Variable;
 $_smarty_tpl->tpl_vars['id'] = new Smarty_Variable;
 $_from = $_smarty_tpl->getVariable('worlds')->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
if (count($_from) > 0){
    foreach ($_from as $_smarty_tpl->tpl_vars['world']->key => $_smarty_tpl->tpl_vars['world']->value){
 $_smarty_tpl->tpl_vars['id']->value = $_smarty_tpl->tpl_vars['world']->key;
?>
						&nbsp; <b>World:</b> <?php echo $_smarty_tpl->getVariable('world')->value;?>
 <br />
						&nbsp; <b>Status:</b>  
							<?php if ($_smarty_tpl->getVariable('serverOnline')->value[$_smarty_tpl->getVariable('id')->value]){?>
								<font color='green'>Online</font><br />
								&nbsp; <b>Uptime:</b> <?php echo $_smarty_tpl->getVariable('serverUptime')->value[$_smarty_tpl->getVariable('id')->value];?>
 <br />
								&nbsp; <b>Players:</b> <?php echo $_smarty_tpl->getVariable('serverPlayers')->value[$_smarty_tpl->getVariable('id')->value];?>
/<?php echo $_smarty_tpl->getVariable('serverMax')->value[$_smarty_tpl->getVariable('id')->value];?>
<br /><br />

							<?php }else{ ?>
								<font color='red'>Offline</font><br />
							<?php }?>
					<?php }} ?>
					<?php echo $_smarty_tpl->getVariable('poll')->value;?>
																</div> 
				</div> 
											
			</div> 
		</div> 
<!-- 	<div class="module"><div><div><div> 
						<center><h3>Advertisment:</h3> </center>
</div></div></div></div>  --> 
		
<div class="module"><div><div><div> 
						<h3>Top Exp:</h3> 
						<?php echo $_smarty_tpl->getVariable('serverHighscore')->value[$_smarty_tpl->getVariable('id')->value];?>
<br/><br/>

</div></div></div></div>  
		</div> 
						

				<!-- Begin Content Inner -->
				    <div id="content_outmiddle">
						<div id="user_modules1">

									<div id="top"> 
					             		<div class="moduletable"> 
					
					
 
 
						<table class="contentpaneopen"> 
							<tbody><tr> 
								<td valign="top">
								<br>
					<?php echo $_smarty_tpl->getVariable('main')->value;?>

							</td></tr> 
							<tr> 
								<td valign="top"> 
						 
									</td> 
							 </tr> 
						</tbody></table> 
								</div> 
	
							</div> 

					</div>
				</div>	
				<!-- Begin Content Downside -->
				<div class="clr"></div>
				<div id="content_down">
					<div id="content_down_left">
		                  
					</div>
				</div>	
				<!-- End Content Downside -->
			<div id="container2">
				<!-- End Page Content -->

				<div id="footer">
				<br>Created Modern Aac version by <a href="http://otland.net/members/kavvson/">Kavvson</a> | - Modern AAC Powered by IDE Engine -
<a href="<?php echo $_smarty_tpl->getVariable('path')->value;?>
/index.php/credits">Credits</a>, 
			Page rendered in: <?php echo $_smarty_tpl->getVariable('renderTime')->value;?>
<br />
					</div>
			</div>
		</div>
		<div class="clr"></div>
		<div id="designed_by">
			
		</div>
	</div>
</div>
</div></body></html>
