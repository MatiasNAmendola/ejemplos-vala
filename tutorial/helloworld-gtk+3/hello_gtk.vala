int main (string[] args) {
    Gtk.init(ref args);     // initialize gtk with any arguments
    
    /* Set up a window */

    var window = new Gtk.Window ();
    window.title = "Hello";
    window.window_position = Gtk.WindowPosition.CENTER;
    window.set_default_size (300, 300);
    window.destroy.connect (Gtk.main_quit);

    /* Create vertical box layout for our 3 widgets */
    var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 3);

    /* Create a textfield aka Entry */
    var entry = new Gtk.Entry ();
    entry.text = "Enter your name";

    /* Create a label */
    var label = new Gtk.Label ("");

    /* Create a button and wire up the click signal (aka event) */
    var button = new Gtk.Button.with_label ("Click me");
    button.clicked.connect (() => {        
        label.label = "Hello " + entry.text + "!";   // change the label text        
    });

    /* Add the widgets to the box */
    box.pack_start (entry);
    box.pack_start (button);
    box.pack_start (label);

    window.add (box);       // add the box to the window

    window.show_all ();     // show the window and all of its widgets
    Gtk.main ();            // start the main event loop
    return 0;
}