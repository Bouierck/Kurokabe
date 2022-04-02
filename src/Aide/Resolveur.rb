require_relative './Techniques/Island.rb'

##
# Le resolveur permet de trouver des technique à appliqué sur la grille afin d'aider l'utilisateur
#
class Resolveur

    ##
    # @listTech => liste des technique a appelé pour donner des indices

    def initialize
        @listTech = Array.new
        @listTech << Island.new
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
                return tech.casesChange if tech.verifieTech(grille)
            }

        end

        return []

    end

end