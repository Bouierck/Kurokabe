##
# Test unitaire de la Sauvegarde
#

load '../src/Donnees/Sauvegarde.rb'

#Création d'une sauvegarde
Sauvegarde.creer("Stun")

#Création d'un niveau
niveau = Niveau.creer(11, Utilisateur.creer("Heaven", 1), "Aventure")

puts niveau

#Sauvegarde du niveau
Sauvegarde.sauvNiveau("Heaven", niveau, 2)

#Récupération du niveau sauvegardé
fichier = File.open("../profile/Stun/levels/Aventure/level11.krkb", "r")
puts Marshal.load(fichier)
fichier.close