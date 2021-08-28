<?php
session_start();
require_once("require.php");
$db=new Baza();
if(!$db->connect())exit();
$odgovor="";
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
    <div id="wrapper">

    <?php
    require_once("_require.php/_header.php");
    if(isset($_GET['id']))
    $id=$_GET['id'];
                
    
    ?>


    <form action='komentarisi.php?id=<?= $id?>' method='post'  class='form-komentarisi'>
    <a class='close-komentarisi' href="vest.php?id=<?= $id?>"><i class="fas fa-window-close"></i></a>

    <input type="text" name='ime' placeholder='Vase ime' class='ime-komentarisi'>
    <input type="text" name='komentar' class='komentarisi-input' placeholder='Vas komentar'>

    <button name='komentarisi-button' class='login-button'>Posalji komentar</button>
    <?php
            //Snimanje komentara
            if(isset($_GET['id']) and isset($_POST['ime']) and isset($_POST['komentar']))
            {

                $id=$_GET['id'];
                $ime=$_POST['ime'];
                $komentar=$_POST['komentar'];
                if($id!="" and $ime!="" and $komentar!="")
                {
                    $ime=filter_var($ime, FILTER_SANITIZE_STRING);
                    $komentar=filter_var($komentar, FILTER_SANITIZE_STRING);
                    $upit="INSERT INTO komentar (vest_komentar_id, komentar_ime, komentar) VALUES ({$id}, '{$ime}', '{$komentar}')";
                    $db->query($upit);
                    if($db->error())
                        $odgovor = "Doslo je do greske";
                    else
                    $odgovor = "Uspesno ostavljen komentar, sacekajte dozvolu administratora";
                } 
                else
                $odgovor = "Svi podaci su obavezni";
            }
            ?>
   <?= $odgovor?> 
    </form>
    
    
   

                    



  
    <!--end wrapper-->






   
          








    
</body>
</html>