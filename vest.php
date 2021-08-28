<?php
session_start();
require_once("require.php");
$db=new Baza();
if(!$db->connect())exit();
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
    ?>
    <main>

    <div class='leftmain'>
    <h3 id='najvesti'>Najnovije vesti</h3>
    <?php
    $upit="SELECT * FROM vwvest WHERE vest_obrisan=0 ORDER BY vest_id DESC";
            if(isset($_GET['id']))$upit="SELECT * FROM vwvest WHERE vest_obrisan=0 ORDER BY vest_id DESC";

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
    
<div class='pojedinacnavest'>
    <?php
    
    
    if(isset($_GET['id']))
            {
                $id=$_GET['id'];
                if(filter_var($id, FILTER_VALIDATE_INT))
                {
                    $upit="SELECT * FROM vwvest WHERE vest_obrisan=0 AND vest_id=".$_GET['id'];
                    $rez=$db->query($upit);
                    if($db->error())
                    {
                        echo "Greska prilikom izvrsavanja upita<br>";
                        echo $db->error()." (".$db->errno().")";
                        exit();
                    }
                    
                    while($red=$db->fetch_object($rez))
                    {
                        echo "<div class='jedna-vest'>";
                        echo "<h3 class='naslov'>".$red->vest_naslov."</h3>";
                        echo "<i class='vreme'>".$red->vest_vreme."</i>";
                        if(file_exists("uploads/{$red->vest_id}.jpg"))
                        $slika="uploads/{$red->vest_id}.jpg";
                        echo "<img src='$slika' width='100%'</img>";
                        
                        echo "<div class='tekst'>";
                        echo "<p>".$red->vest_tekst."<p>";
                        echo "</div>";
                        echo "<div class='idinakomentare'>";

                        echo "<div>";

                        echo "<a href='komentarisi.php?id=$id'>Ostavi komentar</a>";


                        echo "</div>";

                        echo "<div>";

                        echo "<a href='komentari.php?id=$id'>Komentari</a>";

                        echo "</div>";

                        echo "</div>";
                        echo "</div>";
                        echo "</div>";
                        
                        echo "</div>";
                          
                    }
                    $upit2="UPDATE vest SET vest_pogledan=vest_pogledan+1 WHERE vest_id=".$_GET['id'];
                    $db->query($upit2);
                    
                }
                else
                    echo "Neodgovarajuci id vesti";
            }

        
    ?>

</div>
<div class='rightmain'></div>
    
    
   
</main>    
</div> <!--end wrapper-->






    <?php
     require_once("_require.php/_footer.php");
    ?>








<script
  src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src='js/main.js'></script>
</body>
</html>