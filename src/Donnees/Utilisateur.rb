##
# Auteur Jérémy Bourgouin & Oussama Belkadi
# Date : Vendredi 25/02 2022 11:42
#

class Utilisateur

    ##
    #@nom => Nom de l'utilisateur
    #@langue => Langue choisi de type Langue
    #@nbEtoiles => Nombre d'étoile obtenu dans le mode aventure

    attr_reader :nom, :langue, :nbEtoiles

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -nom- nom de l'utilisateur
    # * -langue- langue de l'utilisateur
    #
    def Utilisateur.creer(nom, langue)
        new(nom, langue)
    end

    private_class_method :new

<<<<<<< HEAD
    def initialize(nom, langue)
       # Sauvegarde.creer(nom)
        @nom = nom
        @langue = langue
        #@nbEtoiles = Sauvegarde.nbEtoiles()

=======
    def initialize(unNom, uneLangue)
        @nom = unNom
        @langue = uneLangue
        @nbEtoiles = Sauvegarde.nbEtoiles()
>>>>>>> 5b57d37473ad881ec77224d685bd9ec3bd5747bf
    end

end # Marqueur de fin de classe
