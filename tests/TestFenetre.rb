require 'gtk3'
load "../src/Niveau/Grille.rb"

def onDestroy
	puts "Fin de l'application"
	Gtk.main_quit
end

monApp = Gtk::Window.new

# Titre de la fenêtre
monApp.set_title("Clicker")
# Taille de la fenêtre
monApp.set_default_size(600,600)
# Réglage de la bordure
monApp.border_width=5
# On peut redimensionner
monApp.set_resizable(true)
# L'application est toujours centrée
monApp.set_window_position(Gtk::WindowPosition::CENTER_ALWAYS)

# Création du Layout
frame=Gtk::Box.new(:vertical, 1)
monApp.add(frame)

g = Grille.creer(Utilisateur.creer("Stun", "") ,"level1", "aventure")
frame.add(g)

monApp.show_all
# Quand la fenêtre est détruite il faut quitter
monApp.signal_connect('destroy') {onDestroy}
Gtk.main