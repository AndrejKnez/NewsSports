<?php
session_start();
require_once("require.php");
$db=new Baza();
if(!$db->connect())exit();
if(isset($_GET['id']))
$id=$_GET['id'];
?>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sportske vesti | Mozzart sport</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    
</head>
<body>
    

<div id="wrapper">

<?php
require_once("_require.php/_header.php");
?>
<main>


<div class='leftmain'>
<h3 id='najvesti'>Najnovije vesti</h3>

<?php
    $upit="SELECT * FROM vwvest WHERE vest_obrisan=0 ORDER BY vest_id DESC";
              
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
                  echo "<a class='kategorija-najnovijavest' href='svevesti.php?kategorija=".$red->vest_kategorija_id."'>".$red->kategorija_naziv."</a><br>";
                      
                      $tmp=explode(" ", $red->vest_naslov);
                      $novi=array_slice($tmp, 0, 10);
                      $a=implode(" ", $novi)."<br>";
                      echo "<a class='naslov-najnovijavest' href='vest.php?id=".$red->vest_id."'>".$a."</a>" ;
                  
                      
                  

                  echo "</div>";
              }
              
          ?>
    
    </div>
    <div class='centermain'>
      <div class='ostavikom'>
         
    <a href='komentarisi.php?id=<?= $id?>' class='login-button'>Ostavi komentar</a>
        </div>
        <?php
            //Prikaz komentara
            $upit="SELECT * FROM komentar WHERE vest_komentar_id={$id} AND komentar_dozvoljen=1 ORDER by komentar_vreme DESC";
            $rez=$db->query($upit);
            if($db->num_rows($rez)==0)
                echo "Trenutno nema komentara";
            while($red=$db->fetch_object($rez))
            {
                echo "<div class='prikaz-komentara'>";
                echo "<div><b>{$red->komentar_ime}</b> - <i>{$red->komentar_vreme}</i></div>";
                echo "<div>{$red->komentar}</div>";
                echo "<div><i class='far fa-thumbs-up onclick='react(this, $red->komentar_id, \up'\')''></i> {$red->komentar_like} | <i class='far fa-thumbs-down onclick='react( this,$red->komentar_id)''></i> {$red->komentar_unlike}</div>";
                echo "</div><br>";
            }
            ?>
    </div>
    <div class='rightmain'>

    </div>
    </main>
</div> <!--end wrapper-->



<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src='js/main.js'></script>
</body>
</html>