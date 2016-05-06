<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Undiscovered Adventure</title>
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/index.css">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="<?= BASE_URL ?>/public/js/index.js"></script>
</head>

<body>

    <div id="bg1"></div>
    <div id="bg2"></div>
    <div id="darkScreen"></div>


    <div id="forms">
        <h1> Undiscovered Adventure </h1>
        <input id="searchBox" type="search" placeholder="Seoul, Korea">
        <input id="searchButton" type="submit" value="Let's Go">

        <a href="#">Anywhere!</a>
    </div>




    <a href="#" class="signUpButton">Sign Up</a>



    <div id="infos">
        <h3>Join Us! </h3>
        <!-- sign up form -->
        <form name ="SignUpForm" method="post" action="<?= BASE_URL ?>/register">
        <!-- email -->
        <div>
            <label class="email-label" for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <!-- pw -->
        <div>
            <label class="pw-label" for="user_pw">Password</label>
            <input type="password" id="user_pw" name="passwd" required>
        </div>
        <!-- username -->
        <div>
            <label class="id-label" for="user_ID">Username</label>
            <input type="text" id="user_ID" name="uname" required>
        </div>
        <div>
            <label class="first-label" for="firstname">First name</label>
            <input type="text" id="firstname" name="firstname" required>
        </div>
        <div>
            <label class="last-label" for="lastname">Last name</label>
            <input type="text" id="lastname" name="lastname" required>
        </div>
		
		<!-- admin code -->
        <div>
            <label class="admin-label" for="admin_ID">If you're an admin, type admin key</label>
            <input type="text" id="admin_ID" name="adminid" >
        </div>

<div>
    <p> Please choose your gender</p>
  <input type="radio" name="gender" value="male" checked> Male
  <input type="radio" name="gender" value="female"> Female
  <input type="radio" name="gender" value="other"> Other
</div>

        <div>

            <input type="submit" id="submitB" name ="btn-signup" value="Submit" >
        </div>
        </form>
    </div>
<iframe width="0" height="0" border="0" position="absolute" name="dummyframe" id="dummyframe"></iframe>

    <ul class="footer">
         <li><a href="<?= BASE_URL ?>">Index</a></li>
        <li><a href="<?= BASE_URL ?>/about">About</a></li>
        
        <li><a href="<?= BASE_URL ?>/contact">Contact</a></li>

    </ul>

</body>

</html>