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

			//gets called when submitting the new post
			//and actually creates the post in the database
			case 'create':
			$postTitle = $_POST['title'];
			$postContent = $_POST['content'];
			$this->create($postTitle, $postContent);
			break;
			
		}
	}


	public function index() {

		include_once SYSTEM_PATH.'/view/index.tpl';
	}

	public function mapPage() {

		include_once SYSTEM_PATH.'/view/mapPage.tpl';
	}

	public function browse() {
		

		include_once SYSTEM_PATH.'/view/browse.tpl';
	}


	public function photos() {
		$pageTitle = 'Photos Page!';
		$pageContent = 'Welcome. Under the construction....';
		include_once SYSTEM_PATH.'/view/photos.tpl';
	}
	

	public function upload(){
		include_once SYSTEM_PATH.'/view/upload.tpl';
	}

	public function create($title, $content){
		$u_title = $title;
		$u_content=$content;
		//create method in BlogPost class
		BlogPost::create($u_title, $u_content);
		//redirects to posts page to see it.
		header('Location: '.BASE_URL.'/posts');

	}

	public function login() {
		//gets username and password from the currently located page.
		$username = $_POST['uname'];
		$passwd = $_POST['pw'];

		if($username != ADMIN_USERNAME) {
					// username not found
			$_SESSION['error'] = "Incorrect username.";
		} elseif ($passwd != ADMIN_PASSWORD) {
					// passwords don't match
			$_SESSION['error'] = "Incorrect password.";
		} else {
					// password matches
					// log in
			$_SESSION['username'] = $username;
			$_SESSION['error'] = "You are logged in as ".$username.".";
		}

		// redirect to posts page
		header('Location: '.BASE_URL.'/posts');
	}

	public function logout() {
				// erase the session
		unset($_SESSION['username']);
				session_destroy(); // for good measure

				// redirect to home page
				header('Location: '.BASE_URL.'/posts');
			}
		} 

		?>