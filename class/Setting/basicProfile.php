<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(DOC_DIR.DS.'inc'.DS.'Image.inc.php');
html_header();

global $USER, $DB;
$userRS = $DB->getRowAssoc("select usr_name, usr_email, usr_langcode, usr_password from ".$DB->prefix."user where usr_userid = :0", array($USER->userid));
$langRS = $DB->getArrayAssoc("select lang_code, lang_name from ".$DB->prefix."lang order by 2");
$form = array('name'=>$userRS['usr_name'], 'email'=>$userRS['usr_email'], 'language'=>$userRS['usr_langcode']);
if($_POST){
	$form = $_POST;
	if(User::genPassword($_POST['password'])==$userRS['usr_password']){
		$cols = array('usr_name'=>$_POST['name'], 'usr_email'=>$_POST['email'], 'usr_langcode'=>$_POST['language']);
		if(strlen($_POST['password1'])){
			if($_POST['password1']==$_POST['password2']){
				$cols['usr_password'] = User::genPassword($_POST['password1']);
			}else{
				echo '<div class="alert alert-danger alert-dark">
					<button type="button" class="close" data-dismiss="alert">×</button>
					Password not match!
				</div>';
			}
		}
		$ok = $DB->doUpdate($DB->prefix.'user', $cols, array('usr_userid'=>$USER->userid));
		$userRS = $DB->getRowAssoc("select usr_name, usr_email, usr_langcode, usr_password from ".$DB->prefix."user where usr_userid = :0", array($USER->userid));
		if($_FILES){
			$img = new Image();
			$img->saveImage($_FILES['avatar'], DOC_DIR.DS.'image'.DS.'avatar', $USER->userid);
		}
		echo '<div class="alert alert-success alert-dark">
			<button type="button" class="close" data-dismiss="alert">×</button>
			Profile updated
		</div>';
	}else{
		echo '<div class="alert alert-danger alert-dark">
			<button type="button" class="close" data-dismiss="alert">×</button>
			Invalid Password!
		</div>';
	}
}

$img = new Image();
$avatarSrc = str_replace('\\', '/', $img->getImage('avatar', $USER->userid));
if($avatarSrc == 'File not found'){
	$avatarSrc = '/'.APP.'/image/default_avatar.png';
}
?>
<style type="text/css">
div.profile-photo{
	display:inline-block;
	padding:6px;
	border-radius:99999px;
	cursor:pointer;
}
div.profile-photo > img{
	border-radius:99999px;
}
</style>
<form method="post" name="basicprofile_form" id="basicprofile_form" action="" class="panel form-horizontal form-bordered" enctype="multipart/form-data">
	<div class="panel-heading">
		<span class="panel-title">Profile</span>
	</div>
	<div class="panel-body no-padding-hr">
		<div class="form-group no-margin-hr panel-padding-h no-padding-t no-border-t">
			<div class="row">
				<label class="col-sm-4 control-label form-group-margin"></label>
				<div class="col-sm-8">
					<div class="profile-block">
					<div class="panel profile-photo">
						<img src="<?php echo $avatarSrc; ?>" alt="" id="avatar_image" />
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="form-group no-margin-hr no-margin-b panel-padding-h">
			<div class="row">
				<label class="col-sm-4 control-label form-group-margin">Name:</label>
				<div class="col-sm-8">
					<input type="name" name="name" id="name" class="form-control" value="<?php echo htmlentities($form['name']); ?>">
				</div>
			</div>
		</div>
		<div class="form-group no-margin-hr no-margin-b panel-padding-h">
			<div class="row">
				<label class="col-sm-4 control-label form-group-margin">Email:</label>
				<div class="col-sm-8">
					<input type="email" name="email" id="email" class="form-control" value="<?php echo htmlentities($form['email']); ?>">
				</div>
			</div>
		</div>
		<div class="form-group no-margin-hr no-margin-b panel-padding-h">
			<div class="row">
				<label class="col-sm-4 control-label">Language:</label>
				<div class="col-sm-8">
					<select class="form-control form-group-margin" name="language" id="language">
<?php
foreach($langRS as $row){
	echo '<option value="'.$row['lang_code'].'"'.($form['language']==$row['lang_code']?' selected="selected"':'').'>'.$row['lang_name'].'</option>';
}
?>
					</select>
				</div>
			</div>
		</div>
		<div class="form-group no-margin-hr no-margin-b panel-padding-h">
			<div class="row">
				<label class="col-sm-4 control-label form-group-margin">Current Password:</label>
				<div class="col-sm-8">
					<input type="password" name="password" id="password" placeholder="Current Password" class="form-control">
				</div>
			</div>
		</div>
		<div class="form-group no-margin-hr no-margin-b panel-padding-h">
			<div class="row">
				<label class="col-sm-4 control-label form-group-margin">New Password:</label>
				<div class="col-sm-8">
					<input type="password" name="password1" id="password1" placeholder="New Password" class="form-control">
				</div>
			</div>
		</div>
		<div class="form-group no-margin-hr no-margin-b panel-padding-h">
			<div class="row">
				<label class="col-sm-4 control-label form-group-margin">Retype New Password:</label>
				<div class="col-sm-8">
					<input type="password" name="password2" id="password2" placeholder="Retype New Password" class="form-control">
				</div>
			</div>
		</div>
		<input type="file" name="avatar" id="avatar" style="display:none;"/>
	</div>
	<div class="panel-footer text-right">
		<button class="btn btn-primary" id="basicprofile_submit">Submit</button>
	</div>
</form>
<script type="text/javascript">
// $('#basicprofile_submit').click(function(event){
	// event.preventDefault();
	// console.log('submit clicked');
	// if(($('#password1').val() || $('#password2').val()) && $('#password1').val()!=$('#password2').val()){
		// console.log($('#password').val());
		// console.log($('#password1').val());
		// console.log($('#password2').val());
	// }
// });

$('#basicprofile_form').validate({
	rules: {
		'name':{
			minlength: 1,
			required: true
		},
		'email':{
			required: true,
			email: true
		},
		'password2':{
			equalTo: "#password1"
		},
		'password':{
			required: true
		}
	}
});

$('#avatar_image').click(function(){
	$('#avatar').click();
});
</script>