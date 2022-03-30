require 'gtk3'

load "../src/Niveau/Niveau.rb"
load "../src/GUI/NiveauGUI.rb"

fenetre = Gtk::Window.new

# Titre de la fenêtre
fenetre.set_title("KUROKABE")
# Taille de la fenêtre
fenetre.set_default_size(600,600)
# Réglage de la bordure
fenetre.border_width=5
# On peut redimensionner
fenetre.set_resizable(true)
# L'application est toujours centrée
fenetre.set_window_position(Gtk::WindowPosition::CENTER_ALWAYS)

niveau = Niveau.creer("4", "Stun", "aventure");
niveauGUI = NiveauGUI.creer(niveau);

fenetre.add(niveauGUI)

fenetre.show_all
Gtk.main