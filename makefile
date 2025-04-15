build:
	@zig build-exe src/kernel.zig \
	-target riscv32-freestanding \
	-O ReleaseSmall \
	-T ld/kernel.ld

run:
	@qemu-system-riscv32 -machine virt -bios default -nographic -serial mon:stdio --no-reboot \
    -d unimp,guest_errors,int,cpu_reset -D qemu.log \
    -kernel kernel