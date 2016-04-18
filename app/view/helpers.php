<?php


function getUrl($obj=null) {
  $url = '';

  switch(get_class($obj)) {
    case 'AppUser':
      $username = $obj->get('user_name');
      $url = BASE_URL.'/users/'.$username;
      break;

    case 'BlogPost':
      $bpid = $obj->get('id');
      $url = BASE_URL.'/posts/'.$bpid;
    break;
  }

  return $url;
}


function formatEvent($e=null) {

  $formatted = '';

  $et = EventType::loadById($e->get('event_type_id'));
  $eventTypeName = $et->get('name');

  switch($eventTypeName) {
    case 'add_blog_post':
      // get the nicely formatted date
      // various examples here: http://php.net/manual/en/function.date.php
      $formattedDate = date("F j, Y, g:i a", strtotime($e->get('date_created')));

      // get user's full name
      $user = AppUser::loadById($e->get('user_1_id'));
      $userUrl = $user->getUrl();
      $userName = $user->get('user_name');

      // get blogpost title
      $bp = BlogPost::loadById($e->get('blog_post_id'));
      if ($bp == null) {
        $formatted = sprintf("<a href=\"%s\">%s</a> deleted the post that was created on %s.",
        $userUrl,
        $userName,
        $formattedDate
        );
        break;
      }
      $blogPostTitle = $bp->get('title');
      $blogPostUrl = $bp->getUrl();

      // produce the formatted string
      $formatted = sprintf("<a href=\"%s\">%s</a> created the post <a href=\"%s\">%s</a> on %s.",
        $userUrl,
        $userName,
        $blogPostUrl,
        $blogPostTitle,
        $formattedDate
        );
    break;

    case 'edit_blog_post':
      // get the nicely formatted date
      // various examples here: http://php.net/manual/en/function.date.php
      $formattedDate = date("F j, Y, g:i a", strtotime($e->get('date_created')));

      // get user's full name
      $user = AppUser::loadById($e->get('user_1_id'));
      $userUrl = $user->getUrl();
      $userName = $user->get('user_name');

      // get blogpost title
      $bp = BlogPost::loadById($e->get('blog_post_id'));
      if ($bp == null) {
        $formatted = sprintf("<a href=\"%s\">%s</a> deleted the post that was editted on %s.",
        $userUrl,
        $userName,
        $formattedDate
        );
        break;
      }
      $blogPostTitle = $bp->get('title');
      $blogPostUrl = $bp->getUrl();

      // produce the formatted string
      $formatted = sprintf("<a href=\"%s\">%s</a> editted the post <a href=\"%s\">%s</a> on %s.",
        $userUrl,
        $userName,
        $blogPostUrl,
        $blogPostTitle,
        $formattedDate
        );
    break;

    case 'delete_blog_post':
      // get the nicely formatted date
      // various examples here: http://php.net/manual/en/function.date.php
      $formattedDate = date("F j, Y, g:i a", strtotime($e->get('date_created')));

      // get user's full name
      $user = AppUser::loadById($e->get('user_1_id'));
      $userUrl = $user->getUrl();
      $userName = $user->get('user_name');

      // get blogpost title
      $bp = BlogPost::loadById($e->get('blog_post_id'));
      if ($bp == null) {
        $formatted = sprintf("<a href=\"%s\">%s</a> deleted a post on %s.",
        $userUrl,
        $userName,
        $formattedDate
        );
        break;
      }
      $blogPostTitle = $bp->get('title');
      $blogPostUrl = $bp->getUrl();

      // produce the formatted string
      $formatted = sprintf("<a href=\"%s\">%s</a> deleted the post %s on %s.",
        $userUrl,
        $userName,
        $blogPostTitle,
        $formattedDate
        );
    break;

    case 'followed_user':
      // get the nicely formatted date
      // various examples here: http://php.net/manual/en/function.date.php
      $formattedDate = date("F j, Y, g:i a", strtotime($e->get('date_created')));

      // get user's full name
      $user1 = AppUser::loadById($e->get('user_1_id'));
      $userUrl1 = $user1->getUrl();
      $userName1 = $user1->get('user_name');

      $user2 = AppUser::loadById($e->get('user_2_id'));
      $userUrl2 = $user2->getUrl();
      $userName2 = $user2->get('user_name');

      // produce the formatted string
      $formatted = sprintf("<a href=\"%s\">%s</a> followed <a href=\"%s\">%s</a> on %s.",
        $userUrl1,
        $userName1,
        $userUrl2,
        $userName2,
        $formattedDate
        );
    break;

    case 'got_follower':
      // get the nicely formatted date
      // various examples here: http://php.net/manual/en/function.date.php
      $formattedDate = date("F j, Y, g:i a", strtotime($e->get('date_created')));

      // get user's full name
      $user1 = AppUser::loadById($e->get('user_1_id'));
      $userUrl1 = $user1->getUrl();
      $userName1 = $user1->get('user_name');

      $user2 = AppUser::loadById($e->get('user_2_id'));
      $userUrl2 = $user2->getUrl();
      $userName2 = $user2->get('user_name');

      // produce the formatted string
      $formatted = sprintf("<a href=\"%s\">%s</a> got a new follower: <a href=\"%s\">%s</a> on %s.",
        $userUrl1,
        $userName1,
        $userUrl2,
        $userName2,
        $formattedDate
        );
    break;

    case 'edit_title_viz':
    // get user's full name
    $user = AppUser::loadById($e->get('user_1_id'));
    $userUrl = $user->getUrl();
    $username = $user->get('user_name');

    // get blog post URL
    $bp = BlogPost::loadById($e->get('blog_post_id'));
    // get old and new titles
    $oldTitle = $e->get('old_data');
    $newTitle = $e->get('new_data');

    // get the nicely formatted date
    // various examples here: http://php.net/manual/en/function.date.php
    $formattedDate = date("F j, Y, g:i a", strtotime($e->get('date_created')));
    if (!is_null($bp)) {
      $blogPostUrl = $bp->getUrl();
    } 
    else {
      // produce the formatted string
    $formatted = sprintf("<a href=\"%s\">%s</a> used the visualization to change a post title from \"%s\" to \"%s\" on %s.",
      $userUrl,
      $username,
      $oldTitle,
      $newTitle,
      $formattedDate
      );
      break;
    }

    // produce the formatted string
    $formatted = sprintf("<a href=\"%s\">%s</a> used the visualization to change a <a href=\"%s\">post title</a> from \"%s\" to \"%s\" on %s.",
      $userUrl,
      $username,
      $blogPostUrl,
      $oldTitle,
      $newTitle,
      $formattedDate
      );
      break;

      case 'delete_post_viz':
      // get user's full name
      $user = AppUser::loadById($e->get('user_1_id'));
      $userUrl = $user->getUrl();
      $username = $user->get('user_name');

      // get old and new titles
      $oldTitle = $e->get('old_data');

      // get the nicely formatted date
      // various examples here: http://php.net/manual/en/function.date.php
      $formattedDate = date("F j, Y, g:i a", strtotime($e->get('date_created')));

      // produce the formatted string
      $formatted = sprintf("<a href=\"%s\">%s</a> used the visualization to delete the post \"%s\" on %s.",
        $userUrl,
        $username,
        $oldTitle,
        $formattedDate
      );
      break;

      case 'create_post_viz':
      // get the nicely formatted date
      // various examples here: http://php.net/manual/en/function.date.php
      $formattedDate = date("F j, Y, g:i a", strtotime($e->get('date_created')));

      // get user's full name
      $user = AppUser::loadById($e->get('user_1_id'));
      $userUrl = $user->getUrl();
      $userName = $user->get('user_name');

      // get blogpost title
      $bp = BlogPost::loadById($e->get('blog_post_id'));
      if ($bp == null) {
        $formatted = sprintf("<a href=\"%s\">%s</a> deleted the post that was created on %s.",
        $userUrl,
        $userName,
        $formattedDate
        );
        break;
      }
      $blogPostTitle = $bp->get('title');
      $blogPostUrl = $bp->getUrl();

      // produce the formatted string
      $formatted = sprintf("<a href=\"%s\">%s</a> used the visualization to create the post <a href=\"%s\">%s</a> on %s.",
        $userUrl,
        $userName,
        $blogPostUrl,
        $blogPostTitle,
        $formattedDate
        );
    break;

    default:
      $formatted = 'Event formatting not found.';
      break;
  }

  return $formatted;

}
