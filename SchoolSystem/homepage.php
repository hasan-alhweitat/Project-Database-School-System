<?php
session_start(); //starting the session for user profile page 
?>
<html lang = "en-US">
    <head>
        <title>main.html</title>
        <link rel = "stylesheet" type = "text/css" href = "./css/bootstrap.css"/>
        <link rel = "stylesheet" type = "text/css" href = "./css/homepage.css"/>

	</head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="#"> School System </a>   
            <a class="navbar-brand" href="./php/logout.php"><h6>Logout </h5></a>   

        </nav>    

        <!-- content -->
        <div class='col-10'>
            <div class="col-5">
                <legend> Welcome <?php
                    if (isset($_SESSION['first_name']) & isset($_SESSION['last_name'])) {
                        echo " " . $_SESSION['first_name'] . " " . $_SESSION['last_name'];
                    }?>
				</legend>
            </div>
        </div>
		 <div class='col-10'>
            <div class="col-5">
				<a href= "./addTeachers.php">  Add Teachers </a> <br>
				<a href= "./deleteTeachers.php"> Delete Teachers </a> <br>
				<a href= "./showTeachers.php">  Show Teachers </a> <br>
				<a href= "./updateTeachers.php"> Update Teachers </a> <br>								
            </div>
        </div>

</body>
</html>