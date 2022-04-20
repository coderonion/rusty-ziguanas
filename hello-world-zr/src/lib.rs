mod ffi_slice;

use std::str;

use ffi_slice::FFISlice;

#[no_mangle]
pub fn println(message: FFISlice<u8>) {
    let slice = message.to_slice();

    match str::from_utf8(slice) {
        Ok(string) => println!("{string}"),
        Err(_) => eprintln!("Slice was invalid utf8."),
    }
}
