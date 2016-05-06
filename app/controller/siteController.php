<?php 

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new SiteController();
$sc->route($action);

class SiteController { 

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			//index page, the front page
			case 'index':
			$this->index();
			break;

			case 'about':
			$this->about();
			break;

			case 'contact':
			$this->contact();
			break;

			//photos view. 
			case 'visualization':
			$this->visualization();
			break;

			case 'visualJson':
			$this->visualJson();
			break;

			//mapPage. 
			case 'mapPage':
			$this->mapPage();
			break;

			//browse page
			case 'browse':
			$this->browse();
			break;

			//gets called when user wants to login
			case 'login':
			$this->login();
			break;
			//gets called when user wants to log out
			case 'logout':
			$this->logout();
			break;

			//gets called when user wants to create a new post
			case 'upload':
			$this->upload();
			break;

		

			case 'profile':
			$username = $_GET['username'];
			$this->profile($username);
			break;

			case 'editProfile':
			$username = $_GET['username'];
			$this->editProfile($username);
			break;

			case 'updateProfile':
			$username = $_GET['username'];
			$new_password = $_POST['pw_box'];
			$new_email = $_POST['email_box'];
			$this->updateProfile($username, $new_password, $new_email);
			break;

			//gets called when submitting the new post
			//and actually creates the post in the database
			case 'create':
			$postTitle = $_POST['title'];
			$postContent = $_POST['content'];
			$cityLat = $_POST['cityLat'];
			$cityLong = $_POST['cityLng'];
			$this->create($postTitle, $postContent, $cityLat, $cityLong);
			break;

			case 'vizCreate':
			$postTitle = $_POST['title'];
			$postContent = $_POST['content'];
			$cityLat = $_POST['cityLat'];
			$cityLong = $_POST['cityLng'];
			$this->vizCreate($postTitle, $postContent, $cityLat, $cityLong);
			break;

			case 'registerSubmit':
				$this->registerSubmit();
				break;			

			case 'followUser':
				$this->followUser();
				break;

			case 'unFollowUser':
				$this->unFollowUser();
				break;
		}
	}

	


	public function index() {

		include_once SYSTEM_PATH.'/view/index.tpl';
	}

	public function about() {

		include_once SYSTEM_PATH.'/view/about.tpl';
	}

	public function contact() {

		include_once SYSTEM_PATH.'/view/contact.tpl';
	}

	public function mapPage() {
		$posts = BlogPost::getAllPosts();
		include_once SYSTEM_PATH.'/view/mapPage.tpl';
	}

	public function browse() {
		

		include_once SYSTEM_PATH.'/view/browse.tpl';
	}

	public function profile($pname){
		$username = $pname;
			// get data for author of post
		$user = AppUser::loadByUsername($username);

		$userid = $user->get('id');
		//$followings = FollowingUser::getFollowing($user->get('id'));
		//$followers = FollowingUser::getFollowers($user->get('id'));

		// $followers = 
		// get all events
		//$events = Event::getAllEventsByUserID($userid);
		$events = Event::getAllFollowerEvents($userid);
		include_once SYSTEM_PATH.'/view/helpers.php';
		include_once SYSTEM_PATH.'/view/profile.tpl';
	}

	public function editProfile($pname){
		$username = $pname;
			// get data for author of post
		$user = AppUser::loadByUsername($username);

		include_once SYSTEM_PATH.'/view/editProfile.tpl';
	}

	public function updateProfile($username, $new_pw, $email){
		$user = AppUser::loadByUsername($username);
		
		$user->set('pw', $new_pw);
		$user->set('email', $email);
		$user->save();
		//redirect to the previous page
		$_SESSION['updateError'] = '';
		header('Location: '.BASE_URL.'/users/'.$username);
	}


	public function visualization() {
		$posts = BlogPost::getAllPosts();
		$pageTitle = 'Photos Page!';
		$pageContent = 'Welcome. Under the construction....';
		include_once SYSTEM_PATH.'/view/visualization.tpl';
	}

	public function visualJson() {
		header('Content-Type: application/json');
		//get all users
		$users = AppUser::getAllUsers();
		$jsonUsers = array(); // array to hold json users
		foreach($users as $user) {
			// get all blog posts
			$posts = BlogPost::getAllPosts();
			$jsonPosts = array(); // array to hold json posts
			foreach($posts as $post) {
				//add only if post is by this user
				if ($post->get('author_id') == $user->get('id')) {
					// the json post object
					$jsonPost = array(
						'name' => $post->get('title'),
						'post_id' => $post->get('id'),
						'size' => 0
					);
					$jsonPosts[] = $jsonPost;
				}
			}
			$jsonUser = array(
				'name' => $user->get('user_name'),
				'children' => $jsonPosts
			);
			$jsonUsers[] = $jsonUser;
		}
		// finally, the json root object
		$json = array(
			'name' => 'users',
			'children' => $jsonUsers
		);
		echo json_encode($json);
	}
	

	public function upload(){
		include_once SYSTEM_PATH.'/view/upload.tpl';
	}

	public function create($title, $content,$cityLat,$cityLong){
		$u_title = $title;
		$u_content=$content;
		$u_lat = $cityLat;
		$u_long = $cityLong;
		//create method in BlogPost class
		$blogID = BlogPost::create($u_title, $u_content, $u_lat, $u_long);
		$logEvent = new Event(array(
			'event_type_id' => EventType::getIdByName('add_blog_post'),
			'user_1_id' => $_SESSION['user_id'],
			'blog_post_id' => $blogID
		));
		$logEvent->save(); // log the event
		//redirects to posts page to see it.
		header('Location: '.BASE_URL.'/posts');
	}

	public function vizCreate($title, $content,$cityLat,$cityLong){
		$u_title = $title;
		$u_content=$content;
		$u_lat = $cityLat;
		$u_long = $cityLong;
		//create method in BlogPost class
		$blogID = BlogPost::create($u_title, $u_content, $u_lat, $u_long);
		$logEvent = new Event(array(
			'event_type_id' => EventType::getIdByName('create_post_viz'),
			'user_1_id' => $_SESSION['user_id'],
			'blog_post_id' => $blogID
		));
		$logEvent->save(); // log the event
		//redirects to posts page to see it.
		header('Location: '.BASE_URL.'/visualization');

	}

	public function login() {
		//gets username and password from the currently located page.
		$username = $_POST['uname'];
		$passwd = $_POST['pw'];

		$user = AppUser::loadByUsername($username);
		if(is_null($user)) {
			// username not found
			$_SESSION['error'] = "Incorrect username.";
		} elseif ($user->get('pw') != $passwd) {
			// passwords don't match
			$_SESSION['error'] = "Incorrect password.";
		} else {
			// password matches!
			// log me in
			$_SESSION['user_id'] = $user->getId();
			$_SESSION['username'] = $username;
			$_SESSION['usergroup'] = $user->get('usergroup');
			// $_SESSION['error'] = "You are logged in as ".$username.".";
			
		}
		header('Location: ' . $_SERVER['HTTP_REFERER']);

		// redirect to profile page
		//header('Location: '.BASE_URL.'/profile/'.$username.'');
	}

	public function logout() {
				// erase the session
		session_unset();
				session_destroy(); // for good measure

				// redirect to home page
		header('Location: '.BASE_URL.'/feeds');
	} 
	public function registerSubmit() {
			// get post data
			$uname  = $_POST['uname'];
			$passwd = $_POST['passwd'];
			$email  = $_POST['email'];
			$adminID = $_POST['adminid'];

			// do some simple form validation

			// are all the required fields filled?
			if ($uname == '' || $passwd == '' || $email == '') {
				// missing form data; send us back
				$_SESSION['registerError'] = 'Please complete all registration fields.';
				header('Location: '.BASE_URL);
				exit();
			}

			// is username in use?
			$user = AppUser::loadByUsername($uname);
			if(!is_null($user)) {
				// username already in use; send us back
				$_SESSION['registerError'] = 'Sorry, that username is already in use. Please pick a unique one.';
				header('Location: '.BASE_URL);
				exit();
			}

			// okay, let's register
			$user = new AppUser();
			$user->set('user_name', $uname);
			$user->set('pw', $passwd);
			$user->set('email', $email);
			
			$ordinaryUser = 1; 
			$isadmin = 5; 
			$ugroup; 
			
			// In order to become an admin, registering user needs to have the key. 
			/// check if this user will become an admin, if so, the usergroup will be 5
			if($adminID == 'admin3744'){
				$user->set('usergroup', $isadmin);
				$ugroup = $isadmin; 
			}
			
			else{
				$user->set('usergroup', $ordinaryUser); 
				$ugroup = $ordinaryUser; 
			}
		
			$user->save(); // save to db

			// log in this freshly created user
			$_SESSION['user_id'] = $user->getId();
			$_SESSION['username'] = $uname;
			$_SESSION['usergroup'] = $ugroup; 
			$_SESSION['error'] = "You successfully registered as ".$uname.".";

			// redirect to home page
			header('Location: '.BASE_URL.'/posts');
			exit();
	}

	public function followUser() {
			header('Content-Type: application/json'); // set the header to hint the response type (JSON) for JQuery's Ajax method

			$userID = null;
			if(isset($_POST['userID']))
				$userID = $_POST['userID']; // get the username data

			// make sure it's a real username
			if(is_null($userID) || $userID == '') {
				echo json_encode(array('error' => 'Invalid user ID.'));
			} else {

				$user = AppUser::loadByID($userID);
				// does the user exist?
				if(!is_null($user)) {

					// get userID of follower (logged-in user)
					$follower = AppUser::loadByUsername($_SESSION['username']);
					$followerID = $follower->get('id');

					// they're not already following each other right?
					if(Follow::areFollowing($followerID, $userID)) {
						echo json_encode(array('error' => 'You are already following this user.'));
					} else {

						// save the follow connection
						$follow = new Follow(array(
							'follower' => $followerID,
							'followee' => $userID
						));
						$follow->save();
						$logEvent = new Event(array(
							'event_type_id' => EventType::getIdByName('followed_user'),
							'user_1_id' => $followerID,
							'user_2_id' => $userID
						));
						$logEvent->save(); // log the event
						$logEvent = new Event(array(
							'event_type_id' => EventType::getIdByName('got_follower'),
							'user_1_id' => $userID,
							'user_2_id' => $followerID
						));
						$logEvent->save(); // log the event
						echo json_encode(array(
							'success' => 'success'
						));
					}
				} else {
					echo json_encode(array(
						'error' => 'That user does not exist.'
					));
				}
			}
	}

	public function unFollowUser() {
			header('Content-Type: application/json'); // set the header to hint the response type (JSON) for JQuery's Ajax method

			$userID = null;
			if(isset($_POST['userID']))
				$userID = $_POST['userID']; // get the username data

			// make sure it's a real username
			if(is_null($userID) || $userID == '') {
				echo json_encode(array('error' => 'Invalid user ID.'));
			} else {

				$user = AppUser::loadByID($userID);
				// does the user exist?
				if(!is_null($user)) {

					// get userID of follower (logged-in user)
					$follower = AppUser::loadByUsername($_SESSION['username']);
					$followerID = $follower->get('id');

					// they're not already following each other right?
					if(Follow::areFollowing($followerID, $userID)) {
						Follow::unfollow($followerID, $userID);						
						echo json_encode(array(
							'success' => 'success'
						));
					} else {
						echo json_encode(array(
						'error' => 'Fail.'
					));
/*
						// save the follow connection
						$follow = new Follow(array(
							'follower' => $followerID,
							'followee' => $userID
						));
						$follow->save();
						$logEvent = new Event(array(
							'event_type_id' => EventType::getIdByName('followed_user'),
							'user_1_id' => $followerID,
							'user_2_id' => $userID
						));
						$logEvent->save(); // log the event
						$logEvent = new Event(array(
							'event_type_id' => EventType::getIdByName('got_follower'),
							'user_1_id' => $userID,
							'user_2_id' => $followerID
						));
						$logEvent->save(); // log the event
						echo json_encode(array(
							'success' => 'success'
						));
						*/
					}
				} else {
					echo json_encode(array(
						'error' => 'That user does not exist.'
					));
				}
			}
	}
}

		?>
