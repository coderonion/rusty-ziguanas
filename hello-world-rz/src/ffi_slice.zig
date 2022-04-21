pub fn FFISlice(comptime T: type) type {
    return extern struct {
        ptr: [*]const T,
        len: usize,
        
        const Self = @This();
        
        pub fn toSlice(self: Self) []const T {
            return self.ptr[0..self.len];
        }
    };
}
