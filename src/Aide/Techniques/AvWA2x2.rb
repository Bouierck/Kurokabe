require_relative './Technique.rb'
require_relative '../../Niveau/CaseCliquable.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class AvWA2x2 < Technique

    def AvWA2x2.creer(grille)
        new(grille)
    end

    def initialize
        
        super("AvWA2x2","Pas de mur 2x2")

    end

    def verifieTech
        @grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []

                if(c.is_a?(CaseCliquable) && c.etat == 0)

                    if (( @grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y + 1][c.x].etat == 2) &&
                        ( ( @grille.matrice[c.y + 1][c.x - 1].is_a?(CaseCliquable) && @grille.matrice[c.y + 1][c.x - 1].etat == 2 ) && 
                        ( @grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && @grille.matrice[c.y ][c.x - 1].etat == 2 ) ) || 
                        ( ( @grille.matrice[c.y + 1][c.x + 1].is_a?(CaseCliquable) && @grille.matrice[c.y + 1][c.x + 1].etat == 2 ) && 
                        ( @grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && @grille.matrice[c.y ][c.x + 1].etat == 2 ) )) 
                            return true if @casesChange.empty? == false

                    if (( @grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y - 1][c.x].etat == 2) &&
                       ( ( @grille.matrice[c.y - 1][c.x - 1].is_a?(CaseCliquable) && @grille.matrice[c.y - 1][c.x - 1].etat == 2 ) && 
                        ( @grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && @grille.matrice[c.y ][c.x - 1].etat == 2 ) ) || 
                        ( ( @grille.matrice[c.y - 1][c.x + 1].is_a?(CaseCliquable) && @grille.matrice[c.y - 1][c.x + 1].etat == 2 ) && 
                        ( @grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && @grille.matrice[c.y ][c.x + 1].etat == 2 ) )) 
                            return true if @casesChange.empty? == false
                    end         

                end
            end
        end

        return false
        
    end

end