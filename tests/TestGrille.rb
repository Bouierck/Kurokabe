load "../src/Niveau/Grille.rb"
load "../src/Donnees/Utilisateur.rb"

g = Grille.creer(Utilisateur.creer("Stun", "") ,"level1", "aventure")
puts g

puts g.matriceCorrigee

