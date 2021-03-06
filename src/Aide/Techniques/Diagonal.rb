require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'
require_relative '../../Niveau/CaseCliquable.rb'

##
# Technique de case chiffre en diagonal 
#
class Diagonal < Technique

    public_class_method :new

    def initialize
        
        super(Langue.text("Diagonal"), Langue.text("DiagonalDesc"))

    end

    def verifieTech(grille)

        grille.matrice.each do |line|
            line.each do |c|

                @casesChange = [] 

                if(c.is_a?(CaseChiffre))

                    ##
                    # Pas besoin de regarder les cases au dessus on regarde uniquement en descendant
                    # Diagonal est un chiffre on check si il y a bien 2 murs sur l'autre diagonal
                    #

                    if(isInGrid(grille.matrice, c.x - 1, c.y + 1) && grille.matrice[c.y + 1][c.x - 1].is_a?(CaseChiffre))

                        @casesChange.push(grille.matrice[c.y][c.x - 1]) if grille.matrice[c.y][c.x - 1].etat != TypeCase::MUR
                        @casesChange.push(grille.matrice[c.y + 1][c.x]) if grille.matrice[c.y + 1][c.x].etat != TypeCase::MUR
                        return true if @casesChange.empty? == false
                      
                    end
                    if(isInGrid(grille.matrice, c.x + 1, c.y + 1) && grille.matrice[c.y + 1][c.x + 1].is_a?(CaseChiffre))

                        @casesChange.push(grille.matrice[c.y][c.x + 1]) if grille.matrice[c.y][c.x + 1].etat != TypeCase::MUR
                        @casesChange.push(grille.matrice[c.y + 1][c.x]) if grille.matrice[c.y + 1][c.x].etat != TypeCase::MUR
                        return true if @casesChange.empty? == false
                        
                   end

                end

            end
        end

        return false
        
    end

    ##
    # test si la case est dans la grille
    #
    # === Attributes
    #
    # * -matrice- matrice de la grille
    # * -x- position x de la case
    # * -y- position y de la case
    #
    def isInGrid(matrice, x, y)

        return x >= 0 && x < matrice.length && y >= 0 && y < matrice.length

    end

end