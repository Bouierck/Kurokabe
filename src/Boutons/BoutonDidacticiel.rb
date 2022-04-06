require_relative "./Bouton.rb"

require_relative "../Aide/Didacticiel.rb"

require_relative "../Niveau/Niveau.rb"

require 'gtk3'

##
# Lance un niveau
#
class BoutonDidacticiel < Bouton

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -uneEtiquette- étiquette du bouton
    # * -uneLongueur- longueur du bouton
    # * -uneLargeur- largeur du bouton
    # * -app- application
    #
    def BoutonDidacticiel.creer(uneEtiquette, uneLongueur, uneLargeur, app)
        new(uneEtiquette, uneLongueur, uneLargeur, app)
    end

    private_class_method :new

    def initialize(uneEtiquette, uneLongueur, uneLargeur, app)
        super(uneEtiquette, uneLongueur, uneLargeur)

        self.signal_connect('clicked'){
    
            niveau = Niveau.creer(1, app.user, "Aventure")
    
            n = Didacticiel.creer(app, niveau)
            app.fenetre.remove(app.fenetre.child) if(app.fenetre.child)
            app.fenetre.child = n
            app.fenetre.titlebar = n.titlebar

        }
    end
end
  
