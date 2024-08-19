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
            <legend>Add New Teachers Page  	</legend>
	
            <form action="./php/addTeach.php"  method="POST">
			    <label> ID </label> <br>
                <input name = "id" type="text" placeholder="ID" class="form-control"/><br><br>
                    
			    <label> First Name </label> <br>
                <input name = "f_name" type="text" placeholder="First Name" class="form-control"/><br><br>
                    
				<label> Last Name </label> <br>
				<input name = "l_name" type="text" placeholder="Last Name" class="form-control"/><br><br>
                    
				<label> ID_school </label><br>
				<input name = "id_school" type="text" placeholder="ID_school" class="form-control"/><br><br>
                     
				<label> Email </label><br>
				<input name = "email" type="email" placeholder="Email" class="form-control"/><br><br>

				</select>				
                <button type="submit"> Add Teachers </button> 
                </form>


</div>


</body>
</html>