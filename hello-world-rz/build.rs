use std::process::Command;

fn main() {
    call("zig", &["build", "-Drelease-safe"]);

    println!("cargo:rustc-link-search=zig-out/lib");
}

fn call(command: &str, args: &[&str]) {
    Command::new(command)
        .args(args)
        .spawn()
        .unwrap()
        .wait()
        .unwrap();
}
