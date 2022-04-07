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
    def CaseChiffreGUI.creer(c, grille, grilleGUI)
        new(c, grille, grilleGUI)
    end

    def initialize(c, grille, grilleGUI)

        super(c, grille, grilleGUI)
        self.label = c.chiffre.to_s

        self.signal_connect('enter-notify-event') { hoverIn }
        self.signal_connect('leave-notify-event') { hoverOut }
    end

    def hoverIn
        chercheGroupe
    end

    def hoverOut
        removeGroupe
    end

    def chercheGroupe
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

        if(listeGroupe.length > 1)
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