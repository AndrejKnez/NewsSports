<?php
require_once("klase/classBaza.php");
require_once("klase/funkcije.php");

$db=new Baza();
if(!$db->connect())exit();
if($_SESSION['status']!="Administrator")
{
    echo "Samo administrator moze videti ovu stranicu";
    echo "<a href='../index.php'>Pocetna</a>";
    exit();
}
if(isset($_GET['email']) AND isset($_GET['validan']))
{
    $email=$_GET['email'];
    $validan=$_GET['validan'];
    if($email!=""  and $validan!='')
    {
        $sql="UPDATE korisnik SET korisnik_validan=1 WHERE korisnik_email='{$email}' AND korisnik_validan='{$validan}'";
        $db->query($sql);
        if($db->affected_rows()==1)
            echo "Vas email je registrovan";
        else
            echo "Nesto nije u redu!!!!";
    }
    else
        echo "Podaci su prazni";
}
else
    echo "Ne postoje podaci";
?>