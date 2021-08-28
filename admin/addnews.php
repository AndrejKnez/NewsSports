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
if($_SESSION['status']!="Administrator" and $_SESSION['status']!="Urednik")
{
    echo "Samo administrator i urednik mogu videti ovu stranicu";
    echo "<a href='../index.php'>Pocetna</a>";
    exit();
}

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
<div class='login-page'>

<form action='addnews.php' method='POST' enctype='multipart/form-data' class='login-form'>
<a class='close' href="../index.php"><i class="fas fa-window-close"></i></a>
<h2 class='prijava-naslov'>Dodavanje vesti</h2>

<input type="text" name='naslov' id='naslov' placeholder='Naslov'>

<textarea  type="text" name='tekst' id='tekst' placeholder='Tekst'></textarea>

<select name="kategorija" id="kategorija">
    <option value="0">Izaberite kategoriju</option>
    <?php
    $upit = "SELECT * FROM kategorija";
    $rez = $db->query($upit);
    while($red = $db->fetch_object($rez))
    {
        echo "<option value='{$red->kategorija_id}'>{$red->kategorija_naziv}</option>";
    }
    
    ?>
    
</select><br>
<select name="podkategorija" id="podkategorija">
<option value="0">Izaberite podkategoriju</option>
    <?php
    $upit = "SELECT * FROM podkategorija";
    $rez = $db->query($upit);
    while($red = $db->fetch_object($rez))
    {
        echo "<option value='{$red->podKategorijaID}'>{$red->podKategorija_naziv}</option>";
    }
    
    ?>
</select><br>
<input type="file" name='slika' id='slika'>

<button name='snimivest' class='login-button'>Dodajte vest</button>

<?php

if(isset($_POST['snimivest']))
{
    
    $naslov = $_POST['naslov'];
    $tekst = $_POST['tekst'];
    $kategorija = $_POST['kategorija'];
    $podkategorija = $_POST['podkategorija'];

    if($naslov!="" and $tekst!="" and $kategorija!="0" and $podkategorija!="0")
    {
        $upit = "INSERT INTO vest (vest_naslov, vest_tekst, vest_autor_id, vest_kategorija_id, vest_podkategorija_id) VALUES ('{$naslov}', '{$tekst}', '{$_SESSION['id']}', '{$kategorija}', '{$podkategorija}')";
        $db->query($upit);
        if($db->error())
        {
            $poruka= "Greska prilikom izvrsavanja upita". $db->error();
        }
        else 
        {
            $id = $db->insert_id();
            $poruka= "Uspesno dodata vest sa id:".$id;
            Statistika::upisiLog("../logs/vesti.log", "{$_SESSION['ime']}, Uspesno dodata vest sa id: $id");

            if($_FILES['slika']['name']!="")
            {
                $ime = "../uploads/".$id.".jpg";
                $tmp = $_FILES['slika']['tmp_name'];
                $velicina = $_FILES['slika']['size'];
                if(!file_exists($ime))
                {
                    if($velicina<2000000)
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
        }
    }
    else
    {
        $poruka= "Nisu uneti svi podaci";
    } 
}


?>

<div><?= $poruka?></div>

</form>

</div>

</body>
</html>