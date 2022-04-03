
#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require_relative "../Donnees/Langue.rb"

require 'gtk3'

##
# Chaange la langue de l'application
#
class BoutonLangue < Bouton

    def BoutonLangue.creer(dirImg, uneLongueur, uneLargeur, uneLangue)
        new(dirImg, uneLongueur, uneLargeur, uneLangue)
    end

    def initialize(dirImg, uneLongueur, uneLargeur, uneLangue)
        
        super("", uneLongueur, uneLargeur)

        self.set_image(Gtk::Image.new(__dir__ + dirImg))

        self.signal_connect('clicked'){
            Langue.changerLangue(uneLangue)
        }

    end

end
