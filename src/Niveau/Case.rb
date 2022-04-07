##
# Représente une case de la grille
#
class Case

    ##
    # @x => position x de la case dans la grille
    # @y => position y de la case dans la grille
    # @clicable => si la case est clicable ou pas

    attr_reader :x, :y

    private_class_method :new

    def initialize(x, y)
        @x, @y = x, y
        @cliquable = false
    end

    ##
    # Affiche le type de la case et sa position
    #
    def to_s
        self.class.name + ": " + @x.to_s + ", " + @y.to_s
    end

end