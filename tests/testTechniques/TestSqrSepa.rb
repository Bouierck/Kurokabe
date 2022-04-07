require_relative "../../src/Niveau/CaseCliquable.rb"
require_relative "../../src/Niveau/CaseChiffre.rb"
require_relative "../../src/Niveau/Grille.rb"
require_relative "../../src/Niveau/Historique.rb"
require_relative "../../src/Aide/Techniques/SquareSepa.rb"
require_relative "../../src/Donnees/Langue.rb"
require_relative "../Test.rb"

Langue.init

historique = Historique.new

matrice = [
    [CaseCliquable.creer(0, 0, historique), CaseCliquable.creer(0, 1, historique), CaseCliquable.creer(0, 2, historique)],
    [CaseChiffre.creer(1, 0, 3), CaseCliquable.creer(1, 1, historique), CaseChiffre.creer(1, 2, 2)],
    [CaseCliquable.creer(2, 0, historique), CaseCliquable.creer(2, 1, historique), CaseCliquable.creer(2, 2, historique)]
]

matriceCorrigee = [
    [CaseCliquable.creer(0, 0, historique, TypeCase::MUR), CaseCliquable.creer(1, 0, historique, TypeCase::MUR), CaseCliquable.creer(2, 0, historique, TypeCase::MUR)],
    [CaseChiffre.creer(0, 1, 3), CaseCliquable.creer(1, 1, historique, TypeCase::MUR), CaseChiffre.creer(2, 1, 2)],
    [CaseCliquable.creer(0, 2, historique, TypeCase::MUR), CaseCliquable.creer(1, 2, historique, TypeCase::MUR), CaseCliquable.creer(2, 2, historique, TypeCase::MUR)]
]


grille = Grille.creer(matrice, matriceCorrigee)


sqrSepa = SquareSepa.new

Test.assert("Case noire entre deux cases chiffres", sqrSepa.verifieTech(grille) == true)