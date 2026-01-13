<?php
// Test database connection and show tables
$servername = "localhost";
$username = "root";
$password = ""; // Default WampServer root password is empty
$dbname = "gamestore_db";

try {
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }

    echo "Connected to database successfully!<br><br>";

    // Get all tables
    $result = $conn->query("SHOW TABLES");

    if ($result->num_rows > 0) {
        echo "Tables in gamestore_db:<br>";
        while($row = $result->fetch_array()) {
            echo "- " . $row[0] . "<br>";
        }
    } else {
        echo "No tables found.";
    }

    // Check if tables have data
    $tables = ['games', 'about_us', 'platforms', 'services', 'feedback'];
    foreach ($tables as $table) {
        $result = $conn->query("SELECT COUNT(*) as count FROM $table");
        if ($result) {
            $row = $result->fetch_assoc();
            echo "<br>$table table has " . $row['count'] . " records.";
        }
    }

} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
    echo "<br><br>Possible fixes:<br>";
    echo "1. Make sure WampServer is running (Apache and MySQL services).<br>";
    echo "2. Check if MySQL root password is empty (default).<br>";
    echo "3. Run the create_database.sql script manually in phpMyAdmin.<br>";
}

$conn->close();
?>
