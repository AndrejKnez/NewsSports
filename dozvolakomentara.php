<?php
session_start();
require_once("require.php");
$db=new Baza();
if(!$db->connect())exit();
$poruka="";
if($_SESSION['status']!="Administrator")
{
    echo "Samo administrator moze videti ovu stranicu";
    echo "<a href='index.php'>Pocetna</a>";
    exit();
}
?>
<?php
if(isset($_GET['idKomentara']) and isset($_GET['akcija']))
{
    $idKomentara=$_GET['idKomentara'];
    $akcija=$_GET['akcija'];
    if($akcija=="brisanje")
    {
         $upit="DELETE FROM komentar WHERE komentar_id={$idKomentara}";
         $db->query($upit);
    }
       
    else
    {
        $upit="UPDATE komentar SET komentar_dozvoljen=1 WHERE komentar_id={$idKomentara}";
        $db->query($upit);
    }
        
    
}
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

    <form class='form-dozvolikomentare'>  
   
    <?php
        $upit="SELECT * FROM komentar WHERE komentar_dozvoljen=0";
        $rez=$db->query($upit);
        if($db->num_rows($rez)>0)
        {
            while($red=$db->fetch_object($rez))
            {
                echo "<div class='dozvolakom'>";
                echo "<div><b>{$red->komentar_ime}</b> <i>{$red->komentar_vreme}</i></div>";
                echo "<div>{$red->komentar}</div>"; 
                echo "<a href='dozvolakomentara.php?idKomentara={$red->komentar_id}&akcija=brisanje'>Obrisi</a> | ";
                echo "<a href='dozvolakomentara.php?idKomentara={$red->komentar_id}&akcija=dozvoli'>Dozvoli</a>";
                echo "</div>";
            }
        }
        else
            $poruka= "Nema komentara";
              
              
        ?>
   <?= $poruka?> 
    </form>
    
    
   

                    



  
    <!--end wrapper-->






   
          








    
</body>
</html>