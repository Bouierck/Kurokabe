require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class IslandExp < Technique
    def IslandExp.creer(grille)
        new(grille)
    end

    def initialize(grille)
        super(grille)
        @nom = "Expansion d'ilot."
    end 

    def verifieTech

        @casesChange = []

        @grille.matrice.each do |line|
            line.each do |c|
                if(c.is_a?(CaseChiffre) && c.chiffre > 1)
                    
                end
            end
        end
    end
end