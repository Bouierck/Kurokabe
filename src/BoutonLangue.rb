#!/usr/bin/env ruby

require 'gtk3'

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
    
    monBoutonLangue = Gtk::Button.new
    

    Gtk.main


end