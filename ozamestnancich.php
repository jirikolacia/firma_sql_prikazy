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
                                                                                                                                                                                          
$query = "  SELECT DISTINCT(pr.nazev_kancelare), COUNT(za.id) as celkem, FORMAT(avg(vek),1) as prumer, sb.id as sbid, pr.id as pid,COUNT(IF(za.pohlavi = 'F', 1, NULL)) as pocetzen
            FROM firma f, pracoviste pr, pozice po, zamestnanci za, seznam_budov sb
            WHERE f.id = '".$_GET['fid']."' AND za.pozice = po.id AND za.firma = pr.fid AND za.pracoviste = pr.id AND sb.id = pr.bid AND pr.fid = f.id 
            GROUP BY pr.nazev_kancelare";
            
            
     


echo "<table border='2'>";
echo "<tr>";
echo "<td>Název pracoviště</td><td>Počet zaměstnanců</td><td>Věkový průměr</td><td>Podíl žen</td>";
echo "</tr>";
#get the result
$result = mysqli_query($connection, $query, MYSQLI_USE_RESULT);


while($row = mysqli_fetch_array($result)){
echo "<tr>";
echo "<td><b><a href='vypis_zamestnancu_pracoviste.php?fid={$_GET['fid']}&bid={$row['sbid']}&id={$row['pid']}'>".$row['nazev_kancelare']."</b></td>";
echo "<td>má ".$row['celkem']." zaměstnanců.</td>";
echo "<td>Věkový průměr ".$row['prumer']." let</td>";
echo "<td>Z toho <b>".$row['pocetzen']." </b>žen</td>";
echo "</tr>";
}




mysqli_close($connection);

}

echo "<a href='ofirme.php?id={$_GET['fid']}'>Zpět</a>";
echo "<br><br><br><a href='firmaphp.php'>Rozcestník</a>";
?>

</body>
</html>



