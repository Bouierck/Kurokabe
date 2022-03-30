require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'
require_relative '../../Niveau/CaseCliquable.rb'

class UnreachSqr < Technique

    def UnreachSqr.creer(grille)
        new(grille)
    end

    def initialize(grille)
        
        super(grille)
        @nom = "Case inatteignable";
 
    end

    def verifieTech

        @grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []
                caseAtteignable = []

                if(c.is_a?(CaseChiffre))
                    for i in 0..c.chiffre do
                        for y in 0..c.chiffre do
                        
                        end
                    end
                end

            end
        end

        return false

    end

    def estAtteignable(case)
        @grille.matrice.each do |line|
            line.each do |c|
                
            end
        end
    end

end