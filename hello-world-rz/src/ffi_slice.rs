#[repr(C)]
pub struct FFISlice<T> {
    ptr: *const T,
    len: usize,
}

impl<'a, T> From<&'a [T]> for FFISlice<T> {
    fn from(slice: &'a [T]) -> Self
    where
        Self: 'a,
    {
        FFISlice {
            ptr: slice.as_ptr(),
            len: slice.len(),
        }
    }
}

impl<'a> From<&'a str> for FFISlice<u8> {
    fn from(slice: &'a str) -> Self
    where
        Self: 'a,
    {
        FFISlice {
            ptr: slice.as_ptr(),
            len: slice.len(),
        }
    }
}
