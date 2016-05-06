<?php

class FollowingUser extends DbObject {
    // name of database table
    const DB_TABLE = 'follow';

    // database fields
    protected $id;
    protected $user_id;
    protected $following_id;


    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'user_id' => 0,
            'following_id' => 0
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->user_id = $args['user_id'];
        $this->following_id = $args['following_id'];


    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'user_id' => $this->user_id,
            'following_id' => $this->following_id,

            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }



    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }


    //get all users you're following
    public static function getFollowing($user_id=null) {
        $query = sprintf(" SELECT id FROM %s WHERE user_id = '%s' ",
            self::DB_TABLE, $user_id
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysqli_num_rows($result))
            return null;
        else {
            $objects = array();
            while($row = mysqli_fetch_assoc($result)) {
                $objects[] = self::loadById($row['id']);
            }
            return ($objects);
        }
    }

    //get all users that are following you
    public static function getFollowers($user_id = null){
 $query = sprintf(" SELECT id FROM %s WHERE following_id = '%s' ",
        self::DB_TABLE, $user_id
        );
    $db = Db::instance();
    $result = $db->lookup($query);
    if(!mysqli_num_rows($result))
        return null;
    else {
        $objects = array();
        while($row = mysqli_fetch_assoc($result)) {
            $objects[] = self::loadById($row['id']);
        }
        return ($objects);
    }
    }

}
