<?php

class AppUser extends DbObject {
    // name of database table
    const DB_TABLE = 'users';

    // database fields
    protected $id;
    protected $user_name;
    protected $user_pw;
    protected $first_name;
    protected $last_name;
    protected $user_email;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'user_name' => '',
            'user_pw' => '',
            'user_email' => null,
            'user_firstname' => null,
            'user_lastname' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->user_name = $args['user_name'];
        $this->user_pw = $args['user_pw'];
        $this->user_email = $args['user_email'];
        $this->user_firstname = $args['user_firstname'];
        $this->user_lastname = $args['user_lastname'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'user_name' => $this->user_name,
            'user_pw' => $this->user_pw,
            'user_email' => $this->user_email,
            'user_firstname' => $this->user_firstname,
            'user_lastname' => $this->user_lastname
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

 

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load user by username
    public static function loadByUsername($user_name=null) {
        if($user_name === null)
            return null;

        $query = sprintf(" SELECT id FROM %s WHERE user_name = '%s' ",
            self::DB_TABLE,
            $user_name
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysqli_num_rows($result))
            return null;
        else {
            $row = mysqli_fetch_assoc($result);
            $obj = self::loadById($row['id']);
            return ($obj);
        }
    }

}
