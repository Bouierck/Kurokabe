require 'gtk3'

    
##
# Fenêtre permettant de choisir un utilisateur ou d'en créer un.
class MenuConnexion < Gtk::Dialog
        
        ##
        # Crée la fenêtre du sélecteur d'utilisateur.
        #
        # Paramètres :
        # [+parent+]        Fenêtre parente au sélecteur d'utilisateur
        # [+app+]           Application (Kurokabe)
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
            entree.style_context.add_class("entry")
            entree.style_context.add_class("margin-bot")

            #Retient le dernier utilisateur connecté et met par défault son nom dans la barre de texte
            lastCo = File.open(__dir__ + '/LastCo.krkb', 'r')
            pseudo = lastCo.read

            entree.set_text(pseudo)

            lastCo.close
            
            entree.signal_connect('key-press-event') { |w, e|
                if(e.keyval == Gdk::Keyval::KEY_Return)
                    p "OK"
                    app.user = Utilisateur.creer(entree.text, 0)
                    lastCo = File.open(__dir__ + '/LastCo.krkb', 'w')
                    lastCo.write(entree.text)
                    lastCo.close
                    self.destroy
                end
            }



            self.content_area.add(
                    Gtk::Box.new(:vertical).tap { |boite|
                    boite.pack_start(
                        Gtk::Image.new(__dir__ + '/../../assets/img/user.png').tap { |img|
                        img.style_context.add_class("margin-top")
                        img.show
                    })
                    boite.add(Gtk::Box.new(:vertical).tap { |boite2|

                    boite2.pack_start(Gtk::Label.new(
                            "ENTREZ VOTRE NOM :").tap { |label|
                            label.style_context.add_class("titre1")
                            label.show
                        })
                        boite2.pack_start(entree)
                        boite2.show
                    })
                    boite.show
                })
            self.add_button("OK", Gtk::ResponseType::OK).style_context.add_class("btn-ok")
            self.add_button(Gtk::Stock::CANCEL, Gtk::ResponseType::CANCEL).style_context.add_class("btn-cancel")
            self.add_button(Gtk::Stock::CLOSE, Gtk::ResponseType::CLOSE).style_context.add_class("btn-close")
            self.set_default_response(Gtk::ResponseType::CANCEL)

            

            self.signal_connect("response") do |widget, response|
                case response
                    when Gtk::ResponseType::OK
                        p "OK"
                        app.user = Utilisateur.creer(entree.text, 0)
                        lastCo = File.open(__dir__ + '/LastCo.krkb', 'w')
                        lastCo.write(entree.text)
                        lastCo.close
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