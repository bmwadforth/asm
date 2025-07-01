extern "C" {
    fn _assembly_add(a: i64, b: i64) -> i64;
    fn _print_assembly_string();
}

fn main() {
    println!("Hello from Rust on ARM64 macOS!");

    unsafe {
        let x = 15;
        let y = 25;
        let sum = _assembly_add(x, y);
        println!("Result from assembly_add({}, {}): {}", x, y, sum);

        _print_assembly_string();
    }
}