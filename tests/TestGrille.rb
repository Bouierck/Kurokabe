require 'gtk3'
load "../src/Niveau/Grille.rb"
load "../src/GUI/GrilleGUI.rb"
load "../src/Donnees/Utilisateur.rb"
load "../src/Niveau/Historique.rb"


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
frame=Gtk::Box.new(:vertical, 4)
monApp.add(frame)

g = Grille.creer(Utilisateur.creer("Stun", "") ,"level1", "aventure")
gG = GrilleGUI.creer(g)
frame.add(gG)

btnRetour=Gtk::Button.new(:label=>"retour")
btnRetour.signal_connect('clicked') { g.historique.retourArriere }
frame.add(btnRetour)

btnAvancer=Gtk::Button.new(:label=>"avancer")
btnAvancer.signal_connect('clicked') { g.historique.retourAvant }
frame.add(btnAvancer)

btnTest=Gtk::Button.new(:label=>"compare")
btnTest.signal_connect('clicked') { puts g.compareGrille }
frame.add(btnTest)

monApp.show_all

# Quand la fenêtre est détruite il faut quitter
monApp.signal_connect('destroy') {onDestroy}
Gtk.main