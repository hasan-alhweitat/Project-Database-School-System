<?php
session_start(); //starting the session for user profile page 

function getTeachers(){
	// open the connection
	include './php/openConn.php';

	$sql = "SELECT * FROM teachers";
	$result = $conn->query($sql);
	$count_line = 1;
	if (!$result) {
		echo'Could not connect: ' . mysql_error();
	} else {
			while ($row = $result->fetch_array(MYSQLI_NUM)) {
				echo "<tr class='table-success'>";
				echo "<td>";
				echo $row[0];
				$count_line++;
				echo "</td>";
				
				echo "<td>";
				echo $row[1];
				$count_line++;
				echo "</td>";

				echo "<td>";
				echo $row[2];
				$count_line++;
				echo "</td>";

				echo "<td>";
				echo $row[3];
				$count_line++;
				echo "</td>";

				echo "<td>";
				echo $row[4];
				$count_line++;
				echo "</td>";
				
                echo " </tr>";
        }
    }

    // close the connection
    include './php/closeConn.php';
}
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
        <legend> View All Teachers  </legend>
		
		<div class='row'>
		<table  class="table table-hover">
		 <thead>
            <tr>
                <th scope="col"> ID </th>
                <th scope="col"> First Name </th>
                <th scope="col"> Last Name </th>
                <th scope="col"> Email </th>
                <th scope="col"> ID_school </th>
            </tr>
			</thead>
			
		    <tbody>
                <?php getTeachers() ?> 
            </tbody>
		</table>
		</div>

</div>


</body>
</html>