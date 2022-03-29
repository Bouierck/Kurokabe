
require_relative '../Niveau/Chronometre.rb'
require_relative 'BoutonLangue.rb'
require_relative 'BoutonMenu.rb'
require_relative 'BoutonNiveau.rb'
require_relative 'BoutonPause.rb'
require_relative 'BoutonSpecial.rb'


require 'gtk3'



window = Gtk::Window.new
window.signal_connect('destroy') {
   Gtk.main_quit
}
c = Chronometre.creerChrono()

frame = Gtk::Box.new(:vertical, 3)
window.add(frame)

boutonSpecial1 = BoutonSpecial.creer("Lancer Chrono",10, 10, c.method(:lancer))
boutonSpecial2 = BoutonSpecial.creer("Afficher Chrono",10, 10, c.method(:update))

boutonNiveau1 = BoutonNiveau.creer("Un Niveau", 10, 10, "level1")

boutonMenu1 = BoutonMenu.creer("Un Menu", 10, 10, MenuNiveaux.new)



frame.add(boutonSpecial1)
frame.add(boutonSpecial2)
frame.add(boutonNiveau1)

window.show_all

Gtk.main

