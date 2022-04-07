require_relative './CaseGUI.rb'

require  'gtk3'

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
    def CaseCliquableGUI.creer(c, grille, grilleGUI)
        new(c, grille, grilleGUI)
    end

    private_class_method :new

    def initialize(c, grille, grilleGUI)

        super(c, grille, grilleGUI)

        self.signal_connect('clicked') { updateCase }
        self.signal_connect('enter-notify-event') { hoverIn }
        self.signal_connect('leave-notify-event') { hoverOut }

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

    def hoverIn
        if(@case.etat == TypeCase::VIDE)
            self.style_context.add_class("case-vide-hover")
        elsif(@case.etat == TypeCase::POINT)
            chercheGroupe
        elsif(@case.etat == TypeCase::MUR)
            self.style_context.add_class("case-mur-hover")
        end
    end

    def hoverOut
        if(@case.etat == TypeCase::VIDE)
            self.style_context.remove_class("case-vide-hover")
        elsif(@case.etat == TypeCase::POINT)
            removeGroupe
        elsif(@case.etat == TypeCase::MUR)
            self.style_context.remove_class("case-mur-hover")
        end
    end

    def chercheGroupe
        if(@case.etat == TypeCase::POINT)
            listeGroupe = Array.new
            aTraiter = Array.new
            aTraiter << @case

            while(aTraiter.empty? == false)
                caseCourante = aTraiter.shift
                @grille.voisines(caseCourante).each do |voisine|
                    if(listeGroupe.include?(voisine) == false && voisine.is_a?(CaseCliquable))
                        aTraiter << voisine
                    elsif(listeGroupe.include?(voisine) == false)
                        listeGroupe << voisine
                    end
                end
                listeGroupe << caseCourante
            end

            listeGroupe.each do |c|
                if(c == @case)
                    self.style_context.add_class("case-groupe")
                else
                    @grilleGUI.matriceGUI[c.y][c.x].style_context.add_class("groupe")
                end
            end
        end
    end

    def removeGroupe
        @grilleGUI.matriceGUI.each do |ligne|
            ligne.each do |caseGUI|
                if(caseGUI == self)
                    self.style_context.remove_class("case-groupe")
                else
                    caseGUI.style_context.remove_class("groupe")
                end
            end
        end
    end

end
