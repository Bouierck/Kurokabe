require_relative './CaseGUI.rb'

require  'gtk3'

class CaseCliquableGUI < CaseGUI

    ##
    # @case case qui est représentée par ce GUI

    def CaseCliquableGUI.creer(c)
        new(c)
    end

    private_class_method :new

    def initialize(c)
        super(c)
        updateCaseGUI
        self.signal_connect('clicked') { updateCase }
    end

    ##
    # update la case
    # retourne vrai si la grille est maintenant fini
    #
    def updateCase

        @case.changeEtat
        @case.historique.nouveauCoup(@case)
        updateCaseGUI
        @case.notifObservateurs

    end

    ##
    # update l'affichaage de la case
    #
    def updateCaseGUI

        case @case.etat
            when 0
                self.label = ""
            when 1
                self.label = "●"
            when 2
                self.label = "⬜"
        end
        
        return self

    end

end