require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class SurndSqr < Technique
    def SurndSqr.creer(grille)
        new(grille)
    end

    def initialize(grille)
        super(grille)
        @nom = "Case blanche entourée"
    end

    def verifieTech 

        @grille.matrice.each do |line|
            line.each do |c|
                @casesChange = []

                if(c.is_a?(CaseCliquable) && c.etat == 0)
                    if((@grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x - 1].etat == 2) &&
                       (@grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x + 1].etat == 2) &&
                       (@grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y - 1][c.x].etat == 2) &&
                       (@grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y + 1][c.x].etat == 2))
                        
                       @casesChange << c
                       return true
                    end
                end
            end
        end

        return false
    end
end