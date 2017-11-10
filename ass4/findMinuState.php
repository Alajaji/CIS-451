<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Another Simple PHP-MySQL Program</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php
  
$manu_code = $_POST['state'];

$manu_code = mysqli_real_escape_string($conn, $manu_code);
// this is a small attempt to avoid SQL injection
// better to use prepared statements

$query = "SELECT 
    s.description,
    CONCAT( '$', IF (SUM(i.total_price) IS NULL, 0.00, SUM(i.total_price))) AS total_spent
FROM
    (customer c,
    stock s,
    orders o)
         LEFT OUTER JOIN 
    items i ON (s.stock_num = i.stock_num)
        AND (s.manu_code = i.manu_code)
        AND (o.order_num = i.order_num)
        AND (c.customer_num = o.customer_num)
WHERE
    s.manu_code LIKE '%".$manu_code."%'
    GROUP BY description";

?>

<p>
The query:
<p>
<?php
print $query;
?>

<hr>
<p>
Result of query:
<p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
print " ==========================";
print "\n";
print " description | total_spent ";
print "\n";
print " ==========================";
print "\n";

while($row = mysqli_fetch_array($result, MYSQLI_BOTH))  
  {
    print "\n";
    print " -------------------------";
    print "$row[description] | $row[total_spent]";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

<p>
<hr>

<p>
<a href="findManuState.txt" >Contents</a>
of the PHP program that created this page. 	 
 
</body>
</html>
	  
