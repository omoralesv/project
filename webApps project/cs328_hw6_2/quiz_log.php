<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="lab4b.css">
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
	
	$q1= strip_tags($_POST['q1']);
	$q2 = strip_tags($_POST['q2']);
	$q3 = strip_tags($_POST['q3']);
	$q4 = strip_tags($_POST['q4']);
	$q5 = strip_tags($_POST['q5']);
	$q6 = strip_tags($_POST['question6']);
	$fname = strip_tags($_POST['fname']);
	$lname = strip_tags($_POST['lname']);
	$score = strip_tags($_POST['quizScore']);
	
	
	
        $empl_query_str = "INSERT INTO quiz
					values('$fname','$lname','$q1','$q2','$q3','$q4','$q5','$q6','$score',sysdate)";
        
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
				<h3>Click <a href="project2.html">Here<br></a> to return to main page.</h3>
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