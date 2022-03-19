#!/usr/bin/env ruby

require 'gtk3'


class BoutonPause
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

    def BoutonPause.creer(uneEtiquette, uneMethode)
        new(uneEtiquette, uneMethode)
    end

    def afficheBouton()
        button = Gtk::Button.new(etiquette)
        Gtk.main
    end  
end