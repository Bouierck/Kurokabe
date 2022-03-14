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
 

        button.signal_connect('clicked') { 
            print"Bonjour"
        }

        button.signal_connect('destroy') { 
            print"je suis mort"
            Gtk.main_quit 
        }
        Gtk.main

    end 
end