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
    def CaseChiffreGUI.creer(c)
        new(c)
    end

    def initialize(c)

        super(c)
        self.label = c.chiffre.to_s

    end

end