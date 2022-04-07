require  'gtk3'

##
# Représente l'aspect graphique d'une case
#
class CaseGUI < Gtk::Button 

    ##
    # @case case qui est représentée par ce GUI

    attr_reader :case

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -c- case représentée par le gui
    #
    def CaseGUI.creer(c, grille, grilleGUI)
        new(c, grille, grilleGUI)
    end

    private_class_method :new

    def initialize(c, grille, grilleGUI)
        super()
        @case = c
        @nbCase = grille.matrice.length*grille.matrice.length
        @grille = grille
        @grilleGUI = grilleGUI

        case @nbCase
        when 25
            self.width_request = 85
            self.height_request = 85
            self.style_context.add_class("case")
        when 49
            self.width_request = 75
            self.height_request = 75
            self.style_context.add_class("case")
        when 100
            self.width_request = 65
            self.height_request = 65
            self.style_context.add_class("case-petit")
        when 225
            self.width_request = 45
            self.height_request = 45
            self.style_context.add_class("case-petit")
        end
    end

end
