<?php
include('connectionData.txt');
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');
?>

<html>
  <center>
<head>
  <title>Team Players</title>
  </head>
  
  <body bgcolor="white">
  
  
  <hr>
  
  
<?php
  
$team = $_POST['team'];
$team = mysqli_real_escape_string($conn, $team);
// this is a small attempt to avoid SQL injection
// better to use prepared statements
$query = "SELECT 
    p.name as Players, t.maneger, t.City_name
FROM
    (Player p)
        JOIN
    Team t ON (t.id = p.Team_id)
    WHERE t.name LIKE '%".$team."%';";
?>




<hr>
<?php
print $team;
?>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));
 

echo "<table border='1'>
<tr>
<th>Players</th>
</tr>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))  
  {
    $man = "$row[maneger]";
    $cname = "$row[City_name]";

  echo "<tr>";
  echo "<td>" . $row[Players] ."</td>";;
  echo "</tr>";
  }
echo "</table>";
    
print "Maneger:" ." ". $man;
print "<br>City:" ." ". $cname;
    
mysqli_free_result($result);
mysqli_close($conn);

?>

<p>
<hr>

<p>
<a href="teamsum.txt" >Contents</a>
of the PHP program that created this page.   
 
</body>
  </center>
</html>
