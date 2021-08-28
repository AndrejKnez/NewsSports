$(function(){

//popunjavanje korisnika

popuniSveKorisnike();
//novalozinka
$('.promeniloz').on("click",promenilozinku);  

//registracija
$('#btnRegistracija').on("click",registracija);  

//logovanje
$('#prijava').on("click",login);  
    
//polja za novu lozinku
$('#zabLoz').on("click",zabloz);  
   
//slanje nove lozinke
$('#btnLozinka').on("click",novalozinka);  

//insert i update
$("#snimi").on("click", insertUpdate);

//ciscenje
$("#ocisti").on("click", ocistiSve);

//brisanje korisnika
$("#obrisi").on("click", brisanje);
   
    
}); 

const navbar = document.querySelector(".navbar");

window.onscroll = function(){
    let top = window.scrollY;
    if(top >= 50)
    {
        navbar.classList.add('scroll');
    }
    else
    {
        navbar.classList.remove('scroll');
    }
}





//funkcija za popunjavanje korisnika

function popuniSveKorisnike()
{
    $.get("../ajax/snimiKorisnike.php?opcija=select", function(response){
       
        let obj = JSON.parse(response);
        let str = "";
        for(el of obj)
        {
            str+="<div class='korisnici' data-id='"+el.korisnik_id+"' data-prezime='"+el.korisnik_prezime+"' data-ime='"+el.korisnik_ime+"' data-email='"+el.korisnik_email+"' data-komentar='"+el.korisnik_komentar+"' data-status='"+el.korisnik_status+"'>"+el.korisnik_id+": "+el.korisnik_ime+" "+el.korisnik_prezime+"</div>";
        }

        $("#sviKorisnici").html(str);
        $(".korisnici").click(function(){
            $("#imeK").val($(this).data("ime"));
            $("#idK").val($(this).data("id"));
            $("#prezimeK").val($(this).data("prezime"));
            $("#komentarK").val($(this).data("komentar"));
            $("#statusK").val($(this).data("status"));
            $("#emailK").val($(this).data("email"));
            $("#emailK").attr("disabled", "disabled");
        })
    })
}

//funkcija za brisanje korisnika

function brisanje(){
    if($("#idK").val()==""){
        alert("Niste izabrali korisnika za brisanje");
        return false;
    }
    if(!confirm("Da li ste sigurni da zelite da obrisete korisnika?")) return false;
    $.post("../ajax/snimikorisnike.php?opcija=delete", {id:$("#idK").val()}, function(response){
        $("#odgovor").html(response);
        popuniSveKorisnike();
        ocistiSve();
    })
}



//funkcija ciscenje inputa

function ocistiSve(){
    $("input").val("");
    $("#status").val("0");
    $("#email").removeAttr("disabled");
    

}


// funkcija za slanje nove lozinke
function novalozinka(){
    

   let lozinkaEmail = $("#lozinkaEmail").val();
   let odgovor = $("#odgovor");
   if(lozinkaEmail == "")
   {
       odgovor.html("Niste uneli email adresu");
       return false;
   }
   else 
   {
       $.post("../ajax/ajax_login.php?funkcija=zaboravljenaLozinka", {email:lozinkaEmail}, function(response){
        
        let o = JSON.parse(response);
        if(o.greska)
        {
            odgovor.html(o.greska);
        }
        else 
        {
            odgovor.html(o.poruka);
        }
       })
   }

}




//funckije za insert i update

function insertUpdate(){
        let ime= $("#imeK").val();
        let id=$("#idK").val();
        let prezime=$("#prezimeK").val();
        let komentar=$("#komentarK").val();
        let status=$("#statusK").val();
        let email=$("#emailK").val();
        if(ime!="" && prezime!="" && status!="0" && email!="")
        {
             if(id=="")
        {
            $.post("../ajax/snimikorisnike.php?opcija=insert", {ime:ime, prezime:prezime, komentar:komentar, status:status, email:email}, function(response){
                $("#odgovor").html(response);
                popuniSveKorisnike();
                ocistiSve();
            })
        }
        else
        {
            $.post("../ajax/snimikorisnike.php?opcija=update", {id:id, ime:ime, prezime:prezime, komentar:komentar, status:status, email:email}, function(response){
                $("#odgovor").html(response);
                popuniSveKorisnike();
                ocistiSve();
            })
        }
        }
        else 
        {
            $("#odgovor").html("Niste uneli potrebne podatke");
        }
       
    }


//funkcija za logovanje
function login(){
    let email = $("#email").val();
    let password = $("#password").val();
    let odgovor = $("#odgovor");
    if(email=="" && password=="")
    {
        odgovor.html("Niste uneli sve podatke");
        return false;
    }
    else
    $.post("../ajax/ajax_login.php?funkcija=login", {email:email, password:password}, function(response){
        
        let a = JSON.parse(response);
        if(a.greska)
        {
            odgovor.html(a.greska);
        }
        else 
        {
            window.location.assign(a.poruka);
        }
    })
}

 //polja za slanje nove lozinke
    function zabloz(){
        
        $("#poljaprijava").hide();
        $("#poljalozinka").show();
    
    }

//funkcija promene lozinke

function promenilozinku(){
    let staraloz = $("#staraloz").val();
    let novaloz = $("#novaloz").val();
    let novaloz2= $("#novaloz2").val();
    let odgovor=$("#odgovor");
    if(staraloz=="" || novaloz=="" || novaloz2=="")
    {
        odgovor.html("Niste uneli sve podatke");
    }

    else
    {
        $.post("../ajax/ajax_login.php?funkcija=novalozinka", {staraloz:staraloz, novaloz:novaloz, novaloz2:novaloz2}, function(response){
            
            let nova = JSON.parse(response);
            if(nova.greska)
            {
                odgovor.html(nova.greska);

            }
            else
            {
                odgovor.html(nova.poruka);
                ocistiSve();
            }
        })
    }
}


// funkcija za regstraciju
function registracija(){
    
    let regEmail = $("#regEmail").val();
    let regIme = $("#regIme").val();
    let regPrezime = $("#regPrezime").val();
    let regLozinka = $("#regLozinka").val();
    let ponovljenaLozinka = $("#ponovljenaLozinka").val();
    let odgovor = $("#odgovor");
    if(regIme=="" || regEmail=="" || regPrezime=="" || regLozinka=="" || ponovljenaLozinka=="")
    {
        
        odgovor.html("Niste uneli neophodne podatke");
        return false;
    }
    else 
    {
        $.post("../ajax/ajax_login.php?funkcija=registracija", {regIme: regIme, regPrezime:regPrezime, regEmail:regEmail, regLozinka: regLozinka, ponovljenaLozinka: ponovljenaLozinka}, function(response){
            
            let b = JSON.parse(response);
            if(b.greska)
            {
                odgovor.html(b.greska);
            }
            else 
            {
                odgovor.html(b.poruka);
                ocistiSve();
            }

                })
            }

}

