##
# Test unitaire de la Sauvegarde
#

load '../src/Donnees/Sauvegarde.rb'

#Création d'une sauvegarde
Sauvegarde.creer("Jeremy")

#Création d'un niveau
niveau = Niveau.creer(11, Utilisateur.creer("Jeremy", 1), "Aventure")

#Sauvegarde du niveau
Sauvegarde.sauvNiveau("Jeremy", niveau, 0, 2)

#Récupération du niveau sauvegardé
fichier = File.open("../profile/Jeremy/levels/Aventure/level11.iml", "r")
print(Marshal.load(fichier))
fichier.close