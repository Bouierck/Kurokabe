#!/usr/bin/env ruby

require 'gtk3'
 

Gtk.init

class BoutonMenu
    private_class_method :new


    def initialize(uneEtiquette)
        @etiquette = uneEtiquette
    end

    def BoutonMenu.creer(uneEtiquette)
        new(uneEtiquette)
    end

    def quitter()
        Gtk.main_quit
    end

    def afficheToi()
        window = Gtk::Window.new
        window.set_default_size(300,700)
        table = Gtk::Table.new(8,4)

        b1 = Gtk::Button.new('JOUER')
        table.attach(b1, 1, 3, 1, 2)
        b2 = Gtk::Button.new('CLASSEMENT')
        table.attach(b2, 1, 3, 2, 3)
        b3 = Gtk::Button.new('REGLES')
        table.attach(b3, 1, 3, 3, 4)
        b4 = Gtk::Button.new('DIDACTICIEL')
        table.attach(b4, 1, 3, 4, 5)
        b5 = Gtk::Button.new('QUITTER')
        table.attach(b5, 1, 3, 6, 7)
        
        window.add(table)
        window.show_all
        
        #Action du bouton Jouer 
        b5.signal_connect('clicked') {
            lanceMenu
        }

        #Action du bouton Classement 
        b5.signal_connect('clicked') {
            lanceMethode
        }

        #Action du bouton Regles 
        b5.signal_connect('clicked') {
            lanceMethode
        }

        #Action du bouton Didacticiel 
        b5.signal_connect('clicked') {
            lanceMethode
        }

        #Action du bouton Quitter 
        b5.signal_connect('clicked') {
            quitter
        }
        
        window.signal_connect('destroy') { 
            quitter 
        }

        Gtk.main 
    end 
end