<?php

	include 'connexion.php';
	
	$date= $_POST['date'];
	$heure=$_POST['heure'];
    $typeOffre=$_POST['typeOffre'];
    //$idUser = $_POST['idUser'];
	
	$requete="INSERT INTO transport VALUES(date='".$date."', heure='".$heure."',typeOffre = '".$typeOffre."', idUser = 1";
	
	$result=mysqli_query($db,$requete);
	$nbLignes=mysqli_num_rows($result);
	
	if ($nbLignes)
		echo json_encode("Succes");
	else{
		echo json_encode("Erreur");
		
	}
	
	include 'deconnexion.php';
	
?>