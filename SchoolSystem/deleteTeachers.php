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
        </nav>    

        <!-- content -->
        <div class='col-10'>
            <legend>  Delete Teachers Page  	</legend>
	
            <form action="./php/deleteTeach.php"  method="POST">
			    <label> First Name </label> <br>
                <input name = "f_name" type="text" placeholder="First Name" class="form-control"/><br><br>
                    
				<label> Last Name </label> <br>
				<input name = "l_name" type="text" placeholder="Last Name" class="form-control"/><br><br>
                    
				<label> ID </label><br>
				<input name = "id" type="text" placeholder="ID" class="form-control"/><br><br>
                    
							
                <button type="submit"> Delete Teachers By ID </button> 
                </form>
		</div>

</body>
</html>