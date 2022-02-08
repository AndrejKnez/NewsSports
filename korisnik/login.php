<?php

session_start();
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

    <div class='login-form'>
    <a class='close' href="../index.php"><i class="fas fa-window-close"></i></a>
    <h2 class='prijava-naslov'>Prijavi se</h2>
    <p class='nalog'>Nemas nalog? <a href="register.php">Registruj se</a></p>
    <br>
   
    <div id='poljaprijava'>
    
    <input type="email" name='email' id='email' placeholder='Email' required>
    
    <input type="password" name='password' id='password' placeholder='Lozinka' required>
    <button  class='login-button' id='prijava'>Prijavi se</button>
    <a id='zabLoz'>Zaboravio sam lozinku</a>
</div>
    <div id='poljalozinka' style='display:none'>
       
        <input type="text" id='lozinkaEmail' name='lozinkaEmail' placeholder='Email'>
        
        <button class='login-button' id='btnLozinka'>Posalji novu lozinku</button>
    </div>

    
    <p id="odgovor"></p>
   
 

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

    <script
  src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src='../js/main.js'></script>
</body>
</html>









<?php




?>