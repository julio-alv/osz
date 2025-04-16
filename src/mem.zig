pub fn memset(buf: [*]u8, value: u8, n: usize) [*]u8 {
    var i: usize = 0;
    while (i < n) : (i += 1) {
        buf[i] = value;
    }
    return buf;
}
