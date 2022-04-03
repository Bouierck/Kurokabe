require 'gtk3'

window = Gtk::Window.new
window.signal_connect('destroy') {
   Gtk.main_quit
}

entry = Gtk::Entry.new
entry.signal_connect('key_press_event') {|w, e|
    puts(e.keyval)
}

entry.show
window.add(entry)
window.show
Gtk.main