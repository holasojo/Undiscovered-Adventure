<span id="error">
    <?php
    if(isset($_SESSION['error'])) {
        $error = $_SESSION['error'];
        
        if($error != ''){
            echo '<script language="javascript">';
            echo 'alert("'.$error.'")';
            echo '</script>';
            $_SESSION['error'] = '';
        }
    }
    ?>
</span>
<?php
if( !isset($_SESSION['username']) || $_SESSION['username'] == '') {
    ?>
    <!-- when not logged in -->
<!-- <form class="navbar-form pull-right">
-->
<!-- loginForm -->
<form class ="navbar-form pull-right" method="POST" action="<?= BASE_URL ?>/login">
    <!--<a name="pageName" >-->
    <div class ="input-group">
        <input type="text" name="uname" class = "form-control" placeholder="Username">
    </div>
    <div class ="input-group">
       <input type="password" name="pw" class = "form-control" placeholder="Password">
   </div>
   
   <input type="submit" name="submit" class="btn btn-primary" value="Log in">
</form>

<?php
} else {
    $username = $_SESSION['username'];
    

    echo '

    <ul class="nav navbar-nav navbar-right">

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Logged In <span class="caret"></span></a>
          <ul class="dropdown-menu">
              <li><a href="'.BASE_URL.'/users/'.$username.'">
               <strong>Logged in as '. $username .'</strong></li>

               <li><a href="'.BASE_URL.'/upload">Upload</a> </li>
               <li><a href="'.BASE_URL.'/users/'.$username.'/editProfile">Edit Profile</a> </li>
               <li role="separator" class="divider"></li>
               <li><a href="'.BASE_URL.'/logout">Log out?</a></li>
           </ul>
       </li>
   </ul>
   ';


}
?>
