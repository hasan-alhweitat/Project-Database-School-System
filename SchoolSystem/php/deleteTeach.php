<?php

// open the connection to the database
include './openConn.php';

//get data from teachers
$query = mysqli_query($conn, "DELETE FROM teachers WHERE id= '$_POST[id]'");
$row = mysqli_affected_rows($conn) or die(mysqli_error($conn) . "<script>
                alert('An error occurred. Could not delete the data!');
                window.location.href='../deleteTeachers.php';
            </script>");

if (!empty($row)) {
    echo "<script> alert('Teachers is deleted successfully'); window.location.href='../homepage.php'; </script>";
}

// close the connection
include 'closeConn.php';
?>