
class Historique

    ##
    # @listeCoups => Liste contenant les coups effectués
    # @index => coup actuel

    def initialize:
        @listeCoups = Array.new()
        @index = 0
    end
   
    ##
    # Ajoute un nouveau coup dans l'historique
    # Le retour en avant n'est plus possible après un nouveau coup !
    #
    def nouveauCoup(x, y):

        if(@index + 1 < @listeCoups.size)
            @listeCoups = @listeCoups.take(@index + 1)
        end
 
        @index++
        @listeCoups.push([x, y])

        return

    end
    
    ##
    # Retourne sur le mouvement précédent
    #
    def retourArriere:
        if(@index > 0)
            @index -= 1
            
            #TODO
            #Effectuer mouvement inverse
        end
    end

    ##
    # Retourne sur le mouvement précédent
    #
    def retourAvant:
        if(@index < @listeCoups.size - 1)
            @index += 1

            #TODO
            #Effectuer mouvement
        end
    end
end