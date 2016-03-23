<?php

class AppUser extends DbObject {
    // name of database table
    const DB_TABLE = 'users';

    // database fields
    protected $id;
    protected $user_name;
    protected $pw;
    //protected $first_name;
    //protected $last_name;
    protected $email;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'user_name' => '',
            'pw' => '',
            'email' => null
            //'first_name' => null,
            //'last_name' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->user_name = $args['user_name'];
        $this->pw = $args['pw'];
        $this->email = $args['email'];
        //$this->first_name = $args['first_name'];
        //$this->last_name = $args['last_name'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'user_name' => $this->user_name,
            'pw' => $this->pw,
            'email' => $this->email
            //'first_name' => $this->first_name,
            //'last_name' => $this->last_name
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
