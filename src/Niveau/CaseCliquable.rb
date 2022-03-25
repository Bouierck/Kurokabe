require_relative "Case.rb"

class CaseCliquable < Case

    ##
    # @etat etat de la case: 0 vide, 1 point, 2 mur

    attr_reader :etat

    ##
    # Constructeur de CaseClicable
    #
    # ==== Attributes
    #
    # * -x- Position x dans la grille
    # * -y- Position y dans la grille
    # * -etat- etat de la case: 0 vide, 1 point, 2 mur
    #
    def CaseCliquable.creer(x, y, etat = 0)
        new(x, y)
        @etat = etat
        self.label = @etat
    end

    def initialize(x, y)
        super(x, y)
        @etat = 0
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