require_relative './Technique.rb'
require_relative '../../Niveau/CaseCliquable.rb'

class Wallexp < Technique

    def WallExp.creer(grille)
        new(grille)
    end

    def initialize(grille)
        
        super(grille)
        @nom = "Expansion de mur";

    end

    def verifieTech

        @grille.matrice.each do |line|
            line.each do |c|

                reliee = false
                countPossible = 0
                @casesChange = [] 

                if(c.is_a?(CaseCliquable) && c.etat == 2)

                    if(@grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x - 1] == 2) reliee = true
                    if(@grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y - 1][c.x] == 2) reliee = true
                    if(@grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y + 1][c.x] == 2) reliee = true
                    if(@grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x + 1] == 2) reliee = true

                    if(reliee == false)
                        
                        if(@grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x - 1] == 0) countPossible += 1
                        if(@grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y - 1][c.x] == 0) countPossible += 1
                        if(@grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && @grille.matrice[c.y + 1][c.x] == 0) countPossible += 1
                        if(@grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && @grille.matrice[c.y][c.x + 1] == 0) countPossible += 1

                    end

                end

            end
        end

                end

            end
        end

        return false
        
    end

end