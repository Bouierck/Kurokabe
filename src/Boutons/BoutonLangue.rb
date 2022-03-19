#!/usr/bin/env ruby

require 'gtk3'

class BoutonLangue

    private_class_method :new

    def initialize(uneEtiquette, uneMethode)
        @etiquette = uneEtiquette
        @methode = uneMethode
    end

    def methode()
        return @methode
    end

    def etiquette()
        return @etiquette
    end

    def BoutonLangue.creer(uneEtiquette, uneMethode)
        new(uneEtiquette, uneMethode)
    end

    def afficheBouton()
        button = Gtk::Button.new(etiquette)
        Gtk.main
    end 
end