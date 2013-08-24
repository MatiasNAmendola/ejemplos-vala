using Gtk;

int main (string[] args) {
	Gtk.init(ref args);

	var window = new Window();
	window.title = "Gtk Win";
	window.border_width = 10;
	window.window_position = WindowPosition.CENTER;
	window.set_default_size(350, 70);
	window.destroy.connect(Gtk.main_quit);

	var button = new Button.with_label("Klikaj mjenia");
	button.clicked.connect (() => {
		button.label = "Bławo bławo!";
	});
	
	try {
		window.icon = IconTheme.get_default().load_icon("pidgin", 48, 0);
	} catch (Error e) {
		stderr.printf("Brak ikony: %s\n", e.message);
	}

	window.add(button);
	window.show_all();

	Gtk.main();

	return 0;
} 
