require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class Diagonal < Technique

    public_class_method :new

    def initialize
        
        super("Diagonal de chiffre", "Deux chiffre en diagonal forme un carré avec 2 murs")

    end

    def verifieTech(grille)

        grille.matrice.each do |line|
            line.each do |c|

                @casesChange = [] 

                if(c.is_a?(CaseChiffre))

                   if(isInTheGrid(grille.matrice, c.x - 1, c.y - 1) && grille.matrice[c.y - 1][c.x - 1].is_a?(CaseChiffre))

                        @casesChange.push(grille.matrice[c.y][c.x - 1]) if grille.matrice[c.y][c.x - 1].etat != 2
                        @casesChange.push(grille.matrice[c.y - 1][c.x]) if grille.matrice[c.y - 1][c.x].etat != 2
                        return true if @casesChange.empty? == false
                      
                   elsif(isInTheGrid(grille.matrice, c.x + 1, c.y - 1) && grille.matrice[c.y - 1][c.x + 1].is_a?(CaseChiffre))

                        @casesChange.push(grille.matrice[c.y][c.x + 1]) if grille.matrice[c.y][c.x + 1].etat != 2
                        @casesChange.push(grille.matrice[c.y - 1][c.x]) if grille.matrice[c.y - 1][c.x].etat != 2
                        return true if @casesChange.empty? == false
                      
                   elsif(isInTheGrid(grille.matrice, c.x - 1, c.y + 1) && grille.matrice[c.y + 1][c.x - 1].is_a?(CaseChiffre))

                        @casesChange.push(grille.matrice[c.y][c.x - 1]) if grille.matrice[c.y][c.x - 1].etat != 2
                        @casesChange.push(grille.matrice[c.y + 1][c.x]) if grille.matrice[c.y + 1][c.x].etat != 2
                        return true if @casesChange.empty? == false
                      
                   elsif(isInTheGrid(grille.matrice, c.x + 1, c.y + 1) && grille.matrice[c.y + 1][c.x + 1].is_a?(CaseChiffre))

                        @casesChange.push(grille.matrice[c.y][c.x + 1]) if grille.matrice[c.y][c.x + 1].etat != 2
                        @casesChange.push(grille.matrice[c.y + 1][c.x]) if grille.matrice[c.y + 1][c.x].etat != 2
                        return true if @casesChange.empty? == false
                        
                   end

                end

            end
        end

        return false
        
    end

    def isInTheGrid(matrice, x, y)

        return x >= 0 && x < matrice.length && y >= 0 && y < matrice.length

    end

end