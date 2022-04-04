require_relative '../src/Niveau/Niveau.rb'
require_relative '../src/GUI/NiveauGUI.rb'

require 'gtk3'

window = Gtk::Window.new
window.signal_connect('destroy') {
   Gtk.main_quit
}

boutonQuitter = Gtk::Button.new("test")
boutonQuitter.show

pop = Gtk::Popover.new

window.signal_connect('key_press_event') {|w, e|
    pop.popup
}

pop.set_relative_to(boutonQuitter)
window.add(boutonQuitter)

window.show
Gtk.main