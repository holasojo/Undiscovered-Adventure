<span id="error">
    <?php
    if(isset($_SESSION['error'])) {
        if($_SESSION['error'] != '') {
                echo $_SESSION['error'];
                $_SESSION['error'] = '';
            }
        }
    ?>
</span>
<?php
    if( !isset($_SESSION['username']) || $_SESSION['username'] == '') {
?>
<!-- when not logged in -->
<form class ="loginForm" method="POST" action="<?= BASE_URL ?>/login">
    <!--<a name="pageName" >-->
    <label>Username: <input type="text" name="uname"></label>
    <label>Password: <input type="password" name="pw"></label>
    <input type="submit" name="submit" value="Log in">
</form>

<?php
    } else {
        $username = $_SESSION['username'];
        echo '
            <br><p>Logged in as <a href="'.BASE_URL.'/profile/'.$username.'">
            <strong>'. $username .'</strong></a>
            <br> <a href="'.BASE_URL.'/users/'.$username.'">Home</a> 
            <br> <a href="'.BASE_URL.'/upload">Upload</a> 
            <br> <a href="'.BASE_URL.'/settings">Settings</a> 
            <br> <a href="'.BASE_URL.'/logout">Log out?</a></p>
        ';
    }
?>
