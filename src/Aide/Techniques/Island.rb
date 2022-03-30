require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class Island < Technique

    def Island.creer(grille)
        new(grille)
    end

    def initialize(grille)
        
        super(grille)
        @nom = "Ile de 1";

    end

    def verifieTech

        @grille.matrice.each do |line|
            line.each do |c|

                @casesChange = [] 

                if(c.is_a?(CaseChiffre) && c.chiffre == 1)

                    @casesChange.push(@grille.matrice[c.y][c.x - 1]) if @grille.matrice[c.y][c.x - 1].etat != 2
                    @casesChange.push(@grille.matrice[c.y][c.x + 1]) if @grille.matrice[c.y][c.x + 1].etat != 2
                    @casesChange.push(@grille.matrice[c.y - 1][c.x]) if @grille.matrice[c.y - 1][c.x].etat != 2
                    @casesChange.push(@grille.matrice[c.y + 1][c.x]) if @grille.matrice[c.y + 1][c.x].etat != 2

                end

                return true if @casesChange.empty? == false

            end
        end

        return false
        
    end

end