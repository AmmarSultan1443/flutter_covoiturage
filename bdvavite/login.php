<?php

	include 'connexion.php';
	
	$login= $_POST['login'];
	$mdp=$_POST['mdp'];
	
	$requete="SELECT * FROM UTILISATEUR Where mailUser='".$login."' and passUser='".$mdp."' ";
	
	$result=mysqli_query($db,$requete);
	$nbLignes=mysqli_num_rows($result);
	
	if ($nbLignes)
		echo json_encode("Succes");
	else{
		echo json_encode("Erreur");
		
	}
	
	include 'deconnexion.php';
	
?>