#!/usr/bin/env ruby

require 'gtk3'
require_relative "/home/user/code/somelogic.rbMenus"
Gtk.init

class BoutonMenu
    private_class_method :new


    def initialize(unMenu, foncMenu)
        @menu = unMenu
        @fonctionMenu = foncMenu
    end

    def menu()
        return @menu
    end

    def fonctionMenu()
        fonctionMenu = @

    end
    def BoutonMenu.creer(fonctionMenu)
        new()
    end



    def lanceMenu()
        monBoutonMenu.signal_connect('clicked') {
            
        }
    
    end

    def onDestroy
        puts "Fin de l'appli"
        Gtk.main_quit
    end

    
    monBoutonMenu = Gtk::Button.new("Menu 1")

    window = Gtk::Window.new
    window.signal_connect('destroy') {
        Gtk.main_quit
    }

    window.add(monBoutonMenu)

    window.show_all
    Gtk.main




end