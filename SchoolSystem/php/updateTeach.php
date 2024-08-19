<?php

// open the connection to the database
include 'openConn.php';


$query = mysqli_query($conn, "UPDATE teachers SET email = '$_POST[email]' where id = '$_POST[id]'") or die(mysqli_error($conn));
$row = mysqli_affected_rows($conn) or die(mysqli_error($conn) . "<script>
                alert('An error occurred. Could not update the data');
                window.location.href='../updateTeachers.php';
            </script>");

if (!empty($row)) {
    echo "<script>
                alert('email is updated successfully');
                window.location.href='../homepage.php';    
          </script>";
}

// close the connection
include 'closeConn.php';
?>