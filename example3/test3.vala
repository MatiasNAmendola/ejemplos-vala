using Gtk;

public void on_button1_clicked (Button source) {
    source.label = "Thank you!";
}

public void on_button2_clicked (Button source) {
    source.label = "Thanks!";
}

int main (string[] args) {     
    Gtk.init (ref args);

    try {
        // If the UI contains custom widgets, their types must've been instantiated once
        // Type type = typeof(Foo.BarEntry);
        // assert(type != 0);
        var builder = new Builder ();
        builder.add_from_file ("sample.ui");
        builder.connect_signals (null);
        var window = builder.get_object ("window1") as Window;
        
        /*var toolbar1 = builder.get_object ("toolbar1") as Toolbar;
        toolbar1.get_style_context ().add_class (STYLE_CLASS_PRIMARY_TOOLBAR);
				var open_button = new ToolButton.from_stock (Stock.OPEN);
        open_button.is_important = true;
        toolbar1.add (open_button);*/
        
        
        window.show_all ();
        Gtk.main ();
    } catch (Error e) {
        stderr.printf ("Could not load UI: %s\n", e.message);
        return 1;
    } 

    return 0;
}
