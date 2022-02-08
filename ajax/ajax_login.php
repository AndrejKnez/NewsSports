<?php
use PHPMailer\PHPMailer\PHPMailer;
require_once "PHPMailer\PHPMailer.php";
require_once "PHPMailer\SMTP.php";
require_once "PHPMailer\Exception.php";
session_start();
require_once("../require.php");
$db = new Baza();
if(!$db->connect())
{
    echo "Neuspela konekcija na bazu"; 
    exit();
};

$funkcija = $_GET['funkcija'];
$odgovor['greska']="";
$odgovor['poruka']="";
//provera podataka za logovanje    
if($funkcija=="login")
{
    
    $email = $_POST['email'];
    $password = $_POST['password'];
    if($email!="" && $password!="")
    {
        if(validanString($email) && validanString($password))
        {
            
            $upit = "SELECT * FROM korisnik WHERE korisnik_email='{$email}'";
            $rez = $db->query($upit);
            if($db->num_rows($rez)==1)
            {
                $red = $db->fetch_object($rez);
                if($red->korisnik_aktivan==1)
                {
                    if($red->korisnik_lozinka == $password)
                    {
                        $_SESSION['id'] = $red->korisnik_id;
                        $_SESSION['ime'] = $red->korisnik_ime;
                        $_SESSION['prezime'] = $red->korisnik_prezime;
                        $_SESSION['status'] = $red->korisnik_status;
                        $odgovor['poruka']=("../index.php");
                        Statistika::upisiLog("../logs/logovanja.log", "{$_SESSION['ime']} {$_SESSION['prezime']}, Uspesna prijava");

                    }
                    else 
                    {
                        $odgovor['greska'] = "Pogreska lozinka za korisnika '{$email}'";
                    }
                }
                else 
                {
                    $odgovor['greska']="Korisnik postoji ali nije aktivan";
                }
            }
            else 
            {
                $odgovor['greska']="Korisnik '{$email}' ne postoji u bazi";
            }
    
  
            }
            else 
            {
               $odgovor['greska']="Email ili lozinka sadrze nedozvoljene karaktere";
            }
                }
                else 
                {
                     $odgovor['greska']="Svi podaci su obavezni";
                }
                
            
                echo JSON_encode($odgovor, 256);
    
}

//provera podataka za slanje nove lozinke
if($funkcija=="zaboravljenaLozinka")
{
    
    $email = $_POST['email'];
    if($email!= "")
    {

        $upit = "SELECT korisnik_id FROM korisnik WHERE korisnik_email='{$email}'";
        $rez = $db->query($upit);
        if($db->num_rows($rez) > 0)
        {
            $novaLozinka=generisiLozinku();
            $sql="UPDATE korisnik SET korisnik_lozinka='{$novaLozinka}' WHERE korisnik_email='{$email}'";
            $db->query($sql);
            if($db->error()) $odgovor['greska']="Neuspesna promena lozinke";
            else 
            {
                

                $mail = new PHPMailer();
                $mail->isSMTP();
                $mail->Host = "smtp.gmail.com";
                $mail->SMTPAuth = true;
                $mail->Username = "knezevicandrej32@gmail.com";
                $mail->Password = "jasamcar123";
                $mail->Port = 465; 
                $mail->SMTPSecure = "ssl";

                $mail->isHTML(true);
                $mail->setFrom("knezevicandrej32@gmail.com");
                $mail->addAddress($email);
                $mail->Subject = "Nova lozinka";
                $mail->Body = "Zdravo, vasa nova lozinka je: ". $novaLozinka;
            
                if($mail->send())
                    {
                        $odgovor['poruka'] = "Uspesno poslata nova lozinka na email";
                    }

                else 
                {
                    $odgovor['greska'] = "Email nije poslat".$mail->ErrorInfo;
                }
            }
        }
        else 
        {
            $odgovor['greska']="Email ne postoji u bazi";
        }
        
    }
        else 
        {
            $odgovor['greska']="Email je obavezan";
        }
        
       echo JSON_encode($odgovor, 256);
}

//promenalozinke

if($funkcija=="novalozinka")
{
    $staraloz = $_POST['staraloz'];
    $novaloz = $_POST['novaloz'];
    $novaloz2 = $_POST['novaloz2'];

    if($staraloz!="" && $novaloz!="" && $novaloz2!="")
    {
        if($novaloz==$novaloz2)
        {
            $upit = "SELECT korisnik_id FROM korisnik WHERE korisnik_lozinka='{$staraloz}'";
            $rez = $db->query($upit);
            if($db->num_rows($rez)>0)
            {
                if(strlen($novaloz)>5)
                {
                    if(validanString($novaloz))
                    {
                        $sql="UPDATE korisnik SET korisnik_lozinka='{$novaloz}' WHERE korisnik_id='{$_SESSION['id']}'";
                        $db->query($sql);
                        if($db->error())
                        {
                            $odgovor['greska']="Neuspesna promena lozinke";
                        } 
                        else
                        {
                            $odgovor['poruka']="Uspesno promenjena lozinka";
                            Statistika::upisiLog("../logs/logovanja.log", "{$_SESSION['ime']} {$_SESSION['prezime']}, Uspesno promenjena lozinka");

                        }
                    }
                    else
                {
                    $odgovor['greska']="Lozinka sadrzi nedozvoljene karaktere";

                }
                }
                else
                {
                    $odgovor['greska']="Lozinka mora sadrzati najmanje 6 karaktera";

                }
            }
            else
            {
                $odgovor['greska']="Pogresna stara lozinka";
            }
        }
        else
        {
            $odgovor['greska']="Lozinke se ne poklapaju";
        }
    }
    else
    {
        $odgovor['greska']="Niste popunili sve podatke";
    }
    echo JSON_encode($odgovor, 256);
}

//registracija 

if($funkcija=="registracija")
{
    $email = $_POST['regEmail'];
    $ime = $_POST['regIme'];
    $prezime = $_POST['regPrezime'];
    $lozinka = $_POST['regLozinka'];
    $ponovljenaLozinka = $_POST['ponovljenaLozinka'];

    if($email!="" and $ime!="" and $prezime!="" and $lozinka!="" and $ponovljenaLozinka!="")
    {   
            if($lozinka===$ponovljenaLozinka)
            {
            
                if(strlen($lozinka)>5)
                {
                    $upit = "SELECT * FROM korisnik WHERE korisnik_email='{$email}'";
                    $rez = $db->query($upit);
                    if($db->num_rows($rez)==0)
                {
                    $validan = time();
                    $sql = "INSERT INTO korisnik (korisnik_ime, korisnik_prezime, korisnik_email, korisnik_lozinka, korisnik_status, korisnik_validan) VALUES ('{$ime}','{$prezime}','{$email}','{$lozinka}','Korisnik','{$validan}')";
                    $db->query($sql);
                    if($db->error())
                        {
                            $odgovor['greska']= "Neuspesna registracija".$db->error;
                        }
                    else 
                        {
                         $odgovor['poruka']= "Uspesno ste se registrovali";
                         Statistika::upisiLog("logs/logovanja.log", "{$_SESSION['ime']} {$_SESSION['prezime']}, Registrovan novi korisnik $ime $prezime");

                        }

                $mail = new PHPMailer();
                $mail->isSMTP();
                $mail->Host = "smtp.gmail.com";
                $mail->SMTPAuth = true;
                $mail->Username = "knezevicandrej32@gmail.com";
                $mail->Password = "jasamcar123";
                $mail->Port = 465; 
                $mail->SMTPSecure = "ssl";

                $mail->isHTML(true);
                $mail->setFrom("knezevicandrej32@gmail.com");
                $mail->addAddress($email);
                $mail->Subject = "Registracija";
                $mail->Body = "Za registraciju vaseg naloga potrebno je da kliknete na sledeci link: <br> 
                    <a href='https://localhost/Projekat/registracija.php?email=$email&validan=$validan/'>Kliknite ovde</a>
                ";
                if($mail->send())
                    {
                        $odgovor['poruka'] = "Uspesna registracija, poslat verifikacioni email";
                    }

                else 
                {
                    $odgovor['greska'] = "Email nije poslat".$mail->ErrorInfo;
                }
                    
               
                }
                else
                {
                 $odgovor['greska']= "Email vec postoji";
                }
            
            }
            else
            {
                $odgovor['greska']= "Lozinka mora sadrzati najmanje 6 karaktera";
            }
            
            }
            else
            {
                $odgovor['greska'] = "Lozinke se ne poklapaju";
            }
            
                
            
            }
            else
            {
                $odgovor['greska']= "Niste uneli neophodne podatke";
            }
            

            echo JSON_encode($odgovor, 256);

}
?>