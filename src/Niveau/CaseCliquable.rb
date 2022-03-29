require_relative "Case.rb"
require_relative "./Historique.rb"

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
    def CaseCliquable.creer(x, y, historique, grille, etat = 0)
        new(x, y, historique, grille, etat)
    end

    def initialize(x, y, historique, grille, etat)
        super(x, y)
        @etat = etat
        @historique = historique
        @grille = grille
        @cliquable = true
        self.label = @etat.to_s
        self.signal_connect("clicked") {clicked}
    end

    ##
    # Met l'etat de la case à l'etat suivant
    #
    def changeEtat
        @etat = (@etat + 1) % 3
        self.label = @etat.to_s
    end

    def clicked
        changeEtat
        @historique.nouveauCoup(@x, @y)
        @grille.estFini
    end
    
    def to_s
        return "~" + @etat.to_s + "~"
    end
end