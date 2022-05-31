<!DOCTYPE html>

<!--
    adapted from an example by Peter Johnson
    adapted by: Sharon Tuttle
    last modified: 2018-03-08
-->

<head>
    <title> Connecting to Oracle! </title>
    <link rel="stylesheet" href="lab4b.css">
</head> 

<body>
<div id="container">
		<nav>
			<h1> <u>Links</u> </h1>
			<a href="admin.php">Admin Data</a>
			<br><br>
			<a href="project2.html">Main Page</a>
			</nav>
			<div id="leftside">
			</div>
<main>
<header style="padding: 0 0 50px"> Admin Login </header>

<?php
    // do you need to ask for username and password?

    if ( ! array_key_exists("username", $_POST) )
    {
        // no username in $_POST? they need a login form!
        ?>
  
        <form method="post" 
              action="<?= htmlentities($_SERVER['PHP_SELF'], ENT_QUOTES) ?>">
        <fieldset>
            <legend> Please enter Oracle username/password: </legend>

            <label for="username"> Username: </label>
            <input type="text" name="username" id="username" /> 
		<br>
            <label for="password"> Password: </label>
            <input type="password" name="password" 
                   id="password" />

            <div class="submit">
                <input type="submit" value="Log in" />
            </div>
        </fieldset>
        </form>
    <?php
    }      

    // otherwise, handle the submitted login form 
    //    (or try to) -- and show the user some
    //    lovely employee information

    else
    {
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

</main>
</body>
</html>

            <?php
            exit;
        }

        // if I get here -- I connected!

        $password = NULL; // I won't be using this anymore

        // let's set up a SQL SELECT statement and ask the
        //     data tier to execute it for us

        $empl_query_str = 'select *
                           from quiz';
        $empl_query_stmt = oci_parse($conn, $empl_query_str);

        oci_execute($empl_query_stmt, OCI_DEFAULT);
        ?>

        <table>
            <h2 style="padding: 0 0 50px"> User Submissions </h2>
            <tr> <th scope="col" style="padding: 0 9px 0"> First Name </th>
                 <th scope="col"style="padding: 0 9px 0"> Last Name </th>
                 <th scope="col"style="padding: 0 9px 0"> Question 1 </th>
                 <th scope="col"style="padding: 0 9px 0"> Question 2 </th>
                 <th scope="col"style="padding: 0 9px 0"> Question 3 </th>
                 <th scope="col"style="padding: 0 9px 0"> Question 4 </th>
                 <th scope="col"style="padding: 0 9px 0"> Question 5 </th>
                 <th scope="col"style="padding: 0 9px 0"> Question 6 </th>
                 <th scope="col"style="padding: 0 9px 0"> Score </th>
                 <th scope="col"style="padding: 0 9px 0"> Date </th>
                 

        <?php
            while (oci_fetch($empl_query_stmt))
            {
                $fname = oci_result($empl_query_stmt, 'FNAME');
                $lname = oci_result($empl_query_stmt, 'LNAME');
                $q1 = oci_result($empl_query_stmt, 'Q1');
                $q2 = oci_result($empl_query_stmt, 'Q2');
                $q3 = oci_result($empl_query_stmt, 'Q3');
                $q4 = oci_result($empl_query_stmt, 'Q4');
                $q5 = oci_result($empl_query_stmt, 'Q5');
                $q6 = oci_result($empl_query_stmt, 'Q6');
                $score = oci_result($empl_query_stmt, 'SCORE');
                $date = oci_result($empl_query_stmt, 'QUIZ_DATE');
                

                

                ?>
                <tr> 
			<td style="padding: 0 9px 0"> <?= $fname?> </td>
			<td style="padding: 0 9px 0"> <?= $lname?> </td>
			<td style="padding: 0 9px 0"> <?= $q1?> </td>
			<td style="padding: 0 9px 0"> <?= $q2?> </td>
			<td style="padding: 0 9px 0"> <?= $q3?> </td>
			<td style="padding: 0 9px 0"> <?= $q4?> </td>
			<td style="padding: 0 9px 0"> <?= $q5?> </td>
			<td style="padding: 0 9px 0"> <?= $q6?> </td>
			<td style="padding: 0 9px 0"> <?= $score?> </td>
			<td style="padding: 0 9px 0"> <?= $date?> </td>
                     
                </tr> 
                <?php
            }
            ?>
            </table>

            <?php

             // FREE your statement, CLOSE your connection!

             oci_free_statement($empl_query_stmt);
             oci_close($conn);
    }
?>  

</body>
</html>


