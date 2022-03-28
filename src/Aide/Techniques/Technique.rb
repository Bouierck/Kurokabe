class Technique

    ##
    # @grille => grille du niveau dans laquelle chercher les techniques
    # @casesChange => listes de cases à surbriller/résoudre pour appilqué la technique
    # @nom de la technique

    attr_reader :casesChange

    private_class_method :new

    def initialize(grille)

        @grille = grille
        @casesChange = []
        @nom = ""

    end

    #renvoi un booleen
    def verifieTech()
    end

    def to_s
        "Techique : " + nom + " peut être appliqué"
    end

end