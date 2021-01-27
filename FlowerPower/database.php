<?php  

class database{

    // properties
    private $host;
    private $dbh;
    private $user;
    private $pass;
    private $db;

    function __construct(){
        $this->host = 'localhost';
        $this->user = 'root';
        $this->pass = '';
        $this->db = 'flowerpower';

        try{
            $dsn = "mysql:host=$this->host;dbname=$this->db"; 
            $this->dbh = new PDO($dsn, $this->user, $this->pass);
        }catch(PDOException $e){
            
            die("Unable to connect: " . $e->getMessage());
        }
    }

    public function addFirstUser(){

        $sql = "INSERT INTO users VALUES (:id, :username, :password, :created_at, :updated_at)";

        $statement = $this->dbh->prepare($sql); 

        $statement->execute([
            'id'=>NULL, 
            'username'=>'mark',
            'password'=>password_hash('mark', PASSWORD_DEFAULT), 
            'created_at'=>date("Y-m-d H:i:s"), 
            'updated_at'=>date("Y-m-d H:i:s")
        ]);
    }


}

?> 