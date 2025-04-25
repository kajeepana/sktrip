<?php
header('Content-Type: application/json');  // Set the response type to JSON
ini_set('display_errors', 1);              // Enable error reporting for debugging
error_reporting(E_ALL);                    // Report all errors

// Check if the form is submitted via POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and retrieve the input data
    $name = isset($_POST['name']) ? trim($_POST['name']) : '';
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $message = isset($_POST['message']) ? trim($_POST['message']) : '';

    // Validate required fields
    if (empty($name) || empty($email) || empty($message)) {
        echo json_encode(["success" => false, "error" => "All fields are required."]);
        exit;
    }

    // Validate email address using a simple regex pattern
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(["success" => false, "error" => "Please enter a valid email address."]);
        exit;
    }

    // Database connection settings
    $servername = "localhost"; // Database server (usually localhost)
    $username = "root";        // Database username (update with your own)
    $password = "";            // Database password (update with your own)
    $dbname = "sk";           // Database name (update with your own)

    // Create database connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        echo json_encode(["success" => false, "error" => "Database connection failed: " . $conn->connect_error]);
        exit;
    }

    // Prepare and bind the SQL query to insert data into the database
    $stmt = $conn->prepare("INSERT INTO contacts (name, email, message) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $name, $email, $message);

    // Execute the query and check if the insertion was successful
    if ($stmt->execute()) {
        // If successful, return a success message in JSON format
        echo json_encode(["success" => true, "message" => "Your message has been sent successfully."]);
    } else {
        // If the insertion fails, return an error message in JSON format
        echo json_encode(["success" => false, "error" => "Failed to send your message. Please try again later."]);
    }

    // Close the statement and the connection
    $stmt->close();
    $conn->close();
} else {
    // If not a POST request, return an error message in JSON format
    echo json_encode(["success" => false, "error" => "Invalid request method."]);
}
?>
