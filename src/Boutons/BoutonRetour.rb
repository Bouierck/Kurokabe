require 'gtk3'


##
# Bouton de retour
class BoutonRetour < Gtk::Button
    
    ##
    # Crée un bouton de retour.
    def initialize
        super(icon_name: 'draw-arrow-back')
        self.show
    end
    
end
    
