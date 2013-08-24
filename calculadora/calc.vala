using Gtk;

class Calculator
{
	private Gtk.Window window;
	private Gtk.Button button0;
	private Gtk.Button button1;
	private Gtk.Button button2;
	private Gtk.Button button3;
	private Gtk.Button button4;
	private Gtk.Button button5;
	private Gtk.Button button6;
	private Gtk.Button button7;
	private Gtk.Button button8;
	private Gtk.Button button9;
	private Gtk.Button button10;
	private Gtk.Button plus_button;
	private Gtk.Button minus_button;
	private Gtk.Button star_button;
	private Gtk.Button division_button;
	private Gtk.Button result_button;
	private Gtk.Table table;
	private Gtk.Entry textentry;
	private string first_operand;
	private string operation;
	
	static bool delete_event ()
		{
			Gtk.main_quit();
			return false;
		}

	public Calculator()
		{
			this.window = new Gtk.Window();
			this.window.set_title("Calculator");
			this.window.set_border_width(10);
			table = new Gtk.Table(5, 3, true);
			this.window.add(table);
			// All buttons needed for calculator
			this.button1 = new Gtk.Button.with_label("1");
			this.button2 = new Gtk.Button.with_label("2");
			this.button3 = new Gtk.Button.with_label("3");
			this.button4 = new Gtk.Button.with_label("4");
			this.button5 = new Gtk.Button.with_label("5");
			this.button6 = new Gtk.Button.with_label("6");
			this.button7 = new Gtk.Button.with_label("7");
			this.button8 = new Gtk.Button.with_label("8");
			this.button9 = new Gtk.Button.with_label("9");
			this.button0 = new Gtk.Button.with_label("0");
			this.plus_button = new Gtk.Button.with_label("+");
			this.minus_button = new Gtk.Button.with_label("-");
			this.star_button = new Gtk.Button.with_label("*");
			this.division_button = new Gtk.Button.with_label("/");
			this.result_button = new Gtk.Button.with_label("=");
			this.textentry = new Gtk.Entry();
			Gtk.AttachOptions flags = Gtk.AttachOptions.EXPAND | Gtk.AttachOptions.FILL;
			table.attach(textentry, 0, 4, 0, 1, flags, flags, 0, 0);
			table.attach(button1, 0, 1, 1, 2, flags, flags, 0, 0);
			table.attach(button2, 1, 2, 1, 2, flags, flags, 0, 0);
			table.attach(button3, 2, 3, 1, 2, flags, flags, 0, 0);
			table.attach(button4, 3, 4, 1, 2, flags, flags, 0, 0);
			table.attach(button5, 0, 1, 2, 3, flags, flags, 0, 0);
			table.attach(button6, 1, 2, 2, 3, flags, flags, 0, 0);
			table.attach(button7, 2, 3, 2, 3, flags, flags, 0, 0);
			table.attach(button8, 3, 4, 2, 3, flags, flags, 0, 0);
			table.attach(button9, 0, 1, 3, 4, flags, flags, 0, 0);
			table.attach(button0, 1, 2, 3, 4, flags, flags, 0, 0);
			table.attach(plus_button, 2, 3, 3, 4, flags, flags, 0, 0);
			table.attach(minus_button, 3, 4, 3, 4, flags, flags, 0, 0);
			table.attach(star_button, 0, 1, 4, 5, flags, flags, 0, 0);
			table.attach(division_button, 1, 2, 4, 5, flags, flags, 0, 0);
			table.attach(result_button, 2, 4, 4, 5, flags, flags, 0, 0);
			table.set_row_spacings(2);
			table.set_col_spacings(2);

			// Signal handling
			this.window.delete_event.connect(this.delete_event);
			this.button1.clicked.connect(() => { this.pressed_number(1); });
			this.button2.clicked.connect(() => { this.pressed_number(2); });
			this.button3.clicked.connect(() => { this.pressed_number(3); });
			this.button4.clicked.connect(() => { this.pressed_number(4); });
			this.button5.clicked.connect(() => { this.pressed_number(5); });
			this.button6.clicked.connect(() => { this.pressed_number(6); });
			this.button7.clicked.connect(() => { this.pressed_number(7); });
			this.button8.clicked.connect(() => { this.pressed_number(8); });
			this.button9.clicked.connect(() => { this.pressed_number(9); });
			this.button0.clicked.connect(() => { this.pressed_number(0); });
			this.plus_button.clicked.connect(() => { this.pressed_operator("+"); });
			this.minus_button.clicked.connect(() => { this.pressed_operator("-"); });
			this.star_button.clicked.connect(() => { this.pressed_operator("*"); });
			this.division_button.clicked.connect(() => { this.pressed_operator("/"); });
			this.result_button.clicked.connect(this.pressed_result);

			textentry.show();
			button1.show();
			button2.show();
			button3.show();
			button4.show();
			button5.show();
			button6.show();
			button7.show();
			button8.show();
			button9.show();
			button0.show();
			plus_button.show();
			minus_button.show();
			division_button.show();
			star_button.show();
			result_button.show();
			table.show();
			window.show();
		}

	void pressed_number(int num)
		{
			stdout.printf("Pressed button %d", num);
			string existing_text = this.textentry.get_text();
			if (existing_text != "")
			{
				existing_text = existing_text + num.to_string();
			}
			else
			{
				existing_text = num.to_string();
			}
			this.textentry.set_text(existing_text);
		}

	void pressed_operator(string operator)
		{
			this.operation = operator;
			this.first_operand = this.textentry.get_text();

		}

	
	void pressed_result()
		{
			string second_operand = this.textentry.get_text();
			int result=0;
			switch(this.operation)
			{
			case "+":
				result = this.first_operand.to_int() + second_operand.to_int();
				break;
			case "-":
				result = this.first_operand.to_int() - second_operand.to_int();
				break;
			case "*":
				result = this.first_operand.to_int() * second_operand.to_int();
				break;
			case "/":
				result = this.first_operand.to_int() / second_operand.to_int();
				break;
			}
			this.textentry.set_text(result.to_string());
			this.first_operand = "";
			this.operation = "";
		}

	public static int main (string[] args)
		{
			Gtk.init (ref args);
			var calc = new Calculator();
			Gtk.main();
			return 0;
		}
}