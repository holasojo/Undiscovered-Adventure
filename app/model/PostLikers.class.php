<?php

class PostLikers extends DbObject {
    // name of database table
    const DB_TABLE = 'post_likers';

    // database fields
    protected $post_id;
    protected $user_id;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'post_id' => null,
            'user_id' => null
            );

        $args += $defaultArgs;

        $this->post_id = $args['post_id'];
        $this->user_id = $args['user_id'];
    }
    //likes a post on the backend
    public static function like($postID=null, $userID=null) {
        $db = Db::instance();
        $query = sprintf("INSERT INTO %s (post_id, user_id) VALUES (%s, %s)",
            self::DB_TABLE,
            $postID,
            $userID
            );
        $db->execute($query);
    }
    //unlikes a post on the backend
    public static function unlike($postID=null, $userID=null) {
        $db = Db::instance();
        $query = sprintf("DELETE FROM %s WHERE post_id = %d AND user_id = %d",
            self::DB_TABLE,
            $postID,
            $userID
            );
        $db->execute($query);
    }

    // Did this user like this post?
    public static function hasLiked($postID=null, $userID=null) {
      if($postID == null || $userID == null)
        return false;

      $db = Db::instance();
      $q = sprintf("SELECT * FROM %s WHERE post_id = %d AND user_id = %d ",
        self::DB_TABLE,
        $postID,
        $userID
        );
      $result = $db->lookup($q);
      if(mysqli_num_rows($result) != 0) {
        // user liked this post
        return true;
      } else { //user didn't like this post
        return false;
      }
    }

}
