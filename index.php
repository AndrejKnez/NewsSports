<?php
session_start();
require_once("klase/classBaza.php");
?>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sportske vesti </title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    
</head>
<body>
    

<div id="wrapper">

<?php
require_once("_require.php/_header.php");
?>

<?php
require_once("_require.php/_main.php");


?>


</div> <!--end wrapper-->

<?php
require_once("_require.php/_footer.php");


?>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src='js/main.js'></script>
</body>
</html>