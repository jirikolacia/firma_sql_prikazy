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

// Creating the connection by specifying the connection details
$connection = mysqli_connect($srv, $user, $psw,$db);

//sql query to select particular columns
//select id and name columns

$query = "  SELECT f.nazev, f.popisek, z.jmeno, z.prijmeni, p.nazev_pozice, f.id 
            FROM firma f, zamestnanci z, pozice p
            WHERE f.id='".$_GET['id']."' AND z.pozice = 1 AND z.pozice = p.id AND z.firma='".$_GET['id']."'";



#get the result
$result = mysqli_query($connection, $query, MYSQLI_USE_RESULT);

while($row = mysqli_fetch_array($result)){

echo "<br>Název je:".$row['nazev'];
echo "<br>Motto:   <i>".$row['popisek']."</i>";
echo "<br>Vedení:  ".$row['nazev_pozice']." ".$row['jmeno']." ".$row['prijmeni']."";


echo "<br><br><br><a href='firmaphp.php'>Rozcestník</a>";
echo "<br><br><br><a href='vypis_budov.php?id={$row['id']}'>Výpis všech budov</a><br>";
echo "<a href='ozamestnancich.php?fid={$row['id']}'>Výpis informací o zaměstnancích</a>";

}


}

mysqli_close($connection);
?>

</body>
</html>



