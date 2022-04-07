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
    end

    ##
    # Choisi l'aspect de la case courante lorsque la souris est sur celle-ci en fonction de son état et possiblement l'aspect d'un groupe lié
    #
    def hoverIn
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

    ##
    # Quand la souris sort de la case courante, l'aspect par défaut est remis en place
    #
    def hoverOut
        @grilleGUI.matriceGUI.each do |ligne|
            ligne.each do |caseGUI|
                caseGUI.style_context.remove_class("case-groupe")
                caseGUI.style_context.remove_class("groupe")
            end
        end
    end
end