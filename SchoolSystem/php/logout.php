<?PHP

session_start();
session_destroy();
header ('location: ../TeachLogIn.php' );

?>