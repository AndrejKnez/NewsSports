<?php
session_start();
require_once("../require.php");
if(!login())
{
    echo "Morate biti prijavljeni da biste posetili ovu stranicu";
    exit();
}
$db=new Baza();
if(!$db->connect())exit();
if($_SESSION['status']!="Administrator")
{
    echo "Samo administrator moze videti ovu stranicu";
    echo "<a href='../index.php'>Pocetna</a>";
    exit();
}




?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../fontawesome/css/all.min.css">
</head>
<body>

<div class='login-page'>

    <div class='login-form'>
    <a class='close' href="../index.php"><i class="fas fa-window-close"></i></a>
    <h2 class='prijava-naslov'>Upravljanje urednicima</h2>
    <br>
    
    <div id='sviKorisnici'></div>


   <input type="text" id='idK' placeholder='Unesite id' disabled><br>
   <input type="text" id='imeK' placeholder='Unesite ime'><br>
   <input type="text" id='prezimeK' placeholder='Unesite prezime'><br>
   <input type="text" id='emailK' placeholder='Unesite email'><br>
   <input type="text" id='komentarK' placeholder='Unesite komentar'><br>
   <select name="statusK" id="statusK">
   
   <option value="0">Izaberite status</option>
   <option value="Administrator">Administrator</option>
   <option value="Urednik">Urednik</option>
   <option value="Korisnik">Korisnik</option>

    
   </select><br>
    <p id="odgovor"></p>
    <button class='login-button' id='ocisti'>Ocisti</button>  <button class='login-button' id='snimi'>Snimi</button> <button class='login-button' id='obrisi'>Obrisi</button>

    

    
    
   
 

    


    </div>

    </div>





<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src='../js/main.js'></script>
</body>
</html>