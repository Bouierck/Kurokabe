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
        self.label = c.etat.to_s
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

        self.label = @case.etat.to_s
        return self

    end

end