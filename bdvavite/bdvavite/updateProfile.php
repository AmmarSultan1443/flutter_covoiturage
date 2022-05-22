<?php
include 'connexion.php';
	
$mail= $_POST['mail'];
$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$tel = $_POST['tel'];
$pass = $_POST['password'];

$requete="UPDATE utilisateur\n"

. "SET nomUser = \"".$nom."\", prenUser = \"".$prenom."\", telUser=\"".$tel."\", passUser = \"".$pass."\" WHERE mailUser = \"".$mail."\"";



$result=mysqli_query($db,$requete);
$nbLignes=mysqli_num_rows($result);

if ($nbLignes)
    echo json_encode("Succes");
else{
    echo json_encode("Erreur");
    
}

include 'deconnexion.php';

?>