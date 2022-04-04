require 'gtk3'

window = Gtk::Window.new
window.signal_connect('destroy') {
   Gtk.main_quit
}

pop = Gtk::Popover.new

window.signal_connect('key_press_event') {|w, e|
    pop.popup
}

pop.set_relative_to(window)
window.add(pop)

window.show
Gtk.main