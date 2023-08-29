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


<script>
function onHide()
{
    
    $("#txt").toggle();
} 
</script>


<?php
{ 
$srv = "localhost";
$user = "root";
$psw = "";
$db = "firma";


$connection = mysqli_connect($srv, $user, $psw,$db);
$query = "  SELECT z.jmeno, z.prijmeni, z.vek, po.nazev_pozice, pr.nazev_kancelare, v.hruba_mzda, v.cista_mzda, 
            DATE_FORMAT(z.datum_nastupu, '%d. %m. %Y') as nastup, timestampdiff(year, z.datum_nastupu, NOW()) as pobyt
            FROM pracoviste pr, zamestnanci z, pozice po, vyplatnice v
            WHERE pr.id='".$_GET['id']."' AND po.platid = v.id AND z.pracoviste = pr.id AND z.pozice = po.id AND z.id = '".$_GET['zid']."'";

            

$result = mysqli_query($connection, $query);
$row = mysqli_fetch_assoc($result);
echo " <h1>Profil zaměstnance ".$row['jmeno']." ".$row['prijmeni']."</h1><br>";


//funkce pro převzetí dat a uložení do globals
function vem_mzda()
{
$srv = "localhost";
$user = "root";
$psw = "";
$db = "firma";
$connection = mysqli_connect($srv, $user, $psw,$db);
$query = "  SELECT z.jmeno, z.prijmeni, z.vek, po.nazev_pozice, pr.nazev_kancelare, v.hruba_mzda, v.cista_mzda, 
            DATE_FORMAT(z.datum_nastupu, '%d. %m. %Y') as nastup, timestampdiff(year, z.datum_nastupu, NOW()) as pobyt
            FROM pracoviste pr, zamestnanci z, pozice po, vyplatnice v
            WHERE pr.id='".$_GET['id']."' AND po.platid = v.id AND z.pracoviste = pr.id AND z.pozice = po.id AND z.id = '".$_GET['zid']."'";
$result = mysqli_query($connection, $query);
$row = mysqli_fetch_assoc($result);

$GLOBALS['hruba'] = $row['hruba_mzda'];
$GLOBALS['cista'] = $row['cista_mzda'];
}

    function hruba_mzda()
{
echo $GLOBALS['hruba'];
}   function cista_mzda()
{
echo $GLOBALS['cista'];
}

vem_mzda();



$result = mysqli_query($connection, $query, MYSQLI_USE_RESULT);
echo "<p>";
while($row = mysqli_fetch_array($result)){

echo "<td>Věk: ".$row['vek']." let.</td><br>";
echo "<td>Pozice zaměstnance: ".$row['nazev_pozice'].".</td><br>";
echo "<td>Pracoviště zaměstnance: ".$row['nazev_kancelare']."</td><br>";
echo "<td>Datum nástupu: ".$row['nastup']."<br>";
echo "<td>Zaměstnanec má pracovní poměr už: ".$row['pobyt']." let<br><br>";

}


echo "<b><br><br><br>Výplatnice</b><br>";

?>
    <form method="post">
        <input type="submit" name='hruba' class="button" value="Ukaž výplatu v hrubém" />
        <br><br>
        <input type="submit" name='cista' class="button" value="Ukaž výplatu v čistém" />
        <br><br>
    </form>

    
    
<?php


        if(array_key_exists('hruba', $_POST)) {
            hruba();
        }
        else if(array_key_exists('cista', $_POST)) {
            cista();
        }       
                   
        function hruba() {
            echo "Hrubá mzda je:".$GLOBALS['hruba']."kč<br>";
        }
        function cista() {
            echo "Čistá mzda je: ".$GLOBALS['cista']."kč<br>";
        }
        
        




$result = mysqli_query($connection, $query);
$row = mysqli_fetch_assoc($result);
echo "<a href='vypis_zamestnancu_pracoviste.php?bid={$_GET['bid']}&id={$_GET['id']}&fid={$_GET['fid']}'>Zpět </a><br>";
echo "<a href='firmaphp.php'>Rozcestník</a>";



}

mysqli_close($connection);



/*
echo "<form id='login' action='vyplata_zamestnance.php' method='post' accept-charset='UTF-8'>";
echo "<fieldset style='width:200px'>";

echo "<legend>Přihlášení</legend>";

echo "<input type='hidden' name='submitted' id='submitted' value='1'/>";

echo "<label for='username' >ID zaměstnance:</label>";
echo "<input type='text' name='username' id='username'  maxlength='3' />";

echo "<label for='password' >Heslo zaměstnance:</label>";
echo "<input type='password' name='password' id='password' maxlength='5' />";

echo "<input type='submit' name='Submit' value='Submit' />";

echo "</fieldset>";
echo "</form>";

//odeslani onclickem hodnot na dalsi stranku:
echo "<form action='vyplata_zamestnance.php' method='get'>";
echo "<input type='hidden' name='zid' value='{$_GET['zid']}'  />";
echo "<input type='submit' value='Přihlašovací stránka' id=".$zid." ><br /><br />";
echo "</form>";


*/


?>

</body>
</html>



