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

	public function posts() {
			// get all posts from this blogpostController
		$posts = BlogPost::getAllPosts();
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
		//redirect to the previous page
		header('Location: '.BASE_URL.'/posts/'.$postID);
	}

	public function delete($pid){
		$postID = $pid;
		$post = BlogPost::loadById($postID);
		//delete method exists in BlogPost class.
		BlogPost::delete($postID);
		//redirect to posts after the post gets deleted.
		header('Location: '.BASE_URL.'/posts');
	}

}
