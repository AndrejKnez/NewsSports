<?php
session_start();
$db=mysqli_connect("localhost", "root", "", "baza");
mysqli_query($db, "SET NAMES utf8");
if(!$db) exit();
$opcija=$_GET['opcija'];
require_once("../klase/classStatistika.php");


//update korisnika
if($opcija=="update")
{
    $sql="UPDATE korisnik SET korisnik_ime='{$_POST['ime']}', korisnik_prezime='{$_POST['prezime']}', korisnik_komentar='{$_POST['komentar']}', korisnik_status='{$_POST['status']}' WHERE korisnik_id={$_POST['id']}";
    mysqli_query($db, $sql);
    if(mysqli_error($db)) echo "Greska<br>".mysqli_error($db);
    else 
    {echo "Uspesno izmenjen korisnik";
    Statistika::upisiLog("../logs/korisnici.log", "{$_SESSION['ime']} {$_SESSION['prezime']}, Uspesno izmenjen korisnik ");}

}

//dodavanje korisnika
if($opcija=="insert")
{
    $ime = $_POST['ime'];
    $prezime = $_POST['prezime'];
    $email = $_POST['email'];
    $status = $_POST['status'];
    if($ime!="" and $prezime!="" and $email!="" and $status!="0")
    {
        $upit = "SELECT * FROM korisnik WHERE korisnik_email='{$email}'";
        $rez = $db->query($upit);
        if(mysqli_num_rows($rez)==0)
        {
    
    $sql="INSERT INTO korisnik (korisnik_ime, korisnik_prezime, korisnik_email, korisnik_lozinka, korisnik_komentar, korisnik_aktivan, korisnik_status) VALUES ('{$_POST['ime']}', '{$_POST['prezime']}', '{$_POST['email']}', '12345', '{$_POST['komentar']}', '1', '{$_POST['status']}')";
    mysqli_query($db, $sql);
    if(mysqli_error($db))
    {
         echo "Greska<br>".mysqli_error($db);
    }
    else 
    {
        echo "Uspesno dodat korisnik";
        Statistika::upisiLog("../logs/korisnici.log", "{$_SESSION['ime']} {$_SESSION['prezime']}, Dodat novi korisnik $ime $prezime");

    }
        }
        else 
        {
            echo "Email vec postoji";
        }    
    
}
else
{
    echo "Niste uneli potrebne podatke";
}
}
//brisanje korisnika
if($opcija=="delete")
{
    $idKorisnika = $_POST['id'];
    $sql="DELETE FROM korisnik WHERE korisnik_id={$_POST['id']}";
    mysqli_query($db, $sql);
    if(mysqli_error($db)) echo "Greska<br>".mysqli_error($db);
    else
    {   
        echo "Uspesno obrisan korisnik";
        if(file_exists("../avatar/".$idKorisnika.".jpg")) unlink("../avatar/".$idKorisnika.".jpg");
        Statistika::upisiLog("../logs/korisnici.log", "{$_SESSION['ime']} {$_SESSION['prezime']}, Uspesno obrisan korisnik");
    } 

}
//selektovanje korisnika
if($opcija=="select")
{
    $sql="SELECT * FROM korisnik WHERE korisnik_status='Urednik' order by korisnik_id ASC";
    $rez=mysqli_query($db, $sql);
    $sviPodaci=mysqli_fetch_all($rez, MYSQLI_ASSOC);   
    echo JSON_encode($sviPodaci, 256);
}
?>