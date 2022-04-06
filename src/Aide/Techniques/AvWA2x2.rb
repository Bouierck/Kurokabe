require_relative './Technique.rb'
require_relative '../../Niveau/CaseCliquable.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class AvWA2x2 < Technique

    public_class_method :new

    def initialize
        super(Langue.text("AvWA2x2"),Langue.text("AvWA2x2Desc"))
    end

    def verifieTech(grille)
        grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []

                if(c.is_a?(CaseCliquable) && c.etat == 0)

                    if (c.y < grille.matrice.length - 1 && (grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x].etat == 2))

                        if(c.x > 0 && (grille.matrice[c.y + 1][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x - 1].etat == 2) && 
                        (grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y ][c.x - 1].etat == 2)) 

                            @casesChange << c
                            return true

                        end
                        if(c.x < line.length - 1 && (grille.matrice[c.y + 1][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x + 1].etat == 2) && 
                        (grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y ][c.x + 1].etat == 2 ))

                            @casesChange << c
                            return true

                        end

                    end
                    if (c.y > 0 && (grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x].etat == 2))

                        if(c.x > 0 && (grille.matrice[c.y - 1][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x - 1].etat == 2) && 
                        (grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y ][c.x - 1].etat == 2))

                            @casesChange << c
                            return true

                        end
                        if(c.x < line.length - 1 && (grille.matrice[c.y - 1][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x + 1].etat == 2) && 
                        (grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y ][c.x + 1].etat == 2))

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