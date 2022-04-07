require_relative '../Test.rb'

require_relative "../../src/Niveau/CaseCliquable.rb"
require_relative "../../src/Niveau/CaseChiffre.rb"
require_relative "../../src/Niveau/Grille.rb"
require_relative "../../src/Niveau/Historique.rb"

require_relative "../../src/Aide/Techniques/Island.rb"

require_relative '../../src/Donnees/Langue.rb'

Langue.init

historique = Historique.new

matrice = [
    [CaseCliquable.creer(0, 0, historique), CaseCliquable.creer(1, 0, historique), CaseCliquable.creer(2, 0, historique)],
    [CaseCliquable.creer(0, 1, historique), CaseChiffre.creer(1, 1, 1), CaseCliquable.creer(2, 1, historique)],
    [CaseCliquable.creer(0, 2, historique), CaseCliquable.creer(1, 2, historique), CaseCliquable.creer(2, 2, historique)]
]

matriceCorrigee = [
    [CaseCliquable.creer(0, 0, historique, 1), CaseCliquable.creer(1, 0, historique, 1), CaseCliquable.creer(2, 0, historique, 1)],
    [CaseCliquable.creer(0, 1, historique, 1), CaseChiffre.creer(1, 1, 1), CaseCliquable.creer(2, 1, historique, 1)],
    [CaseCliquable.creer(0, 2, historique, 1), CaseCliquable.creer(1, 2, historique, 1), CaseCliquable.creer(2, 2, historique, 1)]
]

grille = Grille.creer(matrice, matriceCorrigee)

tech = Island.new

Test.assert("Technique trouvé avec tout les murs", tech.verifieTech(grille) == true)

matrice = [
    [CaseCliquable.creer(0, 0, historique), CaseCliquable.creer(0, 1, historique, 1), CaseCliquable.creer(0, 2, historique)],
    [CaseCliquable.creer(1, 0, historique, 1), CaseChiffre.creer(1, 1, 1), CaseCliquable.creer(1, 2, historique, 1)],
    [CaseCliquable.creer(2, 0, historique, 1), CaseCliquable.creer(2, 1, historique, 1), CaseCliquable.creer(2, 2, historique, 1)]
]

grille = Grille.creer(matrice, matriceCorrigee)

Test.assert("Technique 1 entourer de murs", tech.verifieTech(grille) == false)

matrice = [
    [CaseChiffre.creer(0, 0, 1), CaseCliquable.creer(0, 1, historique, 1), CaseCliquable.creer(0, 2, historique)],
    [CaseCliquable.creer(1, 0, historique), CaseCliquable.creer(1, 1, historique), CaseCliquable.creer(1, 2, historique)],
    [CaseCliquable.creer(2, 0, historique), CaseCliquable.creer(2, 1, historique), CaseCliquable.creer(2, 2, historique)]
]

matriceCorrigee = [
    [CaseCliquable.creer(0, 0, historique, 1), CaseCliquable.creer(0, 1, historique, 1), CaseCliquable.creer(0, 2, historique, 1)],
    [CaseCliquable.creer(1, 0, historique, 1), CaseChiffre.creer(1, 1, 1), CaseCliquable.creer(1, 2, historique)],
    [CaseCliquable.creer(2, 0, historique, 1), CaseCliquable.creer(2, 1, historique, 1), CaseCliquable.creer(2, 2, historique, 1)]
]

grille = Grille.creer(matrice, matriceCorrigee)

Test.assert("Technique 1 dans un coin + 1 mur", tech.verifieTech(grille) == true)