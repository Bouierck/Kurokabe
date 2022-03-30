##
# L'historique stock les coups de l'utilisateur pour permttre de faire des retours en arrière / en avant
#
class Historique

    ##
    # @listeCoups => Liste contenant les coups effectués
    # @index => coup actuel

    def initialize
        @listeCoups = Array.new()
        @index = 0
    end
   
    ##
    # Ajoute un nouveau coup dans l'historique
    # Le retour en avant n'est plus possible après un nouveau coup !
    #
    def nouveauCoup(c)

        #S'il y avait des coups après on les enlève
        if(@index < @listeCoups.size)
            @listeCoups = @listeCoups.take(@index)
        end
 
        @index += 1
        @listeCoups.push(c)

    end
    
    ##
    # Retourne sur le mouvement précédent
    #
    def retourArriere

        if(@index > 0) #On est pas au début de la liste de coups
            @index -= 1

            #Effectuer mouvement inverse
            2.times { @listeCoups[@index].changeEtat }

        end
    end

    ##
    # Retourne sur le mouvement précédement annulé
    #
    def retourAvant()
        if(@index < @listeCoups.size)
            
            #Effectuer mouvement
            @listeCoups[@index].changeEtat
            @index += 1
        end
    end 
end