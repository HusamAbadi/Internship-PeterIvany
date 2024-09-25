<?php
if (isset($_GET["id"])) {
    $id = $_GET["id"];

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "tagsdb";

    $connection = new mysqli($servername, $username, $password, $dbname);
    if ($connection->connect_error) {
        die("Connection failed: " . $connection->connect_error);
    }
    
    $sql = "DELETE FROM tags WHERE id=$id";
    $result = $connection->query($sql);
    $connection->close();
}

header("location: /tagsdb/index.php");
exit;
?>