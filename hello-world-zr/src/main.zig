const std = @import("std");
const ffi_slice = @import("ffi_slice.zig");

const FFISlice = ffi_slice.FFISlice;

extern fn println(message: FFISlice(u8)) void;

pub fn main() void {
    const message = "Hello, world!";
    const slice = FFISlice(u8).fromSlice(message);
    
    println(slice);
}
