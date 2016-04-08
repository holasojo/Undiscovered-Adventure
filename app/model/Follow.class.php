<?php

class Follow extends DbObject {
    // name of database table
    const DB_TABLE = 'follow';

    // database fields
    protected $id;
    protected $follower;
    protected $followee;
    protected $date_created;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'follower' => null,
            'followee' => null,
            'date_created' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->follower = $args['follower'];
        $this->followee = $args['followee'];
        $this->date_created = $args['date_created'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'follower' => $this->follower,
            'followee' => $this->followee
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // is the first user following the second user?
    public static function areFollowing($followerID=null, $followeeID=null) {
      if($followerID == null || $followeeID == null)
        return false;

      $db = Db::instance();
      $q = sprintf("SELECT * FROM %s WHERE follower = %d AND followee = %d ",
        self::DB_TABLE,
        $followerID,
        $followeeID
        );
      $result = $db->lookup($q);
      if(mysqli_num_rows($result) != 0) {
        // follow was wound
        return true;
      } else {
        return false;
      }
    }

}
