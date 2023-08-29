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
<h1>Uvodní stránka - rozcestník</h1>

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
$query = "  SELECT * 
            FROM firma";

#get the result
$final = mysqli_query($connection, $query);
echo "<tr>Název firmy: <br>";
if (mysqli_num_rows($final) > 0) {
 //get the output of each row
  while($i = mysqli_fetch_array($final)) {
      //get id and name columns
        echo "<td>  <a href='ofirme.php?id={$i['id']}'>  ".$i["nazev"]."    </a></td>   <br>";
        

//        echo "Název firmy: <a href='vypis_budov=?nazev'>".$i["nazev"]."</a><br>";





  
  
  
  }
  echo "</tr>";
} else {
  echo "No results";
}
}

mysqli_close($connection);



?>

</body>
</html>


