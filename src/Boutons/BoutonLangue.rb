
#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require_relative "../Donnees/Langue.rb"

require 'gtk3'

##
# Change la langue de l'application
#
class BoutonLangue < Bouton

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -dirImg- localisation de l'image du bouton
    # * -uneLangue- langue du bouton
    def BoutonLangue.creer(dirImg, uneLangue)
        new(dirImg, uneLangue)
    end

    def initialize(dirImg, uneLangue)
        
        super("")

        self.set_image(Gtk::Image.new(__dir__ + dirImg))

        self.signal_connect('clicked'){
            Langue.changerLangue(uneLangue)
        }

    end

end
