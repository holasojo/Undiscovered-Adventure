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

			//photos view. 
			case 'photos':
			$this->photos();
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

			//gets called when submitting the new post
			//and actually creates the post in the database
			case 'create':
			$postTitle = $_POST['title'];
			$postContent = $_POST['content'];
			$cityLat = $_POST['cityLat'];
			$cityLong = $_POST['cityLng'];
			$this->create($postTitle, $postContent, $cityLat, $cityLong);
			break;

			case 'registerSubmit':
				$this->registerSubmit();
				break;			
		}
	}


	public function index() {

		include_once SYSTEM_PATH.'/view/index.tpl';
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


		$followings = FollowingUser::getFollowing($user->get('id'));
		$followers = FollowingUser::getFollowers($user->get('id'));

		// $followers = 
		include_once SYSTEM_PATH.'/view/profile.tpl';
	}

	public function photos() {
		$pageTitle = 'Photos Page!';
		$pageContent = 'Welcome. Under the construction....';
		include_once SYSTEM_PATH.'/view/photos.tpl';
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
		BlogPost::create($u_title, $u_content, $u_lat, $u_long);
		//redirects to posts page to see it.
		header('Location: '.BASE_URL.'/posts');

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
			$_SESSION['error'] = "You are logged in as ".$username.".";
		}


		// redirect to profile page
		header('Location: '.BASE_URL.'/profile/'.$username.'');
	}

	public function logout() {
				// erase the session
		session_unset();
				session_destroy(); // for good measure

				// redirect to home page
				header('Location: '.BASE_URL.'/posts');
	} 
	public function registerSubmit() {
			// get post data
			$uname  = $_POST['uname'];
			$passwd = $_POST['passwd'];
			$email  = $_POST['email'];

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
			$user->save(); // save to db

			// log in this freshly created user
			$_SESSION['user_id'] = $user->getId();
			$_SESSION['username'] = $uname;
			$_SESSION['error'] = "You successfully registered as ".$uname.".";

			// redirect to home page
			header('Location: '.BASE_URL.'/posts');
			exit();
	}
}

		?>