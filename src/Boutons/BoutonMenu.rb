#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

##
# Lance un menu
#
class BoutonMenu < Bouton
    
    ##
    #@menu Menu à lancé à l'appuie du bouton

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -uneEtiquette- étiquette du bouton
    # * -uneLongueur- longueur du bouton
    # * -uneLargeur- largeur du bouton
    # * -unMenu- menu à lancer
    # * -app- application
    def BoutonMenu.creer(uneEtiquette, uneLongueur, uneLargeur, unMenu, app)
        new(uneEtiquette, uneLongueur, uneLargeur, unMenu, app)
    end

    private_class_method :new

    def initialize(uneEtiquette, uneLongueur, uneLargeur, unMenu, app)

        super(uneEtiquette, uneLongueur, uneLargeur)
        @menu = unMenu

        self.signal_connect('clicked'){
            m = @menu.call(app)
            app.fenetre.remove(app.fenetre.child) if(app.fenetre.child)
            app.fenetre.child = m
            app.fenetre.titlebar = m.titlebar
        }

    end
end

   
