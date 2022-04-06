require 'gtk3'

require_relative "./BoutonMenu.rb"

##
# Bouton de retour
class BoutonRetour < BoutonMenu
    
   ##
    #@menu Menu à lancé à l'appuie du bouton

    def BoutonRetour.creer(menu, app)
        new(menu, app)
    end

    private_class_method :new

    def initialize(menu, app)
        super("❮", 10, 10, menu, app)
    end
end
    
