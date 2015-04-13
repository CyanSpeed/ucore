
obj/bootblock.o:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:

# start address should be 0:7c00, in real mode, the beginning address of the running bootloader
.globl start
start:
.code16                                             # Assemble for 16-bit mode
    cli                                             # Disable interrupts
    7c00:	fa                   	cli    
    cld                                             # String operations increment
    7c01:	fc                   	cld    

    # Set up the important data segment registers (DS, ES, SS).
    xorw %ax, %ax                                   # Segment number zero
    7c02:	31 c0                	xor    %eax,%eax
    movw %ax, %ds                                   # -> Data Segment
    7c04:	8e d8                	mov    %eax,%ds
    movw %ax, %es                                   # -> Extra Segment
    7c06:	8e c0                	mov    %eax,%es
    movw %ax, %ss                                   # -> Stack Segment
    7c08:	8e d0                	mov    %eax,%ss

00007c0a <seta20.1>:
    # Enable A20:
    #  For backwards compatibility with the earliest PCs, physical
    #  address line 20 is tied low, so that addresses higher than
    #  1MB wrap around to zero by default. This code undoes this.
seta20.1:
    inb $0x64, %al                                  # Wait for not busy(8042 input buffer empty).
    7c0a:	e4 64                	in     $0x64,%al
    testb $0x2, %al
    7c0c:	a8 02                	test   $0x2,%al
    jnz seta20.1
    7c0e:	75 fa                	jne    7c0a <seta20.1>

    movb $0xd1, %al                                 # 0xd1 -> port 0x64
    7c10:	b0 d1                	mov    $0xd1,%al
    outb %al, $0x64                                 # 0xd1 means: write data to 8042's P2 port
    7c12:	e6 64                	out    %al,$0x64

00007c14 <seta20.2>:

seta20.2:
    inb $0x64, %al                                  # Wait for not busy(8042 input buffer empty).
    7c14:	e4 64                	in     $0x64,%al
    testb $0x2, %al
    7c16:	a8 02                	test   $0x2,%al
    jnz seta20.2
    7c18:	75 fa                	jne    7c14 <seta20.2>

    movb $0xdf, %al                                 # 0xdf -> port 0x60
    7c1a:	b0 df                	mov    $0xdf,%al
    outb %al, $0x60                                 # 0xdf = 11011111, means set P2's A20 bit(the 1 bit) to 1
    7c1c:	e6 60                	out    %al,$0x60

    # Switch from real to protected mode, using a bootstrap GDT
    # and segment translation that makes virtual addresses
    # identical to physical addresses, so that the
    # effective memory map does not change during the switch.
    lgdt gdtdesc
    7c1e:	0f 01 16             	lgdtl  (%esi)
    7c21:	6c                   	insb   (%dx),%es:(%edi)
    7c22:	7c 0f                	jl     7c33 <protcseg+0x1>
    movl %cr0, %eax
    7c24:	20 c0                	and    %al,%al
    orl $CR0_PE_ON, %eax
    7c26:	66 83 c8 01          	or     $0x1,%ax
    movl %eax, %cr0
    7c2a:	0f 22 c0             	mov    %eax,%cr0

    # Jump to next instruction, but in 32-bit code segment.
    # Switches processor into 32-bit mode.
    ljmp $PROT_MODE_CSEG, $protcseg
    7c2d:	ea 32 7c 08 00 66 b8 	ljmp   $0xb866,$0x87c32

00007c32 <protcseg>:

.code32                                             # Assemble for 32-bit mode
protcseg:
    # Set up the protected-mode data segment registers
    movw $PROT_MODE_DSEG, %ax                       # Our data segment selector
    7c32:	66 b8 10 00          	mov    $0x10,%ax
    movw %ax, %ds                                   # -> DS: Data Segment
    7c36:	8e d8                	mov    %eax,%ds
    movw %ax, %es                                   # -> ES: Extra Segment
    7c38:	8e c0                	mov    %eax,%es
    movw %ax, %fs                                   # -> FS
    7c3a:	8e e0                	mov    %eax,%fs
    movw %ax, %gs                                   # -> GS
    7c3c:	8e e8                	mov    %eax,%gs
    movw %ax, %ss                                   # -> SS: Stack Segment
    7c3e:	8e d0                	mov    %eax,%ss

    # Set up the stack pointer and call into C. The stack region is from 0--start(0x7c00)
    movl $0x0, %ebp
    7c40:	bd 00 00 00 00       	mov    $0x0,%ebp
    movl $start, %esp
    7c45:	bc 00 7c 00 00       	mov    $0x7c00,%esp
    call bootmain
    7c4a:	e8 80 00 00 00       	call   7ccf <bootmain>

00007c4f <spin>:

    # If bootmain returns (it shouldn't), loop.
spin:
    jmp spin
    7c4f:	eb fe                	jmp    7c4f <spin>
    7c51:	8d 76 00             	lea    0x0(%esi),%esi

00007c54 <gdt>:
	...
    7c5c:	ff                   	(bad)  
    7c5d:	ff 00                	incl   (%eax)
    7c5f:	00 00                	add    %al,(%eax)
    7c61:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7c68:	00 92 cf 00 17 00    	add    %dl,0x1700cf(%edx)

00007c6c <gdtdesc>:
    7c6c:	17                   	pop    %ss
    7c6d:	00 54 7c 00          	add    %dl,0x0(%esp,%edi,2)
	...

00007c72 <readsect>:
        /* do nothing */;
}

/* readsect - read a single sector at @secno into @dst */
static void
readsect(void *dst, uint32_t secno) {
    7c72:	55                   	push   %ebp
    7c73:	89 d1                	mov    %edx,%ecx
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
    7c75:	ba f7 01 00 00       	mov    $0x1f7,%edx
    7c7a:	89 e5                	mov    %esp,%ebp
    7c7c:	57                   	push   %edi
    7c7d:	89 c7                	mov    %eax,%edi
    7c7f:	ec                   	in     (%dx),%al
#define ELFHDR          ((struct elfhdr *)0x10000)      // scratch space

/* waitdisk - wait for disk ready */
static void
waitdisk(void) {
    while ((inb(0x1F7) & 0xC0) != 0x40)
    7c80:	83 e0 c0             	and    $0xffffffc0,%eax
    7c83:	3c 40                	cmp    $0x40,%al
    7c85:	75 f8                	jne    7c7f <readsect+0xd>
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
    7c87:	ba f2 01 00 00       	mov    $0x1f2,%edx
    7c8c:	b0 01                	mov    $0x1,%al
    7c8e:	ee                   	out    %al,(%dx)
    7c8f:	b2 f3                	mov    $0xf3,%dl
    7c91:	88 c8                	mov    %cl,%al
    7c93:	ee                   	out    %al,(%dx)
    // wait for disk to be ready
    waitdisk();

    outb(0x1F2, 1);                         // count = 1
    outb(0x1F3, secno & 0xFF);
    outb(0x1F4, (secno >> 8) & 0xFF);
    7c94:	89 c8                	mov    %ecx,%eax
    7c96:	b2 f4                	mov    $0xf4,%dl
    7c98:	c1 e8 08             	shr    $0x8,%eax
    7c9b:	ee                   	out    %al,(%dx)
    outb(0x1F5, (secno >> 16) & 0xFF);
    7c9c:	89 c8                	mov    %ecx,%eax
    7c9e:	b2 f5                	mov    $0xf5,%dl
    7ca0:	c1 e8 10             	shr    $0x10,%eax
    7ca3:	ee                   	out    %al,(%dx)
    outb(0x1F6, ((secno >> 24) & 0xF) | 0xE0);
    7ca4:	c1 e9 18             	shr    $0x18,%ecx
    7ca7:	b2 f6                	mov    $0xf6,%dl
    7ca9:	83 e1 0f             	and    $0xf,%ecx
    7cac:	88 c8                	mov    %cl,%al
    7cae:	83 c8 e0             	or     $0xffffffe0,%eax
    7cb1:	ee                   	out    %al,(%dx)
    7cb2:	b0 20                	mov    $0x20,%al
    7cb4:	b2 f7                	mov    $0xf7,%dl
    7cb6:	ee                   	out    %al,(%dx)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
    7cb7:	ec                   	in     (%dx),%al
#define ELFHDR          ((struct elfhdr *)0x10000)      // scratch space

/* waitdisk - wait for disk ready */
static void
waitdisk(void) {
    while ((inb(0x1F7) & 0xC0) != 0x40)
    7cb8:	83 e0 c0             	and    $0xffffffc0,%eax
    7cbb:	3c 40                	cmp    $0x40,%al
    7cbd:	75 f8                	jne    7cb7 <readsect+0x45>
    return data;
}

static inline void
insl(uint32_t port, void *addr, int cnt) {
    asm volatile (
    7cbf:	b9 80 00 00 00       	mov    $0x80,%ecx
    7cc4:	ba f0 01 00 00       	mov    $0x1f0,%edx
    7cc9:	fc                   	cld    
    7cca:	f2 6d                	repnz insl (%dx),%es:(%edi)
    // wait for disk to be ready
    waitdisk();

    // read a sector
    insl(0x1F0, dst, SECTSIZE / 4);
}
    7ccc:	5f                   	pop    %edi
    7ccd:	5d                   	pop    %ebp
    7cce:	c3                   	ret    

00007ccf <bootmain>:
    }
}

/* bootmain - the entry of bootloader */
void
bootmain(void) {
    7ccf:	55                   	push   %ebp
    7cd0:	89 e5                	mov    %esp,%ebp
    7cd2:	57                   	push   %edi
    7cd3:	56                   	push   %esi
    7cd4:	53                   	push   %ebx

    // round down to sector boundary
    va -= offset % SECTSIZE;

    // translate from bytes to sectors; kernel starts at sector 1
    uint32_t secno = (offset / SECTSIZE) + 1;
    7cd5:	bb 01 00 00 00       	mov    $0x1,%ebx
    }
}

/* bootmain - the entry of bootloader */
void
bootmain(void) {
    7cda:	83 ec 1c             	sub    $0x1c,%esp
    7cdd:	8d 43 7f             	lea    0x7f(%ebx),%eax

    // If this is too slow, we could read lots of sectors at a time.
    // We'd write more to memory than asked, but it doesn't matter --
    // we load in increasing order.
    for (; va < end_va; va += SECTSIZE, secno ++) {
        readsect((void *)va, secno);
    7ce0:	89 da                	mov    %ebx,%edx
    uint32_t secno = (offset / SECTSIZE) + 1;

    // If this is too slow, we could read lots of sectors at a time.
    // We'd write more to memory than asked, but it doesn't matter --
    // we load in increasing order.
    for (; va < end_va; va += SECTSIZE, secno ++) {
    7ce2:	43                   	inc    %ebx
    7ce3:	c1 e0 09             	shl    $0x9,%eax
        readsect((void *)va, secno);
    7ce6:	e8 87 ff ff ff       	call   7c72 <readsect>
    uint32_t secno = (offset / SECTSIZE) + 1;

    // If this is too slow, we could read lots of sectors at a time.
    // We'd write more to memory than asked, but it doesn't matter --
    // we load in increasing order.
    for (; va < end_va; va += SECTSIZE, secno ++) {
    7ceb:	83 fb 09             	cmp    $0x9,%ebx
    7cee:	75 ed                	jne    7cdd <bootmain+0xe>
bootmain(void) {
    // read the 1st page off disk
    readseg((uintptr_t)ELFHDR, SECTSIZE * 8, 0);

    // is this a valid ELF?
    if (ELFHDR->e_magic != ELF_MAGIC) {
    7cf0:	81 3d 00 00 01 00 7f 	cmpl   $0x464c457f,0x10000
    7cf7:	45 4c 46 
    7cfa:	75 6a                	jne    7d66 <bootmain+0x97>
    }

    struct proghdr *ph, *eph;

    // load each program segment (ignores ph flags)
    ph = (struct proghdr *)((uintptr_t)ELFHDR + ELFHDR->e_phoff);
    7cfc:	a1 1c 00 01 00       	mov    0x1001c,%eax
    7d01:	8d 98 00 00 01 00    	lea    0x10000(%eax),%ebx
    eph = ph + ELFHDR->e_phnum;
    7d07:	0f b7 05 2c 00 01 00 	movzwl 0x1002c,%eax
    7d0e:	c1 e0 05             	shl    $0x5,%eax
    7d11:	01 d8                	add    %ebx,%eax
    7d13:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for (; ph < eph; ph ++) {
    7d16:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
    7d19:	73 3f                	jae    7d5a <bootmain+0x8b>
        readseg(ph->p_va & 0xFFFFFF, ph->p_memsz, ph->p_offset);
    7d1b:	8b 73 08             	mov    0x8(%ebx),%esi
 * readseg - read @count bytes at @offset from kernel into virtual address @va,
 * might copy more than asked.
 * */
static void
readseg(uintptr_t va, uint32_t count, uint32_t offset) {
    uintptr_t end_va = va + count;
    7d1e:	8b 43 14             	mov    0x14(%ebx),%eax

    // load each program segment (ignores ph flags)
    ph = (struct proghdr *)((uintptr_t)ELFHDR + ELFHDR->e_phoff);
    eph = ph + ELFHDR->e_phnum;
    for (; ph < eph; ph ++) {
        readseg(ph->p_va & 0xFFFFFF, ph->p_memsz, ph->p_offset);
    7d21:	8b 4b 04             	mov    0x4(%ebx),%ecx
    7d24:	81 e6 ff ff ff 00    	and    $0xffffff,%esi
 * readseg - read @count bytes at @offset from kernel into virtual address @va,
 * might copy more than asked.
 * */
static void
readseg(uintptr_t va, uint32_t count, uint32_t offset) {
    uintptr_t end_va = va + count;
    7d2a:	01 f0                	add    %esi,%eax
    7d2c:	89 45 e4             	mov    %eax,-0x1c(%ebp)

    // round down to sector boundary
    va -= offset % SECTSIZE;
    7d2f:	89 c8                	mov    %ecx,%eax

    // translate from bytes to sectors; kernel starts at sector 1
    uint32_t secno = (offset / SECTSIZE) + 1;
    7d31:	c1 e9 09             	shr    $0x9,%ecx
static void
readseg(uintptr_t va, uint32_t count, uint32_t offset) {
    uintptr_t end_va = va + count;

    // round down to sector boundary
    va -= offset % SECTSIZE;
    7d34:	25 ff 01 00 00       	and    $0x1ff,%eax

    // translate from bytes to sectors; kernel starts at sector 1
    uint32_t secno = (offset / SECTSIZE) + 1;
    7d39:	8d 79 01             	lea    0x1(%ecx),%edi
static void
readseg(uintptr_t va, uint32_t count, uint32_t offset) {
    uintptr_t end_va = va + count;

    // round down to sector boundary
    va -= offset % SECTSIZE;
    7d3c:	29 c6                	sub    %eax,%esi
    uint32_t secno = (offset / SECTSIZE) + 1;

    // If this is too slow, we could read lots of sectors at a time.
    // We'd write more to memory than asked, but it doesn't matter --
    // we load in increasing order.
    for (; va < end_va; va += SECTSIZE, secno ++) {
    7d3e:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
    7d41:	73 12                	jae    7d55 <bootmain+0x86>
        readsect((void *)va, secno);
    7d43:	89 fa                	mov    %edi,%edx
    7d45:	89 f0                	mov    %esi,%eax
    uint32_t secno = (offset / SECTSIZE) + 1;

    // If this is too slow, we could read lots of sectors at a time.
    // We'd write more to memory than asked, but it doesn't matter --
    // we load in increasing order.
    for (; va < end_va; va += SECTSIZE, secno ++) {
    7d47:	47                   	inc    %edi
        readsect((void *)va, secno);
    7d48:	e8 25 ff ff ff       	call   7c72 <readsect>
    uint32_t secno = (offset / SECTSIZE) + 1;

    // If this is too slow, we could read lots of sectors at a time.
    // We'd write more to memory than asked, but it doesn't matter --
    // we load in increasing order.
    for (; va < end_va; va += SECTSIZE, secno ++) {
    7d4d:	81 c6 00 02 00 00    	add    $0x200,%esi
    7d53:	eb e9                	jmp    7d3e <bootmain+0x6f>
    struct proghdr *ph, *eph;

    // load each program segment (ignores ph flags)
    ph = (struct proghdr *)((uintptr_t)ELFHDR + ELFHDR->e_phoff);
    eph = ph + ELFHDR->e_phnum;
    for (; ph < eph; ph ++) {
    7d55:	83 c3 20             	add    $0x20,%ebx
    7d58:	eb bc                	jmp    7d16 <bootmain+0x47>
        readseg(ph->p_va & 0xFFFFFF, ph->p_memsz, ph->p_offset);
    }

    // call the entry point from the ELF header
    // note: does not return
    ((void (*)(void))(ELFHDR->e_entry & 0xFFFFFF))();
    7d5a:	a1 18 00 01 00       	mov    0x10018,%eax
    7d5f:	25 ff ff ff 00       	and    $0xffffff,%eax
    7d64:	ff d0                	call   *%eax
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
}

static inline void
outw(uint16_t port, uint16_t data) {
    asm volatile ("outw %0, %1" :: "a" (data), "d" (port));
    7d66:	ba 00 8a ff ff       	mov    $0xffff8a00,%edx
    7d6b:	89 d0                	mov    %edx,%eax
    7d6d:	66 ef                	out    %ax,(%dx)
    7d6f:	b8 00 8e ff ff       	mov    $0xffff8e00,%eax
    7d74:	66 ef                	out    %ax,(%dx)
bad:
    outw(0x8A00, 0x8A00);
    outw(0x8A00, 0x8E00);

    /* do nothing */
    while (1);
    7d76:	eb fe                	jmp    7d76 <bootmain+0xa7>
