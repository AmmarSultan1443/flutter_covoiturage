<?php

	include 'connexion.php';
	
	$date= $_POST['date'];
	$heure=$_POST['heure'];
    $typeOffre=$_POST['typeOffre'];
	$mail = $_POST['mail'];
    //$idUser = $_POST['idUser'];
	
	$requete="INSERT INTO transport (date, heure, typeOffre, idUser) VALUES('".$date."','".$heure."','".$typeOffre."', (SELECT idUser FROM utilisateur WHERE mailUser = '".$mail."'))";
	
	$result=mysqli_query($db,$requete);
	$nbLignes=mysqli_num_rows($result);
	
	if ($nbLignes)
		echo json_encode("Succes");
	else{
		echo json_encode("Erreur");
		
	}
	
	include 'deconnexion.php';
	
?>