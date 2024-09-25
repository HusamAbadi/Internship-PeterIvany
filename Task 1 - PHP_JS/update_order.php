<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tagsdb";

$connection = new mysqli($servername, $username, $password, $dbname);

if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

$data = json_decode(file_get_contents("php://input"), true);
//* file_get_contents("php://input"): This function reads the raw POST data from the request body.
//* json_decode(..., true): This function decodes the JSON data into a PHP associative array. The true parameter specifies that the result should be an associative array, not an object.
//* $data: This variable now holds the decoded associative array from the JSON input.


foreach ($data as $order => $id) {
    //* foreach ($data as $order => $id): This loop iterates over each key-value pair in the $data array.
    //* $order: This variable holds the new order position.
    //* $id: This variable holds the ID of the tag.

    $sql = "UPDATE tags SET tag_order = $order WHERE id = $id";
    //* Updates the tag_order column in the tags table.
    //* SET tag_order = $order: Sets the tag_order column to the value of $order.
    //* WHERE id = $id: This part specifies that the update should be applied to the row where the id column matches the value of $id.
    
    $connection->query($sql);
}

$connection->close();
?>