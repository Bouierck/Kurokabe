require_relative './CaseGUI.rb'

require  'gtk3'

class CaseCliquableGUI < CaseGUI

    ##
    # @case case qui est représentée par ce GUI

    def CaseCliquableGUI.creer(c, grille)
        new(c, grille)
    end

    private_class_method :new

    def initialize(c, grille)

        super(c)

        @grille = grille

        self.style_context.add_class("case-clic")
        self.signal_connect('clicked') { updateCase }

        updateCaseGUI


    end

    ##
    # update la case
    # retourne vrai si la grille est maintenant fini
    #
    def updateCase

        if(@grille.estFini? == false)
            @case.changeEtat
            @case.historique.nouveauCoup(@case)
            updateCaseGUI
            @case.notifObservateurs
        end

    end

    ##
    # update l'affichaage de la case
    #
    def updateCaseGUI

        self.style_context.remove_class("indice")

        case @case.etat
            when 0
                self.style_context.remove_class("case-mur")
                self.style_context.add_class("case-vide")
            when 1
                self.label = "●"
                self.style_context.remove_class("case-vide")
                self.style_context.add_class("case-point")
            when 2
                self.label = ""
                self.style_context.remove_class("case-point")
                self.style_context.add_class("case-mur")
        end
        
        return self

    end

end