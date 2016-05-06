<?php

class AppUser extends DbObject {
    // name of database table
    const DB_TABLE = 'users';

    // database fields
    protected $id;
    protected $user_name;
    protected $pw;
    protected $firstname;
    protected $lastname;
    protected $email;
	protected $gender;
	protected $usergroup;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'user_name' => '',
            'pw' => '',
            'email' => null,
            'usergroup' => null,
            'firstname'=>'',
            'lastname'=>'',
            'gender' =>''
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->user_name = $args['user_name'];
        $this->pw = $args['pw'];
        $this->email = $args['email'];
		$this->usergroup = $args['usergroup'];
        $this->firstname = $args['firstname'];
        $this->lastname = $args['lastname'];
        $this->gender = $args['gender'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'user_name' => $this->user_name,
            'pw' => $this->pw,
            'email' => $this->email,
			'usergroup' => $this->usergroup,
            'firstname'  => $this->firstname,
            'lastname' => $this->lastname,
            'gender' => $this ->gender
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

    // load all users
    public static function getAllUsers($limit=null) {
        $query = sprintf(" SELECT id FROM %s ",
            self::DB_TABLE
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

    public function getUrl() {
        include_once SYSTEM_PATH.'/view/helpers.php';
        return getUrl($this);
    }
    public function isFollowing($followeeID=null) {
      if($followeeID == null)
        return false;


      return (Follow::areFollowing($this->id, $followeeID));
    }

}
