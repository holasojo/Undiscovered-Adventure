<?php
require_once '../global.php';
if($_POST['action'] == 'like') {
    $db = Db::instance();
    $id = $_POST['idOption'];


    public function likeDislike($postID) {
      $post = BlogPost::loadById($postID);
      //$likedTitle = $post->get('title'); // temporarily store the old title
      $currUserID = AppUser::loadByUsername($_SESSION['username'])->get('id');
      // first make sure user is logged in
      if(!isset($_SESSION['username'])) {
        $_SESSION['vizError'] = "You must be logged in to like the blog post.";
      } else {
        $currUserID = AppUser::loadByUsername($_SESSION['username'])->get('id');
        if (is_null($post)) {
          $_SESSION['vizError'] = 'Error occured, post not found to like / dislike.';
        } else {
          $tokens = $post->get('vote_IDs');
          $userIDs = $post->get('vote_IDs');
          $toke = strtok($tokens, ":"); // Delimited by ':'
          $postLikedAlready = false;

          while ($toke !== false) {
            if ($toke == $currUserID) {
              $postLikedAlready = true;
            }
            $toke = strtok(":"); // Delimited by ':'
          }

          $sqlVotes = "";
          if ($postLikedAlready) { // Then dislike it!
            str_replace($currUserID, "", $userIDs);
            $sqlVotes = "UPDATE posts SET vote = vote - 1 WHERE id = '{$postID}'";
          } else { // Like it!
            $userIDs = $userIDs . ":" . $currUserID;
            $sqlVotes = "UPDATE posts SET vote = vote + 1 WHERE id = '{$postID}'";
          }

          $sqlIDs = "UPDATE posts SET voteIDs = '{$userIDs}' WHERE id = '{$postID}'";

          $db = Db::instance();
          $db->execute($sqlVotes);
          $db->execute($sqlIDs);

          $post->save();
          // log the event
          $_SESSION['vizError'] = "New blog post liked successfully.";
        }
      }
      header('Location: '.BASE_URL.'/photos'); // send us back
    }
}
