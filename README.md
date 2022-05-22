# covoiturage_vavite

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# flutter_covoiturage
# flutter_covoiturage

Il est primordial d'ajouter le script de la base de données dans son serveur local et d'ajouter le dossier bdvavite dans htdocs de votre WAMP/ LAMP/ MAMP. Il faudra également refaire la connexion à la base de données dans le fichier : bdvavite/connexion.php

Cette application présente les bases pour l'utilisateur : jmarcel@jemail.com au mot de passe: testgibson.

Il est possible de se connecter, les pages utilisées pour la connexion sont : lib/connexion.dart et bdvavite/login.php
Il est également possible de consulter les courses proposées avec les fichiers : lib/menu.dart et bdvavite/transport.php
Pour consulter une offre en particulier, il faut cliquer sur cette offre. On fait appel aux fichiers : lib/ride.dart et bdvavite/rider.php
L'ajout de courses se fait dans le deuxième onglet du menu du bas. 
On peut ajouter :
- la date
- l'heure
- et le type d'offre

Ce sont les fichiers : lib/ajouter.dart et bdvavite/ajout.php qui sont utilisés.

Enfin un utilisateur peut modifier ses informations dans l'onglet profil. 
Les fichiers utilisés : lib/profilePage.dart et bdvavite/updateProfile.php
