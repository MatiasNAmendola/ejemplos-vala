class Person : GLib.Object {
	private int _age = 0;

	public int age {
		get { return _age; }
		set { _age = value; }
	}

	[Description (nick="krotki opis", blurb="bardzo dlugi opis pola")]
	public string name {get; set; default = "";}

	public static int main(string[] args) {
		var p = new Person();
		p.notify.connect((src, obj) => {stdout.printf("Obiekt zmienil zawartosc. [%s]\n", obj.name);});
		p.age = 25;
		stdout.printf("age: %d\n", p.age);
		p.age += 11;
		stdout.printf("age: %d\n", p.age);
		p.name = "Kamil";
		stdout.printf("name: %s\n", p.name);
		p.name += " Kasia";
		stdout.printf("name: %s\n", p.name);
		return 0;
	}
}
