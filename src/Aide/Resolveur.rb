require_relative './Techniques/Island.rb'
require_relative './Techniques/SquareSepa.rb'
require_relative './Techniques/Diagonal.rb'
require_relative './Techniques/SurndSqr.rb'
require_relative './Techniques/UnreachSqr.rb'
require_relative './Techniques/WallExp.rb'
require_relative './Techniques/AvWA2x2.rb'
require_relative './Techniques/IslandExp.rb'

module ReponseType
    TEXT = 0
    ARRAY = 1
end

##
# Le resolveur permet de trouver des technique à appliqué sur la grille afin d'aider l'utilisateur
#
class Resolveur

    ##
    # @listTech => liste des technique a appelé pour donner des indices
    # @nbAppel => nombre d'aide demandé

    attr_reader :nbAppel

    def initialize
        @listTech = Array.new
        @listTech << Island.new << SquareSepa.new << Diagonal.new << SurndSqr.new << WallExp.new << UnreachSqr.new << IslandExp.new << AvWA2x2.new
        @nbAppel = 0
    end

    ##
    # Cherche les techniques à appliqué
    # Retourne l'ensemble des cases à surbriller
    #
    # === Attributes
    #
    # * -grille- Grille dans laquelle chercher les techniques
    #
    def resoudreGrille(grille)
        
        if(grille.compareGrille == []) #La grille ne comporte pas d'erreur

            @listTech.each{ |tech|

                if tech.verifieTech(grille)
                    
                    if(@nbAppel % 3 == 0)
                        rep = {:response => ReponseType::TEXT, :text => tech.to_s}
                    elsif(@nbAppel % 3 == 1)
                        rep = {:response => ReponseType::TEXT, :text => tech.to_s_desc}
                    else
                        rep = {:response => ReponseType::ARRAY, :text => tech.to_s_desc, :cases => tech.casesChange}
                    end

                    @nbAppel = (@nbAppel + 1) % 3
                    return rep

                end

            }

        end

        return {:response => ReponseType::TEXT, :text => "Aucune technique n'a été trouvé ou erreur dans la grille"}

    end

end