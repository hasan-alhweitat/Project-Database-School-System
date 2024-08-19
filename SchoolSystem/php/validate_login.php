<?php


// open the connection to the database
include 'openConn.php';

if (!empty($_POST['email'])) { //checking the 'email' which is from TeachLogIn.php, is it Teachty or have some text 
    $query = mysqli_query($conn, "SELECT * from teachers where email ='$_POST[email]'") or die(mysqli_error());
    $row = mysqli_fetch_array($query) or die(mysqli_error($conn) . "<script>
                                                                            alert('wrong email ');
                                                                            window.location.href='../TeachLogIn.php';
                                                                     </script>");


    if (!empty($row['email'])) {
        session_start(); //starting the session for user profile page 
        $_SESSION['id'] = $row['id'];
        $_SESSION['first_name'] = $row['first_name'];
        $_SESSION['last_name'] = $row['last_name'];

        header('location: ../homepage.php');
    }
}


// close the connection
include 'closeConn.php';
?>