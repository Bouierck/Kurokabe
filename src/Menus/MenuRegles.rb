require 'gtk3'

require_relative '../Boutons/BoutonRetour.rb'
require_relative '../Boutons/BoutonMenu.rb'

require_relative '../Donnees/Langue.rb'

##
# Widget graphique représentant l'écran d'accueil.
class MenuRegles < Gtk::Box

    attr_reader :titlebar
    def initialize(app)
        super(:vertical, 10)


        lbl = Gtk::Label.new.tap{ |label|
            label.set_markup("REGLES")
        label.show 
        }

        btnRegles = BoutonMenu.creer("TECHNIQUE", 10, 10, MenuTechnique.method(:new), app)
        btnRegles.show


        topbox=Gtk::Box.new(:vertical).tap { |boite|
            boite.pack_start(btnRegles)
            boite.pack_start(lbl)
            boite.show
        }

        self.pack_start(topbox)
        
        textLbl = Gtk::Label.new.tap{ |label|
            label.set_markup("Nurikabe est un casse-tête de formation d'îles. Contrairement à d'autres puzzles de logique, les Nurikabe sont résolus en cloisonnant 
            les indices avec des murs selon les règles de sorte que toutes les îles soient isolées et qu'il y ait un chemin continu vers tous les murs.
    
            Les énigmes de Nurikabe existent en plusieurs tailles et vont de très faciles à extrêmement difficiles, prenant de cinq minutes à plusieurs heures à résoudre. 
            Cependant, faites une seule erreur et vous vous retrouverez bloqué plus tard alors que vous vous rapprochez de la solution...
    
    
                    Le principe est simple :
        
            Vous disposez d'une grille comme celle ci-dessous
            Le but est de noircir certaines cases, et de garder les autres blanches
            Vous devez respecter les règles suivantes :
                Règle 1 : Chaque groupe de cases blanches adjacentes (ayant un côté en commun) doit contenir un et un seul nombre
                Règle 2 : Le nombre de cases formant un ilot doit être égale au nombre inscrit dans l'ilot
                Règle 3 : Toutes les cases noires doivent être connectées entre elles
                Règle 4 : Il ne peut pas y avoir de cases noires qui fassent intégralement le tour d'un ilot
                Règle 5 : Il ne peut y avoir un carré de 4 cases de couleur noire
        
            Il existe des variantes dans les règles qui interdisent les carrés de 4 cases de couleur blanche, 
            ou qui autorise les boucles sur les cases noires... 
            J'applique ici les vrais règles 'officielles', c'est à dire les 5 règles précisées au-dessus. 
            Si vous jouez au Nurikabe ailleurs, vérifiez donc les règles auparavant, sinon les grilles peuvent être impossibles.
        
            Le Nurikabe est donc un mélange entre le Mosaiku et le Fillomino.
                    ")
        label.show 
        }
        self.pack_start(textLbl)


            

        self.show

        @titlebar = Gtk::HeaderBar.new.tap { |barre|
                barre.title = "Nurikabe"
                barre.show_close_button = true
                barre.pack_start(BoutonRetour.new.tap { |bouton|
                    bouton.sensitive = true
                    bouton.signal_connect("clicked") { app.accueil }
                })
                barre.show
            }

    end


end