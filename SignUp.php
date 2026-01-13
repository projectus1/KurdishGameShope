<?php
$conn = new mysqli("localhost", "root", "", "gamestore");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $email        = trim($_POST["email"] ?? '');
    $pass         = $_POST["pass"] ?? '';
    $confirm_pass = $_POST["confirm_pass"] ?? '';

    if (empty($email) || empty($pass) || empty($confirm_pass)) {
        die("All fields are required.");
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Invalid email format.");
    }

    if ($pass !== $confirm_pass) {
        die("Passwords do not match.");
    }

    $hashed_password = password_hash($pass, PASSWORD_DEFAULT);

    // check if email exists
    $check = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $check->bind_param("s", $email);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        die("Email already registered.");
    }
    $check->close();

    // insert user
    $stmt = $conn->prepare(
        "INSERT INTO users (email, password) VALUES (?, ?)"
    );
    $stmt->bind_param("ss", $email, $hashed_password);

    if ($stmt->execute()) {
        header("Location: GameStore1.html");
        exit();
    } else {
        die("Error: " . $conn->error);
    }

    $stmt->close();
}

$conn->close();
