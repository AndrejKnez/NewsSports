<?php
require_once("../require.php");


session_start();
session_unset();
session_destroy();
header("location: ../index.php");
Statistika::upisiLog("../logs/logovanja.log", "{$_SESSION['ime']} Uspesna odjava");

?>