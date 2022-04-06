
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
    # * -uneEtiquette- étiquette du bouton
    # * -uneLongueur- longueur du bouton
    # * -uneLargeur- largeur du bouton
    # * -uneLangue- langue du bouton
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
