<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>
    
</body>
</html>

<?php

require_once("klase/classBaza.php");
require_once("klase/funkcije.php");
$db=new Baza();
if(!$db->connect())exit();
?>

<header>

<div id="headertop">

    <div class="logo">

       <p><i class='logotitle'><b>SPORTSKE VESTI</b> </i> </p> 
    </div>


    <div id="icons">

        <a target="_blank" href=""><i class="fab fa-instagram"></i></a>
        <a target="_blank" href=""><i class="fab fa-facebook"></i></a>
        <a target="_blank" href=""><i class="fab fa-youtube"></i></a>
        <a target="_blank" href=""><i class="fab fa-twitter"></i></a>
        <a href='pretraga.php'><i class="fas fa-search"></i></a>
        <?php
        if(login())
        {
            echo "<li class='navitems'>";
            echo   "<div class='dropdown'>";
            $upit="SELECT * FROM korisnik";
            $rez=$db->query($upit);
              if($db->error())
              {
                  echo "Greska prilikom izvrsavanja upita<br>";
                  echo $db->error()." (".$db->errno().")";
                  exit();
              }
          
              while($red=$db->fetch_object($rez))
              {
                  if(file_exists("avatar/".$_SESSION['id'].".jpg")) $slika="avatar/".$_SESSION['id'].".jpg";
                    else $slika="avatar/nouser.jpg";
            
              }
            echo "<a><img class='avatar-slika' src='{$slika}' height='20px'></a>";
            echo   "<div class='dropdown-content'>";
            echo   "<a class='profil' href='korisnik/urediprofil.php'>Uredi profil</a>";
            echo   "<a class='profil' href='korisnik/logout.php'>Odjavi se</a>";                
            echo   "</div>";   
            echo   "</div>";
            echo   "</li>";    
            
        }
        ?>
        


        <!--<a class='prijava-button'href="korisnik/login.php">PRIJAVI SE</a>-->
    <?php
    if(login())
    {
           
            echo "<a class='prijava-button' >{$_SESSION['ime']} {$_SESSION['prezime']} ({$_SESSION['status']}) </a>";

    }
    else echo "<a class='prijava-button' href='korisnik/login.php'>PRIJAVI SE</a>";
    
    ?>

    </div> <!--end icons-->

</div> <!--end header top-->

<div class="headerbottom">

<nav>

<ul class="navbar">

    <li><a class="naslovna" href="index.php">NASLOVNA</a></li>
    <li><a class='navitems' href="svevesti.php">Sve vesti</a></li>
    <?php
        $upit="SELECT * FROM kategorija";
        $rez=$db->query($upit);
        while($red=$db->fetch_object($rez))
        echo "<li><a class='navitems' href='index.php?kategorija={$red->kategorija_id}'>{$red->kategorija_naziv}</a></li>";
    ?>
    
    
    <?php
    if(login())
    {
         if($_SESSION['status']=='Administrator')
            {
            echo "<li class='navitems'>";
            echo   "<div class='dropdown'>";
            echo   "<ul class='dropbtn'>OPCIJE</ul>";
            echo   "<div class='dropdown-content'>";
            echo   "<a id='korisnici' href='admin/korisnici.php'>UREDNICI</a>";
            echo   "<a href='admin/addnews.php'>DODAJ VEST</a>";
            echo   "<a href='admin/deletenews.php'>OBRISI VEST</a>";
            echo   "<a href='dozvolakomentara.php'>DOZVOLA KOMENTARA</a>";
            echo   "<a href='statistika.php'>STATISTIKA</a>";
            
                            
            echo     "</div>";   
            echo     "</div>";
            echo  "</li>";    
    }
            if($_SESSION['status']=='Urednik')
            {
                echo "<li class='navitems'>";
                echo   "<div class='dropdown'>";
                echo   "<ul class='dropbtn'>OPCIJE</ul>";
                echo   "<div class='dropdown-content'>";
                
                echo   "<a href='admin/addnews.php'>DODAJ VEST</a>";
                echo   "<a href='admin/deletenews.php'>OBRISI VEST</a>";                
                echo   "</div>";   
                echo   "</div>";
                echo   "</li>";    
            }

    }
       
    ?>





</ul>






</nav>


</div> <!--end header bottom-->





</header>