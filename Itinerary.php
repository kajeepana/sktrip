<?php
// Server config
$host = "localhost";
$dbname = "sk";
$username = "root";
$password = "";

// Get form data
$destination = $_POST['destination'] ?? '';
$start_date = $_POST['start_date'] ?? '';
$end_date = $_POST['end_date'] ?? '';
$activities = $_POST['activities'] ?? '';

// Validation
if (empty($destination) || empty($start_date) || empty($end_date)) {
    echo "Please fill in all required fields.";
    exit;
}

if (strtotime($start_date) > strtotime($end_date)) {
    echo "Start date cannot be after end date.";
    exit;
}

try {
    // Create connection
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Insert query
    $sql = "INSERT INTO trip (destination, start_date, end_date, activities) 
            VALUES (:destination, :start_date, :end_date, :activities)";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':destination', $destination);
    $stmt->bindParam(':start_date', $start_date);
    $stmt->bindParam(':end_date', $end_date);
    $stmt->bindParam(':activities', $activities);

    $stmt->execute();

    echo "<script>alert('Trip saved to database successfully!'); window.location.href = 'All.html';</script>";

} catch (PDOException $e) {
    echo "Database error: " . $e->getMessage();
}
?>