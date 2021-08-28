<?php

function login()
{
    
        if(isset($_SESSION['id']) and isset($_SESSION['ime']) and isset($_SESSION['status']))
    {
        return true;
    }
    else return false;
    
    
}

function validanString($str)
{
    $str = filter_var($str, FILTER_SANITIZE_STRING);
    if(strpos($str, ' ')!=false) return false;
    if(strpos($str, '=')!=false) return false;
    if(strpos($str, '*')!=false) return false;
    if(strpos($str, '/')!=false) return false;
    if(strpos($str, '-')!=false) return false;
    if(strpos($str, '+')!=false) return false;
    if(strpos($str, '!')!=false) return false;
    if(strpos($str, '#')!=false) return false;
    if(strpos($str, '$')!=false) return false;
    if(strpos($str, '%')!=false) return false;
    if(strpos($str, '^')!=false) return false;
    if(strpos($str, '&')!=false) return false;
    if(strpos($str, ')')!=false) return false;
    if(strpos($str, '_')!=false) return false;
    if(strpos($str, '|')!=false) return false;
    if(strpos($str, '"')!=false) return false;
    if(strpos($str, '}')!=false) return false;
    if(strpos($str, '{')!=false) return false;
    if(strpos($str, '[')!=false) return false;
    if(strpos($str, ']')!=false) return false;
    if(strpos($str, ';')!=false) return false;
    if(strpos($str, ':')!=false) return false;
    if(strpos($str, ',')!=false) return false;

    if(strpos($str, '/')!=false) return false;


    
    return true;
}

function generisiLozinku(){
    
    $ms = ["a", "b", "c", "d", "e", "f", "g"];
    $vs = ["A", "B", "C", "D", "E", "F", "G"];
    $broj = [0,1,2,3,4,5,6,7,8,9];
    

    $lozinka= $ms[mt_rand(0, count($ms)-1)].$ms[mt_rand(0, count($ms)-1)].$vs[mt_rand(0, count($vs)-1)].$vs[mt_rand(0, count($vs)-1)].$broj[mt_rand(0, count($broj)-1)];

    return $lozinka;
}



?>