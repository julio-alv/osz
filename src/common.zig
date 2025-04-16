const sbi = @import("sbi.zig");

pub fn putchar(ch: u8) void {
    _ = sbi.call(ch, 0, 0, 0, 0, 0, 0, 1);
}

pub fn println(str: []const u8) void {
    for (str) |c| {
        putchar(c);
    }
    putchar('\n');
}
