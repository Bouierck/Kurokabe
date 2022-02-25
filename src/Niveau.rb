##
# Auteur Jérémy Bourgouin & Oussama Belkadi
# Date : Vendredi 25/02 2022 11:36
#

class Niveau

    #@idNiveau -> Numero du niveau 
    #@grille -> Bouton pour accéder a la grille
    #@typeFenetre -> Booleen qui definit si la fenetre est en grande ou en petite 
    #@listBoutonSpe -> de type BoutonSpecial qui correspond aux différents boutons dans le niveau

    def initialize(idNiveau,uneGrille,typeFenetre,listBoutonSpe)
        @idNiveau = idNiveau
        @grille = uneGrille
        @typeFenetre = false
        @listBoutonSpe = Array.new()
    end

    #Action lors de clique sur un bouton special comme pause
    def LancerBoutonSpe()

    end 

    #changement de la représentation en fonction de la taille de la fenetre 
    def FenetreTaille()
    
    end 
end # Marqueur de fin de classe