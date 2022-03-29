
#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

##
# Bouton qui change la langue de l'application
#

class BoutonLangue < Bouton

    ##
    # @uneEtiquette, nom donné au bouton
    # @uneLongueur, longueur du bouton
    # @uneLargeur, largeur du bouton
    # @uneLangue, la langue actuelle (par défaut : français)
    #

    def BoutonLangue.creer(uneEtiquette, uneLongueur, uneLargeur, uneLangue)
        new(uneEtiquette, uneLongueur, uneLargeur, uneLangue)
    end

    def initialize(uneEtiquette, uneLongueur, uneLargeur, uneLangue)
        #Initialisation du bouton avec ses valeurs
        super(uneEtiquette, uneLongueur, uneLargeur)
        @langue = uneLangue

        
        self.signal_connect('clicked'){
            #Changement de la langue
            @langue.changerLangue
        }

    end

end
