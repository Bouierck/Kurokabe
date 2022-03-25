class Case

    ##
    # @x => position x de la case dans la grille
    # @y => position y de la case dans la grille
    # @etat => etat actuel dela case

    ##
    # Constructeur de Case
    #
    # ==== Attributes
    #
    # * -x- Position x dans la grille
    # * -y- Position y dans la grille
    #
    def Case.creer(x, y):
        new(x, y)
    end

    private_class_method :new

    def initialize(x, y):
        @x, @y = x, y
        @etat = 0
    end

    ##
    # Met l'etat de la case à l'etat suivant
    #
    def changeEtat:
        @etat = (@etat + 1) % 3
    end

end