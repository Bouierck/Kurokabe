class Technique
    def Technique.creer(id)
        new(id)
    end

    private_class_method :new

    def initialize(id)
        @idTech = id
    end

    #renvoi un booleen
    def verifieTech(grille)

    end
end