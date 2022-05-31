<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
</head>

<!--
    adapted from an example by Peter Johnson
    adapted by: Sharon Tuttle
    last modified: 2018-03-08
-->
<body>
 <?php
	
        // I am a little paranoid -- I'm stripping
        //    tags from the username

        $username = strip_tags($_POST['username']);

        // the ONLY thing I am doing with this is
        //    trying to log in -- so I HOPE this is OK

        $password = $_POST['password'];

        // set up connection string
	
        $db_conn_str =
            "(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)
                                       (HOST = cedar.humboldt.edu)
                                       (PORT = 1521))
                            (CONNECT_DATA = (SID = STUDENT)))";

        // let's try to connect and log into Oracle using this

        $conn = oci_connect($username, $password, $db_conn_str);

        // exiting if connection/log in failed

        if (! $conn)
        {
            ?>
            <p> Could not log into Oracle, sorry </p>

            <?php
            exit;
        }

        // if I get here -- I connected!
	$password = NULL; // I won't be using this anymore
	
	$fname = strip_tags($_POST['fname']);
	$lname = strip_tags($_POST['lname']);
	$address = strip_tags($_POST['address']);
	$city = strip_tags($_POST['city']);
	$state = strip_tags($_POST['state']);
	$telephone = strip_tags($_POST['telephone']);
	$email = strip_tags($_POST['email']);
	$bName = strip_tags($_POST['buildingName']);
	$height = strip_tags($_POST['height']);
	$rooms = strip_tags($_POST['rooms']);
	$description = strip_tags($_POST['description']);
	
	
        $empl_query_str = "INSERT INTO arch
					values('$fname','$lname','$address','$city','$state','$telephone','$email',
							'$bName','$height','$rooms','$description',sysdate)";
        
	$empl_query_stmt = oci_parse($conn, $empl_query_str);
	if(oci_execute($empl_query_stmt, OCI_DEFAULT)=== TRUE)
		{
			$empl_query_str = "COMMIT";
			$empl_query_stmt = oci_parse($conn, $empl_query_str);
			oci_execute($empl_query_stmt, OCI_DEFAULT);
			
			?>
			<center>
				<header>Thank you</header>
				<h2><?php echo $fname  . " " . $lname?>
				<br>
				<h2>Your form has been successfully submitted</h2>
				<br>
				<h3>Click <a href="arch.html">Here<br></a> to return to main page.</h3>
			</center>
			
			<?php
		}
	else
		echo "Error". $empl_query_str . "<br>" . $conn ->error;
        
	//oci_execute($empl_query_stmt, OCI_DEFAULT);
      
             // FREE your statement, CLOSE your connection!

             oci_free_statement($empl_query_stmt);
             oci_close($conn);
    

?>  
</body>
</html>