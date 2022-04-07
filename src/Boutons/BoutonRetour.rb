require 'gtk3'

require_relative "./BoutonMenu.rb"

##
# Bouton de retour
class BoutonRetour < BoutonMenu

    ##
    # Constructeur
    #
    # === Attributes
    # 
    # * -menu- menu dans lequel se trouve le bouton
    # * -uneApp- application
    #
    def BoutonRetour.creer(menu, app)
        new(menu, app)
    end

    private_class_method :new

    def initialize(menu, app)
        super("❮", menu, app)
    end
end
    
