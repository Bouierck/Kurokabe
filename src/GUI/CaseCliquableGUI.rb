require_relative './CaseGUI.rb'

require  'gtk3'

class TypeCase

    VIDE = 0
    MUR = 1
    POINT = 2

end

##
# Représente l'aspect graphique d'une case cliquable
#
class CaseCliquableGUI < CaseGUI

    ##
    # @case case qui est représentée par ce GUI
    # @caseConnecte case qui est connectée à cette case

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -c- case représentée par le gui
    # * -grille- grille du niveau
    #
    def CaseCliquableGUI.creer(c, grille, nb)
        new(c, grille, nb)
    end

    private_class_method :new

    def initialize(c, grille, nb)

        super(c)

        @grille = grille
        @nbCase = nb

        case @nbCase
        when 25
            self.width_request = 85
            self.height_request = 85
        when 49
            self.width_request = 75
            self.height_request = 75
        when 100
            self.width_request = 65
            self.height_request = 65
        when 225
            self.width_request = 45
            self.height_request = 45
    end

        self.style_context.add_class("case-clic")
        self.signal_connect('clicked') { updateCase }
        # self.signal_connect('enter-notify-event') { chercheGroupe }
        # self.signal_connect('leave-notify-event') { removeGroupe }

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
            when TypeCase::VIDE
                self.label = ""
                self.style_context.remove_class("case-mur")
                self.style_context.remove_class("case-point")
                self.style_context.add_class("case-vide")
            when TypeCase::POINT
                self.label = "●"
                self.style_context.remove_class("case-vide")
                self.style_context.remove_class("case-mur")
                self.style_context.add_class("case-point")
            when TypeCase::MUR
                self.label = ""
                self.style_context.remove_class("case-point")
                self.style_context.remove_class("case-vide")
                self.style_context.add_class("case-mur")
        end
        
        return self

    end

end
