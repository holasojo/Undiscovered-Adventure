<?php

class Event extends DbObject {
    // name of database table
    const DB_TABLE = 'event';

    // database fields
    protected $id;
    protected $event_type_id;
    protected $user_1_id;
    protected $user_2_id;
    protected $blog_post_id;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'event_type_id' => 0,
            'user_1_id' => null,
            'user_2_id' => null,
            'blog_post_id' => null,
            'date_created' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->event_type_id = $args['event_type_id'];
        $this->user_1_id = $args['user_1_id'];
        $this->user_2_id = $args['user_2_id'];
        $this->blog_post_id = $args['blog_post_id'];
        $this->date_created = $args['date_created'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'event_type_id' => $this->event_type_id,
            'user_1_id' => $this->user_1_id,
            'user_2_id' => $this->user_2_id,
            'blog_post_id' => $this->blog_post_id
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }


    public static function getAllEvents() {
      $db = Db::instance();

      $q = sprintf("SELECT * FROM %s ORDER BY date_created DESC ",
        self::DB_TABLE
        );
      $result = $db->lookup($q);

      $events = array();
      while($row = mysqli_fetch_assoc($result)) {
        $events[] = self::loadById($row['id']);
      }

      return $events;
    }



}
