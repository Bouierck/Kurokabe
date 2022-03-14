#!/usr/bin/env ruby

require 'gtk3'


class BoutonPause
    

    private_class_method :new

    def initialize(uneEtiquette)
        @etiquette = uneEtiquette
    end

    def BoutonPause.creer(uneEtiquette)
        new(uneEtiquette)
    end

    def afficheToi()
        window = Gtk::Window.new
        button = Gtk::Button.new('Bouton Pause')

        window.add(button)
        window.show_all
        
        Gtk.main

        window.signal_connect('destroy') { 
            Gtk.main_quit 
        }
    end 
end