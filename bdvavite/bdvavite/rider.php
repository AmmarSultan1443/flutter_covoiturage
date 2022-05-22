<?php

include 'connexion.php';
	
//$idUser= $_POST['rider'];

$requete="SELECT * FROM UTILISATEUR Where idUser=1";

$result=mysqli_query($db,$requete);
	$data=array();
	
	
	while($row = mysqli_fetch_assoc($result)){
		$data[]=$row;
		
	}
	
	echo json_encode($data);
	
	// Libérer le jeu de résultat
	mysqli_free_result($result);

include 'deconnexion.php';

?>