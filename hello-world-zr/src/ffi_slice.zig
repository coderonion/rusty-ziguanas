pub fn FFISlice(comptime T: type) type {
    return extern struct {
        ptr: [*]const T,
        len: usize,
        
        const Self = @This();
        
        pub fn fromSlice(slice: []const T) Self {
            return .{
                .ptr = slice.ptr,
                .len = slice.len,
            };
        }
    };
}
