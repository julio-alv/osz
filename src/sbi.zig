const sbiret = struct {
    Value: i32,
    Error: i32,
};

pub fn call(
    arg0: i32,
    arg1: i32,
    arg2: i32,
    arg3: i32,
    arg4: i32,
    arg5: i32,
    fid: i32,
    eid: i32,
) sbiret {
    var err: i32 = undefined;
    var value: i32 = undefined;

    asm volatile (
        \\ mv a0, %[arg0]
        \\ mv a1, %[arg1]
        \\ mv a2, %[arg2]
        \\ mv a3, %[arg3]
        \\ mv a4, %[arg4]
        \\ mv a5, %[arg5]
        \\ mv a6, %[fid]
        \\ mv a7, %[eid]
        \\ ecall
        \\ mv %[err], a0
        \\ mv %[value], a1
        : [err] "=r" (err),
          [value] "=r" (value),
        : [arg0] "r" (arg0),
          [arg1] "r" (arg1),
          [arg2] "r" (arg2),
          [arg3] "r" (arg3),
          [arg4] "r" (arg4),
          [arg5] "r" (arg5),
          [fid] "r" (fid),
          [eid] "r" (eid),
        : "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "memory"
    );

    return .{ .Value = value, .Error = err };
}
