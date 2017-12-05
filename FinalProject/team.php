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
  
$team = $_POST['team'];

$team = mysqli_real_escape_string($conn, $team);
// this is a small attempt to avoid SQL injection
// better to use prepared statements

$query = "SELECT 
    p.name, pos.position
FROM
    (Player p, Player_has_Position pp, Position pos)
    JOIN Team t ON (t.id = p.Team_id)
    AND (pos.pos_code = pp.Position_pos_code)
    AND (p.name = pp.Player_name)
    WHERE t.id LIKE '%".$team."%'";

?>

<p>
The query:
<p>
<?php
print $query;
?>

<hr>
<p>
print $team:
<p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
print " ==========================";
print "\n";
print " Players";
print "\n";
print " ==========================";
print "\n";

while($row = mysqli_fetch_array($result, MYSQLI_BOTH))  
  {
    print "\n";
    print " -------------------------";
    print "$row[Player] | $row[Position]";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

<p>
<hr>

<p>
<a href="team.txt" >Contents</a>
of the PHP program that created this page. 	 
 
</body>
</html>
	  
