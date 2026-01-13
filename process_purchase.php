<?php
header('Content-Type: application/json');

// Database connection
$servername = "localhost";
$username = "root";
$password = ""; // Default WampServer root password
$dbname = "gamestore_db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Database connection failed']);
    exit();
}

// Get POST data
$user_email = $_POST['user_email'] ?? '';
$item_name = $_POST['item_name'] ?? '';
$item_type = $_POST['item_type'] ?? '';
$price = $_POST['price'] ?? 0;

if (empty($user_email) || empty($item_name) || empty($item_type)) {
    echo json_encode(['success' => false, 'message' => 'Missing required data']);
    exit();
}

// Insert purchase
$stmt = $conn->prepare("INSERT INTO purchases (user_email, item_name, item_type, price) VALUES (?, ?, ?, ?)");
$stmt->bind_param("sssd", $user_email, $item_name, $item_type, $price);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Purchase recorded successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to record purchase']);
}

$stmt->close();
$conn->close();
?>
