require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class SquareSepa < Technique

    public_class_method :new

    def initialize    
        super(Langue.text("SquareSepa"), Langue.text("SquareSepaDesc"))
    end

    def verifieTech(grille)

        grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []

                if(c.is_a?(CaseChiffre))

                    if(c.x > 1 && grille.matrice[c.y][c.x - 2].is_a?(CaseChiffre) && grille.matrice[c.y][c.x - 1].etat != 2)

                        @casesChange.push(grille.matrice[c.y][c.x - 1])
                        return true

                    elsif(c.y > 1 && grille.matrice[c.y - 2][c.x].is_a?(CaseChiffre) && grille.matrice[c.y - 1][c.x].etat != 2)
                        
                        @casesChange.push(grille.matrice[c.y - 1][c.x])
                        return true

                    elsif(c.x < (grille.matrice.length - 2) && grille.matrice[c.y][c.x + 2].is_a?(CaseChiffre) && grille.matrice[c.y][c.x + 1].etat != 2)
                        
                        @casesChange.push(grille.matrice[c.y][c.x + 1])
                        return true

                    elsif(c.y < (grille.matrice.length - 2) && grille.matrice[c.y + 2][c.x].is_a?(CaseChiffre) && grille.matrice[c.y + 1][c.x].etat != 2)
                        
                        @casesChange.push(grille.matrice[c.y + 1][c.x])
                        return true

                    end

                end

            end
        end

        return false

    end

end