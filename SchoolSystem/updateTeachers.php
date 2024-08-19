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
            <a class="navbar-brand" href="./php/logout.php"><h6> Logout </h5></a>   
        </nav>    

        <!-- content -->
        <div class='col-10'>
            <legend> Update Teachers Page  	</legend>
	
            <form action="./php/updateTeach.php"  method="POST">

				<label> ID </label><br>
				<input name = "id" type="text" placeholder="ID" class="form-control"/><br><br>
                   
				<label> Email </label> <br>
				<input name = "email" type="text" placeholder="Email" class="form-control"/><br><br>
        
							
                <button type="submit"> Update Teachers By ID </button> 
                </form>


</div>
            </div>
        </div>

</body>
</html>