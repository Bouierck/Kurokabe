#!/usr/bin/env ruby

require 'gtk3'
Gtk.init

class BoutonLangue

    private_class_method :new

    def initialize(uneLangue)
        @langue = uneLangue
    end

    def langue()
        return @langue
    end

    def BoutonLangue.creer()
        new()
    end

    def changeLangue()

    end

    def onDestroy
        puts "Fin de l'appli"
        Gtk.main_quit
    end  

    fenetre = Gtk::Window.new
    fenetre.signal_connect('destroy') {
        Gtk.main_quit
    }

    monBoutonLangue = Gtk::Button.new("Changement de la langue")

    fenetre.add(monBoutonLangue)

    fenetre.show_all
    Gtk.main

end