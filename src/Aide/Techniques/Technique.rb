class Technique

    ##
    # @grille => grille du niveau dans laquelle chercher les techniques
    # @casesChange => listes de cases à surbriller/résoudre pour appilqué la technique
    # @nom de la technique

    attr_reader :casesChange

    private_class_method :new 

    def initialize(nom, desc)
        @casesChange = []
        @nom = nom
        @desc = desc
    end

    ##
    # Verifie si la technique est applicable à la grille
    # Retourne vrai si oui faux sinon
    #
    # === AAttributes
    #
    # * -grille- Grille où chercher la technique
    #
    def verifieTech(grille)
    end

    ##
    # Renvoie le non de la technique
    #
    def to_s
        "Techique : " + nom + " peut être appliqué"
    end

    ##
    # Renvoie la description de la technique
    #
    def to_s_desc
        nom + ": " + desc
    end

end