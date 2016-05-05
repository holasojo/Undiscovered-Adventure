<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a PostController and route it
$pc = new PostController();
$pc->route($action);

class PostController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			//posts view. Shows all the posts in a list view.
			case 'posts':
			$this->posts();
			break;
			//edit with visual
			case 'editTitle':
			$this->editTitle();
			break;
			//delete with visual
			case 'deletePost':
			$this->deletePost();
			break;

			case 'feeds':
			$this->feeds();
			break;

				//detail view of a post
			case 'post':
			$postID = $_GET['postID'];
			$this->post($postID);
			break;
				//edit view. 
			case 'edit':
			$postID = $_GET['postID'];
			$this->edit($postID);
			break;
			// submit a when done editing
			case 'submit':
			$postID = $_GET['postID'];
			$postTitle = $_POST['edit_title'];
			$postContent = $_POST['edit_content'];
			$this->submit($postID,$postTitle, $postContent);
			break;

				//delete a post
			case 'delete':
			$postID =$_GET['postID'];
			$this->delete($postID);
			break;
		}

	}

	public function feeds(){
		$posts = BlogPost::getAllPosts();
		// get all events
		$events = Event::getAllEvents();
		include_once SYSTEM_PATH.'/view/helpers.php';
		include_once SYSTEM_PATH.'/view/feeds.tpl';
	}

	public function posts() {
			// get all posts from this blogpostController
		$posts = BlogPost::getAllPosts();
		// get all events
		$events = Event::getAllEvents();
		include_once SYSTEM_PATH.'/view/helpers.php';
		include_once SYSTEM_PATH.'/view/posts.tpl';
	}

	public function post($pid) {
			// get data for this post
		$postID = $pid;
		$post = BlogPost::loadById($postID);

			// get data for author of post
		$author = AppUser::loadById($post->get('author_id'));



		include_once SYSTEM_PATH.'/view/post.tpl';



	}


	public function edit($pid) {

			// get data for this post
		$postID = $pid;
		$post = BlogPost::loadById($postID);

			// get data for author of post
		$author = AppUser::loadById($post->get('author_id'));

		include_once SYSTEM_PATH.'/view/edit.tpl';
	}


	public function submit($pid, $title, $content){


		$postID = $pid;
		$post = BlogPost::loadById($postID);
		//update method exists in BlogPost class.
		BlogPost::update($postID, $title, $content);
		$logEvent = new Event(array(
			'event_type_id' => EventType::getIdByName('edit_blog_post'),
			'user_1_id' => $_SESSION['user_id'],
			'blog_post_id' => $postID
		));
		$logEvent->save(); // log the event
		//redirect to the previous page
		header('Location: '.BASE_URL.'/posts/'.$postID);
	}

	public function delete($pid){
		$postID = $pid;
		//delete method exists in BlogPost class.
		BlogPost::delete($postID);
		$logEvent = new Event(array(
			'event_type_id' => EventType::getIdByName('delete_blog_post'),
			'user_1_id' => $_SESSION['user_id'],
			'blog_post_id' => $postID
		));
		$logEvent->save(); // log the event
		//redirect to posts after the post gets deleted.
		header('Location: '.BASE_URL.'/posts');
	}

	public function editTitle() {
		$newTitle = $_POST['postTitle'];
		$postID = $_POST['postID'];
		$post = BlogPost::loadById($postID);
		$oldTitle = $post->get('title'); // temporarily store the old title
		// first make sure user is logged in
		if(!isset($_SESSION['username'])) {
			$_SESSION['vizError'] = "You must be logged in to edit the blog post.";
		} else {
			// get user ID for logged-in user
			$currUserID = AppUser::loadByUsername($_SESSION['username'])->get('id');
			// does the blog post exist?
			if(is_null($post)) {
				$_SESSION['vizError'] = 'That blog post ID does not exist.';
			} elseif( ($_SESSION['usergroup'] != 5) &&
				($post->get('author_id') != $currUserID) ) {
				// are we allowed to edit it?
				$_SESSION['vizError'] = 'You are not authorized to edit that blog post title.';
			} else {
				// we're allowed, so let's edit and save
				$post->set('title', $newTitle);
				$post->save();
				// log the event
				$logEvent = new Event(array(
					'event_type_id' => EventType::getIdByName('edit_title_viz'),
					'user_1_id' => $currUserID,
					'blog_post_id' => $post->get('id'),
					'old_data' => $oldTitle,
					'new_data' => $newTitle
				));
				$logEvent->save();
				$_SESSION['vizError'] = "New blog post title saved successfully.";
			}
		}
		header('Location: '.BASE_URL.'/visualization'); // send us back
	}
	public function deletePost(){
		$postID = $_POST['postID'];
		$post = BlogPost::loadById($postID);
		$oldTitle = $post->get('title');
		// first make sure user is logged in
		if(!isset($_SESSION['username'])) {
			$_SESSION['vizError'] = "You must be logged in to delete the blog post.";
		} else {
			// get user ID for logged-in user
			$currUserID = AppUser::loadByUsername($_SESSION['username'])->get('id');
			// does the blog post exist?
			if(is_null($post)) {
				$_SESSION['vizError'] = 'That blog post ID does not exist.';
			} elseif( ($_SESSION['usergroup'] != 5) &&
				($post->get('author_id') != $currUserID) ) {
				// are we allowed to edit it?
				$_SESSION['vizError'] = 'You are not authorized to delete that blog post.';
			} else {
				// we're allowed, so let's edit and save
				// log the event
				$logEvent = new Event(array(
					'event_type_id' => EventType::getIdByName('delete_post_viz'),
					'user_1_id' => $currUserID,
					'blog_post_1_id' => $post->get('id'),
					'old_data' => $oldTitle
				));
				$logEvent->save();
				//delete method exists in BlogPost class.
				BlogPost::delete($postID);
				$_SESSION['vizError'] = "Blog post deleted successfully.";
			}
		}
		header('Location: '.BASE_URL.'/visualization');
	}

}
