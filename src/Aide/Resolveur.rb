require_relative './Techniques/Island.rb'
require_relative './Techniques/SquareSepa.rb'
require_relative './Techniques/Diagonal.rb'
require_relative './Techniques/SurndSqr.rb'
require_relative './Techniques/UnreachSqr.rb'
require_relative './Techniques/WallExp.rb'
require_relative './Techniques/AvWA2x2.rb'
require_relative './Techniques/IslandExp.rb'
require_relative './Techniques/Island2Cases.rb'
require_relative './Techniques/SrndCompIsland.rb'
require_relative './Techniques/IslandContinuity.rb'

##
# Type de réponse envoyé par le resolveur
#
class ReponseType
    ##
    # Envoie d'un message
    TEXT = 0
    ##
    # Envoie des cases
    ARRAY = 1
end

##
# Le resolveur permet de trouver des technique à appliqué sur la grille afin d'aider l'utilisateur
#
class Resolveur

    ##
    # @listTech => liste des technique a appelé pour donner des indices
    # @nbAppel => nombre d'aide demandé
    # @typeIndice => type d'indice à donner

    attr_reader :nbAppel

    def initialize
        @listTech = Array.new
        @listTech << Island.new << SrndCompIsland.new << SquareSepa.new << Diagonal.new << Island2Cases.new << SurndSqr.new << WallExp.new << IslandExp.new << UnreachSqr.new << AvWA2x2.new  << IslandContinuity.new
        @nbAppel = 0
        @typeIndice = 0

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
                    
                    @typeIndice = 0 if tech != @prevTech

                    if(@typeIndice % 3 == 0)
                        rep = {:response => ReponseType::TEXT, :text => tech.to_s}
                    elsif(@typeIndice % 3 == 1)
                        rep = {:response => ReponseType::TEXT, :text => tech.to_s_desc}
                    else
                        rep = {:response => ReponseType::ARRAY, :text => tech.to_s_desc, :cases => tech.casesChange}
                    end

                    @nbAppel += 1
                    @typeIndice = (@typeIndice + 1) % 3
                    @prevTech = tech
                    return rep

                end

            }

        end

        return {:response => ReponseType::TEXT, :text => Langue.text("resolveur")}

    end

end