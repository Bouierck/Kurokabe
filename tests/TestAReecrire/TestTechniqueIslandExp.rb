require_relative '../src/Aide/Techniques/IslandExp.rb'
require_relative '../src/Niveau/Grille.rb'
require_relative '../src/Donnees/Utilisateur.rb'

grille = Grille.creer(Utilisateur.creer("Stun", 1), "level1", "aventure")
isldExp = IslandExp.creer(grille)

#Ile complétement vide
if(isldExp.verifieTech == true)
    puts("Test 1: KO !")
else
    puts("Test 1: OK !")
end

#Cas parfait avec une case à proposer en x = 0 ; y = 4
2.times { grille.matrice[2][0].changeEtat }
2.times { grille.matrice[2][1].changeEtat }
2.times { grille.matrice[3][1].changeEtat }

if(isldExp.verifieTech == true)
    puts("Test 2: OK !")
    puts isldExp.casesChange[0].x, isldExp.casesChange[0].y
else
    puts("Test 2: KO !")
end