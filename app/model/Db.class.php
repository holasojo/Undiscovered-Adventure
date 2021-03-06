<?php

class Db {

	private static $_instance = null;
	private $conn;

	private function __construct() {
		$host     = DB_HOST;
		$database = DB_DATABASE;
		$username = DB_USER;
		$password = DB_PASS;

		$this->conn = mysqli_connect($host, $username, $password, $database)
		or die ('Error: Could not connect to MySql database');

	}

	public static function instance() {
		if (self::$_instance === null) {
			self::$_instance = new Db();
		}
		return self::$_instance;
	}

	public function fetchById($id, $class_name, $db_table) {
		if ($id === null) {
			return null;
		}

		$query = sprintf("SELECT * FROM `%s` WHERE id = '%s';",
			$db_table,
			$id
			);
		//echo $query;
		$result = $this->lookup($query);

		if(!mysqli_num_rows($result)) {
			return null;
		} else {
			$row = mysqli_fetch_assoc($result);
			$obj = new $class_name($row);
			return $obj;
		}
	}


	public function store(&$obj, $class_name, $db_table, $data)
	{
		// find out if this item already exists so we know to use INSERT or UPDATE
		if($obj->getId() === null) {
			// ID would only be null for a new item, so let's use INSERT
			$query = $this->buildInsertQuery($db_table, $data);
			//echo $query;
			$this->execute($query); // execute the query we've built
			$obj->setId($this->getLastInsertID()); //get back the ID for the new item
		} else {
			// item ID exists, so let's use UPDATE
			// only hit the database if the instance has been modified
			if($obj->getModified()) {
				$query = $this->buildUpdateQuery($db_table, $data, $obj->getId());
				//echo $query;
				$this->execute($query); // execute the query we've built
			}
		}
		//echo $query; // print the query
		$obj->setModified(false); // reset the flag
	}


	public function updatePost($pid, $updated_title, $updated_content){
		//create a row
		$sql = "UPDATE posts SET title='$updated_title',content='$updated_content' WHERE id='$pid'";


		//query update post
		if (mysqli_query($this->conn, $sql)) {
			//notify if it's updated or not
			?>

			<script>
				alert("updated");
			</script>
			<?php


		} else {
			// if not updated for some reason
			?><script>
			alert("not updated");
		</script><?php
		echo "Error updating record: " . mysqli_error($this->conn);
	}


}

public function createPost($title, $content, $lat, $long){
	//create a row
	$sql =  "INSERT INTO posts (title, content, latitude, longitude, author_id) VALUES ('$title', '$content', '$lat','$long','{$_SESSION['user_id']}');";

	// query create a post
	if (mysqli_query($this->conn,$sql)) {
		echo "New record created successfully";
		return $this->conn->insert_id;
	} else {
		//if it did not update
		?>
		<script type="text/javascript">alert("not working")</script>
		<?php
		echo "Error: " . $sql . "<br>" . $conn->error;
	}


}


public function deletePost($pid){

	$sql="DELETE FROM posts WHERE id='$pid'";
	//put delete method using query
	if (mysqli_query($this->conn, $sql)) {
		?>
		<script>
			alert("removed");
		</script>
		<?php


	} else {
		?><script>
		alert("not removed");
	</script><?php
	echo "Error record: " . mysqli_error($this->conn);
}

}

	// Formats a string for use in SQL queries.
	// Use this on ANY string that comes from external sources (i.e. the user).
public function quoteString($s) {
	return "'" . mysqli_real_escape_string($this->conn, $s) . "'";
}

	// Formats a date (i.e. UNIX timestamp) for use in SQL queries.
public function quoteDate($d) {
	return date("'Y-m-d H:i:s'", $d);
}

	//Query the database for information
public function lookup($query) {
	$result = mysqli_query($this->conn, $query);
	if(!$result)
		die('Invalid query: ' . $query);
	return ($result);
}

	//Execute operations like UPDATE or INSERT
public function execute($query) {
	$ex = mysqli_query($this->conn, $query);
	if(!$ex)
		die ('Query failed:' . mysqli_error($this->conn));
}

	//Build an INSERT query.  Mostly here to make things neater elsewhere.
	//$table  -> Name of the table to insert into
	//$fields -> List of attributes to populate
	//$values -> Values that will populate the new row
	//RETURN  -> A mysql insert query in the form of:
	//					 "INSERT INTO <table> (<fields>) VALUES (<values>)"
	//NOTE: This function DOES NOT actually EXECUTE the query, only gives a
	//			string to be used elsewhere.
public function buildInsertQuery($table = '', $data = array()) {
	$fields = '';
	$values = '';

	foreach ($data as $field => $value) {
			if($value !== null) { // skip unset fields
				$fields .= "`".$field . "`, ";
				$values .= $this->quoteString($value) . ", ";
			}
		}

		 // cut off the last ', ' for each
		$fields = substr($fields, 0, -2);
		$values = substr($values, 0, -2);

		$query = sprintf("INSERT INTO `%s` (%s) VALUES (%s);",
			$table,
			$fields,
			$values
			);

		return ($query);
	}

	public function buildUpdateQuery($table = '', $data = array(), $id=0) {
		$all_null = true;
		$query = "UPDATE `" . $table . "` SET `";

		foreach ($data as $field => $value) {
			if($value === null) {
				$query .= $field . "` = NULL, `";
			} else {
				$query .= $field . "` = " . $this->quoteString($value) . ", `";
				$all_null = false;
			}
		}

		$query = substr($query, 0, -3); // cut off the last ', `'
		$query .= " WHERE id = '" . $id . "';";

		// only return a real query if there's something to update
		if($all_null)
			return '';
		else
			return ($query);
	}

	//Get the ID of the last row inserted into the database.  Useful for getting
	//the id of a new object inserted using AUTO_INCREMENT in the db.
	//RETURN -> The ID of the last inserted row
	public function getLastInsertID() {
		$query = "SELECT LAST_INSERT_ID() AS id";
		$result = mysqli_query($this->conn, $query);
		if(!$result)
			die('Invalid query.');

		$row = mysqli_fetch_assoc($result);
		return ($row['id']);
	}

}
