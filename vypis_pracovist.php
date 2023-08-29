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
$query = "  SELECT nazev_kancelare, popis, budovy, p.id, p.bid
            FROM pracoviste p, seznam_budov sb
            WHERE p.bid='".$_GET['bid']."' AND sb.id ='".$_GET['bid']."' 
            ORDER BY nazev_kancelare desc";

            

$result = mysqli_query($connection, $query);
$row = mysqli_fetch_assoc($result);
echo " <h1>Seznam pracovišť uvnitř  ".$row['budovy']."</h1><br>";

$result = mysqli_query($connection, $query, MYSQLI_USE_RESULT);





echo "<p>";
while($row = mysqli_fetch_array($result)){


echo "<a href='vypis_zamestnancu_pracoviste.php?id={$row['id']}&bid={$row['bid']}&fid={$_GET['fid']}'>".$row['nazev_kancelare']."</a><br>".$row['popis']."<br><br>";



}
echo "</p>";
echo "<a href='vypis_budov.php?id={$_GET['fid']}'>Zpět na výpis budov</a>";
echo "<br><br><br><a href='firmaphp.php'>Rozcestník</a>";
}

mysqli_close($connection);





?>

</body>
</html>



