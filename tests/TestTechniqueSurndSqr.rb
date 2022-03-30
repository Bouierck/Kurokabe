require_relative '../src/Aide/Techniques/SurndSqr.rb'
require_relative '../src/Niveau/Grille.rb'
require_relative '../src/Donnees/Utilisateur.rb'

grille = Grille.creer(Utilisateur.creer("Stun", 1), "level3", "aventure")
srdSqr = SurndSqr.creer(grille)

#Ile complétement vide
if(srdSqr.verifieTech == true)
    puts("Test 1: KO !")
else
    puts("Test 1: OK !")
end

# Mur entourant la case x = 2 et y = 2
2.times { grille.matrice[2][1].changeEtat }
2.times { grille.matrice[2][3].changeEtat }
2.times { grille.matrice[3][2].changeEtat }
2.times { grille.matrice[1][2].changeEtat }

if(srdSqr.verifieTech == true)
    puts("Test 2: OK !")
else
    puts("Test 2: KO !")
end