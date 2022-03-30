require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class Diagonal < Technique

    def Diagonal.creer(grille)
        new(grille)
    end

    def initialize(grille)
        
        super(grille)
        @nom = "Diagonal de chiffre";

    end

    def verifieTech

        @grille.matrice.each do |line|
            line.each do |c|

                @casesChange = [] 

                if(c.is_a?(CaseChiffre))

                   if(@grille.matrice[c.y - 1][c.x - 1].is_a?(CaseChiffre))

                        @casesChange.push(@grille.matrice[c.y][c.x - 1]) if @grille.matrice[c.y][c.x - 1].etat != 2
                        @casesChange.push(@grille.matrice[c.y - 1][c.x]) if @grille.matrice[c.y - 1][c.x].etat != 2
                        return true if @casesChange.empty? == false
                      
                   elsif(@grille.matrice[c.y - 1][c.x + 1].is_a?(CaseChiffre))

                        @casesChange.push(@grille.matrice[c.y][c.x + 1]) if @grille.matrice[c.y][c.x + 1].etat != 2
                        @casesChange.push(@grille.matrice[c.y - 1][c.x]) if @grille.matrice[c.y - 1][c.x].etat != 2
                        return true if @casesChange.empty? == false
                      
                   elsif(@grille.matrice[c.y + 1][c.x - 1].is_a?(CaseChiffre))

                        @casesChange.push(@grille.matrice[c.y][c.x - 1]) if @grille.matrice[c.y][c.x - 1].etat != 2
                        @casesChange.push(@grille.matrice[c.y + 1][c.x]) if @grille.matrice[c.y + 1][c.x].etat != 2
                        return true if @casesChange.empty? == false
                      
                   elsif(@grille.matrice[c.y + 1][c.x + 1].is_a?(CaseChiffre))

                        @casesChange.push(@grille.matrice[c.y][c.x + 1]) if @grille.matrice[c.y][c.x + 1].etat != 2
                        @casesChange.push(@grille.matrice[c.y + 1][c.x]) if @grille.matrice[c.y + 1][c.x].etat != 2
                        return true if @casesChange.empty? == false
                        
                   end

                end

            end
        end

        return false
        
    end

end