ENTRY(_start)

SECTIONS {
    . = 0x80200000;
    _kernel_base = .;
    
    .text :{
        KEEP(*(.text.boot));
        *(.text);
        *(.text.*);
    }

    .rodata : ALIGN(4) {
        *(.rodata);
        *(.rodata.*);
    }

    .data : ALIGN(4) {
        *(.data);
        *(.data.*);
    }

    .bss : ALIGN(4) {
        _bss = .;
        *(.bss);
        *(.bss.*);
        *(.sbss);
        *(.sbss.*);
        _bss_end = .;
    }

    . = ALIGN(4);
    . += 128K;
    _stack_top = .;

    . = ALIGN(4096);
    _free_ram = .;
    . += 64M;
    _free_ram_end = .;
}