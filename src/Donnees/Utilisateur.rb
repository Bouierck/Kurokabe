##
# Un Utilisateur sert a connaître le nom ainsi que la langue utilisé par l'utilisateur
#
class Utilisateur

    ##
    # @nom => Nom de l'utilisateur
    # @langue => Langue choisi de type Langue

    attr_reader :nom, :langue

    ##
    # Constructeur de Utilisateur
    #
    # ==== Attributes
    #
    # * -nom- nom de l'utilisateur
    # * -langue- langue chois par l'utilisateur
    #
    def Utilisateur.creer(nom, langue)
        new(nom, langue)
    end

    private_class_method :new

    def initialize(nom, langue)
        Sauvegarde.creer(nom)
        @nom = nom
        @langue = langue
    end

end # Marqueur de fin de classe