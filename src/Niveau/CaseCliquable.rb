require_relative "./Case.rb"
require_relative "./Historique.rb"

require_relative "../Modules/dpObservateur/Observable.rb"

##
# Classe d'énumaratioon pour les type de cases
#
class TypeCase

    ##
    # Case Vide
    VIDE = 0
    ##
    # Case mur
    MUR = 1
    ##
    # Case point
    POINT = 2

end

##
# Case cliquable qui peut prendre plusieurs états (vide, supposé vide ou mur)
#
class CaseCliquable < Case

    include Observable

    ##
    # @etat etat de la case: 0 vide, 1 point, 2 mur

    attr_reader :etat, :historique

    ##
    # Constructeur de CaseClicable
    #
    # ==== Attributes
    #
    # * -x- Position x dans la grille
    # * -y- Position y dans la grille
    # * -etat- etat de la case: 0 vide, 1 point, 2 mur
    #
    def CaseCliquable.creer(x, y, historique, etat = TypeCase::VIDE)
        new(x, y, historique, etat)
    end
 
    def initialize(x, y, historique, etat)

        super(x, y)
        @etat = etat
        @historique = historique
        @cliquable = true
        @observateurs = []

    end

    ##
    # Met l'etat de la case à l'etat suivant
    #
    def changeEtat
        
        @etat = (@etat + 1) % 3
        return self
        
    end

    ##
    # Complète l'affichage de Case avec l'état correspondant à la case
    # 
    def to_s
        super() + " | " + etat.to_s
    end
end