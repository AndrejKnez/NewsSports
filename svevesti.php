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
<div id='pozadina-svevesti'>
    <?php
        require_once("_require.php/_header.php");
 
    ?>
<div class='sve-vesti'>
    
        
         <div class='arhiva-left'>
             <h3 id='najvesti'>Arhiva vesti</h3>
         <?php
             

        $upit="SELECT * FROM kategorija";
        $rez=$db->query($upit);
        while($red=$db->fetch_object($rez))
        echo "<div class='arhiva'><a class='navitems' href='svevesti.php?kategorija={$red->kategorija_id}'>{$red->kategorija_naziv}</a></div>";
    ?>         
      


         </div>

    <div id='sve-vesti'>
    <?php
    $upit="SELECT * FROM vwvest WHERE vest_obrisan=0 ORDER BY vest_id DESC";
              if(isset($_GET['id']))$upit="SELECT * FROM vwvest WHERE vest_obrisan=0 AND vest_id=".$_GET['id']." ORDER BY id DESC";
              if(isset($_GET['kategorija']))$upit="SELECT * FROM vwvest WHERE vest_obrisan=0 AND vest_kategorija_id='".$_GET['kategorija']."' ORDER BY vest_id DESC";
              if(isset($_GET['autor']))$upit="SELECT * FROM vwvest WHERE vest_obrisan=0 AND vest_autor_id='".$_GET['autor']."'  ORDER BY vest_id DESC";
              
              $rez=$db->query($upit);
              if($db->error())
              {
                  echo "Greska prilikom izvrsavanja upita<br>";
                  echo $db->error()." (".$db->errno().")";
                  exit();
              }
              $slika="";
              $vesti= array();
              while($red=$db->fetch_object($rez))
                  
              {
                  
                  echo "<div class='posebnevesti'>";
                  if(file_exists("uploads/{$red->vest_id}.jpg"))
                  $slika="uploads/{$red->vest_id}.jpg";
                  echo "<a href='vest.php?id=".$red->vest_id."'><img src='$slika' width='240px' height='135px'></a>";
                  echo "<a class='kategorija-posebnevesti' href='svevesti.php?kategorija=".$red->vest_kategorija_id."'>".$red->kategorija_naziv."</a><br>";
                      
                      $tmp=explode(" ", $red->vest_naslov);
                      $novi=array_slice($tmp, 0, 10);
                      $a=implode(" ", $novi)."<br>";
                      echo "<a class='naslov-posebnevesti' href='vest.php?id=".$red->vest_id."'>".$a."</a>" ;
                  
                      
                  

                  echo "</div>";
              }
              
          ?>
    
    
    
    
    </div>



    </div>


</div>
</div>
<?php
require_once("_require.php/_footer.php");


?>
</body>
</html>