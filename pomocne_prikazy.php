<?php

//postup na pripojeni do databaze X
{ 

//nazev serveru, uzivatele, heslo a databaze ze ktere budu tahat data
$srv = "localhost";
$user = "root";
$psw = "";
$db = "firma";

// connection = prikaz mysqli_connect, kde pridam do zavorky hodnoty pod kterymi se prihlasim do databaze
$connection = mysqli_connect($srv, $user, $psw,$db);

//zde v query vytvorim dotaz, ktery chci aby mi SQL provedlo a vratilo z nej hodnoty
$query = "  SELECT * 
            FROM seznam_budov
            WHERE id=1";

            //WHERE id='".$_GET['id']."'";

//resultem vytahnu vysledky. Vzor je: mysqli_query([pripojeniDB],[SQLdotaz], MYSQLI_USE_RESULT);
$result = mysqli_query($connection, $query, MYSQLI_USE_RESULT);

//dokud row (radek) trva, tak vezmu retezec znaku z resultu a vypisu je
while($row = mysqli_fetch_array($result)){


}




?>
