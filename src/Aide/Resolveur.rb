require_relative './Techniques/Island.rb'

class Resolveur

    def initialize
        @listTech = Array.new
        @listTech << Island.new
    end

    def resoudreGrille(grille)
        
        if(grille.compareGrille == []) #La grille ne comporte pas d'erreur

            @listTech.each{ |tech|
                return tech.casesChange if tech.verifieTech(grille)
            }

        end

        return []

    end

end