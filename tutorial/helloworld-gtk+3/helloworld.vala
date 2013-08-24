using Gtk;

int main (string[] args) {
	Gtk.init (ref args);

	var window = new Gtk.Window ();
	window.title = "Hello World!";
	window.window_position = Gtk.WindowPosition.CENTER;
	window.set_default_size (350, 100);
	window.destroy.connect (Gtk.main_quit);


	// Lets create a button
	var helloBtn = new Gtk.Button.with_label ("Hello");
	
	// Attach an event handler for the clicked event
	helloBtn.clicked.connect (() => {
		helloBtn.label = "World!";
		helloBtn.set_sensitive (false); // disable it
	});

	// Add it to the window
	window.add (helloBtn);

	window.show_all ();
	Gtk.main ();
	return 0;
}