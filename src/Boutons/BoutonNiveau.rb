
#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

##
# Boutons présents sur la fenêtre du menu niveau affichant la grille du niveau selectionné
#

class BoutonNiveau < Bouton

    ##
    # @uneEtiquette, nom donné au bouton
    # @uneLongueur, longueur du bouton
    # @uneLargeur, largeur du bouton
    # @unNiveau, niveau à lancé
    #

    def BoutonNiveau.creer(uneEtiquette, uneLongueur, uneLargeur, unNiveau)
        new(uneEtiquette, uneLongueur, uneLargeur, unNiveau)
    end

    private_class_method :new

    def initialize(uneEtiquette, uneLongueur, uneLargeur, unNiveau)
        #Initialisation du bouton avec ses valeurs
        super(uneEtiquette, uneLongueur, uneLargeur)
        @niveau = unNiveau

        self.signal_connect('clicked'){
            #Lance et affiche le niveau
            @niveau.NiveauAffiche
        }
    end
end
  
