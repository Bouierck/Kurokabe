##
# Test unitaire de l'affichage du chronomètre
#

load '../src/Niveau/Chronometre.rb'

require 'gtk3'

chrono = Chronometre.creerChrono()

window = Gtk::Window.new
window.add(chrono)

chrono.lancer

window.show_all
Gtk.main