<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tagsdb";

$connection = new mysqli($servername, $username, $password, $dbname);
$sqlCreateTable = "
    CREATE TABLE IF NOT EXISTS tags (
        id INT AUTO_INCREMENT PRIMARY KEY,
        tag VARCHAR(255) NOT NULL UNIQUE,
        tag_order INT
    )
";
if ($connection->query($sqlCreateTable) !== TRUE) {
    die("Error creating table: " . $connection->error);
}

$tag = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $tag = $connection->real_escape_string($_POST["tag"]);

    $sqlCheck = "SELECT COUNT(*) AS tag_count FROM tags WHERE BINARY tag = '$tag'";
    $resultCheck = $connection->query($sqlCheck);
    $rowCheck = $resultCheck->fetch_assoc();

    if ($rowCheck['tag_count'] > 0) {
        echo "Tag '$tag' already exists. Please choose a different tag.";
    } else {
        $sqlCount = "SELECT COUNT(*) AS row_count FROM tags";
        $resultCount = $connection->query($sqlCount);
        $row = $resultCount->fetch_assoc();
        $tag_order = $row['row_count'] + 1;

        $sqlInsert = "INSERT INTO tags (tag, tag_order) VALUES ('$tag', $tag_order)";
        if (!$connection->query($sqlInsert)) {
            die("Error inserting tag: " . $connection->error);
        }

        $tag = "";
        header("Location: /tagsdb/index.php");
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tags List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container my-5">
        <h2>Tags List</h2>
        <form method="post">
            <div class="mb-3">
                <label for="tag" class="form-label">Tag</label>
                <input type="text" class="form-control" name="tag" id="tag" value="<?php echo htmlspecialchars($tag); ?>">
            </div>
            <button type="submit" class="btn btn-primary">Add</button>
        </form>
        <br>
        <div class="grid-container">
            <?php
            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "tagsdb";

            $connection = new mysqli($servername, $username, $password, $dbname);
            if ($connection->connect_error) {
                die("Connection failed: " . $connection->connect_error);
            }

            $sql = "SELECT * FROM tags ORDER BY tag_order ASC";
            $result = $connection->query($sql);

            if (!$result) {
                die("Invalid query: " . $connection->error);
            }

            while ($row = $result->fetch_assoc()) {
                echo <<<HTML
                    <div class="cell" draggable="true" data-id="{$row['id']}" data-order="{$row['tag_order']}">
                        {$row['tag']}
                        <a class="btn btn-danger" href="/tagsdb/delete.php?id={$row['id']}" role="button">
                            <i class="fa fa-trash-o" style="font-size:20px;"></i>
                        </a>
                    </div>
                HTML;
            }
            ?>
        </div>
    </div>
    <script src="script.js" defer></script>
</body>
</html>
