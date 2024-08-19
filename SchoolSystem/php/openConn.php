<?php

$servername = "localhost";
$username = "teachers";
$password = "4453";
$dbname = "school_system";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>