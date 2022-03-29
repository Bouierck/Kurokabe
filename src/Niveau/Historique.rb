
class Historique

    ##
    # @listeCoups => Liste contenant les coups effectués
    # @index => coup actuel

    def Historique.creer(grille)
        new(grille)
    end

    def initialize(grille)
        @listeCoups = Array.new()
        @index = 0
        @grille = grille
    end
   
    ##
    # Ajoute un nouveau coup dans l'historique
    # Le retour en avant n'est plus possible après un nouveau coup !
    #
    def nouveauCoup(x, y)
        if(@index < @listeCoups.size)
            @listeCoups = @listeCoups.take(@index)
        end
 
        @index += 1
        @listeCoups.push([x, y])
    end
    
    ##
    # Retourne sur le mouvement précédent
    #
    def retourArriere
        if(@index > 0)
            @index -= 1

            x = @listeCoups[@index][0]
            y = @listeCoups[@index][1]
 
            2.times { @grille.matrice[y][x].changeEtat }
        end
    end

    ##
    # Retourne sur le mouvement précédement annulé
    #
    def retourAvant
        if(@index < @listeCoups.size)
            @index += 1

            x = @listeCoups[@index-1][0]
            y = @listeCoups[@index-1][1]
 
            @grille.matrice[y][x].changeEtat
        end
    end
end