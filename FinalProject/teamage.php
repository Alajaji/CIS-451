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
$age = $_POST['age'];
$team = mysqli_real_escape_string($conn, $team);
$age = mysqli_real_escape_string($conn, $age);

// this is a small attempt to avoid SQL injection
// better to use prepared statements
$query = "SELECT 
    p.name, p.age
FROM
    Player p 
    JOIN  Team t ON (t.id = p.Team_id)
WHERE
    t.name LIKE '%".$team."%' AND p.age > $age";
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
<th>Age</th>
</tr>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))  
  {
  echo "<tr>";
  echo "<td>" . $row[name] ."</td>";
  echo "<td>" . $row[age] . "</td>";
  echo "</tr>";
  }
echo "</table>";
mysqli_free_result($result);
mysqli_close($conn);
?>

<p>
<hr>

<p>
<a href="teamage.txt" >Contents</a>
of the PHP program that created this page.   
 
</body>
  </center>
</html>