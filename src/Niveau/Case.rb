require 'gtk3'

##
# Représente une case de la grille
#
class Case < Gtk::Button 

    ##
    # @x => position x de la case dans la grille
    # @y => position y de la case dans la grille
    # @clicable => si la case est clicable ou pas

    attr_reader :x, :y

    private_class_method :new

    def initialize(x, y)
        super()
        @x, @y = x, y
        @cliquable = false
    end

end