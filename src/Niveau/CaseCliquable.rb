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
    #
    def CaseClicable.creer(x, y)
        new(x, y)
    end

    def initialize(x, y)
        super(x, y)
        @etat = 0
        @clicable = true
    end

    ##
    # Met l'etat de la case à l'etat suivant
    #
    def changeEtat:
        @etat = (@etat + 1) % 3
    end
    
end