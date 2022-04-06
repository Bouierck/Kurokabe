require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'
require_relative '../../Niveau/CaseCliquable.rb'

class IslandContinuity < Technique
    def IslandContinuity.creer(grille)
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
                if(c.is_a?(CaseCliquable) && c.chiffre > 1)
                    if(AvWA2x2(@grille))
                end
            end
        end
    end
end