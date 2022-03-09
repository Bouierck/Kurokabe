#!/usr/bin/env ruby

require 'gtk3'
Gtk.init

class BoutonMenu
    private_class_method :new

    def initialize(unMenu)
        @menu = unMenu
    end

    def menu()
        return @menu
    end

    def BoutonMenu.creer()
        new()
    end

    def lanceMenu()
        monBoutonMenu.signal_connect('clicked') {
            print"Bonsoir"
        }
    
    end

    def onDestroy
        puts "Fin de l'appli"
        Gtk.main_quit
    end

    
    monBoutonMenu = Gtk::Button.new("Menu 1")
    monBoutonMenu.active=true
    hb.pack_start(monBoutonMenu)

    window = Gtk::Window.new
    window.signal_connect('destroy') {
        Gtk.main_quit
    }



    window.add(hb)
    window.show_all
    Gtk.main




end