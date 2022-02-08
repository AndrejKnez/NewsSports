<?php
session_start();
require_once("../klase/classBaza.php");
require_once("../klase/funkcije.php");
if(!login())
{
    echo "Morate biti prijavljeni da biste posetili ovu stranicu";
    exit();
}
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
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../fontawesome/css/all.min.css">

</head>
<body>
<header>

<div id="headertop">

    <div class="logo">

    <p><i class='logotitle'><b>SPORTSKE VESTI</b> </i> </p> 
    </div>


    <div id="icons">

        <a target="_blank" href="https://www.instagram.com/mozzartsport/"><i class="fab fa-instagram"></i></a>
        <a target="_blank" href="https://www.facebook.com/MozzartSport/"><i class="fab fa-facebook"></i></a>
        <a target="_blank" href="https://www.youtube.com/user/SportMOZZART"><i class="fab fa-youtube"></i></a>
        <a target="_blank" href="https://twitter.com/MozzartSport/"><i class="fab fa-twitter"></i></a>
        <a href='korisnik/pretraga.php'><i class="fas fa-search"></i></a>
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
                  if(file_exists("../avatar/".$_SESSION['id'].".jpg")) $slika="../avatar/".$_SESSION['id'].".jpg";
                    else $slika="../avatar/nouser.jpg";
            
              }
            echo "<a><img class='avatar-slika' src='{$slika}' height='20px'></a>";
            echo   "<div class='dropdown-content'>";
            echo   "<a class='profil' href='urediprofil.php'>Uredi profil</a>";
            echo   "<a class='profil' href='logout.php'>Odjavi se</a>";                
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

<div class="hederbottom">

<nav>

<ul class="navbar">

    <li><a class="naslovna" href="../index.php">NASLOVNA</a></li>
    <li><a class='navitems' href="../svevesti.php">Sve vesti</a></li>
    <?php
        $upit="SELECT * FROM kategorija";
        $rez=$db->query($upit);
        while($red=$db->fetch_object($rez))
        echo "<li><a class='navitems' href='../index.php?kategorija={$red->kategorija_id}'>{$red->kategorija_naziv}</a></li>";
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
            echo   "<a id='korisnici' href='../admin/korisnici.php'>UREDNICI</a>";
            echo   "<a href='../admin/addnews.php'>DODAJ VEST</a>";
            echo   "<a href='../admin/deletenews.php'>OBRISI VEST</a>";
            echo   "<a href='../admin/dozvola.php'>DOZVOLA KOMENTARA</a>";
                            
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
                
                echo   "<a href='../admin/addnews.php'>DODAJ VEST</a>";
                echo   "<a href='../admin/deletenews.php'>OBRISI VEST</a>";                
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

<main>

<div class="leftmain">
<h3 id='najvesti'>Najnovije vesti</h3>

    
    <?php
    $upit="SELECT * FROM vwvest WHERE vest_obrisan=0 ORDER BY vest_id DESC";
              if(isset($_GET['id']))$upit="SELECT * FROM vwvest WHERE vest_obrisan=0 AND vest_id=".$_GET['id']." ORDER BY vest_id DESC";
              if(isset($_GET['kategorija']))$upit="SELECT * FROM vwvest WHERE vest_obrisan=0 AND vest_kategorija_id='".$_GET['kategorija']."' ORDER BY vest_id DESC";
              if(isset($_GET['autor']))$upit="SELECT * FROM vwvest WHERE vest_obrisan=0 AND vest_autor_id='".$_GET['autor']."'  ORDER BY vest_id DESC";
              
              $rez=$db->query($upit);
              if($db->error())
              {
                  echo "Greska prilikom izvrsavanja upita<br>";
                  echo $db->error()." (".$db->errno().")";
                  exit();
              }
              
              $vesti= array();
              while($red=$db->fetch_object($rez))
                  
              {
                  echo "<div class='najnovijavest'>";
                  echo "<a class='kategorija-najnovijavest' href='../svevesti.php?kategorija=".$red->vest_kategorija_id."'>".$red->kategorija_naziv."</a><br>";
                      
                      $tmp=explode(" ", $red->vest_naslov);
                      $novi=array_slice($tmp, 0, 10);
                      $a=implode(" ", $novi)."<br>";
                      echo "<a class='naslov-najnovijavest' href='../vest.php?id=".$red->vest_id."'>".$a."</a>" ;
                  
                      
                  

                  echo "</div>";
                  
              }
              
          ?>
    
    
</div>

<div class="centermain">
    
    <h2 class='izmenaloz'>IZMENA LOZINKE</h2>
    
    <div class='novaloz'>
    
    <input type="password" name="staraloz" id="staraloz" placeholder='Stara lozinka'>
    <input type="password" name="novaloz" id="novaloz" placeholder='Nova lozinka'>
    <input type="password" name="novaloz" id="novaloz2" placeholder='Ponovite novu lozinku'>
    <button name='snimisliku' class='promeniloz'>PROMENI LOZINKU</button>
    <p id='odgovor'></p>
</div>
    
</div>


<div class="rightmain">
    <form action='urediprofil.php' method='post' enctype='multipart/form-data'>
    <h2 class='izmenaloz'>IZMENA PROFILNE SLIKE</h2>
   
    <input type="file" name="avatar" >
    <button name='snimisliku' class='avatar'>SACUVAJ PROFILNU SLIKU</button>
    <?php
$id=$_SESSION['id'];
if(isset($_POST['snimisliku']))
{
    if($_FILES['avatar']['name']!="")
    {
        $ime = "../avatar/".$id.".jpg";
        $tmp = $_FILES['avatar']['tmp_name'];
        $velicina = $_FILES['avatar']['size'];
        if(!file_exists($ime))
        {
            if($velicina<50000)
            {
            
                $dozvoljeno = array("jpg", "png", "jpeg");
                if(in_array(pathinfo($ime, PATHINFO_EXTENSION), $dozvoljeno))
            {
                if(@move_uploaded_file($tmp, $ime))
                {
                    $poruka.= " Uspesan upload slike na server";
                }
                else 
                {
                    $poruka.= " Neuspesan upload slike na server";
                }
            }
            else
            {
                $poruka = "Nedozvoljen format slike";
            }
            }
            else
            {
                $poruka = "Datoteka je prevelika";
            }
            
        }
        else 
        {
            $poruka =  "Datoteka vec postoji";
        }
        
}
else 
        {
            $poruka =  "Niste izabrali sliku";
        }

}






?>  

</form> 
<p><?= $poruka?></p>
</div>    
            
            

</main>

<script
  src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src='../js/main.js'></script>
</body>
</html>