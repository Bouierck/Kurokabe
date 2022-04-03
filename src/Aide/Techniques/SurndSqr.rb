require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class SurndSqr < Technique
   
    public_class_method :new

    def initialize
        super("Case blanche entourée", "Une case blanche entouré de mur est forcément un mur")
    end

    def verifieTech(grille)

        grille.matrice.each do |line|
            line.each do |c|
                @casesChange = []

                if(c.is_a?(CaseCliquable) && c.etat == 0)
                    #
                    if(((c.x - 1 < 0) || grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y][c.x - 1].etat == 2) &&
                       ((c.x + 1 == line.length) || grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y][c.x + 1].etat == 2) &&
                       ((c.y - 1 < 0) || grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x].etat == 2) &&
                       ((c.y + 1 == grille.matrice.length) || grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x].etat == 2))
                        
                       @casesChange << c
                       return true
                    end
                end
            end
        end

        return false
    end
end