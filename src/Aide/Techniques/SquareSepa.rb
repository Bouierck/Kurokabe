require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class SquareSepa < Technique

    def SquareSepa.creer(grille)
        new(grille)
    end

    def initialize(grille)
        
        super(grille)
        @nom = "Séparation d'une case"

    end

    def verifieTech

        @grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []

                if(c.is_a?(CaseChiffre))

                    if(@grille.matrice[c.y][c.x - 2].is_a?(CaseChiffre) && @grille.matrice[c.y][c.x - 1].etat != 2)

                        @casesChange.push(@grille.matrice[c.y][c.x - 1])
                        return true

                    elsif(@grille.matrice[c.y - 2][c.x].is_a?(CaseChiffre) && @grille.matrice[c.y - 1][c.x].etat != 2)
                        
                        @casesChange.push(@grille.matrice[c.y - 1][c.x])
                        return true

                    elsif(@grille.matrice[c.y][c.x + 2].is_a?(CaseChiffre) && @grille.matrice[c.y][c.x + 1].etat != 2)
                        
                        @casesChange.push(@grille.matrice[c.y][c.x + 1])
                        return true

                    elsif(@grille.matrice[c.y + 2][c.x].is_a?(CaseChiffre) && @grille.matrice[c.y + 1][c.x].etat != 2)
                        
                        @casesChange.push(@grille.matrice[c.y + 1][c.x])
                        return true

                    end

                end

            end
        end

        return false

    end

end