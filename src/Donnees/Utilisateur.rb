##
# Auteur Jérémy Bourgouin & Oussama Belkadi
# Date : Vendredi 25/02 2022 11:42
#

class Utilisateur

    ##
    #@nom => Nom de l'utilisateur
    #@langue => Langue choisi de type Langue
    #@nbEtoiles => Nombre d'étoile obtenu dans le mode aventure
    #@sauvegarde => Sauvegarde de l'utilisateur

    ##
    # Constructeur de Sauvegarde
    #
    def Utilisateur.creer(unNom, uneLangue)
        new(unNom, uneLangue)
    end

    def initialize(unNom, uneLangue)
        @nom = unNom
        @langue = uneLangue
        @sauvegarde = new Sauvegarde(unNom)
        @nbEtoiles = unInt.nbEtoiles()
    end

    private_class_method :new

    ##
    # Retourne le nombre d'étoiles
    #
    def getNbEtoiles()
        return @nbEtoiles
    end
end # Marqueur de fin de classe