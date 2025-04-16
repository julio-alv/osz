const mem = @import("mem.zig");
const common = @import("common.zig");
const sbi = @import("sbi.zig");

extern const _stack_top: [*]u8;
extern const _bss: [*]u8;
extern const _bss_end: [*]u8;

export fn kernel_main() void {
    _ = mem.memset(_bss, 0, @intFromPtr(_bss_end) - @intFromPtr(_bss));

    const msg = "\n\nHello World!\n";
    for (msg) |value| {
        common.putchar(value);
    }

    while (true) {
        asm volatile ("wfi");
    }
}

export fn _start() linksection(".text.boot") callconv(.naked) void {
    asm volatile (
        \\ mv sp, %[stack_top]
        \\ j kernel_main
        :
        : [stack_top] "r" (_stack_top),
    );
}
