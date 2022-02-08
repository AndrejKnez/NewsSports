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
$sesija = $_SESSION['id'];
$poruka="";

?>

<?php

if(isset($_POST['obrisivest']))
{
    $idVesti = $_POST['idVesti'];
    if($idVesti!="0")
    {
        $upit = "UPDATE vest SET vest_obrisan=1 WHERE vest_id=$idVesti";
        $db->query($upit);
        if($db->error())
        {
            $poruka = "Greska prilikom izvrsavanja upita";
        }
        else
        {
            $poruka = "Uspesno obrisana vest";
            Statistika::upisiLog("../logs/vesti.log", "{$_SESSION['ime']} {$_SESSION['prezime']}, Uspesno obrisana vest sa id: $idVesti");

        }
    }
    else
    {
        $poruka="Niste izabrali vest za brisanje";
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
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../fontawesome/css/all.min.css">
</head>
<body>
<div class='login--page'>

<form action='deletenews.php' method='POST' class='login-form'>
<a class='close' href="../index.php"><i class="fas fa-window-close"></i></a>
<h2 class='prijava-naslov'>Brisanje vesti</h2>


<select name="idVesti"  id="idVesti">
    <option value="0">Izaberite vest za brisanje</option>
    <?php
    
    $upit = "SELECT * FROM vest WHERE vest_obrisan=0 AND vest_autor_id=$sesija ORDER BY vest_id ASC";
    $rez = $db->query($upit);
    while($red = $db->fetch_object($rez))
    {
        echo "<option value='{$red->vest_id}'>{$red->vest_id}: {$red->vest_naslov}</option>";
    }
    ?>
</select><br>

<button name='obrisivest' class='login-button'>Obrisite vest</button>



<div><?= $poruka?></div>

</form>

</div>

</body>
</html>