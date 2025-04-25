<?php
header('Content-Type: application/json');
ini_set('display_errors', 1);
error_reporting(E_ALL);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $servername = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "sk";

    $conn = new mysqli($servername, $dbUsername, $dbPassword, $dbname);

    if ($conn->connect_error) {
        echo json_encode(["success" => false, "error" => "Database connection failed."]);
        exit;
    }

    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    $stmt = $conn->prepare("SELECT username, password FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($storedUsername, $storedPassword);
        $stmt->fetch();

        if (password_verify($password, $storedPassword)) {
            echo json_encode(["success" => true]);
        } else {
            echo json_encode(["success" => false, "error" => "Incorrect password."]);
        }
    } else {
        echo json_encode(["success" => false, "error" => "Email not found."]);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["success" => false, "error" => "Invalid request method."]);
}
?>
