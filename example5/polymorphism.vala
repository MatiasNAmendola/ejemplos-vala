class SuperClass : GLib.Object {
    public void method_1() {
        stdout.printf("SuperClass.method_1()\n");
    }
}

class SubClass : SuperClass {
    public void method_1() {
        stdout.printf("SubClass.method_1()\n");
    }
}

int main (string[] args) {
	SubClass o1 = new SubClass();
	o1.method_1();
	SuperClass o2 = o1;
	o2.method_1();
	return 0;
}
