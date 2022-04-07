require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'
require_relative '../../Niveau/CaseCliquable.rb'

##
# Technique qui permet de d'ajouter une case noire dans une case entourée par des cases noires
#
class SurndSqr < Technique
   
    public_class_method :new

    def initialize
        super(Langue.text("SurndSqr"), Langue.text("SurndSqrDesc"))
    end

    def verifieTech(grille)

        #On parcourt toutes les cases de la grille
        grille.matrice.each do |line|
            line.each do |c|
                @casesChange = []

                #Si une case cliquable est à l'état 0 et qu'elle est entourée de case noire ou bord de la grille, alors c'est aussi une case noire
                if(c.is_a?(CaseCliquable) && c.etat == TypeCase::VIDE)
    
                    if(((c.x - 1 < 0) || grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y][c.x - 1].etat == TypeCase::MUR) &&
                       ((c.x + 1 == line.length) || grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y][c.x + 1].etat == TypeCase::MUR) &&
                       ((c.y - 1 < 0) || grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x].etat == TypeCase::MUR) &&
                       ((c.y + 1 == grille.matrice.length) || grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x].etat == TypeCase::MUR))
                        
                       @casesChange << c
                       return true
                    end

                end
            end
        end

        return false
    end
end