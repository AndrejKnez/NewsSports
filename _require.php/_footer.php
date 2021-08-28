<footer>




<div class="footertop">
<div class="content">
<div class="logofooter">

<img src="images/mozzart_logo.png" alt="Logo">  
    
</div> <!--end logofooter-->

<div class="appfooter">

<p>PREUZMITE I Moozart sport aplikacije</p>

<div class="iconsfooter">
<a href=""><i class="fab fa-apple"></i></a>
<a href=""><i class="fab fa-android"></i></a>



</div> <!--end iconsfooter-->




</div> <!--end appfooter-->
</div>
</div> <!--end footertop-->

<div class="footermain">
<div class="content">

<div class="favoriti">
    <a href="#">FAVORITI</a>
</div>   <!--end favoriti-->


<div class="naslovnafooter">
    <a href="index.php">NASLOVNA</a>
</div>   <!--end naslovna-->

<?php
$upit="SELECT * FROM kategorija";
        $rez=$db->query($upit);
        while($red=$db->fetch_object($rez))
        echo "<ul class='navbar'><li><a href='svevesti.php?kategorija={$red->kategorija_id}'>{$red->kategorija_naziv}</a></li></ul>";
?>


<div class="kladjenjefooter">
    <a href="#">KLADJENJE</a>
</div>   <!--end kladjenje -->

</div> <!--endcontent-->
 
</div> <!--endfootermain-->

<div class="footerbottom">
<div class="content">
<div class="footerbotttomleft">
    <div class="iconsfooterleft">
    <a href="https://www.facebook.com/MozzartSport/"><i class="fab fa-facebook"></i></a>
    <a href="https://twitter.com/MozzartSport/"><i class="fab fa-twitter"></i></a>
    <a href="https://www.youtube.com/user/SportMOZZART"><i class="fab fa-youtube"></i></a>
    <a href="https://www.instagram.com/mozzartsport/"><i class="fab fa-instagram"></i></a>
</div><!--end iconsfooterleft-->
<div class="footerbottomlefttext">
<a href="#">O nama</a>
<a href="#">Uslovi koriscenja</a>
<a href="#">Rss</p>
<p href="#">Politika privatnosti</a>
<a href="#">Politika kolacica</a>


</div><!--end footerbottomlefttext-->
</div> <!--end footerbotttomleft-->



</div>
</div> <!--end footerbottom-->
</footer>
