require_relative './CaseGUI.rb'

require  'gtk3'

##
# Représente l'aspect graphique d'une case cliquable
#
class CaseCliquableGUI < CaseGUI

    ##
    # @case case qui est représentée par ce GUI

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -c- case représentée par le gui
    # * -grille- grille du niveau
    #
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
    # update la cas
    # impossible si la grille est terminé
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
        self.style_context.remove_class("erreur")

        case @case.etat
            when 0
                self.label = ""
                self.style_context.remove_class("case-mur")
                self.style_context.remove_class("case-point")
                self.style_context.add_class("case-vide")
            when 1
                self.label = "●"
                self.style_context.remove_class("case-vide")
                self.style_context.remove_class("case-mur")
                self.style_context.add_class("case-point")
            when 2
                self.label = ""
                self.style_context.remove_class("case-point")
                self.style_context.remove_class("case-vide")
                self.style_context.add_class("case-mur")
        end
        
        return self

    end

end