require_relative './CaseGUI.rb'

require  'gtk3'

class CaseChiffreGUI < CaseGUI

    ##
    # @case case qui est représentée par ce GUI

    def CaseChiffreGUI.creer(c)
        new(c)
    end

    def initialize(c)

        super(c)
        self.label = c.chiffre.to_s

    end

end