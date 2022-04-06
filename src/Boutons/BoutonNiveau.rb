require_relative "./Bouton.rb"

require_relative "../GUI/NiveauGUI.rb"

require_relative "../Niveau/Niveau.rb"

require 'gtk3'

##
# Lance un niveau
#
class BoutonNiveau < Bouton

    ##
    #@niveau Niveaau qui se lance au clque sur le bouton

    def BoutonNiveau.creer(uneEtiquette, uneLongueur, uneLargeur, id, mode, app)
        new(uneEtiquette, uneLongueur, uneLargeur, id, mode, app)
    end

    private_class_method :new

    def initialize(uneEtiquette, uneLongueur, uneLargeur, id, menuNiveau, app)
        super(uneEtiquette, uneLongueur, uneLargeur)

        self.width_request = 79
        self.height_request = 50

        mode = ["Classique", "Aventure", "Classe"]

        self.signal_connect('clicked'){

            fichierName = __dir__ + "/../../profile/" + app.user.nom + "/levels/" + mode[menuNiveau.mode - 1] + "/level" + id.to_s + ".krkb"
    
            if(File.exist?(fichierName))
                fichier = File.open(fichierName, "r")
                niveau = Marshal.load(fichier)
                fichier.close
            else
                niveau = Niveau.creer(id, app.user, mode[menuNiveau.mode - 1])
            end
    
            n = NiveauGUI.creer(app, niveau)
            app.fenetre.remove(app.fenetre.child) if(app.fenetre.child)
            app.fenetre.child = n
            app.fenetre.titlebar = n.titlebar

        }
    end
end
  
