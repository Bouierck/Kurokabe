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
    # Constructeur de Sauvegarde
    #
    def Utilisateur.creer(unNom, uneLangue)
        new(unNom, uneLangue)
    end

    private_class_method :new

    def initialize(unNom, uneLangue)
        Sauvegarde.creer(unNom)
        @nom = unNom
        @langue = uneLangue
        @nbEtoiles = Sauvegarde.nbEtoiles()
    end

end # Marqueur de fin de classe