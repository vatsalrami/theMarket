<?php
class searchUtil{
	public static $loginUser = "root"; 
	public static $loginPass = "admin";
	public static $host = "localhost:3306"; // local host
	public static $schema = "theMarket"; // DB Schema
	
	public static function loginConnection(){
		$db = new mysqli(searchUtil::$host, searchUtil::$loginUser, searchUtil::$loginPass, searchUtil::$schema);
	
		if($db->connect_errno){
			echo("Could not connect to db");
			$db->close();
			exit();
		}
		
		return $db;
	}
	
}
?>