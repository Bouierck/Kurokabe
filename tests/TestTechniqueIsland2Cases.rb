require_relative '../src/Aide/Techniques/Island2Cases.rb'
require_relative '../src/Niveau/Grille.rb'
require_relative '../src/Donnees/Utilisateur.rb'

grille = Grille.creer(Utilisateur.creer("Stun", 1), "level2", "aventure")
srdSqr = Island2Cases.creer(grille)

#Ile complétement vide
if(srdSqr.verifieTech == true)
    puts("Test 1: KO !")
else
    puts("Test 1: OK !")
end

puts grille

# Mur entourant la case x = 2 et y = 2
2.times { grille.matrice[3][0].changeEtat }
2.times { grille.matrice[4][1].changeEtat }


if(srdSqr.verifieTech == true)
    puts("Test 2: OK !")
else
    puts("Test 2: KO !")
end