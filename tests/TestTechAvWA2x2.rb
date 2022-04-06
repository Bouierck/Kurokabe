require_relative '../src/Aide/Techniques/AvWA2x2.rb'
require_relative '../src/Niveau/Grille.rb'
require_relative '../src/Donnees/Utilisateur.rb'

grille = Grille.creer(Utilisateur.creer("Stun", 1), "level1", "aventure")
ile = AvWA2x2.creer(grille)

# 3 murs entourant la case et coller entre eux x = 2 et y = 2
2.times { grille.matrice[3][3].changeEtat }
2.times { grille.matrice[3][4].changeEtat }
2.times { grille.matrice[2][4].changeEtat }

if(ile.verifieTech == true)
    puts("Test 2: OK !")
else
    puts("Test 2: KO !")
end
