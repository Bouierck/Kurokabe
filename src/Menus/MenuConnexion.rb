require 'gtk3'

    
##
# Fenêtre permettant de choisir un utilisateur ou d'en créer un.
class MenuConnexion < Gtk::Dialog
    
       attr:user,true
        
        ##
        # Crée la fenêtre du sélecteur d'utilisateur.
        #
        # Paramètres :
        # [+parent+]        Fenêtre parente au sélecteur d'utilisateur
        # [+app+]           Application (Nurikabe)
        def initialize(parent, app = nil)
            super(title: "Nouvel utilisateur", parent: parent,
            flags: Gtk::DialogFlags::USE_HEADER_BAR |
            Gtk::DialogFlags::MODAL |
            Gtk::DialogFlags::DESTROY_WITH_PARENT)

            self.title = "Connexion"
            self.set_default_size(300, 200)
            self.child.add(Gtk::Label.new("Connexion"))

            entree = Gtk::Entry.new.tap { |entree|
                entree.signal_connect("activate") {
                        self.signal_emit("response", 1)
                    }
                    entree.show
                }

            self.content_area.add(
                    Gtk::Box.new(:horizontal).tap { |boite|
                    boite.pack_start(
                        Gtk::Image.new('teub.png').tap { |img|
                        img.show
                    })
                    boite.add(Gtk::Box.new(:vertical).tap { |boite2|

                    boite2.pack_start(Gtk::Label.new(
                            "Entrez votre pseudo:").tap { |label|

                            label.show
                        })
                        boite2.pack_start(entree)
                        boite2.show
                    })
                    boite.show
                })
            self.add_button("OK", Gtk::ResponseType::OK)
            self.add_button(Gtk::Stock::CANCEL, Gtk::ResponseType::CANCEL)
            self.add_button(Gtk::Stock::CLOSE, Gtk::ResponseType::CLOSE)
            self.set_default_response(Gtk::ResponseType::CANCEL)

            self.signal_connect("response") do |widget, response|
                case response
                    when Gtk::ResponseType::OK
                        p "OK"
                        @user = entree.text
                        #possibilité de créer dossier
                        self.destroy
                    when Gtk::ResponseType::CANCEL
                        p "Cancel"
                        entree.set_text("")
                    when Gtk::ResponseType::CLOSE
                        p "Close"
                        self.destroy
                        parent.destroy
                end
            end
            self.show


        end
        
    
end