<?php

// open the connection to the database
include './openConn.php';



if ($query = mysqli_query($conn, "INSERT INTO teachers(id, f_name, l_name, email, id_school) VALUES ('$_POST[id]','$_POST[f_name]','$_POST[l_name]','$_POST[email]','$_POST[id_school]' )") or die(mysqli_error($conn))) {
    $row = mysqli_affected_rows($conn) or die(mysqli_error($conn) . "<script>   alert('An error occurred');
																				window.location.href='../addTeachers.php';
																	</script>");
    if (!empty($row)) {
         echo "<script>
               alert('a new teachers is added successfully');
               window.location.href='../homepage.php';
            </script>";
    }
}


// close the connection
include 'closeConn.php';
?>
