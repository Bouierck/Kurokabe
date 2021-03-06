require_relative './Technique.rb'
require_relative '../../Niveau/CaseCliquable.rb'
require_relative '../../Niveau/CaseChiffre.rb'

require_relative '../../Donnees/Langue.rb'

##
# Technique: les mur de 2x2 sont impossible
#
class AvWA2x2 < Technique

    public_class_method :new

    def initialize
        super(Langue.text("AvWA2x2"),Langue.text("AvWA2x2Desc"))
    end

    def verifieTech(grille)
        grille.matrice.each do |line|
            #On parcourt toutes les cases de la grille
            line.each do |c|

                @casesChange = []

                if(c.is_a?(CaseCliquable) && c.etat == TypeCase::VIDE)
                    #On verifie que la case en haut de la case courante est cliquable et que c'est un mur
                    if (c.y < grille.matrice.length - 1 && (grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x].etat == TypeCase::MUR))

                        if(c.x > 0 && (grille.matrice[c.y + 1][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x - 1].etat == TypeCase::MUR) && 
                        (grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y ][c.x - 1].etat == TypeCase::MUR)) 

                            @casesChange << c
                            return true

                        end
                        if(c.x < line.length - 1 && (grille.matrice[c.y + 1][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x + 1].etat == TypeCase::MUR) && 
                        (grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y ][c.x + 1].etat == TypeCase::MUR ))

                            @casesChange << c
                            return true

                        end

                    end
                    if (c.y > 0 && (grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x].etat == TypeCase::MUR))
                        #On verifie que la case en bas de la case courante est cliquable et que c'est un mur
                        if(c.x > 0 && (grille.matrice[c.y - 1][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x - 1].etat == TypeCase::MUR) && 
                        (grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y ][c.x - 1].etat == TypeCase::MUR))

                            @casesChange << c
                            return true

                        end
                        if(c.x < line.length - 1 && (grille.matrice[c.y - 1][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x + 1].etat == TypeCase::MUR) && 
                        (grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y ][c.x + 1].etat == TypeCase::MUR))

                            @casesChange << c
                            return true

                        end

                    end         

                end
            end
        end

        return false
        
    end

end
