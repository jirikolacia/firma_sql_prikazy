<!DOCTYPE html>
<html lang="cs">

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="styl.css" type="text/css" />
    <link rel="stylesheet" href="css/lightbox.min.css" type="text/css" media="screen" />
    <title>Moje první webová stránka</title>
</head>
  
  <body>
  <main>

</main>
<?php
{ 
$srv = "localhost";
$user = "root";
$psw = "";
$db = "firma";


$connection = mysqli_connect($srv, $user, $psw,$db);
$query = "  SELECT budovy, umisteni, sb.id, f.id as fid, f.nazev 
            FROM seznam_budov sb, firma f
            WHERE f.id='".$_GET['id']."' AND sb.firmaid ='".$_GET['id']."' ";

            
$result = mysqli_query($connection, $query);
$row = mysqli_fetch_assoc($result);
echo " <h1>Seznam budov ve firmě  ".$row['nazev']."</h1><br>";
echo "Pro rozkliknutí pracovišť v jednotlivých budovách použijte klikatelné odkazy se jménem budov.<br><br><br>";




$result = mysqli_query($connection, $query, MYSQLI_USE_RESULT);

while($row = mysqli_fetch_array($result)){

echo "<a href='vypis_pracovist.php?bid={$row['id']}&fid={$row['fid']}'>".$row['budovy']."</a><br>";



//echo "<td>  <a href='vypis_budov.php?id={$row['id']}'>  ".$row["nazev"]."    </a></td>   <br>";



}
echo "<br><br><a href='ofirme.php?id={$_GET['id']}'>O firmě</a>";
echo "<br><a href='firmaphp.php'>Rozcestník</a>";


}

mysqli_close($connection);





?>

</body>
</html>



