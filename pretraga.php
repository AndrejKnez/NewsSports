<?php

session_start();
require_once("require.php");

$db=new Baza();
if(!$db->connect())exit();


$poruka="";

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
</head>
<body>
<div class='login--page'>

<form action='addnews.php' method='POST' enctype='multipart/form-data' class='pretraga-form'>
<a class='close-pretraga' href="index.php"><i class="fas fa-window-close"></i></a>

<input type="text" name='pretraga' class='pretraga' placeholder='Pretrazi MozzartSport'>

<p>Pronađite šta vas zanima na mozzartsport/u unoseći termin u polje za pretragu iznad. Rezultati pretraživanja će se pojaviti u toku unosa pojmova.

</p>




<div><?= $poruka?></div>

</form>

</div>

</body>
</html>