const std = @import("std");
const ffi_slice = @import("ffi_slice.zig");

const FFISlice = ffi_slice.FFISlice;

export fn println(slice: FFISlice(u8)) void {
    const message = slice.toSlice();
    std.debug.print("{s}\n", .{ message });
}
