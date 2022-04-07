require_relative './CaseGUI.rb'

require  'gtk3'

##
# Représente l'aspect graphique d'une case chiffre
#
class CaseChiffreGUI < CaseGUI

    ##
    # @case case qui est représentée par ce GUI

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -c- case représentée par le gui
    #
    def CaseChiffreGUI.creer(c, grille)
        new(c, grille)
    end

    def initialize(c, grille)

        super(c, grille)
        self.label = c.chiffre.to_s

    end

end