<html>
  <head>
    <title>GSA Tech Test</title>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  </head>
  <body>
<?php
  /*
    Part One

    Establish a connection to the following database using PDO or mysqli.

  */

  $servername = "hostdb.example.com";
  $username = "testuser";
  $password = "testpassword";
  $databasename = "testdbname";

  // Create connection
  $conn = new mysqli($servername, $username, $password, $databasename);

  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  }
  echo "Connected successfully";


  /*
    Part Two

    Using the tables in the database, write a query that finds the sum of the conversation minutes for each company in 2015 and returns these fields:
    company ID, company name, priority, total minutes
  */

  $sql = " SELECT `ID`, `CompanyName`, `Priority` , convo.total_minutes
            FROM `testdbname`.`tblCustomerCompanies` as companies
            JOIN (
            	SELECT SUM(minutes) as total_minutes, `companyID`
            	FROM `testdbname`.`tblCustomerConversation`
            	WHERE `minutes` IS NOT NULL
            	AND year(`date`) = '2015'
            	GROUP BY `companyID`
            ) convo ON convo.companyID = companies.ID ";

/*
    Part Three

    Loop through the results from your query to build a table with the results.

*/


  echo "<table id='table'>
          <thead>
            <tr>
              <th>Company Name</th>
              <th>Priority</th>
              <th>Minutes</th>
            </tr>
          </thead>
          <tbody>";
          $result = mysqli_query($conn, $sql);

          if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "ID: " . $row["ID"]. " - Company Name: " . $row["CompanyName"]. " - Priority" . $row["Priority"]. " - Total Minutes: ". $row["total_minutes"]. "<br>";
              }
          } else {
              echo "0 results";
          }
  echo "</tbody></table>";
?>
    <!--
      Part Four

      Write some css to change the background color of the odd rows to #eeeeee
    -->

    <style>
        tr:nth-child(odd) {
        background-color: #eeeeee;
      }
    </style>

    <!--
      Part Five

      Using javascript/jQuery, change the minutes in the table to the form "#h #m". For example, 365 minutes would display as "6h 5m".
    -->
    <script type="text/javascript">
      $("tr").each(function() {
          var value = $(this).text(); //get table row as an array

          var hours = Math.floor( value[3] / 60);      // get hours as a whole number, from the Minutes column in table
          var minutes = value[3] % 60; //get remaining minutes
          var full_time = hours + "h " + minutes + "m"; //concatenate to proper format
          $(value[3]).append(full_time); // overwrite table cell
      })
    </script>
  </body>
</html>
