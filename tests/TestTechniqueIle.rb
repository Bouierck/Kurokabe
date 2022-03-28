require_relative '../src/Aide/Techniques/Island.rb'
require_relative '../src/Niveau/Grille.rb'
require_relative '../src/Donnees/Utilisateur.rb'

grille = Grille.creer(Utilisateur.creer("Stun", 1), "level1", "aventure")
ile = Island.creer(grille)

#Ile complétement vide
if(ile.verifieTech == true)
    puts("Test 1: OK !")
else
    puts("Test 1: KO !")
end

#Ile 3 cases vides + 1 supposé vide
grille.matrice[1][2].changeEtat

if(ile.verifieTech == true)
    puts("Test 2: OK !")
else
    puts("Test 2: KO !")
end

#Ile 2 cases vides + 1 supposé vide + 1 mur
2.times { grille.matrice[2][3].changeEtat }

if(ile.verifieTech == true)
    puts("Test 3: OK !")
else
    puts("Test 3: KO !")
end

#Ile 1 case vide + 1 supposé vide + 2 murs
2.times { grille.matrice[2][1].changeEtat }

if(ile.verifieTech == true)
    puts("Test 4: OK !")
else
    puts("Test 4: KO !")
end

#Ile 0 case vide + 0 supposé vide + 4 mur
2.times { grille.matrice[3][2].changeEtat }
grille.matrice[1][2].changeEtat

if(ile.verifieTech == false)
    puts("Test 5: OK !")
else
    puts("Test 5: KO !")
end