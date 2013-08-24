using Gtk;

public class MainWindow : Gtk.Window {

	private void initComponents() {
		this.title = "ValaCommander";
		this.destroy.connect(Gtk.main_quit);
		
	}

	public static int main (string[] args) {
		Gtk.init(ref args);
		
		MainWindow w = new MainWindow();
		w.initComponents();
		w.show_all();
		w.

		Gtk.main();
		return 0;
	}
}
