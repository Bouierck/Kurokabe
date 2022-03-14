load "../src/Niveau/Grille.rb"
load "../src/Donnees/Utilisateur.rb"

puts Grille.creer(Utilisateur.creer("Stun", "") ,"level1").matrice

