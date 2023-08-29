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
$query = "  SELECT z.jmeno, z.prijmeni, po.nazev_pozice, pr.nazev_kancelare, pr.id, z.vek, z.id as zid
            FROM pracoviste pr, zamestnanci z, pozice po
            WHERE pr.id='".$_GET['id']."' AND z.pracoviste = pr.id AND z.pozice = po.id";

            

$result = mysqli_query($connection, $query);
$row = mysqli_fetch_assoc($result);
echo " <h1>Seznam zaměstnanců uvnitř  ".$row['nazev_kancelare']."</h1><br>";

$result = mysqli_query($connection, $query, MYSQLI_USE_RESULT);





echo "<p>";
while($row = mysqli_fetch_array($result)){


echo "<a href='ozamestnanci.php?fid={$_GET['fid']}&bid={$_GET['bid']}&id={$_GET['id']}&zid={$row['zid']}'>".$row['jmeno']." ".$row['prijmeni']."</a>, ".$row['vek']." let na pozici ".$row['nazev_pozice']."<br><br>";



}
echo "</p>";

$result = mysqli_query($connection, $query);
$row = mysqli_fetch_assoc($result);
echo "<a href='vypis_pracovist.php?bid={$_GET['bid']}&fid={$_GET['fid']}'>Zpět na výpis pracovišť</a><br>";
echo "<a href='ozamestnancich.php?fid=&fid={$_GET['fid']}'>Podíl zaměstnanců na pracoviště</a>";

echo "<br><br><br><a href='firmaphp.php'>Rozcestník</a>";



}

mysqli_close($connection);





?>

</body>
</html>



