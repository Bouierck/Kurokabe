require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class IslandExp < Technique
    
    public_class_method :new
    
    def initialize
        super("Expansion d'ilot.", "")
    end 

    def verifieTech(grille)
        #On parcourt toutes les cases de la grille
        grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []

                #Si la case est un chiffre et a qu'une sortie possible à l'état 0, alors on peut la compléter par un point (état 1)
                if(c.is_a?(CaseChiffre) && c.chiffre > 1)

                    count = 0

                    if c.x <= 0 || grille.matrice[c.y][c.x - 1].etat == 2
                        count += 1
                    elsif grille.matrice[c.y][c.x - 1].etat == 0
                        @casesChange << grille.matrice[c.y][c.x - 1]
                    end

                    if c.x >= (grille.matrice.length - 1) || grille.matrice[c.y][c.x + 1].etat == 2
                        count += 1
                    elsif grille.matrice[c.y][c.x + 1].etat == 0
                        @casesChange << grille.matrice[c.y][c.x + 1]
                    end
                    
                    if c.y <= 0 || grille.matrice[c.y - 1][c.x].etat == 2
                        count += 1
                    elsif grille.matrice[c.y - 1][c.x].etat == 0
                        @casesChange << grille.matrice[c.y - 1][c.x]
                    end

                    if c.y >= (grille.matrice.length - 1) || grille.matrice[c.y + 1][c.x].etat == 2
                        count += 1
                    elsif grille.matrice[c.y + 1][c.x].etat == 0
                        @casesChange << grille.matrice[c.y + 1][c.x]
                    end
                    
                    return true if count == 3 && @casesChange.empty? == false

                end

            end
        end

        return false

    end

end