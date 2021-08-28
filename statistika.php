<?php
session_start();
require_once("require.php");
$db=new Baza();
if(!$db->connect())exit();
$poruka="";
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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
</head>
<body>
    <div id="wrapper">

    <?php
    require_once("_require.php/_header.php");
   
                
    
    ?>
   

    <form action='statistika.php' method='post'  class='form-komentarisi'>
    <h3>Statistika</h3>
    <a class='close-komentarisi' href="index.php"><i class="fas fa-window-close"></i></a>
    <select name="datoteka" id="datoteka">

    <option value="0">Izaberi log datoteku</option>
    <option value="logovanja.log">Logovanja</option>
    <option value="korisnici.log">Korisnici</option>
    <option value="vesti.log">Vesti</option>

    </select>
    

    <button name='snimi' class='login-button'>Prikazi log</button>
    <?php
            //Snimanje komentara
            if(isset($_POST['datoteka']) and $_POST['datoteka']!="0")
            {
                $datoteka = $_POST['datoteka'];
                if(file_exists("logs/$datoteka"))
                {
                    $poruka = file_get_contents("logs/$datoteka");
                    $poruka=nl2br($poruka);
                }
                else
                {
                    echo "Nema aktivnosti";
                }
                
            } 

            else
            {
                $odgovor = "Svi podaci su obavezni";
            }
            
            
            ?>
   <?= $poruka?> 
    </form>
    
    
   

                    



  
    <!--end wrapper-->






   
          








    
</body>
</html>