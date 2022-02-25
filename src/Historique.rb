class Historique

    ##
    # @listeCoups => Liste contenant les coups effectués
    # @index => coup actuel

    def initialize:
        @listeCoups = Array.new()
        @index = 0
    end

    def nouveauCoup(x, y):
    end
    
    def retourArriere:
        @index -= 1
    end

    def retourAvant:
        @index += 1
    end

end