mod ffi_slice;

use ffi_slice::FFISlice;

fn main() {
    println("Hello, world!");
}

fn println(message: &str) {
    let slice = FFISlice::from(message);
    unsafe {
        u_println(slice);
    }
}

#[link(name = "println", kind = "dylib")]
extern "C" {
    #[link_name = "println"]
    fn u_println(message: FFISlice<u8>);
}
