fn main() {
    // Tell Cargo that if the assembly files change, to rerun this build script.
    // This ensures changes in your .s files trigger a recompile.
    println!("cargo:rerun-if-changed=asm/functions.s");
    println!("cargo:rerun-if-changed=asm/print_string.s");

    // Configure and compile the assembly files.
    // `target` method sets the target architecture. This is important for cross-compilation,
    // though on an M3 Mac, it will default correctly.
    // `file` method adds the assembly source files.
    // `compile` method names the resulting static library (e.g., 'libasm.a').
    cc::Build::new()
        .file("asm/functions.s")
        .file("asm/print_string.s")
        .target("aarch64-apple-darwin")
        .compile("asm_lib");
}