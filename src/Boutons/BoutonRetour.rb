require 'gtk3'


##
# Bouton de retour
class BoutonRetour < Gtk::Button
    
    ##
    # Crée un bouton de retour.
    def initialize
        super(label: "↶")
        self.show
    end
    
end
    
