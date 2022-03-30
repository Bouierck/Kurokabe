require_relative "Case.rb"
require_relative "./Historique.rb"

#require_relative "../Donnees/Sauvegarde.rb"

##
# Case cliquable qui peut prendre plusieurs états (vide, supposé vide ou mur)
#
class CaseCliquable < Case

    ##
    # @etat etat de la case: 0 vide, 1 point, 2 mur

    attr_reader :etat, :historique, :grille

    ##
    # Constructeur de CaseClicable
    #
    # ==== Attributes
    #
    # * -x- Position x dans la grille
    # * -y- Position y dans la grille
    # * -etat- etat de la case: 0 vide, 1 point, 2 mur
    #
    def CaseCliquable.creer(x, y, historique, grille, etat = 0)
        new(x, y, historique, grille, etat)
    end
 
    def initialize(x, y, historique, grille, etat)
        super(x, y)
        @etat = etat
        @historique = historique
        @grille = grille
        @cliquable = true
    end

    ##
    # Met l'etat de la case à l'etat suivant
    #
    def changeEtat
        @etat = (@etat + 1) % 3
    end
    
    def to_s
        return "~" + @etat.to_s + "~"
    end
end