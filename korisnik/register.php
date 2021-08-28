<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../fontawesome/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
    <div class='login--page'>
    
    <div class='login-form'>
    <a class='close' href="../index.php"><i class="fas fa-window-close"></i></a>
    <h2 class='prijava-naslov'>Registruj se</h2>
    <p class='nalog'>Imas nalog? <a href="login.php">Prijavi se</a></p>
    <br>
    
    
    <input type="text" name='regIme' id='regIme' placeholder='Ime' maxlength='15' required>
    <input type="text" name='regPrezime' id='regPrezime' placeholder='Prezime' maxlength='15' required>
    <input type="email" name='regEmail' id='regEmail' placeholder='Email' maxlength='30' required>
    <input type="password" name='regLozinka' id='regLozinka' placeholder='Lozinka' maxlength='15'  required>
    <input type="password" name='ponovljenaLozinka' id='ponovljenaLozinka' placeholder='Ponovi lozinku' required>
    
    
    <button class='login-button' id='btnRegistracija'>Registruj se</button>

    <p id='odgovor'></p>
    

    <div class='login-socials'> 
        <a class='link-socials' href="">Prijavi se</a> <p>Facebook</p> 
    </div>

    <div class='login-socials'> 
        <a class='link-socials' href="">Prijavi se</a> <p>Twitter</p> 
    </div>

    <div class='login-socials'> 
        <a class='link-socials' href="">Prijavi se</a> <p>Google</p> 
    </div>





    </div>







    </div>

    
    
 
<script src='../js/main.js'></script>
</body>
</html>