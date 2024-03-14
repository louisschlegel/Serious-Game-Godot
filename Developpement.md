# Plan de Développement pour Projet Godot

## Introduction
- Le projet est un serious game montrant les différences perspectives de tout types de violence. Il permet de se rendre compte que la même violence peut etre interprétée différemment suivant les situations.
- Le projet a été commencé le 15/09/2023 et terminé le 22/12/2023, a été fait dans le cadre d'un projet scolaire en 2ème année de BUT Informatique.
- Le projet a comme auteurs :
	Louis Schlegel
	Louis Hertschuh
	Thomas Goepp
	Nicolas Moutou

## Environnement de Développement
- Il faut avoir un ordinateur permettant de faire tourner Godot Engine 4.1 ( A partir de Windows 7, Mac OS 10.2 ou Linux )
- Lien d'installation de Godot Engine : [godot](https://godotengine.org)

## Structure du Projet
- Le fichier est codé en GDScript
- Les variables sont écrite en camel Case, les méthodes en Snake Case et les classes en Pascal Case

## Fonctionnalités
- Donner des coups de poing 
	Permet de mettre K.O. des PNJs dans certaines situations
- Telephone
	Permet de consulter un téléphone avec des historiques de conversations
-Inventaire
	Permet de stocker 5 items par terre ( clignottant en jaune ) pour faire avancer l'histoire
-Jauges de violence
	Permet de juger à la fin des scènes les niveaux de violence et d'estimer les peines légale pour ces actions
-Interragir avec les PNJs
	Permet de parler aux PNJs pour faire avancer l'histoire

## Architecture du Code
- Utilisation de la programmation orientée objet
- Chaque scène est un objet différent appelé dans la boucle principale du jeu ( ScenePrincipale.gd )

## Graphismes et Ressources
- Utilisation d'un AnimationTree et AnimationPlayer pour les animations du Joueur
- Une scène contient généralement une tilemap avec la carte dessus
- Intégration et utilisation d'assets externes (majoritairement sur le site [kenney](https://www.kenney.nl/) et [itch.io](https://itch.io/game-assets)

## Programmation Gameplay
- Gestion des entrées utilisateur
- Implémentation de la logique de gameplay
- Intégration de mécaniques de jeu spécifiques

## Optimisation
- Utilisation d'image dans le téléphone avec une scrollbar pour optimiser la mémoire

## Documentation
- Documentation à refaire, très peu présente mais code assez simple à comprendre ( les documentations automatique ne marchaient pas bien )
- Guide d'utilisation dans [Description.md](Description.md)
- Documentation destinée aux utilisateurs finaux

## Collaboration
- Utilisation de git 
- Chaque personne a un fork du projet qu'il alimente comme il vaut et lorsque sa version est fini il merge dans le projet principal
- Communication a travers des réunions, des sessions de code commun et des groupes Discord 

## Planification et Suivi
- Utilisation des schémas Perl et Gantt pour mettre en place l'organisation

## Réutilisation
- Il suffit juste de fork le git "SeriousGame" et de faire une copie local sur notre ordinateur
- Si une modification est faire sur le fork, vous pouvez faire un merge request

## Conclusion
- Points clés du développements :
	Ajout du joueur
	Ajout des PNJs
	Ajout des maps
	Ajout des scènes
	Ajout du menu
	Ajout des questions en fin de scène
- On espère que ce projet restera jouable pendant longtemps 
- Merci à toutes les personnes qui nous ont soutenus pour ce projet ( Cyprien Iov )
