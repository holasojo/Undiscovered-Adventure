<?php

class BlogPost extends DbObject {
    // name of database table
    const DB_TABLE = 'posts';

    // database fields
    protected $id;
    protected $title;
    protected $content;
    protected $author_id;
    protected $date_created;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'title' => '',
            'content' => '',
            'author_id' => 0,
            'date_created' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->title = $args['title'];
        $this->content = $args['content'];
        $this->author_id = $args['author_id'];
        $this->date_created = $args['date_created'];
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'title' => $this->title,
            'content' => $this->content,
            'date_created' => $this->date_created
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

      //use updatePost() in database class

    public function update($pid, $updated_title, $updated_content){
       $db = Db::instance();
       $db->updatePost($pid, $updated_title, $updated_content);


   }
     //use deltePost() in database class
   public function delete($pid){
       $db = Db::instance();
       $db->deletePost($pid);  
   }

   //use createPost() in database class
   public function create($title,$content){
       $db = Db::instance();
       $db->createPost($title, $content);


   }
    // load all posts on this blog
   public static function getAllPosts($limit=null) {
    $query = sprintf(" SELECT id FROM %s ORDER BY date_created DESC ",
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



}
