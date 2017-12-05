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
    tt.num_title, tit.name
FROM
    (title tit, Team_has_title tt)
    JOIN Team t ON (t.id = tt.Team_id)
    AND (tt.title_id = tit.id)
    WHERE t.name LIKE '%".$team."%'";
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
<th>Title</th>
<th>Number of times won</th>
</tr>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))  
  {
  echo "<tr>";
  echo "<td>" . $row[name] ."</td>";
  echo "<td>" . $row[num_title] . "</td>";
  echo "</tr>";
  }
echo "</table>";
mysqli_free_result($result);
mysqli_close($conn);
?>

<p>
<hr>

<p>
<a href="team.txt" >Contents</a>
of the PHP program that created this page.   
 
</body>
  </center>
</html>
