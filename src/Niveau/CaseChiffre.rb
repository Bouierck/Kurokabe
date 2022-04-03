require_relative "Case.rb"

##
# Case non cliquable qui indique le nombre de case vide autour d'elle
#
class CaseChiffre < Case

    ##
    # @chiffre chiffre de la case (correspond au nombre de case libre autour d'elle)

    attr_reader :chiffre

    ##
    # Constructeur de CaseChiffre
    #
    # ==== Attributes
    #
    # * -x- Position x dans la grille
    # * -y- Position y dans la grille
    # * -chiffre- Chiffre de la case
    #
    def CaseChiffre.creer(x, y, chiffre) 
        new(x, y, chiffre)
    end
    
    def initialize(x, y, chiffre)
        super(x, y)
        @chiffre = chiffre
    end

    # def to_s
    #     return "*" + @chiffre.to_s + "*"
    # end
    
end