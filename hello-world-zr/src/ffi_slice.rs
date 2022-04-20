use std::slice;

#[repr(C)]
pub struct FFISlice<T> {
    ptr: *const T,
    len: usize,
}

impl<T> FFISlice<T> {
    pub fn to_slice(&self) -> &[T] {
        unsafe { slice::from_raw_parts(self.ptr, self.len) }
    }
}
