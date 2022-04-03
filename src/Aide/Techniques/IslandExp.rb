require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class IslandExp < Technique
    def IslandExp.creer(grille)
        new(grille)
    end

    def initialize(grille)
        super(grille)
        @nom = "Expansion d'ilot."
    end 

    def verifieTech
        #On parcourt toutes les cases de la grille
        @grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []

                #Si la case est un chiffre et a qu'une sortie possible à l'état 0, alors on peut la compléter par un point (état 1)
                if(c.is_a?(CaseChiffre) && c.chiffre > 1)
                    @casesChange << @grille.matrice[c.y][c.x - 1] if ((c.x - 1 >= 0) && @grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x - 1].etat == 0)
                    @casesChange << @grille.matrice[c.y][c.x + 1] if ((c.x + 1 < line.length) && @grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x + 1].etat == 0)
                    @casesChange << @grille.matrice[c.y - 1][c.x] if ((c.y - 1 >= 0) && @grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y - 1][c.x].etat == 0)
                    @casesChange << @grille.matrice[c.y + 1][c.x] if ((c.y + 1 < @grille.matrice.length) && @grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y + 1][c.x].etat == 0)

                    return true if(@casesChange.length == 1)
                end
            end
        end

        return false

    end
end