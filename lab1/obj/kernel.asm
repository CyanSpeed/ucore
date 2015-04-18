
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 00 fe 10 00       	mov    $0x10fe00,%edx
  10000b:	b8 56 ea 10 00       	mov    $0x10ea56,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 56 ea 10 00       	push   $0x10ea56
  10001f:	e8 b2 2b 00 00       	call   102bd6 <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 05 15 00 00       	call   101531 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 80 33 10 00 	movl   $0x103380,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 9c 33 10 00       	push   $0x10339c
  10003e:	e8 f1 01 00 00       	call   100234 <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 6f 08 00 00       	call   1008ba <print_kerninfo>

    grade_backtrace();
  10004b:	e8 71 00 00 00       	call   1000c1 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 46 28 00 00       	call   10289b <pmm_init>

    pic_init();                 // init interrupt controller
  100055:	e8 16 16 00 00       	call   101670 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005a:	e8 73 17 00 00       	call   1017d2 <idt_init>

    clock_init();               // init clock interrupt
  10005f:	e8 c3 0c 00 00       	call   100d27 <clock_init>
    intr_enable();              // enable irq interrupt
  100064:	e8 43 17 00 00       	call   1017ac <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  100069:	eb fe                	jmp    100069 <kern_init+0x69>

0010006b <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10006b:	55                   	push   %ebp
  10006c:	89 e5                	mov    %esp,%ebp
  10006e:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100071:	83 ec 04             	sub    $0x4,%esp
  100074:	6a 00                	push   $0x0
  100076:	6a 00                	push   $0x0
  100078:	6a 00                	push   $0x0
  10007a:	e8 96 0c 00 00       	call   100d15 <mon_backtrace>
  10007f:	83 c4 10             	add    $0x10,%esp
}
  100082:	c9                   	leave  
  100083:	c3                   	ret    

00100084 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100084:	55                   	push   %ebp
  100085:	89 e5                	mov    %esp,%ebp
  100087:	53                   	push   %ebx
  100088:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10008b:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10008e:	8b 55 0c             	mov    0xc(%ebp),%edx
  100091:	8d 5d 08             	lea    0x8(%ebp),%ebx
  100094:	8b 45 08             	mov    0x8(%ebp),%eax
  100097:	51                   	push   %ecx
  100098:	52                   	push   %edx
  100099:	53                   	push   %ebx
  10009a:	50                   	push   %eax
  10009b:	e8 cb ff ff ff       	call   10006b <grade_backtrace2>
  1000a0:	83 c4 10             	add    $0x10,%esp
}
  1000a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000a6:	c9                   	leave  
  1000a7:	c3                   	ret    

001000a8 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000a8:	55                   	push   %ebp
  1000a9:	89 e5                	mov    %esp,%ebp
  1000ab:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000ae:	83 ec 08             	sub    $0x8,%esp
  1000b1:	ff 75 10             	pushl  0x10(%ebp)
  1000b4:	ff 75 08             	pushl  0x8(%ebp)
  1000b7:	e8 c8 ff ff ff       	call   100084 <grade_backtrace1>
  1000bc:	83 c4 10             	add    $0x10,%esp
}
  1000bf:	c9                   	leave  
  1000c0:	c3                   	ret    

001000c1 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000c7:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000cc:	83 ec 04             	sub    $0x4,%esp
  1000cf:	68 00 00 ff ff       	push   $0xffff0000
  1000d4:	50                   	push   %eax
  1000d5:	6a 00                	push   $0x0
  1000d7:	e8 cc ff ff ff       	call   1000a8 <grade_backtrace0>
  1000dc:	83 c4 10             	add    $0x10,%esp
}
  1000df:	c9                   	leave  
  1000e0:	c3                   	ret    

001000e1 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000e1:	55                   	push   %ebp
  1000e2:	89 e5                	mov    %esp,%ebp
  1000e4:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000e7:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000ea:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000ed:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f0:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000f3:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1000f7:	0f b7 c0             	movzwl %ax,%eax
  1000fa:	83 e0 03             	and    $0x3,%eax
  1000fd:	89 c2                	mov    %eax,%edx
  1000ff:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100104:	83 ec 04             	sub    $0x4,%esp
  100107:	52                   	push   %edx
  100108:	50                   	push   %eax
  100109:	68 a1 33 10 00       	push   $0x1033a1
  10010e:	e8 21 01 00 00       	call   100234 <cprintf>
  100113:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  100116:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011a:	0f b7 d0             	movzwl %ax,%edx
  10011d:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100122:	83 ec 04             	sub    $0x4,%esp
  100125:	52                   	push   %edx
  100126:	50                   	push   %eax
  100127:	68 af 33 10 00       	push   $0x1033af
  10012c:	e8 03 01 00 00       	call   100234 <cprintf>
  100131:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  100134:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100138:	0f b7 d0             	movzwl %ax,%edx
  10013b:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100140:	83 ec 04             	sub    $0x4,%esp
  100143:	52                   	push   %edx
  100144:	50                   	push   %eax
  100145:	68 bd 33 10 00       	push   $0x1033bd
  10014a:	e8 e5 00 00 00       	call   100234 <cprintf>
  10014f:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  100152:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100156:	0f b7 d0             	movzwl %ax,%edx
  100159:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  10015e:	83 ec 04             	sub    $0x4,%esp
  100161:	52                   	push   %edx
  100162:	50                   	push   %eax
  100163:	68 cb 33 10 00       	push   $0x1033cb
  100168:	e8 c7 00 00 00       	call   100234 <cprintf>
  10016d:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100170:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100174:	0f b7 d0             	movzwl %ax,%edx
  100177:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  10017c:	83 ec 04             	sub    $0x4,%esp
  10017f:	52                   	push   %edx
  100180:	50                   	push   %eax
  100181:	68 d9 33 10 00       	push   $0x1033d9
  100186:	e8 a9 00 00 00       	call   100234 <cprintf>
  10018b:	83 c4 10             	add    $0x10,%esp
    round ++;
  10018e:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100193:	83 c0 01             	add    $0x1,%eax
  100196:	a3 80 ea 10 00       	mov    %eax,0x10ea80
}
  10019b:	c9                   	leave  
  10019c:	c3                   	ret    

0010019d <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  10019d:	55                   	push   %ebp
  10019e:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001a0:	5d                   	pop    %ebp
  1001a1:	c3                   	ret    

001001a2 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001a2:	55                   	push   %ebp
  1001a3:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001a5:	5d                   	pop    %ebp
  1001a6:	c3                   	ret    

001001a7 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001a7:	55                   	push   %ebp
  1001a8:	89 e5                	mov    %esp,%ebp
  1001aa:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001ad:	e8 2f ff ff ff       	call   1000e1 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001b2:	83 ec 0c             	sub    $0xc,%esp
  1001b5:	68 e8 33 10 00       	push   $0x1033e8
  1001ba:	e8 75 00 00 00       	call   100234 <cprintf>
  1001bf:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001c2:	e8 d6 ff ff ff       	call   10019d <lab1_switch_to_user>
    lab1_print_cur_status();
  1001c7:	e8 15 ff ff ff       	call   1000e1 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001cc:	83 ec 0c             	sub    $0xc,%esp
  1001cf:	68 08 34 10 00       	push   $0x103408
  1001d4:	e8 5b 00 00 00       	call   100234 <cprintf>
  1001d9:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  1001dc:	e8 c1 ff ff ff       	call   1001a2 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001e1:	e8 fb fe ff ff       	call   1000e1 <lab1_print_cur_status>
}
  1001e6:	c9                   	leave  
  1001e7:	c3                   	ret    

001001e8 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1001e8:	55                   	push   %ebp
  1001e9:	89 e5                	mov    %esp,%ebp
  1001eb:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  1001ee:	83 ec 0c             	sub    $0xc,%esp
  1001f1:	ff 75 08             	pushl  0x8(%ebp)
  1001f4:	e8 68 13 00 00       	call   101561 <cons_putc>
  1001f9:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  1001fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001ff:	8b 00                	mov    (%eax),%eax
  100201:	8d 50 01             	lea    0x1(%eax),%edx
  100204:	8b 45 0c             	mov    0xc(%ebp),%eax
  100207:	89 10                	mov    %edx,(%eax)
}
  100209:	c9                   	leave  
  10020a:	c3                   	ret    

0010020b <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10020b:	55                   	push   %ebp
  10020c:	89 e5                	mov    %esp,%ebp
  10020e:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100211:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100218:	ff 75 0c             	pushl  0xc(%ebp)
  10021b:	ff 75 08             	pushl  0x8(%ebp)
  10021e:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100221:	50                   	push   %eax
  100222:	68 e8 01 10 00       	push   $0x1001e8
  100227:	e8 de 2c 00 00       	call   102f0a <vprintfmt>
  10022c:	83 c4 10             	add    $0x10,%esp
    return cnt;
  10022f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100232:	c9                   	leave  
  100233:	c3                   	ret    

00100234 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100234:	55                   	push   %ebp
  100235:	89 e5                	mov    %esp,%ebp
  100237:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10023a:	8d 45 0c             	lea    0xc(%ebp),%eax
  10023d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100240:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100243:	83 ec 08             	sub    $0x8,%esp
  100246:	50                   	push   %eax
  100247:	ff 75 08             	pushl  0x8(%ebp)
  10024a:	e8 bc ff ff ff       	call   10020b <vcprintf>
  10024f:	83 c4 10             	add    $0x10,%esp
  100252:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100255:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100258:	c9                   	leave  
  100259:	c3                   	ret    

0010025a <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  10025a:	55                   	push   %ebp
  10025b:	89 e5                	mov    %esp,%ebp
  10025d:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  100260:	83 ec 0c             	sub    $0xc,%esp
  100263:	ff 75 08             	pushl  0x8(%ebp)
  100266:	e8 f6 12 00 00       	call   101561 <cons_putc>
  10026b:	83 c4 10             	add    $0x10,%esp
}
  10026e:	c9                   	leave  
  10026f:	c3                   	ret    

00100270 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100270:	55                   	push   %ebp
  100271:	89 e5                	mov    %esp,%ebp
  100273:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100276:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10027d:	eb 14                	jmp    100293 <cputs+0x23>
        cputch(c, &cnt);
  10027f:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100283:	83 ec 08             	sub    $0x8,%esp
  100286:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100289:	52                   	push   %edx
  10028a:	50                   	push   %eax
  10028b:	e8 58 ff ff ff       	call   1001e8 <cputch>
  100290:	83 c4 10             	add    $0x10,%esp
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  100293:	8b 45 08             	mov    0x8(%ebp),%eax
  100296:	8d 50 01             	lea    0x1(%eax),%edx
  100299:	89 55 08             	mov    %edx,0x8(%ebp)
  10029c:	0f b6 00             	movzbl (%eax),%eax
  10029f:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002a2:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002a6:	75 d7                	jne    10027f <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1002a8:	83 ec 08             	sub    $0x8,%esp
  1002ab:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002ae:	50                   	push   %eax
  1002af:	6a 0a                	push   $0xa
  1002b1:	e8 32 ff ff ff       	call   1001e8 <cputch>
  1002b6:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002bc:	c9                   	leave  
  1002bd:	c3                   	ret    

001002be <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002be:	55                   	push   %ebp
  1002bf:	89 e5                	mov    %esp,%ebp
  1002c1:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002c4:	e8 c7 12 00 00       	call   101590 <cons_getc>
  1002c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002d0:	74 f2                	je     1002c4 <getchar+0x6>
        /* do nothing */;
    return c;
  1002d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002d5:	c9                   	leave  
  1002d6:	c3                   	ret    

001002d7 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002d7:	55                   	push   %ebp
  1002d8:	89 e5                	mov    %esp,%ebp
  1002da:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  1002dd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1002e1:	74 13                	je     1002f6 <readline+0x1f>
        cprintf("%s", prompt);
  1002e3:	83 ec 08             	sub    $0x8,%esp
  1002e6:	ff 75 08             	pushl  0x8(%ebp)
  1002e9:	68 27 34 10 00       	push   $0x103427
  1002ee:	e8 41 ff ff ff       	call   100234 <cprintf>
  1002f3:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  1002f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  1002fd:	e8 bc ff ff ff       	call   1002be <getchar>
  100302:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100305:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100309:	79 0a                	jns    100315 <readline+0x3e>
            return NULL;
  10030b:	b8 00 00 00 00       	mov    $0x0,%eax
  100310:	e9 82 00 00 00       	jmp    100397 <readline+0xc0>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100315:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100319:	7e 2b                	jle    100346 <readline+0x6f>
  10031b:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100322:	7f 22                	jg     100346 <readline+0x6f>
            cputchar(c);
  100324:	83 ec 0c             	sub    $0xc,%esp
  100327:	ff 75 f0             	pushl  -0x10(%ebp)
  10032a:	e8 2b ff ff ff       	call   10025a <cputchar>
  10032f:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  100332:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100335:	8d 50 01             	lea    0x1(%eax),%edx
  100338:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10033b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10033e:	88 90 c0 ea 10 00    	mov    %dl,0x10eac0(%eax)
  100344:	eb 4c                	jmp    100392 <readline+0xbb>
        }
        else if (c == '\b' && i > 0) {
  100346:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10034a:	75 1a                	jne    100366 <readline+0x8f>
  10034c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100350:	7e 14                	jle    100366 <readline+0x8f>
            cputchar(c);
  100352:	83 ec 0c             	sub    $0xc,%esp
  100355:	ff 75 f0             	pushl  -0x10(%ebp)
  100358:	e8 fd fe ff ff       	call   10025a <cputchar>
  10035d:	83 c4 10             	add    $0x10,%esp
            i --;
  100360:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100364:	eb 2c                	jmp    100392 <readline+0xbb>
        }
        else if (c == '\n' || c == '\r') {
  100366:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  10036a:	74 06                	je     100372 <readline+0x9b>
  10036c:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100370:	75 20                	jne    100392 <readline+0xbb>
            cputchar(c);
  100372:	83 ec 0c             	sub    $0xc,%esp
  100375:	ff 75 f0             	pushl  -0x10(%ebp)
  100378:	e8 dd fe ff ff       	call   10025a <cputchar>
  10037d:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  100380:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100383:	05 c0 ea 10 00       	add    $0x10eac0,%eax
  100388:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  10038b:	b8 c0 ea 10 00       	mov    $0x10eac0,%eax
  100390:	eb 05                	jmp    100397 <readline+0xc0>
        }
    }
  100392:	e9 66 ff ff ff       	jmp    1002fd <readline+0x26>
}
  100397:	c9                   	leave  
  100398:	c3                   	ret    

00100399 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100399:	55                   	push   %ebp
  10039a:	89 e5                	mov    %esp,%ebp
  10039c:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  10039f:	a1 c0 ee 10 00       	mov    0x10eec0,%eax
  1003a4:	85 c0                	test   %eax,%eax
  1003a6:	74 02                	je     1003aa <__panic+0x11>
        goto panic_dead;
  1003a8:	eb 48                	jmp    1003f2 <__panic+0x59>
    }
    is_panic = 1;
  1003aa:	c7 05 c0 ee 10 00 01 	movl   $0x1,0x10eec0
  1003b1:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003b4:	8d 45 14             	lea    0x14(%ebp),%eax
  1003b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003ba:	83 ec 04             	sub    $0x4,%esp
  1003bd:	ff 75 0c             	pushl  0xc(%ebp)
  1003c0:	ff 75 08             	pushl  0x8(%ebp)
  1003c3:	68 2a 34 10 00       	push   $0x10342a
  1003c8:	e8 67 fe ff ff       	call   100234 <cprintf>
  1003cd:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1003d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003d3:	83 ec 08             	sub    $0x8,%esp
  1003d6:	50                   	push   %eax
  1003d7:	ff 75 10             	pushl  0x10(%ebp)
  1003da:	e8 2c fe ff ff       	call   10020b <vcprintf>
  1003df:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1003e2:	83 ec 0c             	sub    $0xc,%esp
  1003e5:	68 46 34 10 00       	push   $0x103446
  1003ea:	e8 45 fe ff ff       	call   100234 <cprintf>
  1003ef:	83 c4 10             	add    $0x10,%esp
    va_end(ap);

panic_dead:
    intr_disable();
  1003f2:	e8 bb 13 00 00       	call   1017b2 <intr_disable>
    while (1) {
        kmonitor(NULL);
  1003f7:	83 ec 0c             	sub    $0xc,%esp
  1003fa:	6a 00                	push   $0x0
  1003fc:	e8 39 08 00 00       	call   100c3a <kmonitor>
  100401:	83 c4 10             	add    $0x10,%esp
    }
  100404:	eb f1                	jmp    1003f7 <__panic+0x5e>

00100406 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100406:	55                   	push   %ebp
  100407:	89 e5                	mov    %esp,%ebp
  100409:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  10040c:	8d 45 14             	lea    0x14(%ebp),%eax
  10040f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100412:	83 ec 04             	sub    $0x4,%esp
  100415:	ff 75 0c             	pushl  0xc(%ebp)
  100418:	ff 75 08             	pushl  0x8(%ebp)
  10041b:	68 48 34 10 00       	push   $0x103448
  100420:	e8 0f fe ff ff       	call   100234 <cprintf>
  100425:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100428:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10042b:	83 ec 08             	sub    $0x8,%esp
  10042e:	50                   	push   %eax
  10042f:	ff 75 10             	pushl  0x10(%ebp)
  100432:	e8 d4 fd ff ff       	call   10020b <vcprintf>
  100437:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  10043a:	83 ec 0c             	sub    $0xc,%esp
  10043d:	68 46 34 10 00       	push   $0x103446
  100442:	e8 ed fd ff ff       	call   100234 <cprintf>
  100447:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  10044a:	c9                   	leave  
  10044b:	c3                   	ret    

0010044c <is_kernel_panic>:

bool
is_kernel_panic(void) {
  10044c:	55                   	push   %ebp
  10044d:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10044f:	a1 c0 ee 10 00       	mov    0x10eec0,%eax
}
  100454:	5d                   	pop    %ebp
  100455:	c3                   	ret    

00100456 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100456:	55                   	push   %ebp
  100457:	89 e5                	mov    %esp,%ebp
  100459:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  10045c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10045f:	8b 00                	mov    (%eax),%eax
  100461:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100464:	8b 45 10             	mov    0x10(%ebp),%eax
  100467:	8b 00                	mov    (%eax),%eax
  100469:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10046c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  100473:	e9 d2 00 00 00       	jmp    10054a <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  100478:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10047b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10047e:	01 d0                	add    %edx,%eax
  100480:	89 c2                	mov    %eax,%edx
  100482:	c1 ea 1f             	shr    $0x1f,%edx
  100485:	01 d0                	add    %edx,%eax
  100487:	d1 f8                	sar    %eax
  100489:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10048c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10048f:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100492:	eb 04                	jmp    100498 <stab_binsearch+0x42>
            m --;
  100494:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100498:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10049b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10049e:	7c 1f                	jl     1004bf <stab_binsearch+0x69>
  1004a0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004a3:	89 d0                	mov    %edx,%eax
  1004a5:	01 c0                	add    %eax,%eax
  1004a7:	01 d0                	add    %edx,%eax
  1004a9:	c1 e0 02             	shl    $0x2,%eax
  1004ac:	89 c2                	mov    %eax,%edx
  1004ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1004b1:	01 d0                	add    %edx,%eax
  1004b3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004b7:	0f b6 c0             	movzbl %al,%eax
  1004ba:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004bd:	75 d5                	jne    100494 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  1004bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004c5:	7d 0b                	jge    1004d2 <stab_binsearch+0x7c>
            l = true_m + 1;
  1004c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004ca:	83 c0 01             	add    $0x1,%eax
  1004cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004d0:	eb 78                	jmp    10054a <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  1004d2:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  1004d9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004dc:	89 d0                	mov    %edx,%eax
  1004de:	01 c0                	add    %eax,%eax
  1004e0:	01 d0                	add    %edx,%eax
  1004e2:	c1 e0 02             	shl    $0x2,%eax
  1004e5:	89 c2                	mov    %eax,%edx
  1004e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1004ea:	01 d0                	add    %edx,%eax
  1004ec:	8b 40 08             	mov    0x8(%eax),%eax
  1004ef:	3b 45 18             	cmp    0x18(%ebp),%eax
  1004f2:	73 13                	jae    100507 <stab_binsearch+0xb1>
            *region_left = m;
  1004f4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004f7:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004fa:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  1004fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004ff:	83 c0 01             	add    $0x1,%eax
  100502:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100505:	eb 43                	jmp    10054a <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100507:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10050a:	89 d0                	mov    %edx,%eax
  10050c:	01 c0                	add    %eax,%eax
  10050e:	01 d0                	add    %edx,%eax
  100510:	c1 e0 02             	shl    $0x2,%eax
  100513:	89 c2                	mov    %eax,%edx
  100515:	8b 45 08             	mov    0x8(%ebp),%eax
  100518:	01 d0                	add    %edx,%eax
  10051a:	8b 40 08             	mov    0x8(%eax),%eax
  10051d:	3b 45 18             	cmp    0x18(%ebp),%eax
  100520:	76 16                	jbe    100538 <stab_binsearch+0xe2>
            *region_right = m - 1;
  100522:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100525:	8d 50 ff             	lea    -0x1(%eax),%edx
  100528:	8b 45 10             	mov    0x10(%ebp),%eax
  10052b:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10052d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100530:	83 e8 01             	sub    $0x1,%eax
  100533:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100536:	eb 12                	jmp    10054a <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100538:	8b 45 0c             	mov    0xc(%ebp),%eax
  10053b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10053e:	89 10                	mov    %edx,(%eax)
            l = m;
  100540:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100543:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100546:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  10054a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10054d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100550:	0f 8e 22 ff ff ff    	jle    100478 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  100556:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10055a:	75 0f                	jne    10056b <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  10055c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10055f:	8b 00                	mov    (%eax),%eax
  100561:	8d 50 ff             	lea    -0x1(%eax),%edx
  100564:	8b 45 10             	mov    0x10(%ebp),%eax
  100567:	89 10                	mov    %edx,(%eax)
  100569:	eb 3f                	jmp    1005aa <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  10056b:	8b 45 10             	mov    0x10(%ebp),%eax
  10056e:	8b 00                	mov    (%eax),%eax
  100570:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  100573:	eb 04                	jmp    100579 <stab_binsearch+0x123>
  100575:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  100579:	8b 45 0c             	mov    0xc(%ebp),%eax
  10057c:	8b 00                	mov    (%eax),%eax
  10057e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100581:	7d 1f                	jge    1005a2 <stab_binsearch+0x14c>
  100583:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100586:	89 d0                	mov    %edx,%eax
  100588:	01 c0                	add    %eax,%eax
  10058a:	01 d0                	add    %edx,%eax
  10058c:	c1 e0 02             	shl    $0x2,%eax
  10058f:	89 c2                	mov    %eax,%edx
  100591:	8b 45 08             	mov    0x8(%ebp),%eax
  100594:	01 d0                	add    %edx,%eax
  100596:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10059a:	0f b6 c0             	movzbl %al,%eax
  10059d:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005a0:	75 d3                	jne    100575 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1005a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005a5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005a8:	89 10                	mov    %edx,(%eax)
    }
}
  1005aa:	c9                   	leave  
  1005ab:	c3                   	ret    

001005ac <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005ac:	55                   	push   %ebp
  1005ad:	89 e5                	mov    %esp,%ebp
  1005af:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005b5:	c7 00 68 34 10 00    	movl   $0x103468,(%eax)
    info->eip_line = 0;
  1005bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005be:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c8:	c7 40 08 68 34 10 00 	movl   $0x103468,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d2:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005dc:	8b 55 08             	mov    0x8(%ebp),%edx
  1005df:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  1005e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e5:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  1005ec:	c7 45 f4 cc 3c 10 00 	movl   $0x103ccc,-0xc(%ebp)
    stab_end = __STAB_END__;
  1005f3:	c7 45 f0 3c b4 10 00 	movl   $0x10b43c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  1005fa:	c7 45 ec 3d b4 10 00 	movl   $0x10b43d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100601:	c7 45 e8 41 d4 10 00 	movl   $0x10d441,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100608:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10060b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10060e:	76 0d                	jbe    10061d <debuginfo_eip+0x71>
  100610:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100613:	83 e8 01             	sub    $0x1,%eax
  100616:	0f b6 00             	movzbl (%eax),%eax
  100619:	84 c0                	test   %al,%al
  10061b:	74 0a                	je     100627 <debuginfo_eip+0x7b>
        return -1;
  10061d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100622:	e9 91 02 00 00       	jmp    1008b8 <debuginfo_eip+0x30c>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100627:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10062e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100631:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100634:	29 c2                	sub    %eax,%edx
  100636:	89 d0                	mov    %edx,%eax
  100638:	c1 f8 02             	sar    $0x2,%eax
  10063b:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100641:	83 e8 01             	sub    $0x1,%eax
  100644:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100647:	ff 75 08             	pushl  0x8(%ebp)
  10064a:	6a 64                	push   $0x64
  10064c:	8d 45 e0             	lea    -0x20(%ebp),%eax
  10064f:	50                   	push   %eax
  100650:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100653:	50                   	push   %eax
  100654:	ff 75 f4             	pushl  -0xc(%ebp)
  100657:	e8 fa fd ff ff       	call   100456 <stab_binsearch>
  10065c:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  10065f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100662:	85 c0                	test   %eax,%eax
  100664:	75 0a                	jne    100670 <debuginfo_eip+0xc4>
        return -1;
  100666:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10066b:	e9 48 02 00 00       	jmp    1008b8 <debuginfo_eip+0x30c>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  100670:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100673:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100676:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100679:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  10067c:	ff 75 08             	pushl  0x8(%ebp)
  10067f:	6a 24                	push   $0x24
  100681:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100684:	50                   	push   %eax
  100685:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100688:	50                   	push   %eax
  100689:	ff 75 f4             	pushl  -0xc(%ebp)
  10068c:	e8 c5 fd ff ff       	call   100456 <stab_binsearch>
  100691:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  100694:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100697:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10069a:	39 c2                	cmp    %eax,%edx
  10069c:	7f 7c                	jg     10071a <debuginfo_eip+0x16e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10069e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006a1:	89 c2                	mov    %eax,%edx
  1006a3:	89 d0                	mov    %edx,%eax
  1006a5:	01 c0                	add    %eax,%eax
  1006a7:	01 d0                	add    %edx,%eax
  1006a9:	c1 e0 02             	shl    $0x2,%eax
  1006ac:	89 c2                	mov    %eax,%edx
  1006ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006b1:	01 d0                	add    %edx,%eax
  1006b3:	8b 00                	mov    (%eax),%eax
  1006b5:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006b8:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006bb:	29 d1                	sub    %edx,%ecx
  1006bd:	89 ca                	mov    %ecx,%edx
  1006bf:	39 d0                	cmp    %edx,%eax
  1006c1:	73 22                	jae    1006e5 <debuginfo_eip+0x139>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  1006c3:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006c6:	89 c2                	mov    %eax,%edx
  1006c8:	89 d0                	mov    %edx,%eax
  1006ca:	01 c0                	add    %eax,%eax
  1006cc:	01 d0                	add    %edx,%eax
  1006ce:	c1 e0 02             	shl    $0x2,%eax
  1006d1:	89 c2                	mov    %eax,%edx
  1006d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d6:	01 d0                	add    %edx,%eax
  1006d8:	8b 10                	mov    (%eax),%edx
  1006da:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1006dd:	01 c2                	add    %eax,%edx
  1006df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006e2:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  1006e5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006e8:	89 c2                	mov    %eax,%edx
  1006ea:	89 d0                	mov    %edx,%eax
  1006ec:	01 c0                	add    %eax,%eax
  1006ee:	01 d0                	add    %edx,%eax
  1006f0:	c1 e0 02             	shl    $0x2,%eax
  1006f3:	89 c2                	mov    %eax,%edx
  1006f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f8:	01 d0                	add    %edx,%eax
  1006fa:	8b 50 08             	mov    0x8(%eax),%edx
  1006fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100700:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100703:	8b 45 0c             	mov    0xc(%ebp),%eax
  100706:	8b 40 10             	mov    0x10(%eax),%eax
  100709:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10070c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10070f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100712:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100715:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100718:	eb 15                	jmp    10072f <debuginfo_eip+0x183>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10071a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10071d:	8b 55 08             	mov    0x8(%ebp),%edx
  100720:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100723:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100726:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100729:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10072c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10072f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100732:	8b 40 08             	mov    0x8(%eax),%eax
  100735:	83 ec 08             	sub    $0x8,%esp
  100738:	6a 3a                	push   $0x3a
  10073a:	50                   	push   %eax
  10073b:	e8 0a 23 00 00       	call   102a4a <strfind>
  100740:	83 c4 10             	add    $0x10,%esp
  100743:	89 c2                	mov    %eax,%edx
  100745:	8b 45 0c             	mov    0xc(%ebp),%eax
  100748:	8b 40 08             	mov    0x8(%eax),%eax
  10074b:	29 c2                	sub    %eax,%edx
  10074d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100750:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100753:	83 ec 0c             	sub    $0xc,%esp
  100756:	ff 75 08             	pushl  0x8(%ebp)
  100759:	6a 44                	push   $0x44
  10075b:	8d 45 d0             	lea    -0x30(%ebp),%eax
  10075e:	50                   	push   %eax
  10075f:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  100762:	50                   	push   %eax
  100763:	ff 75 f4             	pushl  -0xc(%ebp)
  100766:	e8 eb fc ff ff       	call   100456 <stab_binsearch>
  10076b:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  10076e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100771:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100774:	39 c2                	cmp    %eax,%edx
  100776:	7f 24                	jg     10079c <debuginfo_eip+0x1f0>
        info->eip_line = stabs[rline].n_desc;
  100778:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10077b:	89 c2                	mov    %eax,%edx
  10077d:	89 d0                	mov    %edx,%eax
  10077f:	01 c0                	add    %eax,%eax
  100781:	01 d0                	add    %edx,%eax
  100783:	c1 e0 02             	shl    $0x2,%eax
  100786:	89 c2                	mov    %eax,%edx
  100788:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10078b:	01 d0                	add    %edx,%eax
  10078d:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100791:	0f b7 d0             	movzwl %ax,%edx
  100794:	8b 45 0c             	mov    0xc(%ebp),%eax
  100797:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10079a:	eb 13                	jmp    1007af <debuginfo_eip+0x203>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  10079c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007a1:	e9 12 01 00 00       	jmp    1008b8 <debuginfo_eip+0x30c>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007a6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a9:	83 e8 01             	sub    $0x1,%eax
  1007ac:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007af:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007b5:	39 c2                	cmp    %eax,%edx
  1007b7:	7c 56                	jl     10080f <debuginfo_eip+0x263>
           && stabs[lline].n_type != N_SOL
  1007b9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007bc:	89 c2                	mov    %eax,%edx
  1007be:	89 d0                	mov    %edx,%eax
  1007c0:	01 c0                	add    %eax,%eax
  1007c2:	01 d0                	add    %edx,%eax
  1007c4:	c1 e0 02             	shl    $0x2,%eax
  1007c7:	89 c2                	mov    %eax,%edx
  1007c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007cc:	01 d0                	add    %edx,%eax
  1007ce:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007d2:	3c 84                	cmp    $0x84,%al
  1007d4:	74 39                	je     10080f <debuginfo_eip+0x263>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  1007d6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007d9:	89 c2                	mov    %eax,%edx
  1007db:	89 d0                	mov    %edx,%eax
  1007dd:	01 c0                	add    %eax,%eax
  1007df:	01 d0                	add    %edx,%eax
  1007e1:	c1 e0 02             	shl    $0x2,%eax
  1007e4:	89 c2                	mov    %eax,%edx
  1007e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007e9:	01 d0                	add    %edx,%eax
  1007eb:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007ef:	3c 64                	cmp    $0x64,%al
  1007f1:	75 b3                	jne    1007a6 <debuginfo_eip+0x1fa>
  1007f3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007f6:	89 c2                	mov    %eax,%edx
  1007f8:	89 d0                	mov    %edx,%eax
  1007fa:	01 c0                	add    %eax,%eax
  1007fc:	01 d0                	add    %edx,%eax
  1007fe:	c1 e0 02             	shl    $0x2,%eax
  100801:	89 c2                	mov    %eax,%edx
  100803:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100806:	01 d0                	add    %edx,%eax
  100808:	8b 40 08             	mov    0x8(%eax),%eax
  10080b:	85 c0                	test   %eax,%eax
  10080d:	74 97                	je     1007a6 <debuginfo_eip+0x1fa>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10080f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100812:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100815:	39 c2                	cmp    %eax,%edx
  100817:	7c 46                	jl     10085f <debuginfo_eip+0x2b3>
  100819:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10081c:	89 c2                	mov    %eax,%edx
  10081e:	89 d0                	mov    %edx,%eax
  100820:	01 c0                	add    %eax,%eax
  100822:	01 d0                	add    %edx,%eax
  100824:	c1 e0 02             	shl    $0x2,%eax
  100827:	89 c2                	mov    %eax,%edx
  100829:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10082c:	01 d0                	add    %edx,%eax
  10082e:	8b 00                	mov    (%eax),%eax
  100830:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100833:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100836:	29 d1                	sub    %edx,%ecx
  100838:	89 ca                	mov    %ecx,%edx
  10083a:	39 d0                	cmp    %edx,%eax
  10083c:	73 21                	jae    10085f <debuginfo_eip+0x2b3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10083e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100841:	89 c2                	mov    %eax,%edx
  100843:	89 d0                	mov    %edx,%eax
  100845:	01 c0                	add    %eax,%eax
  100847:	01 d0                	add    %edx,%eax
  100849:	c1 e0 02             	shl    $0x2,%eax
  10084c:	89 c2                	mov    %eax,%edx
  10084e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100851:	01 d0                	add    %edx,%eax
  100853:	8b 10                	mov    (%eax),%edx
  100855:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100858:	01 c2                	add    %eax,%edx
  10085a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10085d:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  10085f:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100862:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100865:	39 c2                	cmp    %eax,%edx
  100867:	7d 4a                	jge    1008b3 <debuginfo_eip+0x307>
        for (lline = lfun + 1;
  100869:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10086c:	83 c0 01             	add    $0x1,%eax
  10086f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100872:	eb 18                	jmp    10088c <debuginfo_eip+0x2e0>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100874:	8b 45 0c             	mov    0xc(%ebp),%eax
  100877:	8b 40 14             	mov    0x14(%eax),%eax
  10087a:	8d 50 01             	lea    0x1(%eax),%edx
  10087d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100880:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  100883:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100886:	83 c0 01             	add    $0x1,%eax
  100889:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  10088c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10088f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  100892:	39 c2                	cmp    %eax,%edx
  100894:	7d 1d                	jge    1008b3 <debuginfo_eip+0x307>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100896:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100899:	89 c2                	mov    %eax,%edx
  10089b:	89 d0                	mov    %edx,%eax
  10089d:	01 c0                	add    %eax,%eax
  10089f:	01 d0                	add    %edx,%eax
  1008a1:	c1 e0 02             	shl    $0x2,%eax
  1008a4:	89 c2                	mov    %eax,%edx
  1008a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008a9:	01 d0                	add    %edx,%eax
  1008ab:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008af:	3c a0                	cmp    $0xa0,%al
  1008b1:	74 c1                	je     100874 <debuginfo_eip+0x2c8>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  1008b3:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1008b8:	c9                   	leave  
  1008b9:	c3                   	ret    

001008ba <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  1008ba:	55                   	push   %ebp
  1008bb:	89 e5                	mov    %esp,%ebp
  1008bd:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  1008c0:	83 ec 0c             	sub    $0xc,%esp
  1008c3:	68 72 34 10 00       	push   $0x103472
  1008c8:	e8 67 f9 ff ff       	call   100234 <cprintf>
  1008cd:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  1008d0:	83 ec 08             	sub    $0x8,%esp
  1008d3:	68 00 00 10 00       	push   $0x100000
  1008d8:	68 8b 34 10 00       	push   $0x10348b
  1008dd:	e8 52 f9 ff ff       	call   100234 <cprintf>
  1008e2:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  1008e5:	83 ec 08             	sub    $0x8,%esp
  1008e8:	68 67 33 10 00       	push   $0x103367
  1008ed:	68 a3 34 10 00       	push   $0x1034a3
  1008f2:	e8 3d f9 ff ff       	call   100234 <cprintf>
  1008f7:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  1008fa:	83 ec 08             	sub    $0x8,%esp
  1008fd:	68 56 ea 10 00       	push   $0x10ea56
  100902:	68 bb 34 10 00       	push   $0x1034bb
  100907:	e8 28 f9 ff ff       	call   100234 <cprintf>
  10090c:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  10090f:	83 ec 08             	sub    $0x8,%esp
  100912:	68 00 fe 10 00       	push   $0x10fe00
  100917:	68 d3 34 10 00       	push   $0x1034d3
  10091c:	e8 13 f9 ff ff       	call   100234 <cprintf>
  100921:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100924:	b8 00 fe 10 00       	mov    $0x10fe00,%eax
  100929:	05 ff 03 00 00       	add    $0x3ff,%eax
  10092e:	ba 00 00 10 00       	mov    $0x100000,%edx
  100933:	29 d0                	sub    %edx,%eax
  100935:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10093b:	85 c0                	test   %eax,%eax
  10093d:	0f 48 c2             	cmovs  %edx,%eax
  100940:	c1 f8 0a             	sar    $0xa,%eax
  100943:	83 ec 08             	sub    $0x8,%esp
  100946:	50                   	push   %eax
  100947:	68 ec 34 10 00       	push   $0x1034ec
  10094c:	e8 e3 f8 ff ff       	call   100234 <cprintf>
  100951:	83 c4 10             	add    $0x10,%esp
}
  100954:	c9                   	leave  
  100955:	c3                   	ret    

00100956 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100956:	55                   	push   %ebp
  100957:	89 e5                	mov    %esp,%ebp
  100959:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  10095f:	83 ec 08             	sub    $0x8,%esp
  100962:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100965:	50                   	push   %eax
  100966:	ff 75 08             	pushl  0x8(%ebp)
  100969:	e8 3e fc ff ff       	call   1005ac <debuginfo_eip>
  10096e:	83 c4 10             	add    $0x10,%esp
  100971:	85 c0                	test   %eax,%eax
  100973:	74 15                	je     10098a <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100975:	83 ec 08             	sub    $0x8,%esp
  100978:	ff 75 08             	pushl  0x8(%ebp)
  10097b:	68 16 35 10 00       	push   $0x103516
  100980:	e8 af f8 ff ff       	call   100234 <cprintf>
  100985:	83 c4 10             	add    $0x10,%esp
  100988:	eb 65                	jmp    1009ef <print_debuginfo+0x99>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  10098a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100991:	eb 1c                	jmp    1009af <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100993:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100996:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100999:	01 d0                	add    %edx,%eax
  10099b:	0f b6 00             	movzbl (%eax),%eax
  10099e:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009a7:	01 ca                	add    %ecx,%edx
  1009a9:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009ab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1009af:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009b2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1009b5:	7f dc                	jg     100993 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  1009b7:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009c0:	01 d0                	add    %edx,%eax
  1009c2:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  1009c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  1009c8:	8b 55 08             	mov    0x8(%ebp),%edx
  1009cb:	89 d1                	mov    %edx,%ecx
  1009cd:	29 c1                	sub    %eax,%ecx
  1009cf:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1009d2:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009d5:	83 ec 0c             	sub    $0xc,%esp
  1009d8:	51                   	push   %ecx
  1009d9:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009df:	51                   	push   %ecx
  1009e0:	52                   	push   %edx
  1009e1:	50                   	push   %eax
  1009e2:	68 32 35 10 00       	push   $0x103532
  1009e7:	e8 48 f8 ff ff       	call   100234 <cprintf>
  1009ec:	83 c4 20             	add    $0x20,%esp
                fnname, eip - info.eip_fn_addr);
    }
}
  1009ef:	c9                   	leave  
  1009f0:	c3                   	ret    

001009f1 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  1009f1:	55                   	push   %ebp
  1009f2:	89 e5                	mov    %esp,%ebp
  1009f4:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  1009f7:	8b 45 04             	mov    0x4(%ebp),%eax
  1009fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  1009fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a00:	c9                   	leave  
  100a01:	c3                   	ret    

00100a02 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a02:	55                   	push   %ebp
  100a03:	89 e5                	mov    %esp,%ebp
  100a05:	83 ec 28             	sub    $0x28,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a08:	89 e8                	mov    %ebp,%eax
  100a0a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a0d:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	
    uint32_t ebp, eip;
    ebp=read_ebp();
  100a10:	89 45 f4             	mov    %eax,-0xc(%ebp)
    eip=read_eip();
  100a13:	e8 d9 ff ff ff       	call   1009f1 <read_eip>
  100a18:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i;
    for(i=0;i<STACKFRAME_DEPTH;i++){
  100a1b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a22:	e9 9d 00 00 00       	jmp    100ac4 <print_stackframe+0xc2>
        cprintf("  edp: 0x%08x ", ebp);
  100a27:	83 ec 08             	sub    $0x8,%esp
  100a2a:	ff 75 f4             	pushl  -0xc(%ebp)
  100a2d:	68 44 35 10 00       	push   $0x103544
  100a32:	e8 fd f7 ff ff       	call   100234 <cprintf>
  100a37:	83 c4 10             	add    $0x10,%esp
        cprintf("  eip: 0x%08x   args", eip);
  100a3a:	83 ec 08             	sub    $0x8,%esp
  100a3d:	ff 75 f0             	pushl  -0x10(%ebp)
  100a40:	68 53 35 10 00       	push   $0x103553
  100a45:	e8 ea f7 ff ff       	call   100234 <cprintf>
  100a4a:	83 c4 10             	add    $0x10,%esp
        uint32_t* arguements=((uint32_t*)ebp+2);
  100a4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a50:	83 c0 08             	add    $0x8,%eax
  100a53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    
        int j;
        for(j=0;j<4;j++){
  100a56:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100a5d:	eb 26                	jmp    100a85 <print_stackframe+0x83>
            cprintf(" 0x%08x ",arguements[j]);
  100a5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a62:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100a6c:	01 d0                	add    %edx,%eax
  100a6e:	8b 00                	mov    (%eax),%eax
  100a70:	83 ec 08             	sub    $0x8,%esp
  100a73:	50                   	push   %eax
  100a74:	68 68 35 10 00       	push   $0x103568
  100a79:	e8 b6 f7 ff ff       	call   100234 <cprintf>
  100a7e:	83 c4 10             	add    $0x10,%esp
        cprintf("  edp: 0x%08x ", ebp);
        cprintf("  eip: 0x%08x   args", eip);
        uint32_t* arguements=((uint32_t*)ebp+2);
    
        int j;
        for(j=0;j<4;j++){
  100a81:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100a85:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100a89:	7e d4                	jle    100a5f <print_stackframe+0x5d>
            cprintf(" 0x%08x ",arguements[j]);
        }

        cprintf("\n");
  100a8b:	83 ec 0c             	sub    $0xc,%esp
  100a8e:	68 71 35 10 00       	push   $0x103571
  100a93:	e8 9c f7 ff ff       	call   100234 <cprintf>
  100a98:	83 c4 10             	add    $0x10,%esp
        print_debuginfo(eip-1);
  100a9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a9e:	83 e8 01             	sub    $0x1,%eax
  100aa1:	83 ec 0c             	sub    $0xc,%esp
  100aa4:	50                   	push   %eax
  100aa5:	e8 ac fe ff ff       	call   100956 <print_debuginfo>
  100aaa:	83 c4 10             	add    $0x10,%esp
        ebp = ((uint32_t *)ebp)[0];
  100aad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ab0:	8b 00                	mov    (%eax),%eax
  100ab2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        eip = ((uint32_t *)ebp)[1];
  100ab5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ab8:	83 c0 04             	add    $0x4,%eax
  100abb:	8b 00                	mov    (%eax),%eax
  100abd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    uint32_t ebp, eip;
    ebp=read_ebp();
    eip=read_eip();

    int i;
    for(i=0;i<STACKFRAME_DEPTH;i++){
  100ac0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100ac4:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100ac8:	0f 8e 59 ff ff ff    	jle    100a27 <print_stackframe+0x25>
        cprintf("\n");
        print_debuginfo(eip-1);
        ebp = ((uint32_t *)ebp)[0];
        eip = ((uint32_t *)ebp)[1];
    }
}
  100ace:	c9                   	leave  
  100acf:	c3                   	ret    

00100ad0 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100ad0:	55                   	push   %ebp
  100ad1:	89 e5                	mov    %esp,%ebp
  100ad3:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100ad6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100add:	eb 0c                	jmp    100aeb <parse+0x1b>
            *buf ++ = '\0';
  100adf:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae2:	8d 50 01             	lea    0x1(%eax),%edx
  100ae5:	89 55 08             	mov    %edx,0x8(%ebp)
  100ae8:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100aeb:	8b 45 08             	mov    0x8(%ebp),%eax
  100aee:	0f b6 00             	movzbl (%eax),%eax
  100af1:	84 c0                	test   %al,%al
  100af3:	74 1e                	je     100b13 <parse+0x43>
  100af5:	8b 45 08             	mov    0x8(%ebp),%eax
  100af8:	0f b6 00             	movzbl (%eax),%eax
  100afb:	0f be c0             	movsbl %al,%eax
  100afe:	83 ec 08             	sub    $0x8,%esp
  100b01:	50                   	push   %eax
  100b02:	68 f4 35 10 00       	push   $0x1035f4
  100b07:	e8 0b 1f 00 00       	call   102a17 <strchr>
  100b0c:	83 c4 10             	add    $0x10,%esp
  100b0f:	85 c0                	test   %eax,%eax
  100b11:	75 cc                	jne    100adf <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100b13:	8b 45 08             	mov    0x8(%ebp),%eax
  100b16:	0f b6 00             	movzbl (%eax),%eax
  100b19:	84 c0                	test   %al,%al
  100b1b:	75 02                	jne    100b1f <parse+0x4f>
            break;
  100b1d:	eb 65                	jmp    100b84 <parse+0xb4>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b1f:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b23:	75 12                	jne    100b37 <parse+0x67>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b25:	83 ec 08             	sub    $0x8,%esp
  100b28:	6a 10                	push   $0x10
  100b2a:	68 f9 35 10 00       	push   $0x1035f9
  100b2f:	e8 00 f7 ff ff       	call   100234 <cprintf>
  100b34:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100b37:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3a:	8d 50 01             	lea    0x1(%eax),%edx
  100b3d:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b40:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b47:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b4a:	01 c2                	add    %eax,%edx
  100b4c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b4f:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b51:	eb 04                	jmp    100b57 <parse+0x87>
            buf ++;
  100b53:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b57:	8b 45 08             	mov    0x8(%ebp),%eax
  100b5a:	0f b6 00             	movzbl (%eax),%eax
  100b5d:	84 c0                	test   %al,%al
  100b5f:	74 1e                	je     100b7f <parse+0xaf>
  100b61:	8b 45 08             	mov    0x8(%ebp),%eax
  100b64:	0f b6 00             	movzbl (%eax),%eax
  100b67:	0f be c0             	movsbl %al,%eax
  100b6a:	83 ec 08             	sub    $0x8,%esp
  100b6d:	50                   	push   %eax
  100b6e:	68 f4 35 10 00       	push   $0x1035f4
  100b73:	e8 9f 1e 00 00       	call   102a17 <strchr>
  100b78:	83 c4 10             	add    $0x10,%esp
  100b7b:	85 c0                	test   %eax,%eax
  100b7d:	74 d4                	je     100b53 <parse+0x83>
            buf ++;
        }
    }
  100b7f:	e9 59 ff ff ff       	jmp    100add <parse+0xd>
    return argc;
  100b84:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b87:	c9                   	leave  
  100b88:	c3                   	ret    

00100b89 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b89:	55                   	push   %ebp
  100b8a:	89 e5                	mov    %esp,%ebp
  100b8c:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b8f:	83 ec 08             	sub    $0x8,%esp
  100b92:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b95:	50                   	push   %eax
  100b96:	ff 75 08             	pushl  0x8(%ebp)
  100b99:	e8 32 ff ff ff       	call   100ad0 <parse>
  100b9e:	83 c4 10             	add    $0x10,%esp
  100ba1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100ba4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100ba8:	75 0a                	jne    100bb4 <runcmd+0x2b>
        return 0;
  100baa:	b8 00 00 00 00       	mov    $0x0,%eax
  100baf:	e9 84 00 00 00       	jmp    100c38 <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bb4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bbb:	eb 5a                	jmp    100c17 <runcmd+0x8e>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100bbd:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100bc0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bc3:	89 d0                	mov    %edx,%eax
  100bc5:	01 c0                	add    %eax,%eax
  100bc7:	01 d0                	add    %edx,%eax
  100bc9:	c1 e0 02             	shl    $0x2,%eax
  100bcc:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bd1:	8b 00                	mov    (%eax),%eax
  100bd3:	83 ec 08             	sub    $0x8,%esp
  100bd6:	51                   	push   %ecx
  100bd7:	50                   	push   %eax
  100bd8:	e8 9a 1d 00 00       	call   102977 <strcmp>
  100bdd:	83 c4 10             	add    $0x10,%esp
  100be0:	85 c0                	test   %eax,%eax
  100be2:	75 2f                	jne    100c13 <runcmd+0x8a>
            return commands[i].func(argc - 1, argv + 1, tf);
  100be4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100be7:	89 d0                	mov    %edx,%eax
  100be9:	01 c0                	add    %eax,%eax
  100beb:	01 d0                	add    %edx,%eax
  100bed:	c1 e0 02             	shl    $0x2,%eax
  100bf0:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bf5:	8b 40 08             	mov    0x8(%eax),%eax
  100bf8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100bfb:	83 ea 01             	sub    $0x1,%edx
  100bfe:	83 ec 04             	sub    $0x4,%esp
  100c01:	ff 75 0c             	pushl  0xc(%ebp)
  100c04:	8d 4d b0             	lea    -0x50(%ebp),%ecx
  100c07:	83 c1 04             	add    $0x4,%ecx
  100c0a:	51                   	push   %ecx
  100c0b:	52                   	push   %edx
  100c0c:	ff d0                	call   *%eax
  100c0e:	83 c4 10             	add    $0x10,%esp
  100c11:	eb 25                	jmp    100c38 <runcmd+0xaf>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c13:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c17:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c1a:	83 f8 02             	cmp    $0x2,%eax
  100c1d:	76 9e                	jbe    100bbd <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c1f:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c22:	83 ec 08             	sub    $0x8,%esp
  100c25:	50                   	push   %eax
  100c26:	68 17 36 10 00       	push   $0x103617
  100c2b:	e8 04 f6 ff ff       	call   100234 <cprintf>
  100c30:	83 c4 10             	add    $0x10,%esp
    return 0;
  100c33:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c38:	c9                   	leave  
  100c39:	c3                   	ret    

00100c3a <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c3a:	55                   	push   %ebp
  100c3b:	89 e5                	mov    %esp,%ebp
  100c3d:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c40:	83 ec 0c             	sub    $0xc,%esp
  100c43:	68 30 36 10 00       	push   $0x103630
  100c48:	e8 e7 f5 ff ff       	call   100234 <cprintf>
  100c4d:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100c50:	83 ec 0c             	sub    $0xc,%esp
  100c53:	68 58 36 10 00       	push   $0x103658
  100c58:	e8 d7 f5 ff ff       	call   100234 <cprintf>
  100c5d:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100c60:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c64:	74 0e                	je     100c74 <kmonitor+0x3a>
        print_trapframe(tf);
  100c66:	83 ec 0c             	sub    $0xc,%esp
  100c69:	ff 75 08             	pushl  0x8(%ebp)
  100c6c:	e8 9f 0c 00 00       	call   101910 <print_trapframe>
  100c71:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c74:	83 ec 0c             	sub    $0xc,%esp
  100c77:	68 7d 36 10 00       	push   $0x10367d
  100c7c:	e8 56 f6 ff ff       	call   1002d7 <readline>
  100c81:	83 c4 10             	add    $0x10,%esp
  100c84:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c87:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c8b:	74 17                	je     100ca4 <kmonitor+0x6a>
            if (runcmd(buf, tf) < 0) {
  100c8d:	83 ec 08             	sub    $0x8,%esp
  100c90:	ff 75 08             	pushl  0x8(%ebp)
  100c93:	ff 75 f4             	pushl  -0xc(%ebp)
  100c96:	e8 ee fe ff ff       	call   100b89 <runcmd>
  100c9b:	83 c4 10             	add    $0x10,%esp
  100c9e:	85 c0                	test   %eax,%eax
  100ca0:	79 02                	jns    100ca4 <kmonitor+0x6a>
                break;
  100ca2:	eb 02                	jmp    100ca6 <kmonitor+0x6c>
            }
        }
    }
  100ca4:	eb ce                	jmp    100c74 <kmonitor+0x3a>
}
  100ca6:	c9                   	leave  
  100ca7:	c3                   	ret    

00100ca8 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100ca8:	55                   	push   %ebp
  100ca9:	89 e5                	mov    %esp,%ebp
  100cab:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cb5:	eb 3d                	jmp    100cf4 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cb7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cba:	89 d0                	mov    %edx,%eax
  100cbc:	01 c0                	add    %eax,%eax
  100cbe:	01 d0                	add    %edx,%eax
  100cc0:	c1 e0 02             	shl    $0x2,%eax
  100cc3:	05 00 e0 10 00       	add    $0x10e000,%eax
  100cc8:	8b 48 04             	mov    0x4(%eax),%ecx
  100ccb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cce:	89 d0                	mov    %edx,%eax
  100cd0:	01 c0                	add    %eax,%eax
  100cd2:	01 d0                	add    %edx,%eax
  100cd4:	c1 e0 02             	shl    $0x2,%eax
  100cd7:	05 00 e0 10 00       	add    $0x10e000,%eax
  100cdc:	8b 00                	mov    (%eax),%eax
  100cde:	83 ec 04             	sub    $0x4,%esp
  100ce1:	51                   	push   %ecx
  100ce2:	50                   	push   %eax
  100ce3:	68 81 36 10 00       	push   $0x103681
  100ce8:	e8 47 f5 ff ff       	call   100234 <cprintf>
  100ced:	83 c4 10             	add    $0x10,%esp

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cf0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100cf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cf7:	83 f8 02             	cmp    $0x2,%eax
  100cfa:	76 bb                	jbe    100cb7 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100cfc:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d01:	c9                   	leave  
  100d02:	c3                   	ret    

00100d03 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d03:	55                   	push   %ebp
  100d04:	89 e5                	mov    %esp,%ebp
  100d06:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d09:	e8 ac fb ff ff       	call   1008ba <print_kerninfo>
    return 0;
  100d0e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d13:	c9                   	leave  
  100d14:	c3                   	ret    

00100d15 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d15:	55                   	push   %ebp
  100d16:	89 e5                	mov    %esp,%ebp
  100d18:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d1b:	e8 e2 fc ff ff       	call   100a02 <print_stackframe>
    return 0;
  100d20:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d25:	c9                   	leave  
  100d26:	c3                   	ret    

00100d27 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d27:	55                   	push   %ebp
  100d28:	89 e5                	mov    %esp,%ebp
  100d2a:	83 ec 18             	sub    $0x18,%esp
  100d2d:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d33:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d37:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d3b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d3f:	ee                   	out    %al,(%dx)
  100d40:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d46:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d4a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d4e:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d52:	ee                   	out    %al,(%dx)
  100d53:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d59:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d5d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d61:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d65:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d66:	c7 05 e8 f9 10 00 00 	movl   $0x0,0x10f9e8
  100d6d:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d70:	83 ec 0c             	sub    $0xc,%esp
  100d73:	68 8a 36 10 00       	push   $0x10368a
  100d78:	e8 b7 f4 ff ff       	call   100234 <cprintf>
  100d7d:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100d80:	83 ec 0c             	sub    $0xc,%esp
  100d83:	6a 00                	push   $0x0
  100d85:	e8 ba 08 00 00       	call   101644 <pic_enable>
  100d8a:	83 c4 10             	add    $0x10,%esp
}
  100d8d:	c9                   	leave  
  100d8e:	c3                   	ret    

00100d8f <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d8f:	55                   	push   %ebp
  100d90:	89 e5                	mov    %esp,%ebp
  100d92:	83 ec 10             	sub    $0x10,%esp
  100d95:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100d9b:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100d9f:	89 c2                	mov    %eax,%edx
  100da1:	ec                   	in     (%dx),%al
  100da2:	88 45 fd             	mov    %al,-0x3(%ebp)
  100da5:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dab:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100daf:	89 c2                	mov    %eax,%edx
  100db1:	ec                   	in     (%dx),%al
  100db2:	88 45 f9             	mov    %al,-0x7(%ebp)
  100db5:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dbb:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dbf:	89 c2                	mov    %eax,%edx
  100dc1:	ec                   	in     (%dx),%al
  100dc2:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dc5:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100dcb:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100dcf:	89 c2                	mov    %eax,%edx
  100dd1:	ec                   	in     (%dx),%al
  100dd2:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dd5:	c9                   	leave  
  100dd6:	c3                   	ret    

00100dd7 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100dd7:	55                   	push   %ebp
  100dd8:	89 e5                	mov    %esp,%ebp
  100dda:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100ddd:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100de4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100de7:	0f b7 00             	movzwl (%eax),%eax
  100dea:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100dee:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100df1:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100df6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100df9:	0f b7 00             	movzwl (%eax),%eax
  100dfc:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e00:	74 12                	je     100e14 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e02:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e09:	66 c7 05 06 ef 10 00 	movw   $0x3b4,0x10ef06
  100e10:	b4 03 
  100e12:	eb 13                	jmp    100e27 <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e14:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e17:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e1b:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e1e:	66 c7 05 06 ef 10 00 	movw   $0x3d4,0x10ef06
  100e25:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e27:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  100e2e:	0f b7 c0             	movzwl %ax,%eax
  100e31:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e35:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e39:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e3d:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e41:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e42:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  100e49:	83 c0 01             	add    $0x1,%eax
  100e4c:	0f b7 c0             	movzwl %ax,%eax
  100e4f:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e53:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e57:	89 c2                	mov    %eax,%edx
  100e59:	ec                   	in     (%dx),%al
  100e5a:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e5d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e61:	0f b6 c0             	movzbl %al,%eax
  100e64:	c1 e0 08             	shl    $0x8,%eax
  100e67:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e6a:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  100e71:	0f b7 c0             	movzwl %ax,%eax
  100e74:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100e78:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e7c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e80:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e84:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100e85:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  100e8c:	83 c0 01             	add    $0x1,%eax
  100e8f:	0f b7 c0             	movzwl %ax,%eax
  100e92:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e96:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100e9a:	89 c2                	mov    %eax,%edx
  100e9c:	ec                   	in     (%dx),%al
  100e9d:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100ea0:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ea4:	0f b6 c0             	movzbl %al,%eax
  100ea7:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100eaa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ead:	a3 00 ef 10 00       	mov    %eax,0x10ef00
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100eb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100eb5:	66 a3 04 ef 10 00    	mov    %ax,0x10ef04
}
  100ebb:	c9                   	leave  
  100ebc:	c3                   	ret    

00100ebd <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ebd:	55                   	push   %ebp
  100ebe:	89 e5                	mov    %esp,%ebp
  100ec0:	83 ec 38             	sub    $0x38,%esp
  100ec3:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100ec9:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ecd:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100ed1:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ed5:	ee                   	out    %al,(%dx)
  100ed6:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100edc:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100ee0:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100ee4:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100ee8:	ee                   	out    %al,(%dx)
  100ee9:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100eef:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100ef3:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ef7:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100efb:	ee                   	out    %al,(%dx)
  100efc:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f02:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f06:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f0a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f0e:	ee                   	out    %al,(%dx)
  100f0f:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f15:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f19:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f1d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f21:	ee                   	out    %al,(%dx)
  100f22:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f28:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f2c:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f30:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f34:	ee                   	out    %al,(%dx)
  100f35:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f3b:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f3f:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f43:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f47:	ee                   	out    %al,(%dx)
  100f48:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f4e:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f52:	89 c2                	mov    %eax,%edx
  100f54:	ec                   	in     (%dx),%al
  100f55:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f58:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f5c:	3c ff                	cmp    $0xff,%al
  100f5e:	0f 95 c0             	setne  %al
  100f61:	0f b6 c0             	movzbl %al,%eax
  100f64:	a3 08 ef 10 00       	mov    %eax,0x10ef08
  100f69:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f6f:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100f73:	89 c2                	mov    %eax,%edx
  100f75:	ec                   	in     (%dx),%al
  100f76:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100f79:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100f7f:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100f83:	89 c2                	mov    %eax,%edx
  100f85:	ec                   	in     (%dx),%al
  100f86:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100f89:	a1 08 ef 10 00       	mov    0x10ef08,%eax
  100f8e:	85 c0                	test   %eax,%eax
  100f90:	74 0d                	je     100f9f <serial_init+0xe2>
        pic_enable(IRQ_COM1);
  100f92:	83 ec 0c             	sub    $0xc,%esp
  100f95:	6a 04                	push   $0x4
  100f97:	e8 a8 06 00 00       	call   101644 <pic_enable>
  100f9c:	83 c4 10             	add    $0x10,%esp
    }
}
  100f9f:	c9                   	leave  
  100fa0:	c3                   	ret    

00100fa1 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fa1:	55                   	push   %ebp
  100fa2:	89 e5                	mov    %esp,%ebp
  100fa4:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fa7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fae:	eb 09                	jmp    100fb9 <lpt_putc_sub+0x18>
        delay();
  100fb0:	e8 da fd ff ff       	call   100d8f <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fb5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fb9:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fbf:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fc3:	89 c2                	mov    %eax,%edx
  100fc5:	ec                   	in     (%dx),%al
  100fc6:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fc9:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100fcd:	84 c0                	test   %al,%al
  100fcf:	78 09                	js     100fda <lpt_putc_sub+0x39>
  100fd1:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100fd8:	7e d6                	jle    100fb0 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fda:	8b 45 08             	mov    0x8(%ebp),%eax
  100fdd:	0f b6 c0             	movzbl %al,%eax
  100fe0:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  100fe6:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fe9:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100fed:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ff1:	ee                   	out    %al,(%dx)
  100ff2:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  100ff8:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  100ffc:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101000:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101004:	ee                   	out    %al,(%dx)
  101005:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  10100b:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  10100f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101013:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101017:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101018:	c9                   	leave  
  101019:	c3                   	ret    

0010101a <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10101a:	55                   	push   %ebp
  10101b:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  10101d:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101021:	74 0d                	je     101030 <lpt_putc+0x16>
        lpt_putc_sub(c);
  101023:	ff 75 08             	pushl  0x8(%ebp)
  101026:	e8 76 ff ff ff       	call   100fa1 <lpt_putc_sub>
  10102b:	83 c4 04             	add    $0x4,%esp
  10102e:	eb 1e                	jmp    10104e <lpt_putc+0x34>
    }
    else {
        lpt_putc_sub('\b');
  101030:	6a 08                	push   $0x8
  101032:	e8 6a ff ff ff       	call   100fa1 <lpt_putc_sub>
  101037:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  10103a:	6a 20                	push   $0x20
  10103c:	e8 60 ff ff ff       	call   100fa1 <lpt_putc_sub>
  101041:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  101044:	6a 08                	push   $0x8
  101046:	e8 56 ff ff ff       	call   100fa1 <lpt_putc_sub>
  10104b:	83 c4 04             	add    $0x4,%esp
    }
}
  10104e:	c9                   	leave  
  10104f:	c3                   	ret    

00101050 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101050:	55                   	push   %ebp
  101051:	89 e5                	mov    %esp,%ebp
  101053:	53                   	push   %ebx
  101054:	83 ec 24             	sub    $0x24,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101057:	8b 45 08             	mov    0x8(%ebp),%eax
  10105a:	b0 00                	mov    $0x0,%al
  10105c:	85 c0                	test   %eax,%eax
  10105e:	75 07                	jne    101067 <cga_putc+0x17>
        c |= 0x0700;
  101060:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101067:	8b 45 08             	mov    0x8(%ebp),%eax
  10106a:	0f b6 c0             	movzbl %al,%eax
  10106d:	83 f8 0a             	cmp    $0xa,%eax
  101070:	74 4c                	je     1010be <cga_putc+0x6e>
  101072:	83 f8 0d             	cmp    $0xd,%eax
  101075:	74 57                	je     1010ce <cga_putc+0x7e>
  101077:	83 f8 08             	cmp    $0x8,%eax
  10107a:	0f 85 88 00 00 00    	jne    101108 <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  101080:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  101087:	66 85 c0             	test   %ax,%ax
  10108a:	74 30                	je     1010bc <cga_putc+0x6c>
            crt_pos --;
  10108c:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  101093:	83 e8 01             	sub    $0x1,%eax
  101096:	66 a3 04 ef 10 00    	mov    %ax,0x10ef04
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10109c:	a1 00 ef 10 00       	mov    0x10ef00,%eax
  1010a1:	0f b7 15 04 ef 10 00 	movzwl 0x10ef04,%edx
  1010a8:	0f b7 d2             	movzwl %dx,%edx
  1010ab:	01 d2                	add    %edx,%edx
  1010ad:	01 d0                	add    %edx,%eax
  1010af:	8b 55 08             	mov    0x8(%ebp),%edx
  1010b2:	b2 00                	mov    $0x0,%dl
  1010b4:	83 ca 20             	or     $0x20,%edx
  1010b7:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  1010ba:	eb 71                	jmp    10112d <cga_putc+0xdd>
  1010bc:	eb 6f                	jmp    10112d <cga_putc+0xdd>
    case '\n':
        crt_pos += CRT_COLS;
  1010be:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  1010c5:	83 c0 50             	add    $0x50,%eax
  1010c8:	66 a3 04 ef 10 00    	mov    %ax,0x10ef04
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010ce:	0f b7 1d 04 ef 10 00 	movzwl 0x10ef04,%ebx
  1010d5:	0f b7 0d 04 ef 10 00 	movzwl 0x10ef04,%ecx
  1010dc:	0f b7 c1             	movzwl %cx,%eax
  1010df:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1010e5:	c1 e8 10             	shr    $0x10,%eax
  1010e8:	89 c2                	mov    %eax,%edx
  1010ea:	66 c1 ea 06          	shr    $0x6,%dx
  1010ee:	89 d0                	mov    %edx,%eax
  1010f0:	c1 e0 02             	shl    $0x2,%eax
  1010f3:	01 d0                	add    %edx,%eax
  1010f5:	c1 e0 04             	shl    $0x4,%eax
  1010f8:	29 c1                	sub    %eax,%ecx
  1010fa:	89 ca                	mov    %ecx,%edx
  1010fc:	89 d8                	mov    %ebx,%eax
  1010fe:	29 d0                	sub    %edx,%eax
  101100:	66 a3 04 ef 10 00    	mov    %ax,0x10ef04
        break;
  101106:	eb 25                	jmp    10112d <cga_putc+0xdd>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101108:	8b 0d 00 ef 10 00    	mov    0x10ef00,%ecx
  10110e:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  101115:	8d 50 01             	lea    0x1(%eax),%edx
  101118:	66 89 15 04 ef 10 00 	mov    %dx,0x10ef04
  10111f:	0f b7 c0             	movzwl %ax,%eax
  101122:	01 c0                	add    %eax,%eax
  101124:	01 c8                	add    %ecx,%eax
  101126:	8b 55 08             	mov    0x8(%ebp),%edx
  101129:	66 89 10             	mov    %dx,(%eax)
        break;
  10112c:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10112d:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  101134:	66 3d cf 07          	cmp    $0x7cf,%ax
  101138:	76 59                	jbe    101193 <cga_putc+0x143>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10113a:	a1 00 ef 10 00       	mov    0x10ef00,%eax
  10113f:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101145:	a1 00 ef 10 00       	mov    0x10ef00,%eax
  10114a:	83 ec 04             	sub    $0x4,%esp
  10114d:	68 00 0f 00 00       	push   $0xf00
  101152:	52                   	push   %edx
  101153:	50                   	push   %eax
  101154:	e8 bd 1a 00 00       	call   102c16 <memmove>
  101159:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10115c:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101163:	eb 15                	jmp    10117a <cga_putc+0x12a>
            crt_buf[i] = 0x0700 | ' ';
  101165:	a1 00 ef 10 00       	mov    0x10ef00,%eax
  10116a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10116d:	01 d2                	add    %edx,%edx
  10116f:	01 d0                	add    %edx,%eax
  101171:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101176:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10117a:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101181:	7e e2                	jle    101165 <cga_putc+0x115>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  101183:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  10118a:	83 e8 50             	sub    $0x50,%eax
  10118d:	66 a3 04 ef 10 00    	mov    %ax,0x10ef04
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101193:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  10119a:	0f b7 c0             	movzwl %ax,%eax
  10119d:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011a1:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011a5:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011a9:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011ad:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011ae:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  1011b5:	66 c1 e8 08          	shr    $0x8,%ax
  1011b9:	0f b6 c0             	movzbl %al,%eax
  1011bc:	0f b7 15 06 ef 10 00 	movzwl 0x10ef06,%edx
  1011c3:	83 c2 01             	add    $0x1,%edx
  1011c6:	0f b7 d2             	movzwl %dx,%edx
  1011c9:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  1011cd:	88 45 ed             	mov    %al,-0x13(%ebp)
  1011d0:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1011d4:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1011d8:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  1011d9:	0f b7 05 06 ef 10 00 	movzwl 0x10ef06,%eax
  1011e0:	0f b7 c0             	movzwl %ax,%eax
  1011e3:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  1011e7:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  1011eb:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1011ef:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1011f3:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  1011f4:	0f b7 05 04 ef 10 00 	movzwl 0x10ef04,%eax
  1011fb:	0f b6 c0             	movzbl %al,%eax
  1011fe:	0f b7 15 06 ef 10 00 	movzwl 0x10ef06,%edx
  101205:	83 c2 01             	add    $0x1,%edx
  101208:	0f b7 d2             	movzwl %dx,%edx
  10120b:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  10120f:	88 45 e5             	mov    %al,-0x1b(%ebp)
  101212:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101216:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10121a:	ee                   	out    %al,(%dx)
}
  10121b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10121e:	c9                   	leave  
  10121f:	c3                   	ret    

00101220 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101220:	55                   	push   %ebp
  101221:	89 e5                	mov    %esp,%ebp
  101223:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101226:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10122d:	eb 09                	jmp    101238 <serial_putc_sub+0x18>
        delay();
  10122f:	e8 5b fb ff ff       	call   100d8f <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101234:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101238:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10123e:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101242:	89 c2                	mov    %eax,%edx
  101244:	ec                   	in     (%dx),%al
  101245:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101248:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10124c:	0f b6 c0             	movzbl %al,%eax
  10124f:	83 e0 20             	and    $0x20,%eax
  101252:	85 c0                	test   %eax,%eax
  101254:	75 09                	jne    10125f <serial_putc_sub+0x3f>
  101256:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10125d:	7e d0                	jle    10122f <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  10125f:	8b 45 08             	mov    0x8(%ebp),%eax
  101262:	0f b6 c0             	movzbl %al,%eax
  101265:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10126b:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10126e:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101272:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101276:	ee                   	out    %al,(%dx)
}
  101277:	c9                   	leave  
  101278:	c3                   	ret    

00101279 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101279:	55                   	push   %ebp
  10127a:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  10127c:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101280:	74 0d                	je     10128f <serial_putc+0x16>
        serial_putc_sub(c);
  101282:	ff 75 08             	pushl  0x8(%ebp)
  101285:	e8 96 ff ff ff       	call   101220 <serial_putc_sub>
  10128a:	83 c4 04             	add    $0x4,%esp
  10128d:	eb 1e                	jmp    1012ad <serial_putc+0x34>
    }
    else {
        serial_putc_sub('\b');
  10128f:	6a 08                	push   $0x8
  101291:	e8 8a ff ff ff       	call   101220 <serial_putc_sub>
  101296:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  101299:	6a 20                	push   $0x20
  10129b:	e8 80 ff ff ff       	call   101220 <serial_putc_sub>
  1012a0:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  1012a3:	6a 08                	push   $0x8
  1012a5:	e8 76 ff ff ff       	call   101220 <serial_putc_sub>
  1012aa:	83 c4 04             	add    $0x4,%esp
    }
}
  1012ad:	c9                   	leave  
  1012ae:	c3                   	ret    

001012af <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012af:	55                   	push   %ebp
  1012b0:	89 e5                	mov    %esp,%ebp
  1012b2:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012b5:	eb 33                	jmp    1012ea <cons_intr+0x3b>
        if (c != 0) {
  1012b7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012bb:	74 2d                	je     1012ea <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012bd:	a1 44 f1 10 00       	mov    0x10f144,%eax
  1012c2:	8d 50 01             	lea    0x1(%eax),%edx
  1012c5:	89 15 44 f1 10 00    	mov    %edx,0x10f144
  1012cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1012ce:	88 90 40 ef 10 00    	mov    %dl,0x10ef40(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1012d4:	a1 44 f1 10 00       	mov    0x10f144,%eax
  1012d9:	3d 00 02 00 00       	cmp    $0x200,%eax
  1012de:	75 0a                	jne    1012ea <cons_intr+0x3b>
                cons.wpos = 0;
  1012e0:	c7 05 44 f1 10 00 00 	movl   $0x0,0x10f144
  1012e7:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  1012ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ed:	ff d0                	call   *%eax
  1012ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1012f2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1012f6:	75 bf                	jne    1012b7 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  1012f8:	c9                   	leave  
  1012f9:	c3                   	ret    

001012fa <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1012fa:	55                   	push   %ebp
  1012fb:	89 e5                	mov    %esp,%ebp
  1012fd:	83 ec 10             	sub    $0x10,%esp
  101300:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101306:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10130a:	89 c2                	mov    %eax,%edx
  10130c:	ec                   	in     (%dx),%al
  10130d:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101310:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101314:	0f b6 c0             	movzbl %al,%eax
  101317:	83 e0 01             	and    $0x1,%eax
  10131a:	85 c0                	test   %eax,%eax
  10131c:	75 07                	jne    101325 <serial_proc_data+0x2b>
        return -1;
  10131e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101323:	eb 2a                	jmp    10134f <serial_proc_data+0x55>
  101325:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10132b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10132f:	89 c2                	mov    %eax,%edx
  101331:	ec                   	in     (%dx),%al
  101332:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101335:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101339:	0f b6 c0             	movzbl %al,%eax
  10133c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10133f:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101343:	75 07                	jne    10134c <serial_proc_data+0x52>
        c = '\b';
  101345:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10134c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10134f:	c9                   	leave  
  101350:	c3                   	ret    

00101351 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101351:	55                   	push   %ebp
  101352:	89 e5                	mov    %esp,%ebp
  101354:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  101357:	a1 08 ef 10 00       	mov    0x10ef08,%eax
  10135c:	85 c0                	test   %eax,%eax
  10135e:	74 10                	je     101370 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101360:	83 ec 0c             	sub    $0xc,%esp
  101363:	68 fa 12 10 00       	push   $0x1012fa
  101368:	e8 42 ff ff ff       	call   1012af <cons_intr>
  10136d:	83 c4 10             	add    $0x10,%esp
    }
}
  101370:	c9                   	leave  
  101371:	c3                   	ret    

00101372 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101372:	55                   	push   %ebp
  101373:	89 e5                	mov    %esp,%ebp
  101375:	83 ec 28             	sub    $0x28,%esp
  101378:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10137e:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  101382:	89 c2                	mov    %eax,%edx
  101384:	ec                   	in     (%dx),%al
  101385:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  101388:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  10138c:	0f b6 c0             	movzbl %al,%eax
  10138f:	83 e0 01             	and    $0x1,%eax
  101392:	85 c0                	test   %eax,%eax
  101394:	75 0a                	jne    1013a0 <kbd_proc_data+0x2e>
        return -1;
  101396:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10139b:	e9 5d 01 00 00       	jmp    1014fd <kbd_proc_data+0x18b>
  1013a0:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013a6:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013aa:	89 c2                	mov    %eax,%edx
  1013ac:	ec                   	in     (%dx),%al
  1013ad:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013b0:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013b4:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013b7:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013bb:	75 17                	jne    1013d4 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013bd:	a1 48 f1 10 00       	mov    0x10f148,%eax
  1013c2:	83 c8 40             	or     $0x40,%eax
  1013c5:	a3 48 f1 10 00       	mov    %eax,0x10f148
        return 0;
  1013ca:	b8 00 00 00 00       	mov    $0x0,%eax
  1013cf:	e9 29 01 00 00       	jmp    1014fd <kbd_proc_data+0x18b>
    } else if (data & 0x80) {
  1013d4:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013d8:	84 c0                	test   %al,%al
  1013da:	79 47                	jns    101423 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1013dc:	a1 48 f1 10 00       	mov    0x10f148,%eax
  1013e1:	83 e0 40             	and    $0x40,%eax
  1013e4:	85 c0                	test   %eax,%eax
  1013e6:	75 09                	jne    1013f1 <kbd_proc_data+0x7f>
  1013e8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013ec:	83 e0 7f             	and    $0x7f,%eax
  1013ef:	eb 04                	jmp    1013f5 <kbd_proc_data+0x83>
  1013f1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013f5:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1013f8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013fc:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101403:	83 c8 40             	or     $0x40,%eax
  101406:	0f b6 c0             	movzbl %al,%eax
  101409:	f7 d0                	not    %eax
  10140b:	89 c2                	mov    %eax,%edx
  10140d:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101412:	21 d0                	and    %edx,%eax
  101414:	a3 48 f1 10 00       	mov    %eax,0x10f148
        return 0;
  101419:	b8 00 00 00 00       	mov    $0x0,%eax
  10141e:	e9 da 00 00 00       	jmp    1014fd <kbd_proc_data+0x18b>
    } else if (shift & E0ESC) {
  101423:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101428:	83 e0 40             	and    $0x40,%eax
  10142b:	85 c0                	test   %eax,%eax
  10142d:	74 11                	je     101440 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10142f:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101433:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101438:	83 e0 bf             	and    $0xffffffbf,%eax
  10143b:	a3 48 f1 10 00       	mov    %eax,0x10f148
    }

    shift |= shiftcode[data];
  101440:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101444:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10144b:	0f b6 d0             	movzbl %al,%edx
  10144e:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101453:	09 d0                	or     %edx,%eax
  101455:	a3 48 f1 10 00       	mov    %eax,0x10f148
    shift ^= togglecode[data];
  10145a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10145e:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  101465:	0f b6 d0             	movzbl %al,%edx
  101468:	a1 48 f1 10 00       	mov    0x10f148,%eax
  10146d:	31 d0                	xor    %edx,%eax
  10146f:	a3 48 f1 10 00       	mov    %eax,0x10f148

    c = charcode[shift & (CTL | SHIFT)][data];
  101474:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101479:	83 e0 03             	and    $0x3,%eax
  10147c:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101483:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101487:	01 d0                	add    %edx,%eax
  101489:	0f b6 00             	movzbl (%eax),%eax
  10148c:	0f b6 c0             	movzbl %al,%eax
  10148f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101492:	a1 48 f1 10 00       	mov    0x10f148,%eax
  101497:	83 e0 08             	and    $0x8,%eax
  10149a:	85 c0                	test   %eax,%eax
  10149c:	74 22                	je     1014c0 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  10149e:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014a2:	7e 0c                	jle    1014b0 <kbd_proc_data+0x13e>
  1014a4:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014a8:	7f 06                	jg     1014b0 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014aa:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014ae:	eb 10                	jmp    1014c0 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014b0:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014b4:	7e 0a                	jle    1014c0 <kbd_proc_data+0x14e>
  1014b6:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014ba:	7f 04                	jg     1014c0 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014bc:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014c0:	a1 48 f1 10 00       	mov    0x10f148,%eax
  1014c5:	f7 d0                	not    %eax
  1014c7:	83 e0 06             	and    $0x6,%eax
  1014ca:	85 c0                	test   %eax,%eax
  1014cc:	75 2c                	jne    1014fa <kbd_proc_data+0x188>
  1014ce:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1014d5:	75 23                	jne    1014fa <kbd_proc_data+0x188>
        cprintf("Rebooting!\n");
  1014d7:	83 ec 0c             	sub    $0xc,%esp
  1014da:	68 a5 36 10 00       	push   $0x1036a5
  1014df:	e8 50 ed ff ff       	call   100234 <cprintf>
  1014e4:	83 c4 10             	add    $0x10,%esp
  1014e7:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1014ed:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1014f1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1014f5:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  1014f9:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1014fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1014fd:	c9                   	leave  
  1014fe:	c3                   	ret    

001014ff <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1014ff:	55                   	push   %ebp
  101500:	89 e5                	mov    %esp,%ebp
  101502:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  101505:	83 ec 0c             	sub    $0xc,%esp
  101508:	68 72 13 10 00       	push   $0x101372
  10150d:	e8 9d fd ff ff       	call   1012af <cons_intr>
  101512:	83 c4 10             	add    $0x10,%esp
}
  101515:	c9                   	leave  
  101516:	c3                   	ret    

00101517 <kbd_init>:

static void
kbd_init(void) {
  101517:	55                   	push   %ebp
  101518:	89 e5                	mov    %esp,%ebp
  10151a:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  10151d:	e8 dd ff ff ff       	call   1014ff <kbd_intr>
    pic_enable(IRQ_KBD);
  101522:	83 ec 0c             	sub    $0xc,%esp
  101525:	6a 01                	push   $0x1
  101527:	e8 18 01 00 00       	call   101644 <pic_enable>
  10152c:	83 c4 10             	add    $0x10,%esp
}
  10152f:	c9                   	leave  
  101530:	c3                   	ret    

00101531 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101531:	55                   	push   %ebp
  101532:	89 e5                	mov    %esp,%ebp
  101534:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  101537:	e8 9b f8 ff ff       	call   100dd7 <cga_init>
    serial_init();
  10153c:	e8 7c f9 ff ff       	call   100ebd <serial_init>
    kbd_init();
  101541:	e8 d1 ff ff ff       	call   101517 <kbd_init>
    if (!serial_exists) {
  101546:	a1 08 ef 10 00       	mov    0x10ef08,%eax
  10154b:	85 c0                	test   %eax,%eax
  10154d:	75 10                	jne    10155f <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  10154f:	83 ec 0c             	sub    $0xc,%esp
  101552:	68 b1 36 10 00       	push   $0x1036b1
  101557:	e8 d8 ec ff ff       	call   100234 <cprintf>
  10155c:	83 c4 10             	add    $0x10,%esp
    }
}
  10155f:	c9                   	leave  
  101560:	c3                   	ret    

00101561 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101561:	55                   	push   %ebp
  101562:	89 e5                	mov    %esp,%ebp
  101564:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  101567:	ff 75 08             	pushl  0x8(%ebp)
  10156a:	e8 ab fa ff ff       	call   10101a <lpt_putc>
  10156f:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  101572:	83 ec 0c             	sub    $0xc,%esp
  101575:	ff 75 08             	pushl  0x8(%ebp)
  101578:	e8 d3 fa ff ff       	call   101050 <cga_putc>
  10157d:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  101580:	83 ec 0c             	sub    $0xc,%esp
  101583:	ff 75 08             	pushl  0x8(%ebp)
  101586:	e8 ee fc ff ff       	call   101279 <serial_putc>
  10158b:	83 c4 10             	add    $0x10,%esp
}
  10158e:	c9                   	leave  
  10158f:	c3                   	ret    

00101590 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101590:	55                   	push   %ebp
  101591:	89 e5                	mov    %esp,%ebp
  101593:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101596:	e8 b6 fd ff ff       	call   101351 <serial_intr>
    kbd_intr();
  10159b:	e8 5f ff ff ff       	call   1014ff <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015a0:	8b 15 40 f1 10 00    	mov    0x10f140,%edx
  1015a6:	a1 44 f1 10 00       	mov    0x10f144,%eax
  1015ab:	39 c2                	cmp    %eax,%edx
  1015ad:	74 36                	je     1015e5 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015af:	a1 40 f1 10 00       	mov    0x10f140,%eax
  1015b4:	8d 50 01             	lea    0x1(%eax),%edx
  1015b7:	89 15 40 f1 10 00    	mov    %edx,0x10f140
  1015bd:	0f b6 80 40 ef 10 00 	movzbl 0x10ef40(%eax),%eax
  1015c4:	0f b6 c0             	movzbl %al,%eax
  1015c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015ca:	a1 40 f1 10 00       	mov    0x10f140,%eax
  1015cf:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015d4:	75 0a                	jne    1015e0 <cons_getc+0x50>
            cons.rpos = 0;
  1015d6:	c7 05 40 f1 10 00 00 	movl   $0x0,0x10f140
  1015dd:	00 00 00 
        }
        return c;
  1015e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015e3:	eb 05                	jmp    1015ea <cons_getc+0x5a>
    }
    return 0;
  1015e5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1015ea:	c9                   	leave  
  1015eb:	c3                   	ret    

001015ec <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1015ec:	55                   	push   %ebp
  1015ed:	89 e5                	mov    %esp,%ebp
  1015ef:	83 ec 14             	sub    $0x14,%esp
  1015f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1015f5:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1015f9:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1015fd:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101603:	a1 4c f1 10 00       	mov    0x10f14c,%eax
  101608:	85 c0                	test   %eax,%eax
  10160a:	74 36                	je     101642 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  10160c:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101610:	0f b6 c0             	movzbl %al,%eax
  101613:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101619:	88 45 fd             	mov    %al,-0x3(%ebp)
  10161c:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101620:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101624:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101625:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101629:	66 c1 e8 08          	shr    $0x8,%ax
  10162d:	0f b6 c0             	movzbl %al,%eax
  101630:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101636:	88 45 f9             	mov    %al,-0x7(%ebp)
  101639:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10163d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101641:	ee                   	out    %al,(%dx)
    }
}
  101642:	c9                   	leave  
  101643:	c3                   	ret    

00101644 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101644:	55                   	push   %ebp
  101645:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  101647:	8b 45 08             	mov    0x8(%ebp),%eax
  10164a:	ba 01 00 00 00       	mov    $0x1,%edx
  10164f:	89 c1                	mov    %eax,%ecx
  101651:	d3 e2                	shl    %cl,%edx
  101653:	89 d0                	mov    %edx,%eax
  101655:	f7 d0                	not    %eax
  101657:	89 c2                	mov    %eax,%edx
  101659:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101660:	21 d0                	and    %edx,%eax
  101662:	0f b7 c0             	movzwl %ax,%eax
  101665:	50                   	push   %eax
  101666:	e8 81 ff ff ff       	call   1015ec <pic_setmask>
  10166b:	83 c4 04             	add    $0x4,%esp
}
  10166e:	c9                   	leave  
  10166f:	c3                   	ret    

00101670 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101670:	55                   	push   %ebp
  101671:	89 e5                	mov    %esp,%ebp
  101673:	83 ec 40             	sub    $0x40,%esp
    did_init = 1;
  101676:	c7 05 4c f1 10 00 01 	movl   $0x1,0x10f14c
  10167d:	00 00 00 
  101680:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101686:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  10168a:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10168e:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101692:	ee                   	out    %al,(%dx)
  101693:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101699:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  10169d:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016a1:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016a5:	ee                   	out    %al,(%dx)
  1016a6:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016ac:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016b0:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016b4:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016b8:	ee                   	out    %al,(%dx)
  1016b9:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016bf:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  1016c3:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1016c7:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1016cb:	ee                   	out    %al,(%dx)
  1016cc:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  1016d2:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  1016d6:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1016da:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1016de:	ee                   	out    %al,(%dx)
  1016df:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  1016e5:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  1016e9:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1016ed:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1016f1:	ee                   	out    %al,(%dx)
  1016f2:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  1016f8:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  1016fc:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101700:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101704:	ee                   	out    %al,(%dx)
  101705:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  10170b:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  10170f:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101713:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101717:	ee                   	out    %al,(%dx)
  101718:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  10171e:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  101722:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101726:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10172a:	ee                   	out    %al,(%dx)
  10172b:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  101731:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101735:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101739:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10173d:	ee                   	out    %al,(%dx)
  10173e:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101744:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101748:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10174c:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101750:	ee                   	out    %al,(%dx)
  101751:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101757:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  10175b:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  10175f:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101763:	ee                   	out    %al,(%dx)
  101764:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  10176a:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  10176e:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101772:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  101776:	ee                   	out    %al,(%dx)
  101777:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  10177d:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  101781:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  101785:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  101789:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  10178a:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101791:	66 83 f8 ff          	cmp    $0xffff,%ax
  101795:	74 13                	je     1017aa <pic_init+0x13a>
        pic_setmask(irq_mask);
  101797:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10179e:	0f b7 c0             	movzwl %ax,%eax
  1017a1:	50                   	push   %eax
  1017a2:	e8 45 fe ff ff       	call   1015ec <pic_setmask>
  1017a7:	83 c4 04             	add    $0x4,%esp
    }
}
  1017aa:	c9                   	leave  
  1017ab:	c3                   	ret    

001017ac <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017ac:	55                   	push   %ebp
  1017ad:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017af:	fb                   	sti    
    sti();
}
  1017b0:	5d                   	pop    %ebp
  1017b1:	c3                   	ret    

001017b2 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017b2:	55                   	push   %ebp
  1017b3:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017b5:	fa                   	cli    
    cli();
}
  1017b6:	5d                   	pop    %ebp
  1017b7:	c3                   	ret    

001017b8 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017b8:	55                   	push   %ebp
  1017b9:	89 e5                	mov    %esp,%ebp
  1017bb:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017be:	83 ec 08             	sub    $0x8,%esp
  1017c1:	6a 64                	push   $0x64
  1017c3:	68 00 37 10 00       	push   $0x103700
  1017c8:	e8 67 ea ff ff       	call   100234 <cprintf>
  1017cd:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  1017d0:	c9                   	leave  
  1017d1:	c3                   	ret    

001017d2 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1017d2:	55                   	push   %ebp
  1017d3:	89 e5                	mov    %esp,%ebp
  1017d5:	83 ec 10             	sub    $0x10,%esp
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    
    extern uintptr_t __vectors[];
    int i;
    int numberOfGate = sizeof(idt) / sizeof(struct gatedesc);
  1017d8:	c7 45 f8 00 01 00 00 	movl   $0x100,-0x8(%ebp)
    for (i = 0; i < numberOfGate; i ++) {
  1017df:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1017e6:	e9 c3 00 00 00       	jmp    1018ae <idt_init+0xdc>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  1017eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017ee:	8b 04 85 20 e6 10 00 	mov    0x10e620(,%eax,4),%eax
  1017f5:	89 c2                	mov    %eax,%edx
  1017f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017fa:	66 89 14 c5 80 f1 10 	mov    %dx,0x10f180(,%eax,8)
  101801:	00 
  101802:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101805:	66 c7 04 c5 82 f1 10 	movw   $0x8,0x10f182(,%eax,8)
  10180c:	00 08 00 
  10180f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101812:	0f b6 14 c5 84 f1 10 	movzbl 0x10f184(,%eax,8),%edx
  101819:	00 
  10181a:	83 e2 e0             	and    $0xffffffe0,%edx
  10181d:	88 14 c5 84 f1 10 00 	mov    %dl,0x10f184(,%eax,8)
  101824:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101827:	0f b6 14 c5 84 f1 10 	movzbl 0x10f184(,%eax,8),%edx
  10182e:	00 
  10182f:	83 e2 1f             	and    $0x1f,%edx
  101832:	88 14 c5 84 f1 10 00 	mov    %dl,0x10f184(,%eax,8)
  101839:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10183c:	0f b6 14 c5 85 f1 10 	movzbl 0x10f185(,%eax,8),%edx
  101843:	00 
  101844:	83 e2 f0             	and    $0xfffffff0,%edx
  101847:	83 ca 0e             	or     $0xe,%edx
  10184a:	88 14 c5 85 f1 10 00 	mov    %dl,0x10f185(,%eax,8)
  101851:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101854:	0f b6 14 c5 85 f1 10 	movzbl 0x10f185(,%eax,8),%edx
  10185b:	00 
  10185c:	83 e2 ef             	and    $0xffffffef,%edx
  10185f:	88 14 c5 85 f1 10 00 	mov    %dl,0x10f185(,%eax,8)
  101866:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101869:	0f b6 14 c5 85 f1 10 	movzbl 0x10f185(,%eax,8),%edx
  101870:	00 
  101871:	83 e2 9f             	and    $0xffffff9f,%edx
  101874:	88 14 c5 85 f1 10 00 	mov    %dl,0x10f185(,%eax,8)
  10187b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10187e:	0f b6 14 c5 85 f1 10 	movzbl 0x10f185(,%eax,8),%edx
  101885:	00 
  101886:	83 ca 80             	or     $0xffffff80,%edx
  101889:	88 14 c5 85 f1 10 00 	mov    %dl,0x10f185(,%eax,8)
  101890:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101893:	8b 04 85 20 e6 10 00 	mov    0x10e620(,%eax,4),%eax
  10189a:	c1 e8 10             	shr    $0x10,%eax
  10189d:	89 c2                	mov    %eax,%edx
  10189f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a2:	66 89 14 c5 86 f1 10 	mov    %dx,0x10f186(,%eax,8)
  1018a9:	00 
      */
    
    extern uintptr_t __vectors[];
    int i;
    int numberOfGate = sizeof(idt) / sizeof(struct gatedesc);
    for (i = 0; i < numberOfGate; i ++) {
  1018aa:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1018b4:	0f 8c 31 ff ff ff    	jl     1017eb <idt_init+0x19>
  1018ba:	c7 45 f4 80 e5 10 00 	movl   $0x10e580,-0xc(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  1018c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018c4:	0f 01 18             	lidtl  (%eax)
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    }
    lidt(&idt_pd);
}
  1018c7:	c9                   	leave  
  1018c8:	c3                   	ret    

001018c9 <trapname>:

static const char *
trapname(int trapno) {
  1018c9:	55                   	push   %ebp
  1018ca:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1018cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1018cf:	83 f8 13             	cmp    $0x13,%eax
  1018d2:	77 0c                	ja     1018e0 <trapname+0x17>
        return excnames[trapno];
  1018d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1018d7:	8b 04 85 80 3a 10 00 	mov    0x103a80(,%eax,4),%eax
  1018de:	eb 18                	jmp    1018f8 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1018e0:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1018e4:	7e 0d                	jle    1018f3 <trapname+0x2a>
  1018e6:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1018ea:	7f 07                	jg     1018f3 <trapname+0x2a>
        return "Hardware Interrupt";
  1018ec:	b8 0a 37 10 00       	mov    $0x10370a,%eax
  1018f1:	eb 05                	jmp    1018f8 <trapname+0x2f>
    }
    return "(unknown trap)";
  1018f3:	b8 1d 37 10 00       	mov    $0x10371d,%eax
}
  1018f8:	5d                   	pop    %ebp
  1018f9:	c3                   	ret    

001018fa <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1018fa:	55                   	push   %ebp
  1018fb:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1018fd:	8b 45 08             	mov    0x8(%ebp),%eax
  101900:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101904:	66 83 f8 08          	cmp    $0x8,%ax
  101908:	0f 94 c0             	sete   %al
  10190b:	0f b6 c0             	movzbl %al,%eax
}
  10190e:	5d                   	pop    %ebp
  10190f:	c3                   	ret    

00101910 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101910:	55                   	push   %ebp
  101911:	89 e5                	mov    %esp,%ebp
  101913:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  101916:	83 ec 08             	sub    $0x8,%esp
  101919:	ff 75 08             	pushl  0x8(%ebp)
  10191c:	68 5e 37 10 00       	push   $0x10375e
  101921:	e8 0e e9 ff ff       	call   100234 <cprintf>
  101926:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101929:	8b 45 08             	mov    0x8(%ebp),%eax
  10192c:	83 ec 0c             	sub    $0xc,%esp
  10192f:	50                   	push   %eax
  101930:	e8 b7 01 00 00       	call   101aec <print_regs>
  101935:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101938:	8b 45 08             	mov    0x8(%ebp),%eax
  10193b:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  10193f:	0f b7 c0             	movzwl %ax,%eax
  101942:	83 ec 08             	sub    $0x8,%esp
  101945:	50                   	push   %eax
  101946:	68 6f 37 10 00       	push   $0x10376f
  10194b:	e8 e4 e8 ff ff       	call   100234 <cprintf>
  101950:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101953:	8b 45 08             	mov    0x8(%ebp),%eax
  101956:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  10195a:	0f b7 c0             	movzwl %ax,%eax
  10195d:	83 ec 08             	sub    $0x8,%esp
  101960:	50                   	push   %eax
  101961:	68 82 37 10 00       	push   $0x103782
  101966:	e8 c9 e8 ff ff       	call   100234 <cprintf>
  10196b:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  10196e:	8b 45 08             	mov    0x8(%ebp),%eax
  101971:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101975:	0f b7 c0             	movzwl %ax,%eax
  101978:	83 ec 08             	sub    $0x8,%esp
  10197b:	50                   	push   %eax
  10197c:	68 95 37 10 00       	push   $0x103795
  101981:	e8 ae e8 ff ff       	call   100234 <cprintf>
  101986:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101989:	8b 45 08             	mov    0x8(%ebp),%eax
  10198c:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101990:	0f b7 c0             	movzwl %ax,%eax
  101993:	83 ec 08             	sub    $0x8,%esp
  101996:	50                   	push   %eax
  101997:	68 a8 37 10 00       	push   $0x1037a8
  10199c:	e8 93 e8 ff ff       	call   100234 <cprintf>
  1019a1:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1019a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a7:	8b 40 30             	mov    0x30(%eax),%eax
  1019aa:	83 ec 0c             	sub    $0xc,%esp
  1019ad:	50                   	push   %eax
  1019ae:	e8 16 ff ff ff       	call   1018c9 <trapname>
  1019b3:	83 c4 10             	add    $0x10,%esp
  1019b6:	89 c2                	mov    %eax,%edx
  1019b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bb:	8b 40 30             	mov    0x30(%eax),%eax
  1019be:	83 ec 04             	sub    $0x4,%esp
  1019c1:	52                   	push   %edx
  1019c2:	50                   	push   %eax
  1019c3:	68 bb 37 10 00       	push   $0x1037bb
  1019c8:	e8 67 e8 ff ff       	call   100234 <cprintf>
  1019cd:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  1019d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d3:	8b 40 34             	mov    0x34(%eax),%eax
  1019d6:	83 ec 08             	sub    $0x8,%esp
  1019d9:	50                   	push   %eax
  1019da:	68 cd 37 10 00       	push   $0x1037cd
  1019df:	e8 50 e8 ff ff       	call   100234 <cprintf>
  1019e4:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  1019e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ea:	8b 40 38             	mov    0x38(%eax),%eax
  1019ed:	83 ec 08             	sub    $0x8,%esp
  1019f0:	50                   	push   %eax
  1019f1:	68 dc 37 10 00       	push   $0x1037dc
  1019f6:	e8 39 e8 ff ff       	call   100234 <cprintf>
  1019fb:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  1019fe:	8b 45 08             	mov    0x8(%ebp),%eax
  101a01:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a05:	0f b7 c0             	movzwl %ax,%eax
  101a08:	83 ec 08             	sub    $0x8,%esp
  101a0b:	50                   	push   %eax
  101a0c:	68 eb 37 10 00       	push   $0x1037eb
  101a11:	e8 1e e8 ff ff       	call   100234 <cprintf>
  101a16:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101a19:	8b 45 08             	mov    0x8(%ebp),%eax
  101a1c:	8b 40 40             	mov    0x40(%eax),%eax
  101a1f:	83 ec 08             	sub    $0x8,%esp
  101a22:	50                   	push   %eax
  101a23:	68 fe 37 10 00       	push   $0x1037fe
  101a28:	e8 07 e8 ff ff       	call   100234 <cprintf>
  101a2d:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a30:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101a37:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101a3e:	eb 3f                	jmp    101a7f <print_trapframe+0x16f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101a40:	8b 45 08             	mov    0x8(%ebp),%eax
  101a43:	8b 50 40             	mov    0x40(%eax),%edx
  101a46:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101a49:	21 d0                	and    %edx,%eax
  101a4b:	85 c0                	test   %eax,%eax
  101a4d:	74 29                	je     101a78 <print_trapframe+0x168>
  101a4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a52:	8b 04 85 c0 e5 10 00 	mov    0x10e5c0(,%eax,4),%eax
  101a59:	85 c0                	test   %eax,%eax
  101a5b:	74 1b                	je     101a78 <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  101a5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a60:	8b 04 85 c0 e5 10 00 	mov    0x10e5c0(,%eax,4),%eax
  101a67:	83 ec 08             	sub    $0x8,%esp
  101a6a:	50                   	push   %eax
  101a6b:	68 0d 38 10 00       	push   $0x10380d
  101a70:	e8 bf e7 ff ff       	call   100234 <cprintf>
  101a75:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a78:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101a7c:	d1 65 f0             	shll   -0x10(%ebp)
  101a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a82:	83 f8 17             	cmp    $0x17,%eax
  101a85:	76 b9                	jbe    101a40 <print_trapframe+0x130>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101a87:	8b 45 08             	mov    0x8(%ebp),%eax
  101a8a:	8b 40 40             	mov    0x40(%eax),%eax
  101a8d:	25 00 30 00 00       	and    $0x3000,%eax
  101a92:	c1 e8 0c             	shr    $0xc,%eax
  101a95:	83 ec 08             	sub    $0x8,%esp
  101a98:	50                   	push   %eax
  101a99:	68 11 38 10 00       	push   $0x103811
  101a9e:	e8 91 e7 ff ff       	call   100234 <cprintf>
  101aa3:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101aa6:	83 ec 0c             	sub    $0xc,%esp
  101aa9:	ff 75 08             	pushl  0x8(%ebp)
  101aac:	e8 49 fe ff ff       	call   1018fa <trap_in_kernel>
  101ab1:	83 c4 10             	add    $0x10,%esp
  101ab4:	85 c0                	test   %eax,%eax
  101ab6:	75 32                	jne    101aea <print_trapframe+0x1da>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101ab8:	8b 45 08             	mov    0x8(%ebp),%eax
  101abb:	8b 40 44             	mov    0x44(%eax),%eax
  101abe:	83 ec 08             	sub    $0x8,%esp
  101ac1:	50                   	push   %eax
  101ac2:	68 1a 38 10 00       	push   $0x10381a
  101ac7:	e8 68 e7 ff ff       	call   100234 <cprintf>
  101acc:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101acf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad2:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101ad6:	0f b7 c0             	movzwl %ax,%eax
  101ad9:	83 ec 08             	sub    $0x8,%esp
  101adc:	50                   	push   %eax
  101add:	68 29 38 10 00       	push   $0x103829
  101ae2:	e8 4d e7 ff ff       	call   100234 <cprintf>
  101ae7:	83 c4 10             	add    $0x10,%esp
    }
}
  101aea:	c9                   	leave  
  101aeb:	c3                   	ret    

00101aec <print_regs>:

void
print_regs(struct pushregs *regs) {
  101aec:	55                   	push   %ebp
  101aed:	89 e5                	mov    %esp,%ebp
  101aef:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101af2:	8b 45 08             	mov    0x8(%ebp),%eax
  101af5:	8b 00                	mov    (%eax),%eax
  101af7:	83 ec 08             	sub    $0x8,%esp
  101afa:	50                   	push   %eax
  101afb:	68 3c 38 10 00       	push   $0x10383c
  101b00:	e8 2f e7 ff ff       	call   100234 <cprintf>
  101b05:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b08:	8b 45 08             	mov    0x8(%ebp),%eax
  101b0b:	8b 40 04             	mov    0x4(%eax),%eax
  101b0e:	83 ec 08             	sub    $0x8,%esp
  101b11:	50                   	push   %eax
  101b12:	68 4b 38 10 00       	push   $0x10384b
  101b17:	e8 18 e7 ff ff       	call   100234 <cprintf>
  101b1c:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101b1f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b22:	8b 40 08             	mov    0x8(%eax),%eax
  101b25:	83 ec 08             	sub    $0x8,%esp
  101b28:	50                   	push   %eax
  101b29:	68 5a 38 10 00       	push   $0x10385a
  101b2e:	e8 01 e7 ff ff       	call   100234 <cprintf>
  101b33:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101b36:	8b 45 08             	mov    0x8(%ebp),%eax
  101b39:	8b 40 0c             	mov    0xc(%eax),%eax
  101b3c:	83 ec 08             	sub    $0x8,%esp
  101b3f:	50                   	push   %eax
  101b40:	68 69 38 10 00       	push   $0x103869
  101b45:	e8 ea e6 ff ff       	call   100234 <cprintf>
  101b4a:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101b4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b50:	8b 40 10             	mov    0x10(%eax),%eax
  101b53:	83 ec 08             	sub    $0x8,%esp
  101b56:	50                   	push   %eax
  101b57:	68 78 38 10 00       	push   $0x103878
  101b5c:	e8 d3 e6 ff ff       	call   100234 <cprintf>
  101b61:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101b64:	8b 45 08             	mov    0x8(%ebp),%eax
  101b67:	8b 40 14             	mov    0x14(%eax),%eax
  101b6a:	83 ec 08             	sub    $0x8,%esp
  101b6d:	50                   	push   %eax
  101b6e:	68 87 38 10 00       	push   $0x103887
  101b73:	e8 bc e6 ff ff       	call   100234 <cprintf>
  101b78:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101b7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7e:	8b 40 18             	mov    0x18(%eax),%eax
  101b81:	83 ec 08             	sub    $0x8,%esp
  101b84:	50                   	push   %eax
  101b85:	68 96 38 10 00       	push   $0x103896
  101b8a:	e8 a5 e6 ff ff       	call   100234 <cprintf>
  101b8f:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101b92:	8b 45 08             	mov    0x8(%ebp),%eax
  101b95:	8b 40 1c             	mov    0x1c(%eax),%eax
  101b98:	83 ec 08             	sub    $0x8,%esp
  101b9b:	50                   	push   %eax
  101b9c:	68 a5 38 10 00       	push   $0x1038a5
  101ba1:	e8 8e e6 ff ff       	call   100234 <cprintf>
  101ba6:	83 c4 10             	add    $0x10,%esp
}
  101ba9:	c9                   	leave  
  101baa:	c3                   	ret    

00101bab <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101bab:	55                   	push   %ebp
  101bac:	89 e5                	mov    %esp,%ebp
  101bae:	83 ec 18             	sub    $0x18,%esp
    char c;

    switch (tf->tf_trapno) {
  101bb1:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb4:	8b 40 30             	mov    0x30(%eax),%eax
  101bb7:	83 f8 2f             	cmp    $0x2f,%eax
  101bba:	77 1d                	ja     101bd9 <trap_dispatch+0x2e>
  101bbc:	83 f8 2e             	cmp    $0x2e,%eax
  101bbf:	0f 83 f5 00 00 00    	jae    101cba <trap_dispatch+0x10f>
  101bc5:	83 f8 21             	cmp    $0x21,%eax
  101bc8:	74 7f                	je     101c49 <trap_dispatch+0x9e>
  101bca:	83 f8 24             	cmp    $0x24,%eax
  101bcd:	74 56                	je     101c25 <trap_dispatch+0x7a>
  101bcf:	83 f8 20             	cmp    $0x20,%eax
  101bd2:	74 16                	je     101bea <trap_dispatch+0x3f>
  101bd4:	e9 ab 00 00 00       	jmp    101c84 <trap_dispatch+0xd9>
  101bd9:	83 e8 78             	sub    $0x78,%eax
  101bdc:	83 f8 01             	cmp    $0x1,%eax
  101bdf:	0f 87 9f 00 00 00    	ja     101c84 <trap_dispatch+0xd9>
  101be5:	e9 83 00 00 00       	jmp    101c6d <trap_dispatch+0xc2>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks ++;
  101bea:	a1 e8 f9 10 00       	mov    0x10f9e8,%eax
  101bef:	83 c0 01             	add    $0x1,%eax
  101bf2:	a3 e8 f9 10 00       	mov    %eax,0x10f9e8
        if (ticks % TICK_NUM == 0) {
  101bf7:	8b 0d e8 f9 10 00    	mov    0x10f9e8,%ecx
  101bfd:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101c02:	89 c8                	mov    %ecx,%eax
  101c04:	f7 e2                	mul    %edx
  101c06:	89 d0                	mov    %edx,%eax
  101c08:	c1 e8 05             	shr    $0x5,%eax
  101c0b:	6b c0 64             	imul   $0x64,%eax,%eax
  101c0e:	29 c1                	sub    %eax,%ecx
  101c10:	89 c8                	mov    %ecx,%eax
  101c12:	85 c0                	test   %eax,%eax
  101c14:	75 0a                	jne    101c20 <trap_dispatch+0x75>
            print_ticks();
  101c16:	e8 9d fb ff ff       	call   1017b8 <print_ticks>
        }
        break;
  101c1b:	e9 9b 00 00 00       	jmp    101cbb <trap_dispatch+0x110>
  101c20:	e9 96 00 00 00       	jmp    101cbb <trap_dispatch+0x110>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101c25:	e8 66 f9 ff ff       	call   101590 <cons_getc>
  101c2a:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101c2d:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c31:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c35:	83 ec 04             	sub    $0x4,%esp
  101c38:	52                   	push   %edx
  101c39:	50                   	push   %eax
  101c3a:	68 b4 38 10 00       	push   $0x1038b4
  101c3f:	e8 f0 e5 ff ff       	call   100234 <cprintf>
  101c44:	83 c4 10             	add    $0x10,%esp
        break;
  101c47:	eb 72                	jmp    101cbb <trap_dispatch+0x110>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101c49:	e8 42 f9 ff ff       	call   101590 <cons_getc>
  101c4e:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101c51:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c55:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c59:	83 ec 04             	sub    $0x4,%esp
  101c5c:	52                   	push   %edx
  101c5d:	50                   	push   %eax
  101c5e:	68 c6 38 10 00       	push   $0x1038c6
  101c63:	e8 cc e5 ff ff       	call   100234 <cprintf>
  101c68:	83 c4 10             	add    $0x10,%esp
        break;
  101c6b:	eb 4e                	jmp    101cbb <trap_dispatch+0x110>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101c6d:	83 ec 04             	sub    $0x4,%esp
  101c70:	68 d5 38 10 00       	push   $0x1038d5
  101c75:	68 ae 00 00 00       	push   $0xae
  101c7a:	68 e5 38 10 00       	push   $0x1038e5
  101c7f:	e8 15 e7 ff ff       	call   100399 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101c84:	8b 45 08             	mov    0x8(%ebp),%eax
  101c87:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101c8b:	0f b7 c0             	movzwl %ax,%eax
  101c8e:	83 e0 03             	and    $0x3,%eax
  101c91:	85 c0                	test   %eax,%eax
  101c93:	75 26                	jne    101cbb <trap_dispatch+0x110>
            print_trapframe(tf);
  101c95:	83 ec 0c             	sub    $0xc,%esp
  101c98:	ff 75 08             	pushl  0x8(%ebp)
  101c9b:	e8 70 fc ff ff       	call   101910 <print_trapframe>
  101ca0:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101ca3:	83 ec 04             	sub    $0x4,%esp
  101ca6:	68 f6 38 10 00       	push   $0x1038f6
  101cab:	68 b8 00 00 00       	push   $0xb8
  101cb0:	68 e5 38 10 00       	push   $0x1038e5
  101cb5:	e8 df e6 ff ff       	call   100399 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101cba:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101cbb:	c9                   	leave  
  101cbc:	c3                   	ret    

00101cbd <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101cbd:	55                   	push   %ebp
  101cbe:	89 e5                	mov    %esp,%ebp
  101cc0:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101cc3:	83 ec 0c             	sub    $0xc,%esp
  101cc6:	ff 75 08             	pushl  0x8(%ebp)
  101cc9:	e8 dd fe ff ff       	call   101bab <trap_dispatch>
  101cce:	83 c4 10             	add    $0x10,%esp
}
  101cd1:	c9                   	leave  
  101cd2:	c3                   	ret    

00101cd3 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101cd3:	6a 00                	push   $0x0
  pushl $0
  101cd5:	6a 00                	push   $0x0
  jmp __alltraps
  101cd7:	e9 67 0a 00 00       	jmp    102743 <__alltraps>

00101cdc <vector1>:
.globl vector1
vector1:
  pushl $0
  101cdc:	6a 00                	push   $0x0
  pushl $1
  101cde:	6a 01                	push   $0x1
  jmp __alltraps
  101ce0:	e9 5e 0a 00 00       	jmp    102743 <__alltraps>

00101ce5 <vector2>:
.globl vector2
vector2:
  pushl $0
  101ce5:	6a 00                	push   $0x0
  pushl $2
  101ce7:	6a 02                	push   $0x2
  jmp __alltraps
  101ce9:	e9 55 0a 00 00       	jmp    102743 <__alltraps>

00101cee <vector3>:
.globl vector3
vector3:
  pushl $0
  101cee:	6a 00                	push   $0x0
  pushl $3
  101cf0:	6a 03                	push   $0x3
  jmp __alltraps
  101cf2:	e9 4c 0a 00 00       	jmp    102743 <__alltraps>

00101cf7 <vector4>:
.globl vector4
vector4:
  pushl $0
  101cf7:	6a 00                	push   $0x0
  pushl $4
  101cf9:	6a 04                	push   $0x4
  jmp __alltraps
  101cfb:	e9 43 0a 00 00       	jmp    102743 <__alltraps>

00101d00 <vector5>:
.globl vector5
vector5:
  pushl $0
  101d00:	6a 00                	push   $0x0
  pushl $5
  101d02:	6a 05                	push   $0x5
  jmp __alltraps
  101d04:	e9 3a 0a 00 00       	jmp    102743 <__alltraps>

00101d09 <vector6>:
.globl vector6
vector6:
  pushl $0
  101d09:	6a 00                	push   $0x0
  pushl $6
  101d0b:	6a 06                	push   $0x6
  jmp __alltraps
  101d0d:	e9 31 0a 00 00       	jmp    102743 <__alltraps>

00101d12 <vector7>:
.globl vector7
vector7:
  pushl $0
  101d12:	6a 00                	push   $0x0
  pushl $7
  101d14:	6a 07                	push   $0x7
  jmp __alltraps
  101d16:	e9 28 0a 00 00       	jmp    102743 <__alltraps>

00101d1b <vector8>:
.globl vector8
vector8:
  pushl $8
  101d1b:	6a 08                	push   $0x8
  jmp __alltraps
  101d1d:	e9 21 0a 00 00       	jmp    102743 <__alltraps>

00101d22 <vector9>:
.globl vector9
vector9:
  pushl $9
  101d22:	6a 09                	push   $0x9
  jmp __alltraps
  101d24:	e9 1a 0a 00 00       	jmp    102743 <__alltraps>

00101d29 <vector10>:
.globl vector10
vector10:
  pushl $10
  101d29:	6a 0a                	push   $0xa
  jmp __alltraps
  101d2b:	e9 13 0a 00 00       	jmp    102743 <__alltraps>

00101d30 <vector11>:
.globl vector11
vector11:
  pushl $11
  101d30:	6a 0b                	push   $0xb
  jmp __alltraps
  101d32:	e9 0c 0a 00 00       	jmp    102743 <__alltraps>

00101d37 <vector12>:
.globl vector12
vector12:
  pushl $12
  101d37:	6a 0c                	push   $0xc
  jmp __alltraps
  101d39:	e9 05 0a 00 00       	jmp    102743 <__alltraps>

00101d3e <vector13>:
.globl vector13
vector13:
  pushl $13
  101d3e:	6a 0d                	push   $0xd
  jmp __alltraps
  101d40:	e9 fe 09 00 00       	jmp    102743 <__alltraps>

00101d45 <vector14>:
.globl vector14
vector14:
  pushl $14
  101d45:	6a 0e                	push   $0xe
  jmp __alltraps
  101d47:	e9 f7 09 00 00       	jmp    102743 <__alltraps>

00101d4c <vector15>:
.globl vector15
vector15:
  pushl $0
  101d4c:	6a 00                	push   $0x0
  pushl $15
  101d4e:	6a 0f                	push   $0xf
  jmp __alltraps
  101d50:	e9 ee 09 00 00       	jmp    102743 <__alltraps>

00101d55 <vector16>:
.globl vector16
vector16:
  pushl $0
  101d55:	6a 00                	push   $0x0
  pushl $16
  101d57:	6a 10                	push   $0x10
  jmp __alltraps
  101d59:	e9 e5 09 00 00       	jmp    102743 <__alltraps>

00101d5e <vector17>:
.globl vector17
vector17:
  pushl $17
  101d5e:	6a 11                	push   $0x11
  jmp __alltraps
  101d60:	e9 de 09 00 00       	jmp    102743 <__alltraps>

00101d65 <vector18>:
.globl vector18
vector18:
  pushl $0
  101d65:	6a 00                	push   $0x0
  pushl $18
  101d67:	6a 12                	push   $0x12
  jmp __alltraps
  101d69:	e9 d5 09 00 00       	jmp    102743 <__alltraps>

00101d6e <vector19>:
.globl vector19
vector19:
  pushl $0
  101d6e:	6a 00                	push   $0x0
  pushl $19
  101d70:	6a 13                	push   $0x13
  jmp __alltraps
  101d72:	e9 cc 09 00 00       	jmp    102743 <__alltraps>

00101d77 <vector20>:
.globl vector20
vector20:
  pushl $0
  101d77:	6a 00                	push   $0x0
  pushl $20
  101d79:	6a 14                	push   $0x14
  jmp __alltraps
  101d7b:	e9 c3 09 00 00       	jmp    102743 <__alltraps>

00101d80 <vector21>:
.globl vector21
vector21:
  pushl $0
  101d80:	6a 00                	push   $0x0
  pushl $21
  101d82:	6a 15                	push   $0x15
  jmp __alltraps
  101d84:	e9 ba 09 00 00       	jmp    102743 <__alltraps>

00101d89 <vector22>:
.globl vector22
vector22:
  pushl $0
  101d89:	6a 00                	push   $0x0
  pushl $22
  101d8b:	6a 16                	push   $0x16
  jmp __alltraps
  101d8d:	e9 b1 09 00 00       	jmp    102743 <__alltraps>

00101d92 <vector23>:
.globl vector23
vector23:
  pushl $0
  101d92:	6a 00                	push   $0x0
  pushl $23
  101d94:	6a 17                	push   $0x17
  jmp __alltraps
  101d96:	e9 a8 09 00 00       	jmp    102743 <__alltraps>

00101d9b <vector24>:
.globl vector24
vector24:
  pushl $0
  101d9b:	6a 00                	push   $0x0
  pushl $24
  101d9d:	6a 18                	push   $0x18
  jmp __alltraps
  101d9f:	e9 9f 09 00 00       	jmp    102743 <__alltraps>

00101da4 <vector25>:
.globl vector25
vector25:
  pushl $0
  101da4:	6a 00                	push   $0x0
  pushl $25
  101da6:	6a 19                	push   $0x19
  jmp __alltraps
  101da8:	e9 96 09 00 00       	jmp    102743 <__alltraps>

00101dad <vector26>:
.globl vector26
vector26:
  pushl $0
  101dad:	6a 00                	push   $0x0
  pushl $26
  101daf:	6a 1a                	push   $0x1a
  jmp __alltraps
  101db1:	e9 8d 09 00 00       	jmp    102743 <__alltraps>

00101db6 <vector27>:
.globl vector27
vector27:
  pushl $0
  101db6:	6a 00                	push   $0x0
  pushl $27
  101db8:	6a 1b                	push   $0x1b
  jmp __alltraps
  101dba:	e9 84 09 00 00       	jmp    102743 <__alltraps>

00101dbf <vector28>:
.globl vector28
vector28:
  pushl $0
  101dbf:	6a 00                	push   $0x0
  pushl $28
  101dc1:	6a 1c                	push   $0x1c
  jmp __alltraps
  101dc3:	e9 7b 09 00 00       	jmp    102743 <__alltraps>

00101dc8 <vector29>:
.globl vector29
vector29:
  pushl $0
  101dc8:	6a 00                	push   $0x0
  pushl $29
  101dca:	6a 1d                	push   $0x1d
  jmp __alltraps
  101dcc:	e9 72 09 00 00       	jmp    102743 <__alltraps>

00101dd1 <vector30>:
.globl vector30
vector30:
  pushl $0
  101dd1:	6a 00                	push   $0x0
  pushl $30
  101dd3:	6a 1e                	push   $0x1e
  jmp __alltraps
  101dd5:	e9 69 09 00 00       	jmp    102743 <__alltraps>

00101dda <vector31>:
.globl vector31
vector31:
  pushl $0
  101dda:	6a 00                	push   $0x0
  pushl $31
  101ddc:	6a 1f                	push   $0x1f
  jmp __alltraps
  101dde:	e9 60 09 00 00       	jmp    102743 <__alltraps>

00101de3 <vector32>:
.globl vector32
vector32:
  pushl $0
  101de3:	6a 00                	push   $0x0
  pushl $32
  101de5:	6a 20                	push   $0x20
  jmp __alltraps
  101de7:	e9 57 09 00 00       	jmp    102743 <__alltraps>

00101dec <vector33>:
.globl vector33
vector33:
  pushl $0
  101dec:	6a 00                	push   $0x0
  pushl $33
  101dee:	6a 21                	push   $0x21
  jmp __alltraps
  101df0:	e9 4e 09 00 00       	jmp    102743 <__alltraps>

00101df5 <vector34>:
.globl vector34
vector34:
  pushl $0
  101df5:	6a 00                	push   $0x0
  pushl $34
  101df7:	6a 22                	push   $0x22
  jmp __alltraps
  101df9:	e9 45 09 00 00       	jmp    102743 <__alltraps>

00101dfe <vector35>:
.globl vector35
vector35:
  pushl $0
  101dfe:	6a 00                	push   $0x0
  pushl $35
  101e00:	6a 23                	push   $0x23
  jmp __alltraps
  101e02:	e9 3c 09 00 00       	jmp    102743 <__alltraps>

00101e07 <vector36>:
.globl vector36
vector36:
  pushl $0
  101e07:	6a 00                	push   $0x0
  pushl $36
  101e09:	6a 24                	push   $0x24
  jmp __alltraps
  101e0b:	e9 33 09 00 00       	jmp    102743 <__alltraps>

00101e10 <vector37>:
.globl vector37
vector37:
  pushl $0
  101e10:	6a 00                	push   $0x0
  pushl $37
  101e12:	6a 25                	push   $0x25
  jmp __alltraps
  101e14:	e9 2a 09 00 00       	jmp    102743 <__alltraps>

00101e19 <vector38>:
.globl vector38
vector38:
  pushl $0
  101e19:	6a 00                	push   $0x0
  pushl $38
  101e1b:	6a 26                	push   $0x26
  jmp __alltraps
  101e1d:	e9 21 09 00 00       	jmp    102743 <__alltraps>

00101e22 <vector39>:
.globl vector39
vector39:
  pushl $0
  101e22:	6a 00                	push   $0x0
  pushl $39
  101e24:	6a 27                	push   $0x27
  jmp __alltraps
  101e26:	e9 18 09 00 00       	jmp    102743 <__alltraps>

00101e2b <vector40>:
.globl vector40
vector40:
  pushl $0
  101e2b:	6a 00                	push   $0x0
  pushl $40
  101e2d:	6a 28                	push   $0x28
  jmp __alltraps
  101e2f:	e9 0f 09 00 00       	jmp    102743 <__alltraps>

00101e34 <vector41>:
.globl vector41
vector41:
  pushl $0
  101e34:	6a 00                	push   $0x0
  pushl $41
  101e36:	6a 29                	push   $0x29
  jmp __alltraps
  101e38:	e9 06 09 00 00       	jmp    102743 <__alltraps>

00101e3d <vector42>:
.globl vector42
vector42:
  pushl $0
  101e3d:	6a 00                	push   $0x0
  pushl $42
  101e3f:	6a 2a                	push   $0x2a
  jmp __alltraps
  101e41:	e9 fd 08 00 00       	jmp    102743 <__alltraps>

00101e46 <vector43>:
.globl vector43
vector43:
  pushl $0
  101e46:	6a 00                	push   $0x0
  pushl $43
  101e48:	6a 2b                	push   $0x2b
  jmp __alltraps
  101e4a:	e9 f4 08 00 00       	jmp    102743 <__alltraps>

00101e4f <vector44>:
.globl vector44
vector44:
  pushl $0
  101e4f:	6a 00                	push   $0x0
  pushl $44
  101e51:	6a 2c                	push   $0x2c
  jmp __alltraps
  101e53:	e9 eb 08 00 00       	jmp    102743 <__alltraps>

00101e58 <vector45>:
.globl vector45
vector45:
  pushl $0
  101e58:	6a 00                	push   $0x0
  pushl $45
  101e5a:	6a 2d                	push   $0x2d
  jmp __alltraps
  101e5c:	e9 e2 08 00 00       	jmp    102743 <__alltraps>

00101e61 <vector46>:
.globl vector46
vector46:
  pushl $0
  101e61:	6a 00                	push   $0x0
  pushl $46
  101e63:	6a 2e                	push   $0x2e
  jmp __alltraps
  101e65:	e9 d9 08 00 00       	jmp    102743 <__alltraps>

00101e6a <vector47>:
.globl vector47
vector47:
  pushl $0
  101e6a:	6a 00                	push   $0x0
  pushl $47
  101e6c:	6a 2f                	push   $0x2f
  jmp __alltraps
  101e6e:	e9 d0 08 00 00       	jmp    102743 <__alltraps>

00101e73 <vector48>:
.globl vector48
vector48:
  pushl $0
  101e73:	6a 00                	push   $0x0
  pushl $48
  101e75:	6a 30                	push   $0x30
  jmp __alltraps
  101e77:	e9 c7 08 00 00       	jmp    102743 <__alltraps>

00101e7c <vector49>:
.globl vector49
vector49:
  pushl $0
  101e7c:	6a 00                	push   $0x0
  pushl $49
  101e7e:	6a 31                	push   $0x31
  jmp __alltraps
  101e80:	e9 be 08 00 00       	jmp    102743 <__alltraps>

00101e85 <vector50>:
.globl vector50
vector50:
  pushl $0
  101e85:	6a 00                	push   $0x0
  pushl $50
  101e87:	6a 32                	push   $0x32
  jmp __alltraps
  101e89:	e9 b5 08 00 00       	jmp    102743 <__alltraps>

00101e8e <vector51>:
.globl vector51
vector51:
  pushl $0
  101e8e:	6a 00                	push   $0x0
  pushl $51
  101e90:	6a 33                	push   $0x33
  jmp __alltraps
  101e92:	e9 ac 08 00 00       	jmp    102743 <__alltraps>

00101e97 <vector52>:
.globl vector52
vector52:
  pushl $0
  101e97:	6a 00                	push   $0x0
  pushl $52
  101e99:	6a 34                	push   $0x34
  jmp __alltraps
  101e9b:	e9 a3 08 00 00       	jmp    102743 <__alltraps>

00101ea0 <vector53>:
.globl vector53
vector53:
  pushl $0
  101ea0:	6a 00                	push   $0x0
  pushl $53
  101ea2:	6a 35                	push   $0x35
  jmp __alltraps
  101ea4:	e9 9a 08 00 00       	jmp    102743 <__alltraps>

00101ea9 <vector54>:
.globl vector54
vector54:
  pushl $0
  101ea9:	6a 00                	push   $0x0
  pushl $54
  101eab:	6a 36                	push   $0x36
  jmp __alltraps
  101ead:	e9 91 08 00 00       	jmp    102743 <__alltraps>

00101eb2 <vector55>:
.globl vector55
vector55:
  pushl $0
  101eb2:	6a 00                	push   $0x0
  pushl $55
  101eb4:	6a 37                	push   $0x37
  jmp __alltraps
  101eb6:	e9 88 08 00 00       	jmp    102743 <__alltraps>

00101ebb <vector56>:
.globl vector56
vector56:
  pushl $0
  101ebb:	6a 00                	push   $0x0
  pushl $56
  101ebd:	6a 38                	push   $0x38
  jmp __alltraps
  101ebf:	e9 7f 08 00 00       	jmp    102743 <__alltraps>

00101ec4 <vector57>:
.globl vector57
vector57:
  pushl $0
  101ec4:	6a 00                	push   $0x0
  pushl $57
  101ec6:	6a 39                	push   $0x39
  jmp __alltraps
  101ec8:	e9 76 08 00 00       	jmp    102743 <__alltraps>

00101ecd <vector58>:
.globl vector58
vector58:
  pushl $0
  101ecd:	6a 00                	push   $0x0
  pushl $58
  101ecf:	6a 3a                	push   $0x3a
  jmp __alltraps
  101ed1:	e9 6d 08 00 00       	jmp    102743 <__alltraps>

00101ed6 <vector59>:
.globl vector59
vector59:
  pushl $0
  101ed6:	6a 00                	push   $0x0
  pushl $59
  101ed8:	6a 3b                	push   $0x3b
  jmp __alltraps
  101eda:	e9 64 08 00 00       	jmp    102743 <__alltraps>

00101edf <vector60>:
.globl vector60
vector60:
  pushl $0
  101edf:	6a 00                	push   $0x0
  pushl $60
  101ee1:	6a 3c                	push   $0x3c
  jmp __alltraps
  101ee3:	e9 5b 08 00 00       	jmp    102743 <__alltraps>

00101ee8 <vector61>:
.globl vector61
vector61:
  pushl $0
  101ee8:	6a 00                	push   $0x0
  pushl $61
  101eea:	6a 3d                	push   $0x3d
  jmp __alltraps
  101eec:	e9 52 08 00 00       	jmp    102743 <__alltraps>

00101ef1 <vector62>:
.globl vector62
vector62:
  pushl $0
  101ef1:	6a 00                	push   $0x0
  pushl $62
  101ef3:	6a 3e                	push   $0x3e
  jmp __alltraps
  101ef5:	e9 49 08 00 00       	jmp    102743 <__alltraps>

00101efa <vector63>:
.globl vector63
vector63:
  pushl $0
  101efa:	6a 00                	push   $0x0
  pushl $63
  101efc:	6a 3f                	push   $0x3f
  jmp __alltraps
  101efe:	e9 40 08 00 00       	jmp    102743 <__alltraps>

00101f03 <vector64>:
.globl vector64
vector64:
  pushl $0
  101f03:	6a 00                	push   $0x0
  pushl $64
  101f05:	6a 40                	push   $0x40
  jmp __alltraps
  101f07:	e9 37 08 00 00       	jmp    102743 <__alltraps>

00101f0c <vector65>:
.globl vector65
vector65:
  pushl $0
  101f0c:	6a 00                	push   $0x0
  pushl $65
  101f0e:	6a 41                	push   $0x41
  jmp __alltraps
  101f10:	e9 2e 08 00 00       	jmp    102743 <__alltraps>

00101f15 <vector66>:
.globl vector66
vector66:
  pushl $0
  101f15:	6a 00                	push   $0x0
  pushl $66
  101f17:	6a 42                	push   $0x42
  jmp __alltraps
  101f19:	e9 25 08 00 00       	jmp    102743 <__alltraps>

00101f1e <vector67>:
.globl vector67
vector67:
  pushl $0
  101f1e:	6a 00                	push   $0x0
  pushl $67
  101f20:	6a 43                	push   $0x43
  jmp __alltraps
  101f22:	e9 1c 08 00 00       	jmp    102743 <__alltraps>

00101f27 <vector68>:
.globl vector68
vector68:
  pushl $0
  101f27:	6a 00                	push   $0x0
  pushl $68
  101f29:	6a 44                	push   $0x44
  jmp __alltraps
  101f2b:	e9 13 08 00 00       	jmp    102743 <__alltraps>

00101f30 <vector69>:
.globl vector69
vector69:
  pushl $0
  101f30:	6a 00                	push   $0x0
  pushl $69
  101f32:	6a 45                	push   $0x45
  jmp __alltraps
  101f34:	e9 0a 08 00 00       	jmp    102743 <__alltraps>

00101f39 <vector70>:
.globl vector70
vector70:
  pushl $0
  101f39:	6a 00                	push   $0x0
  pushl $70
  101f3b:	6a 46                	push   $0x46
  jmp __alltraps
  101f3d:	e9 01 08 00 00       	jmp    102743 <__alltraps>

00101f42 <vector71>:
.globl vector71
vector71:
  pushl $0
  101f42:	6a 00                	push   $0x0
  pushl $71
  101f44:	6a 47                	push   $0x47
  jmp __alltraps
  101f46:	e9 f8 07 00 00       	jmp    102743 <__alltraps>

00101f4b <vector72>:
.globl vector72
vector72:
  pushl $0
  101f4b:	6a 00                	push   $0x0
  pushl $72
  101f4d:	6a 48                	push   $0x48
  jmp __alltraps
  101f4f:	e9 ef 07 00 00       	jmp    102743 <__alltraps>

00101f54 <vector73>:
.globl vector73
vector73:
  pushl $0
  101f54:	6a 00                	push   $0x0
  pushl $73
  101f56:	6a 49                	push   $0x49
  jmp __alltraps
  101f58:	e9 e6 07 00 00       	jmp    102743 <__alltraps>

00101f5d <vector74>:
.globl vector74
vector74:
  pushl $0
  101f5d:	6a 00                	push   $0x0
  pushl $74
  101f5f:	6a 4a                	push   $0x4a
  jmp __alltraps
  101f61:	e9 dd 07 00 00       	jmp    102743 <__alltraps>

00101f66 <vector75>:
.globl vector75
vector75:
  pushl $0
  101f66:	6a 00                	push   $0x0
  pushl $75
  101f68:	6a 4b                	push   $0x4b
  jmp __alltraps
  101f6a:	e9 d4 07 00 00       	jmp    102743 <__alltraps>

00101f6f <vector76>:
.globl vector76
vector76:
  pushl $0
  101f6f:	6a 00                	push   $0x0
  pushl $76
  101f71:	6a 4c                	push   $0x4c
  jmp __alltraps
  101f73:	e9 cb 07 00 00       	jmp    102743 <__alltraps>

00101f78 <vector77>:
.globl vector77
vector77:
  pushl $0
  101f78:	6a 00                	push   $0x0
  pushl $77
  101f7a:	6a 4d                	push   $0x4d
  jmp __alltraps
  101f7c:	e9 c2 07 00 00       	jmp    102743 <__alltraps>

00101f81 <vector78>:
.globl vector78
vector78:
  pushl $0
  101f81:	6a 00                	push   $0x0
  pushl $78
  101f83:	6a 4e                	push   $0x4e
  jmp __alltraps
  101f85:	e9 b9 07 00 00       	jmp    102743 <__alltraps>

00101f8a <vector79>:
.globl vector79
vector79:
  pushl $0
  101f8a:	6a 00                	push   $0x0
  pushl $79
  101f8c:	6a 4f                	push   $0x4f
  jmp __alltraps
  101f8e:	e9 b0 07 00 00       	jmp    102743 <__alltraps>

00101f93 <vector80>:
.globl vector80
vector80:
  pushl $0
  101f93:	6a 00                	push   $0x0
  pushl $80
  101f95:	6a 50                	push   $0x50
  jmp __alltraps
  101f97:	e9 a7 07 00 00       	jmp    102743 <__alltraps>

00101f9c <vector81>:
.globl vector81
vector81:
  pushl $0
  101f9c:	6a 00                	push   $0x0
  pushl $81
  101f9e:	6a 51                	push   $0x51
  jmp __alltraps
  101fa0:	e9 9e 07 00 00       	jmp    102743 <__alltraps>

00101fa5 <vector82>:
.globl vector82
vector82:
  pushl $0
  101fa5:	6a 00                	push   $0x0
  pushl $82
  101fa7:	6a 52                	push   $0x52
  jmp __alltraps
  101fa9:	e9 95 07 00 00       	jmp    102743 <__alltraps>

00101fae <vector83>:
.globl vector83
vector83:
  pushl $0
  101fae:	6a 00                	push   $0x0
  pushl $83
  101fb0:	6a 53                	push   $0x53
  jmp __alltraps
  101fb2:	e9 8c 07 00 00       	jmp    102743 <__alltraps>

00101fb7 <vector84>:
.globl vector84
vector84:
  pushl $0
  101fb7:	6a 00                	push   $0x0
  pushl $84
  101fb9:	6a 54                	push   $0x54
  jmp __alltraps
  101fbb:	e9 83 07 00 00       	jmp    102743 <__alltraps>

00101fc0 <vector85>:
.globl vector85
vector85:
  pushl $0
  101fc0:	6a 00                	push   $0x0
  pushl $85
  101fc2:	6a 55                	push   $0x55
  jmp __alltraps
  101fc4:	e9 7a 07 00 00       	jmp    102743 <__alltraps>

00101fc9 <vector86>:
.globl vector86
vector86:
  pushl $0
  101fc9:	6a 00                	push   $0x0
  pushl $86
  101fcb:	6a 56                	push   $0x56
  jmp __alltraps
  101fcd:	e9 71 07 00 00       	jmp    102743 <__alltraps>

00101fd2 <vector87>:
.globl vector87
vector87:
  pushl $0
  101fd2:	6a 00                	push   $0x0
  pushl $87
  101fd4:	6a 57                	push   $0x57
  jmp __alltraps
  101fd6:	e9 68 07 00 00       	jmp    102743 <__alltraps>

00101fdb <vector88>:
.globl vector88
vector88:
  pushl $0
  101fdb:	6a 00                	push   $0x0
  pushl $88
  101fdd:	6a 58                	push   $0x58
  jmp __alltraps
  101fdf:	e9 5f 07 00 00       	jmp    102743 <__alltraps>

00101fe4 <vector89>:
.globl vector89
vector89:
  pushl $0
  101fe4:	6a 00                	push   $0x0
  pushl $89
  101fe6:	6a 59                	push   $0x59
  jmp __alltraps
  101fe8:	e9 56 07 00 00       	jmp    102743 <__alltraps>

00101fed <vector90>:
.globl vector90
vector90:
  pushl $0
  101fed:	6a 00                	push   $0x0
  pushl $90
  101fef:	6a 5a                	push   $0x5a
  jmp __alltraps
  101ff1:	e9 4d 07 00 00       	jmp    102743 <__alltraps>

00101ff6 <vector91>:
.globl vector91
vector91:
  pushl $0
  101ff6:	6a 00                	push   $0x0
  pushl $91
  101ff8:	6a 5b                	push   $0x5b
  jmp __alltraps
  101ffa:	e9 44 07 00 00       	jmp    102743 <__alltraps>

00101fff <vector92>:
.globl vector92
vector92:
  pushl $0
  101fff:	6a 00                	push   $0x0
  pushl $92
  102001:	6a 5c                	push   $0x5c
  jmp __alltraps
  102003:	e9 3b 07 00 00       	jmp    102743 <__alltraps>

00102008 <vector93>:
.globl vector93
vector93:
  pushl $0
  102008:	6a 00                	push   $0x0
  pushl $93
  10200a:	6a 5d                	push   $0x5d
  jmp __alltraps
  10200c:	e9 32 07 00 00       	jmp    102743 <__alltraps>

00102011 <vector94>:
.globl vector94
vector94:
  pushl $0
  102011:	6a 00                	push   $0x0
  pushl $94
  102013:	6a 5e                	push   $0x5e
  jmp __alltraps
  102015:	e9 29 07 00 00       	jmp    102743 <__alltraps>

0010201a <vector95>:
.globl vector95
vector95:
  pushl $0
  10201a:	6a 00                	push   $0x0
  pushl $95
  10201c:	6a 5f                	push   $0x5f
  jmp __alltraps
  10201e:	e9 20 07 00 00       	jmp    102743 <__alltraps>

00102023 <vector96>:
.globl vector96
vector96:
  pushl $0
  102023:	6a 00                	push   $0x0
  pushl $96
  102025:	6a 60                	push   $0x60
  jmp __alltraps
  102027:	e9 17 07 00 00       	jmp    102743 <__alltraps>

0010202c <vector97>:
.globl vector97
vector97:
  pushl $0
  10202c:	6a 00                	push   $0x0
  pushl $97
  10202e:	6a 61                	push   $0x61
  jmp __alltraps
  102030:	e9 0e 07 00 00       	jmp    102743 <__alltraps>

00102035 <vector98>:
.globl vector98
vector98:
  pushl $0
  102035:	6a 00                	push   $0x0
  pushl $98
  102037:	6a 62                	push   $0x62
  jmp __alltraps
  102039:	e9 05 07 00 00       	jmp    102743 <__alltraps>

0010203e <vector99>:
.globl vector99
vector99:
  pushl $0
  10203e:	6a 00                	push   $0x0
  pushl $99
  102040:	6a 63                	push   $0x63
  jmp __alltraps
  102042:	e9 fc 06 00 00       	jmp    102743 <__alltraps>

00102047 <vector100>:
.globl vector100
vector100:
  pushl $0
  102047:	6a 00                	push   $0x0
  pushl $100
  102049:	6a 64                	push   $0x64
  jmp __alltraps
  10204b:	e9 f3 06 00 00       	jmp    102743 <__alltraps>

00102050 <vector101>:
.globl vector101
vector101:
  pushl $0
  102050:	6a 00                	push   $0x0
  pushl $101
  102052:	6a 65                	push   $0x65
  jmp __alltraps
  102054:	e9 ea 06 00 00       	jmp    102743 <__alltraps>

00102059 <vector102>:
.globl vector102
vector102:
  pushl $0
  102059:	6a 00                	push   $0x0
  pushl $102
  10205b:	6a 66                	push   $0x66
  jmp __alltraps
  10205d:	e9 e1 06 00 00       	jmp    102743 <__alltraps>

00102062 <vector103>:
.globl vector103
vector103:
  pushl $0
  102062:	6a 00                	push   $0x0
  pushl $103
  102064:	6a 67                	push   $0x67
  jmp __alltraps
  102066:	e9 d8 06 00 00       	jmp    102743 <__alltraps>

0010206b <vector104>:
.globl vector104
vector104:
  pushl $0
  10206b:	6a 00                	push   $0x0
  pushl $104
  10206d:	6a 68                	push   $0x68
  jmp __alltraps
  10206f:	e9 cf 06 00 00       	jmp    102743 <__alltraps>

00102074 <vector105>:
.globl vector105
vector105:
  pushl $0
  102074:	6a 00                	push   $0x0
  pushl $105
  102076:	6a 69                	push   $0x69
  jmp __alltraps
  102078:	e9 c6 06 00 00       	jmp    102743 <__alltraps>

0010207d <vector106>:
.globl vector106
vector106:
  pushl $0
  10207d:	6a 00                	push   $0x0
  pushl $106
  10207f:	6a 6a                	push   $0x6a
  jmp __alltraps
  102081:	e9 bd 06 00 00       	jmp    102743 <__alltraps>

00102086 <vector107>:
.globl vector107
vector107:
  pushl $0
  102086:	6a 00                	push   $0x0
  pushl $107
  102088:	6a 6b                	push   $0x6b
  jmp __alltraps
  10208a:	e9 b4 06 00 00       	jmp    102743 <__alltraps>

0010208f <vector108>:
.globl vector108
vector108:
  pushl $0
  10208f:	6a 00                	push   $0x0
  pushl $108
  102091:	6a 6c                	push   $0x6c
  jmp __alltraps
  102093:	e9 ab 06 00 00       	jmp    102743 <__alltraps>

00102098 <vector109>:
.globl vector109
vector109:
  pushl $0
  102098:	6a 00                	push   $0x0
  pushl $109
  10209a:	6a 6d                	push   $0x6d
  jmp __alltraps
  10209c:	e9 a2 06 00 00       	jmp    102743 <__alltraps>

001020a1 <vector110>:
.globl vector110
vector110:
  pushl $0
  1020a1:	6a 00                	push   $0x0
  pushl $110
  1020a3:	6a 6e                	push   $0x6e
  jmp __alltraps
  1020a5:	e9 99 06 00 00       	jmp    102743 <__alltraps>

001020aa <vector111>:
.globl vector111
vector111:
  pushl $0
  1020aa:	6a 00                	push   $0x0
  pushl $111
  1020ac:	6a 6f                	push   $0x6f
  jmp __alltraps
  1020ae:	e9 90 06 00 00       	jmp    102743 <__alltraps>

001020b3 <vector112>:
.globl vector112
vector112:
  pushl $0
  1020b3:	6a 00                	push   $0x0
  pushl $112
  1020b5:	6a 70                	push   $0x70
  jmp __alltraps
  1020b7:	e9 87 06 00 00       	jmp    102743 <__alltraps>

001020bc <vector113>:
.globl vector113
vector113:
  pushl $0
  1020bc:	6a 00                	push   $0x0
  pushl $113
  1020be:	6a 71                	push   $0x71
  jmp __alltraps
  1020c0:	e9 7e 06 00 00       	jmp    102743 <__alltraps>

001020c5 <vector114>:
.globl vector114
vector114:
  pushl $0
  1020c5:	6a 00                	push   $0x0
  pushl $114
  1020c7:	6a 72                	push   $0x72
  jmp __alltraps
  1020c9:	e9 75 06 00 00       	jmp    102743 <__alltraps>

001020ce <vector115>:
.globl vector115
vector115:
  pushl $0
  1020ce:	6a 00                	push   $0x0
  pushl $115
  1020d0:	6a 73                	push   $0x73
  jmp __alltraps
  1020d2:	e9 6c 06 00 00       	jmp    102743 <__alltraps>

001020d7 <vector116>:
.globl vector116
vector116:
  pushl $0
  1020d7:	6a 00                	push   $0x0
  pushl $116
  1020d9:	6a 74                	push   $0x74
  jmp __alltraps
  1020db:	e9 63 06 00 00       	jmp    102743 <__alltraps>

001020e0 <vector117>:
.globl vector117
vector117:
  pushl $0
  1020e0:	6a 00                	push   $0x0
  pushl $117
  1020e2:	6a 75                	push   $0x75
  jmp __alltraps
  1020e4:	e9 5a 06 00 00       	jmp    102743 <__alltraps>

001020e9 <vector118>:
.globl vector118
vector118:
  pushl $0
  1020e9:	6a 00                	push   $0x0
  pushl $118
  1020eb:	6a 76                	push   $0x76
  jmp __alltraps
  1020ed:	e9 51 06 00 00       	jmp    102743 <__alltraps>

001020f2 <vector119>:
.globl vector119
vector119:
  pushl $0
  1020f2:	6a 00                	push   $0x0
  pushl $119
  1020f4:	6a 77                	push   $0x77
  jmp __alltraps
  1020f6:	e9 48 06 00 00       	jmp    102743 <__alltraps>

001020fb <vector120>:
.globl vector120
vector120:
  pushl $0
  1020fb:	6a 00                	push   $0x0
  pushl $120
  1020fd:	6a 78                	push   $0x78
  jmp __alltraps
  1020ff:	e9 3f 06 00 00       	jmp    102743 <__alltraps>

00102104 <vector121>:
.globl vector121
vector121:
  pushl $0
  102104:	6a 00                	push   $0x0
  pushl $121
  102106:	6a 79                	push   $0x79
  jmp __alltraps
  102108:	e9 36 06 00 00       	jmp    102743 <__alltraps>

0010210d <vector122>:
.globl vector122
vector122:
  pushl $0
  10210d:	6a 00                	push   $0x0
  pushl $122
  10210f:	6a 7a                	push   $0x7a
  jmp __alltraps
  102111:	e9 2d 06 00 00       	jmp    102743 <__alltraps>

00102116 <vector123>:
.globl vector123
vector123:
  pushl $0
  102116:	6a 00                	push   $0x0
  pushl $123
  102118:	6a 7b                	push   $0x7b
  jmp __alltraps
  10211a:	e9 24 06 00 00       	jmp    102743 <__alltraps>

0010211f <vector124>:
.globl vector124
vector124:
  pushl $0
  10211f:	6a 00                	push   $0x0
  pushl $124
  102121:	6a 7c                	push   $0x7c
  jmp __alltraps
  102123:	e9 1b 06 00 00       	jmp    102743 <__alltraps>

00102128 <vector125>:
.globl vector125
vector125:
  pushl $0
  102128:	6a 00                	push   $0x0
  pushl $125
  10212a:	6a 7d                	push   $0x7d
  jmp __alltraps
  10212c:	e9 12 06 00 00       	jmp    102743 <__alltraps>

00102131 <vector126>:
.globl vector126
vector126:
  pushl $0
  102131:	6a 00                	push   $0x0
  pushl $126
  102133:	6a 7e                	push   $0x7e
  jmp __alltraps
  102135:	e9 09 06 00 00       	jmp    102743 <__alltraps>

0010213a <vector127>:
.globl vector127
vector127:
  pushl $0
  10213a:	6a 00                	push   $0x0
  pushl $127
  10213c:	6a 7f                	push   $0x7f
  jmp __alltraps
  10213e:	e9 00 06 00 00       	jmp    102743 <__alltraps>

00102143 <vector128>:
.globl vector128
vector128:
  pushl $0
  102143:	6a 00                	push   $0x0
  pushl $128
  102145:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10214a:	e9 f4 05 00 00       	jmp    102743 <__alltraps>

0010214f <vector129>:
.globl vector129
vector129:
  pushl $0
  10214f:	6a 00                	push   $0x0
  pushl $129
  102151:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102156:	e9 e8 05 00 00       	jmp    102743 <__alltraps>

0010215b <vector130>:
.globl vector130
vector130:
  pushl $0
  10215b:	6a 00                	push   $0x0
  pushl $130
  10215d:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102162:	e9 dc 05 00 00       	jmp    102743 <__alltraps>

00102167 <vector131>:
.globl vector131
vector131:
  pushl $0
  102167:	6a 00                	push   $0x0
  pushl $131
  102169:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10216e:	e9 d0 05 00 00       	jmp    102743 <__alltraps>

00102173 <vector132>:
.globl vector132
vector132:
  pushl $0
  102173:	6a 00                	push   $0x0
  pushl $132
  102175:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10217a:	e9 c4 05 00 00       	jmp    102743 <__alltraps>

0010217f <vector133>:
.globl vector133
vector133:
  pushl $0
  10217f:	6a 00                	push   $0x0
  pushl $133
  102181:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102186:	e9 b8 05 00 00       	jmp    102743 <__alltraps>

0010218b <vector134>:
.globl vector134
vector134:
  pushl $0
  10218b:	6a 00                	push   $0x0
  pushl $134
  10218d:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102192:	e9 ac 05 00 00       	jmp    102743 <__alltraps>

00102197 <vector135>:
.globl vector135
vector135:
  pushl $0
  102197:	6a 00                	push   $0x0
  pushl $135
  102199:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10219e:	e9 a0 05 00 00       	jmp    102743 <__alltraps>

001021a3 <vector136>:
.globl vector136
vector136:
  pushl $0
  1021a3:	6a 00                	push   $0x0
  pushl $136
  1021a5:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1021aa:	e9 94 05 00 00       	jmp    102743 <__alltraps>

001021af <vector137>:
.globl vector137
vector137:
  pushl $0
  1021af:	6a 00                	push   $0x0
  pushl $137
  1021b1:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1021b6:	e9 88 05 00 00       	jmp    102743 <__alltraps>

001021bb <vector138>:
.globl vector138
vector138:
  pushl $0
  1021bb:	6a 00                	push   $0x0
  pushl $138
  1021bd:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1021c2:	e9 7c 05 00 00       	jmp    102743 <__alltraps>

001021c7 <vector139>:
.globl vector139
vector139:
  pushl $0
  1021c7:	6a 00                	push   $0x0
  pushl $139
  1021c9:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1021ce:	e9 70 05 00 00       	jmp    102743 <__alltraps>

001021d3 <vector140>:
.globl vector140
vector140:
  pushl $0
  1021d3:	6a 00                	push   $0x0
  pushl $140
  1021d5:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1021da:	e9 64 05 00 00       	jmp    102743 <__alltraps>

001021df <vector141>:
.globl vector141
vector141:
  pushl $0
  1021df:	6a 00                	push   $0x0
  pushl $141
  1021e1:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1021e6:	e9 58 05 00 00       	jmp    102743 <__alltraps>

001021eb <vector142>:
.globl vector142
vector142:
  pushl $0
  1021eb:	6a 00                	push   $0x0
  pushl $142
  1021ed:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1021f2:	e9 4c 05 00 00       	jmp    102743 <__alltraps>

001021f7 <vector143>:
.globl vector143
vector143:
  pushl $0
  1021f7:	6a 00                	push   $0x0
  pushl $143
  1021f9:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1021fe:	e9 40 05 00 00       	jmp    102743 <__alltraps>

00102203 <vector144>:
.globl vector144
vector144:
  pushl $0
  102203:	6a 00                	push   $0x0
  pushl $144
  102205:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  10220a:	e9 34 05 00 00       	jmp    102743 <__alltraps>

0010220f <vector145>:
.globl vector145
vector145:
  pushl $0
  10220f:	6a 00                	push   $0x0
  pushl $145
  102211:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102216:	e9 28 05 00 00       	jmp    102743 <__alltraps>

0010221b <vector146>:
.globl vector146
vector146:
  pushl $0
  10221b:	6a 00                	push   $0x0
  pushl $146
  10221d:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102222:	e9 1c 05 00 00       	jmp    102743 <__alltraps>

00102227 <vector147>:
.globl vector147
vector147:
  pushl $0
  102227:	6a 00                	push   $0x0
  pushl $147
  102229:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10222e:	e9 10 05 00 00       	jmp    102743 <__alltraps>

00102233 <vector148>:
.globl vector148
vector148:
  pushl $0
  102233:	6a 00                	push   $0x0
  pushl $148
  102235:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10223a:	e9 04 05 00 00       	jmp    102743 <__alltraps>

0010223f <vector149>:
.globl vector149
vector149:
  pushl $0
  10223f:	6a 00                	push   $0x0
  pushl $149
  102241:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102246:	e9 f8 04 00 00       	jmp    102743 <__alltraps>

0010224b <vector150>:
.globl vector150
vector150:
  pushl $0
  10224b:	6a 00                	push   $0x0
  pushl $150
  10224d:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102252:	e9 ec 04 00 00       	jmp    102743 <__alltraps>

00102257 <vector151>:
.globl vector151
vector151:
  pushl $0
  102257:	6a 00                	push   $0x0
  pushl $151
  102259:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10225e:	e9 e0 04 00 00       	jmp    102743 <__alltraps>

00102263 <vector152>:
.globl vector152
vector152:
  pushl $0
  102263:	6a 00                	push   $0x0
  pushl $152
  102265:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10226a:	e9 d4 04 00 00       	jmp    102743 <__alltraps>

0010226f <vector153>:
.globl vector153
vector153:
  pushl $0
  10226f:	6a 00                	push   $0x0
  pushl $153
  102271:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102276:	e9 c8 04 00 00       	jmp    102743 <__alltraps>

0010227b <vector154>:
.globl vector154
vector154:
  pushl $0
  10227b:	6a 00                	push   $0x0
  pushl $154
  10227d:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102282:	e9 bc 04 00 00       	jmp    102743 <__alltraps>

00102287 <vector155>:
.globl vector155
vector155:
  pushl $0
  102287:	6a 00                	push   $0x0
  pushl $155
  102289:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10228e:	e9 b0 04 00 00       	jmp    102743 <__alltraps>

00102293 <vector156>:
.globl vector156
vector156:
  pushl $0
  102293:	6a 00                	push   $0x0
  pushl $156
  102295:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10229a:	e9 a4 04 00 00       	jmp    102743 <__alltraps>

0010229f <vector157>:
.globl vector157
vector157:
  pushl $0
  10229f:	6a 00                	push   $0x0
  pushl $157
  1022a1:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1022a6:	e9 98 04 00 00       	jmp    102743 <__alltraps>

001022ab <vector158>:
.globl vector158
vector158:
  pushl $0
  1022ab:	6a 00                	push   $0x0
  pushl $158
  1022ad:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1022b2:	e9 8c 04 00 00       	jmp    102743 <__alltraps>

001022b7 <vector159>:
.globl vector159
vector159:
  pushl $0
  1022b7:	6a 00                	push   $0x0
  pushl $159
  1022b9:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1022be:	e9 80 04 00 00       	jmp    102743 <__alltraps>

001022c3 <vector160>:
.globl vector160
vector160:
  pushl $0
  1022c3:	6a 00                	push   $0x0
  pushl $160
  1022c5:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1022ca:	e9 74 04 00 00       	jmp    102743 <__alltraps>

001022cf <vector161>:
.globl vector161
vector161:
  pushl $0
  1022cf:	6a 00                	push   $0x0
  pushl $161
  1022d1:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1022d6:	e9 68 04 00 00       	jmp    102743 <__alltraps>

001022db <vector162>:
.globl vector162
vector162:
  pushl $0
  1022db:	6a 00                	push   $0x0
  pushl $162
  1022dd:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1022e2:	e9 5c 04 00 00       	jmp    102743 <__alltraps>

001022e7 <vector163>:
.globl vector163
vector163:
  pushl $0
  1022e7:	6a 00                	push   $0x0
  pushl $163
  1022e9:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1022ee:	e9 50 04 00 00       	jmp    102743 <__alltraps>

001022f3 <vector164>:
.globl vector164
vector164:
  pushl $0
  1022f3:	6a 00                	push   $0x0
  pushl $164
  1022f5:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1022fa:	e9 44 04 00 00       	jmp    102743 <__alltraps>

001022ff <vector165>:
.globl vector165
vector165:
  pushl $0
  1022ff:	6a 00                	push   $0x0
  pushl $165
  102301:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102306:	e9 38 04 00 00       	jmp    102743 <__alltraps>

0010230b <vector166>:
.globl vector166
vector166:
  pushl $0
  10230b:	6a 00                	push   $0x0
  pushl $166
  10230d:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102312:	e9 2c 04 00 00       	jmp    102743 <__alltraps>

00102317 <vector167>:
.globl vector167
vector167:
  pushl $0
  102317:	6a 00                	push   $0x0
  pushl $167
  102319:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10231e:	e9 20 04 00 00       	jmp    102743 <__alltraps>

00102323 <vector168>:
.globl vector168
vector168:
  pushl $0
  102323:	6a 00                	push   $0x0
  pushl $168
  102325:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10232a:	e9 14 04 00 00       	jmp    102743 <__alltraps>

0010232f <vector169>:
.globl vector169
vector169:
  pushl $0
  10232f:	6a 00                	push   $0x0
  pushl $169
  102331:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102336:	e9 08 04 00 00       	jmp    102743 <__alltraps>

0010233b <vector170>:
.globl vector170
vector170:
  pushl $0
  10233b:	6a 00                	push   $0x0
  pushl $170
  10233d:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102342:	e9 fc 03 00 00       	jmp    102743 <__alltraps>

00102347 <vector171>:
.globl vector171
vector171:
  pushl $0
  102347:	6a 00                	push   $0x0
  pushl $171
  102349:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10234e:	e9 f0 03 00 00       	jmp    102743 <__alltraps>

00102353 <vector172>:
.globl vector172
vector172:
  pushl $0
  102353:	6a 00                	push   $0x0
  pushl $172
  102355:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10235a:	e9 e4 03 00 00       	jmp    102743 <__alltraps>

0010235f <vector173>:
.globl vector173
vector173:
  pushl $0
  10235f:	6a 00                	push   $0x0
  pushl $173
  102361:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102366:	e9 d8 03 00 00       	jmp    102743 <__alltraps>

0010236b <vector174>:
.globl vector174
vector174:
  pushl $0
  10236b:	6a 00                	push   $0x0
  pushl $174
  10236d:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102372:	e9 cc 03 00 00       	jmp    102743 <__alltraps>

00102377 <vector175>:
.globl vector175
vector175:
  pushl $0
  102377:	6a 00                	push   $0x0
  pushl $175
  102379:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10237e:	e9 c0 03 00 00       	jmp    102743 <__alltraps>

00102383 <vector176>:
.globl vector176
vector176:
  pushl $0
  102383:	6a 00                	push   $0x0
  pushl $176
  102385:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10238a:	e9 b4 03 00 00       	jmp    102743 <__alltraps>

0010238f <vector177>:
.globl vector177
vector177:
  pushl $0
  10238f:	6a 00                	push   $0x0
  pushl $177
  102391:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102396:	e9 a8 03 00 00       	jmp    102743 <__alltraps>

0010239b <vector178>:
.globl vector178
vector178:
  pushl $0
  10239b:	6a 00                	push   $0x0
  pushl $178
  10239d:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1023a2:	e9 9c 03 00 00       	jmp    102743 <__alltraps>

001023a7 <vector179>:
.globl vector179
vector179:
  pushl $0
  1023a7:	6a 00                	push   $0x0
  pushl $179
  1023a9:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1023ae:	e9 90 03 00 00       	jmp    102743 <__alltraps>

001023b3 <vector180>:
.globl vector180
vector180:
  pushl $0
  1023b3:	6a 00                	push   $0x0
  pushl $180
  1023b5:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1023ba:	e9 84 03 00 00       	jmp    102743 <__alltraps>

001023bf <vector181>:
.globl vector181
vector181:
  pushl $0
  1023bf:	6a 00                	push   $0x0
  pushl $181
  1023c1:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1023c6:	e9 78 03 00 00       	jmp    102743 <__alltraps>

001023cb <vector182>:
.globl vector182
vector182:
  pushl $0
  1023cb:	6a 00                	push   $0x0
  pushl $182
  1023cd:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1023d2:	e9 6c 03 00 00       	jmp    102743 <__alltraps>

001023d7 <vector183>:
.globl vector183
vector183:
  pushl $0
  1023d7:	6a 00                	push   $0x0
  pushl $183
  1023d9:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1023de:	e9 60 03 00 00       	jmp    102743 <__alltraps>

001023e3 <vector184>:
.globl vector184
vector184:
  pushl $0
  1023e3:	6a 00                	push   $0x0
  pushl $184
  1023e5:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1023ea:	e9 54 03 00 00       	jmp    102743 <__alltraps>

001023ef <vector185>:
.globl vector185
vector185:
  pushl $0
  1023ef:	6a 00                	push   $0x0
  pushl $185
  1023f1:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1023f6:	e9 48 03 00 00       	jmp    102743 <__alltraps>

001023fb <vector186>:
.globl vector186
vector186:
  pushl $0
  1023fb:	6a 00                	push   $0x0
  pushl $186
  1023fd:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102402:	e9 3c 03 00 00       	jmp    102743 <__alltraps>

00102407 <vector187>:
.globl vector187
vector187:
  pushl $0
  102407:	6a 00                	push   $0x0
  pushl $187
  102409:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  10240e:	e9 30 03 00 00       	jmp    102743 <__alltraps>

00102413 <vector188>:
.globl vector188
vector188:
  pushl $0
  102413:	6a 00                	push   $0x0
  pushl $188
  102415:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10241a:	e9 24 03 00 00       	jmp    102743 <__alltraps>

0010241f <vector189>:
.globl vector189
vector189:
  pushl $0
  10241f:	6a 00                	push   $0x0
  pushl $189
  102421:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102426:	e9 18 03 00 00       	jmp    102743 <__alltraps>

0010242b <vector190>:
.globl vector190
vector190:
  pushl $0
  10242b:	6a 00                	push   $0x0
  pushl $190
  10242d:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102432:	e9 0c 03 00 00       	jmp    102743 <__alltraps>

00102437 <vector191>:
.globl vector191
vector191:
  pushl $0
  102437:	6a 00                	push   $0x0
  pushl $191
  102439:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10243e:	e9 00 03 00 00       	jmp    102743 <__alltraps>

00102443 <vector192>:
.globl vector192
vector192:
  pushl $0
  102443:	6a 00                	push   $0x0
  pushl $192
  102445:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10244a:	e9 f4 02 00 00       	jmp    102743 <__alltraps>

0010244f <vector193>:
.globl vector193
vector193:
  pushl $0
  10244f:	6a 00                	push   $0x0
  pushl $193
  102451:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102456:	e9 e8 02 00 00       	jmp    102743 <__alltraps>

0010245b <vector194>:
.globl vector194
vector194:
  pushl $0
  10245b:	6a 00                	push   $0x0
  pushl $194
  10245d:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102462:	e9 dc 02 00 00       	jmp    102743 <__alltraps>

00102467 <vector195>:
.globl vector195
vector195:
  pushl $0
  102467:	6a 00                	push   $0x0
  pushl $195
  102469:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10246e:	e9 d0 02 00 00       	jmp    102743 <__alltraps>

00102473 <vector196>:
.globl vector196
vector196:
  pushl $0
  102473:	6a 00                	push   $0x0
  pushl $196
  102475:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10247a:	e9 c4 02 00 00       	jmp    102743 <__alltraps>

0010247f <vector197>:
.globl vector197
vector197:
  pushl $0
  10247f:	6a 00                	push   $0x0
  pushl $197
  102481:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102486:	e9 b8 02 00 00       	jmp    102743 <__alltraps>

0010248b <vector198>:
.globl vector198
vector198:
  pushl $0
  10248b:	6a 00                	push   $0x0
  pushl $198
  10248d:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102492:	e9 ac 02 00 00       	jmp    102743 <__alltraps>

00102497 <vector199>:
.globl vector199
vector199:
  pushl $0
  102497:	6a 00                	push   $0x0
  pushl $199
  102499:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10249e:	e9 a0 02 00 00       	jmp    102743 <__alltraps>

001024a3 <vector200>:
.globl vector200
vector200:
  pushl $0
  1024a3:	6a 00                	push   $0x0
  pushl $200
  1024a5:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1024aa:	e9 94 02 00 00       	jmp    102743 <__alltraps>

001024af <vector201>:
.globl vector201
vector201:
  pushl $0
  1024af:	6a 00                	push   $0x0
  pushl $201
  1024b1:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1024b6:	e9 88 02 00 00       	jmp    102743 <__alltraps>

001024bb <vector202>:
.globl vector202
vector202:
  pushl $0
  1024bb:	6a 00                	push   $0x0
  pushl $202
  1024bd:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1024c2:	e9 7c 02 00 00       	jmp    102743 <__alltraps>

001024c7 <vector203>:
.globl vector203
vector203:
  pushl $0
  1024c7:	6a 00                	push   $0x0
  pushl $203
  1024c9:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1024ce:	e9 70 02 00 00       	jmp    102743 <__alltraps>

001024d3 <vector204>:
.globl vector204
vector204:
  pushl $0
  1024d3:	6a 00                	push   $0x0
  pushl $204
  1024d5:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1024da:	e9 64 02 00 00       	jmp    102743 <__alltraps>

001024df <vector205>:
.globl vector205
vector205:
  pushl $0
  1024df:	6a 00                	push   $0x0
  pushl $205
  1024e1:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1024e6:	e9 58 02 00 00       	jmp    102743 <__alltraps>

001024eb <vector206>:
.globl vector206
vector206:
  pushl $0
  1024eb:	6a 00                	push   $0x0
  pushl $206
  1024ed:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1024f2:	e9 4c 02 00 00       	jmp    102743 <__alltraps>

001024f7 <vector207>:
.globl vector207
vector207:
  pushl $0
  1024f7:	6a 00                	push   $0x0
  pushl $207
  1024f9:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1024fe:	e9 40 02 00 00       	jmp    102743 <__alltraps>

00102503 <vector208>:
.globl vector208
vector208:
  pushl $0
  102503:	6a 00                	push   $0x0
  pushl $208
  102505:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  10250a:	e9 34 02 00 00       	jmp    102743 <__alltraps>

0010250f <vector209>:
.globl vector209
vector209:
  pushl $0
  10250f:	6a 00                	push   $0x0
  pushl $209
  102511:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102516:	e9 28 02 00 00       	jmp    102743 <__alltraps>

0010251b <vector210>:
.globl vector210
vector210:
  pushl $0
  10251b:	6a 00                	push   $0x0
  pushl $210
  10251d:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102522:	e9 1c 02 00 00       	jmp    102743 <__alltraps>

00102527 <vector211>:
.globl vector211
vector211:
  pushl $0
  102527:	6a 00                	push   $0x0
  pushl $211
  102529:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10252e:	e9 10 02 00 00       	jmp    102743 <__alltraps>

00102533 <vector212>:
.globl vector212
vector212:
  pushl $0
  102533:	6a 00                	push   $0x0
  pushl $212
  102535:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10253a:	e9 04 02 00 00       	jmp    102743 <__alltraps>

0010253f <vector213>:
.globl vector213
vector213:
  pushl $0
  10253f:	6a 00                	push   $0x0
  pushl $213
  102541:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102546:	e9 f8 01 00 00       	jmp    102743 <__alltraps>

0010254b <vector214>:
.globl vector214
vector214:
  pushl $0
  10254b:	6a 00                	push   $0x0
  pushl $214
  10254d:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102552:	e9 ec 01 00 00       	jmp    102743 <__alltraps>

00102557 <vector215>:
.globl vector215
vector215:
  pushl $0
  102557:	6a 00                	push   $0x0
  pushl $215
  102559:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10255e:	e9 e0 01 00 00       	jmp    102743 <__alltraps>

00102563 <vector216>:
.globl vector216
vector216:
  pushl $0
  102563:	6a 00                	push   $0x0
  pushl $216
  102565:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10256a:	e9 d4 01 00 00       	jmp    102743 <__alltraps>

0010256f <vector217>:
.globl vector217
vector217:
  pushl $0
  10256f:	6a 00                	push   $0x0
  pushl $217
  102571:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102576:	e9 c8 01 00 00       	jmp    102743 <__alltraps>

0010257b <vector218>:
.globl vector218
vector218:
  pushl $0
  10257b:	6a 00                	push   $0x0
  pushl $218
  10257d:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102582:	e9 bc 01 00 00       	jmp    102743 <__alltraps>

00102587 <vector219>:
.globl vector219
vector219:
  pushl $0
  102587:	6a 00                	push   $0x0
  pushl $219
  102589:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10258e:	e9 b0 01 00 00       	jmp    102743 <__alltraps>

00102593 <vector220>:
.globl vector220
vector220:
  pushl $0
  102593:	6a 00                	push   $0x0
  pushl $220
  102595:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10259a:	e9 a4 01 00 00       	jmp    102743 <__alltraps>

0010259f <vector221>:
.globl vector221
vector221:
  pushl $0
  10259f:	6a 00                	push   $0x0
  pushl $221
  1025a1:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1025a6:	e9 98 01 00 00       	jmp    102743 <__alltraps>

001025ab <vector222>:
.globl vector222
vector222:
  pushl $0
  1025ab:	6a 00                	push   $0x0
  pushl $222
  1025ad:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1025b2:	e9 8c 01 00 00       	jmp    102743 <__alltraps>

001025b7 <vector223>:
.globl vector223
vector223:
  pushl $0
  1025b7:	6a 00                	push   $0x0
  pushl $223
  1025b9:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1025be:	e9 80 01 00 00       	jmp    102743 <__alltraps>

001025c3 <vector224>:
.globl vector224
vector224:
  pushl $0
  1025c3:	6a 00                	push   $0x0
  pushl $224
  1025c5:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1025ca:	e9 74 01 00 00       	jmp    102743 <__alltraps>

001025cf <vector225>:
.globl vector225
vector225:
  pushl $0
  1025cf:	6a 00                	push   $0x0
  pushl $225
  1025d1:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1025d6:	e9 68 01 00 00       	jmp    102743 <__alltraps>

001025db <vector226>:
.globl vector226
vector226:
  pushl $0
  1025db:	6a 00                	push   $0x0
  pushl $226
  1025dd:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1025e2:	e9 5c 01 00 00       	jmp    102743 <__alltraps>

001025e7 <vector227>:
.globl vector227
vector227:
  pushl $0
  1025e7:	6a 00                	push   $0x0
  pushl $227
  1025e9:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1025ee:	e9 50 01 00 00       	jmp    102743 <__alltraps>

001025f3 <vector228>:
.globl vector228
vector228:
  pushl $0
  1025f3:	6a 00                	push   $0x0
  pushl $228
  1025f5:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1025fa:	e9 44 01 00 00       	jmp    102743 <__alltraps>

001025ff <vector229>:
.globl vector229
vector229:
  pushl $0
  1025ff:	6a 00                	push   $0x0
  pushl $229
  102601:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102606:	e9 38 01 00 00       	jmp    102743 <__alltraps>

0010260b <vector230>:
.globl vector230
vector230:
  pushl $0
  10260b:	6a 00                	push   $0x0
  pushl $230
  10260d:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102612:	e9 2c 01 00 00       	jmp    102743 <__alltraps>

00102617 <vector231>:
.globl vector231
vector231:
  pushl $0
  102617:	6a 00                	push   $0x0
  pushl $231
  102619:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  10261e:	e9 20 01 00 00       	jmp    102743 <__alltraps>

00102623 <vector232>:
.globl vector232
vector232:
  pushl $0
  102623:	6a 00                	push   $0x0
  pushl $232
  102625:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10262a:	e9 14 01 00 00       	jmp    102743 <__alltraps>

0010262f <vector233>:
.globl vector233
vector233:
  pushl $0
  10262f:	6a 00                	push   $0x0
  pushl $233
  102631:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102636:	e9 08 01 00 00       	jmp    102743 <__alltraps>

0010263b <vector234>:
.globl vector234
vector234:
  pushl $0
  10263b:	6a 00                	push   $0x0
  pushl $234
  10263d:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102642:	e9 fc 00 00 00       	jmp    102743 <__alltraps>

00102647 <vector235>:
.globl vector235
vector235:
  pushl $0
  102647:	6a 00                	push   $0x0
  pushl $235
  102649:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10264e:	e9 f0 00 00 00       	jmp    102743 <__alltraps>

00102653 <vector236>:
.globl vector236
vector236:
  pushl $0
  102653:	6a 00                	push   $0x0
  pushl $236
  102655:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10265a:	e9 e4 00 00 00       	jmp    102743 <__alltraps>

0010265f <vector237>:
.globl vector237
vector237:
  pushl $0
  10265f:	6a 00                	push   $0x0
  pushl $237
  102661:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102666:	e9 d8 00 00 00       	jmp    102743 <__alltraps>

0010266b <vector238>:
.globl vector238
vector238:
  pushl $0
  10266b:	6a 00                	push   $0x0
  pushl $238
  10266d:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102672:	e9 cc 00 00 00       	jmp    102743 <__alltraps>

00102677 <vector239>:
.globl vector239
vector239:
  pushl $0
  102677:	6a 00                	push   $0x0
  pushl $239
  102679:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10267e:	e9 c0 00 00 00       	jmp    102743 <__alltraps>

00102683 <vector240>:
.globl vector240
vector240:
  pushl $0
  102683:	6a 00                	push   $0x0
  pushl $240
  102685:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10268a:	e9 b4 00 00 00       	jmp    102743 <__alltraps>

0010268f <vector241>:
.globl vector241
vector241:
  pushl $0
  10268f:	6a 00                	push   $0x0
  pushl $241
  102691:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102696:	e9 a8 00 00 00       	jmp    102743 <__alltraps>

0010269b <vector242>:
.globl vector242
vector242:
  pushl $0
  10269b:	6a 00                	push   $0x0
  pushl $242
  10269d:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1026a2:	e9 9c 00 00 00       	jmp    102743 <__alltraps>

001026a7 <vector243>:
.globl vector243
vector243:
  pushl $0
  1026a7:	6a 00                	push   $0x0
  pushl $243
  1026a9:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1026ae:	e9 90 00 00 00       	jmp    102743 <__alltraps>

001026b3 <vector244>:
.globl vector244
vector244:
  pushl $0
  1026b3:	6a 00                	push   $0x0
  pushl $244
  1026b5:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1026ba:	e9 84 00 00 00       	jmp    102743 <__alltraps>

001026bf <vector245>:
.globl vector245
vector245:
  pushl $0
  1026bf:	6a 00                	push   $0x0
  pushl $245
  1026c1:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1026c6:	e9 78 00 00 00       	jmp    102743 <__alltraps>

001026cb <vector246>:
.globl vector246
vector246:
  pushl $0
  1026cb:	6a 00                	push   $0x0
  pushl $246
  1026cd:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1026d2:	e9 6c 00 00 00       	jmp    102743 <__alltraps>

001026d7 <vector247>:
.globl vector247
vector247:
  pushl $0
  1026d7:	6a 00                	push   $0x0
  pushl $247
  1026d9:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1026de:	e9 60 00 00 00       	jmp    102743 <__alltraps>

001026e3 <vector248>:
.globl vector248
vector248:
  pushl $0
  1026e3:	6a 00                	push   $0x0
  pushl $248
  1026e5:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1026ea:	e9 54 00 00 00       	jmp    102743 <__alltraps>

001026ef <vector249>:
.globl vector249
vector249:
  pushl $0
  1026ef:	6a 00                	push   $0x0
  pushl $249
  1026f1:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1026f6:	e9 48 00 00 00       	jmp    102743 <__alltraps>

001026fb <vector250>:
.globl vector250
vector250:
  pushl $0
  1026fb:	6a 00                	push   $0x0
  pushl $250
  1026fd:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102702:	e9 3c 00 00 00       	jmp    102743 <__alltraps>

00102707 <vector251>:
.globl vector251
vector251:
  pushl $0
  102707:	6a 00                	push   $0x0
  pushl $251
  102709:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  10270e:	e9 30 00 00 00       	jmp    102743 <__alltraps>

00102713 <vector252>:
.globl vector252
vector252:
  pushl $0
  102713:	6a 00                	push   $0x0
  pushl $252
  102715:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10271a:	e9 24 00 00 00       	jmp    102743 <__alltraps>

0010271f <vector253>:
.globl vector253
vector253:
  pushl $0
  10271f:	6a 00                	push   $0x0
  pushl $253
  102721:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102726:	e9 18 00 00 00       	jmp    102743 <__alltraps>

0010272b <vector254>:
.globl vector254
vector254:
  pushl $0
  10272b:	6a 00                	push   $0x0
  pushl $254
  10272d:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102732:	e9 0c 00 00 00       	jmp    102743 <__alltraps>

00102737 <vector255>:
.globl vector255
vector255:
  pushl $0
  102737:	6a 00                	push   $0x0
  pushl $255
  102739:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10273e:	e9 00 00 00 00       	jmp    102743 <__alltraps>

00102743 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102743:	1e                   	push   %ds
    pushl %es
  102744:	06                   	push   %es
    pushl %fs
  102745:	0f a0                	push   %fs
    pushl %gs
  102747:	0f a8                	push   %gs
    pushal
  102749:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  10274a:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10274f:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102751:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102753:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102754:	e8 64 f5 ff ff       	call   101cbd <trap>

    # pop the pushed stack pointer
    popl %esp
  102759:	5c                   	pop    %esp

0010275a <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  10275a:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  10275b:	0f a9                	pop    %gs
    popl %fs
  10275d:	0f a1                	pop    %fs
    popl %es
  10275f:	07                   	pop    %es
    popl %ds
  102760:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102761:	83 c4 08             	add    $0x8,%esp
    iret
  102764:	cf                   	iret   

00102765 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102765:	55                   	push   %ebp
  102766:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102768:	8b 45 08             	mov    0x8(%ebp),%eax
  10276b:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10276e:	b8 23 00 00 00       	mov    $0x23,%eax
  102773:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102775:	b8 23 00 00 00       	mov    $0x23,%eax
  10277a:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10277c:	b8 10 00 00 00       	mov    $0x10,%eax
  102781:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102783:	b8 10 00 00 00       	mov    $0x10,%eax
  102788:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10278a:	b8 10 00 00 00       	mov    $0x10,%eax
  10278f:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102791:	ea 98 27 10 00 08 00 	ljmp   $0x8,$0x102798
}
  102798:	5d                   	pop    %ebp
  102799:	c3                   	ret    

0010279a <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10279a:	55                   	push   %ebp
  10279b:	89 e5                	mov    %esp,%ebp
  10279d:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1027a0:	b8 00 fa 10 00       	mov    $0x10fa00,%eax
  1027a5:	05 00 04 00 00       	add    $0x400,%eax
  1027aa:	a3 84 f9 10 00       	mov    %eax,0x10f984
    ts.ts_ss0 = KERNEL_DS;
  1027af:	66 c7 05 88 f9 10 00 	movw   $0x10,0x10f988
  1027b6:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1027b8:	66 c7 05 48 ea 10 00 	movw   $0x68,0x10ea48
  1027bf:	68 00 
  1027c1:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  1027c6:	66 a3 4a ea 10 00    	mov    %ax,0x10ea4a
  1027cc:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  1027d1:	c1 e8 10             	shr    $0x10,%eax
  1027d4:	a2 4c ea 10 00       	mov    %al,0x10ea4c
  1027d9:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  1027e0:	83 e0 f0             	and    $0xfffffff0,%eax
  1027e3:	83 c8 09             	or     $0x9,%eax
  1027e6:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  1027eb:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  1027f2:	83 c8 10             	or     $0x10,%eax
  1027f5:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  1027fa:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  102801:	83 e0 9f             	and    $0xffffff9f,%eax
  102804:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  102809:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  102810:	83 c8 80             	or     $0xffffff80,%eax
  102813:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  102818:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  10281f:	83 e0 f0             	and    $0xfffffff0,%eax
  102822:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  102827:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  10282e:	83 e0 ef             	and    $0xffffffef,%eax
  102831:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  102836:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  10283d:	83 e0 df             	and    $0xffffffdf,%eax
  102840:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  102845:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  10284c:	83 c8 40             	or     $0x40,%eax
  10284f:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  102854:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  10285b:	83 e0 7f             	and    $0x7f,%eax
  10285e:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  102863:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  102868:	c1 e8 18             	shr    $0x18,%eax
  10286b:	a2 4f ea 10 00       	mov    %al,0x10ea4f
    gdt[SEG_TSS].sd_s = 0;
  102870:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  102877:	83 e0 ef             	and    $0xffffffef,%eax
  10287a:	a2 4d ea 10 00       	mov    %al,0x10ea4d

    // reload all segment registers
    lgdt(&gdt_pd);
  10287f:	68 50 ea 10 00       	push   $0x10ea50
  102884:	e8 dc fe ff ff       	call   102765 <lgdt>
  102889:	83 c4 04             	add    $0x4,%esp
  10288c:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102892:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102896:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102899:	c9                   	leave  
  10289a:	c3                   	ret    

0010289b <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  10289b:	55                   	push   %ebp
  10289c:	89 e5                	mov    %esp,%ebp
    gdt_init();
  10289e:	e8 f7 fe ff ff       	call   10279a <gdt_init>
}
  1028a3:	5d                   	pop    %ebp
  1028a4:	c3                   	ret    

001028a5 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  1028a5:	55                   	push   %ebp
  1028a6:	89 e5                	mov    %esp,%ebp
  1028a8:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1028ab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  1028b2:	eb 04                	jmp    1028b8 <strlen+0x13>
        cnt ++;
  1028b4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  1028b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1028bb:	8d 50 01             	lea    0x1(%eax),%edx
  1028be:	89 55 08             	mov    %edx,0x8(%ebp)
  1028c1:	0f b6 00             	movzbl (%eax),%eax
  1028c4:	84 c0                	test   %al,%al
  1028c6:	75 ec                	jne    1028b4 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  1028c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1028cb:	c9                   	leave  
  1028cc:	c3                   	ret    

001028cd <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  1028cd:	55                   	push   %ebp
  1028ce:	89 e5                	mov    %esp,%ebp
  1028d0:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1028d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1028da:	eb 04                	jmp    1028e0 <strnlen+0x13>
        cnt ++;
  1028dc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  1028e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028e3:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1028e6:	73 10                	jae    1028f8 <strnlen+0x2b>
  1028e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1028eb:	8d 50 01             	lea    0x1(%eax),%edx
  1028ee:	89 55 08             	mov    %edx,0x8(%ebp)
  1028f1:	0f b6 00             	movzbl (%eax),%eax
  1028f4:	84 c0                	test   %al,%al
  1028f6:	75 e4                	jne    1028dc <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  1028f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1028fb:	c9                   	leave  
  1028fc:	c3                   	ret    

001028fd <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  1028fd:	55                   	push   %ebp
  1028fe:	89 e5                	mov    %esp,%ebp
  102900:	57                   	push   %edi
  102901:	56                   	push   %esi
  102902:	83 ec 20             	sub    $0x20,%esp
  102905:	8b 45 08             	mov    0x8(%ebp),%eax
  102908:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10290b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10290e:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102911:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102914:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102917:	89 d1                	mov    %edx,%ecx
  102919:	89 c2                	mov    %eax,%edx
  10291b:	89 ce                	mov    %ecx,%esi
  10291d:	89 d7                	mov    %edx,%edi
  10291f:	ac                   	lods   %ds:(%esi),%al
  102920:	aa                   	stos   %al,%es:(%edi)
  102921:	84 c0                	test   %al,%al
  102923:	75 fa                	jne    10291f <strcpy+0x22>
  102925:	89 fa                	mov    %edi,%edx
  102927:	89 f1                	mov    %esi,%ecx
  102929:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10292c:	89 55 e8             	mov    %edx,-0x18(%ebp)
  10292f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102932:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102935:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102936:	83 c4 20             	add    $0x20,%esp
  102939:	5e                   	pop    %esi
  10293a:	5f                   	pop    %edi
  10293b:	5d                   	pop    %ebp
  10293c:	c3                   	ret    

0010293d <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  10293d:	55                   	push   %ebp
  10293e:	89 e5                	mov    %esp,%ebp
  102940:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102943:	8b 45 08             	mov    0x8(%ebp),%eax
  102946:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102949:	eb 21                	jmp    10296c <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  10294b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10294e:	0f b6 10             	movzbl (%eax),%edx
  102951:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102954:	88 10                	mov    %dl,(%eax)
  102956:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102959:	0f b6 00             	movzbl (%eax),%eax
  10295c:	84 c0                	test   %al,%al
  10295e:	74 04                	je     102964 <strncpy+0x27>
            src ++;
  102960:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102964:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102968:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  10296c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102970:	75 d9                	jne    10294b <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102972:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102975:	c9                   	leave  
  102976:	c3                   	ret    

00102977 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102977:	55                   	push   %ebp
  102978:	89 e5                	mov    %esp,%ebp
  10297a:	57                   	push   %edi
  10297b:	56                   	push   %esi
  10297c:	83 ec 20             	sub    $0x20,%esp
  10297f:	8b 45 08             	mov    0x8(%ebp),%eax
  102982:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102985:	8b 45 0c             	mov    0xc(%ebp),%eax
  102988:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  10298b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10298e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102991:	89 d1                	mov    %edx,%ecx
  102993:	89 c2                	mov    %eax,%edx
  102995:	89 ce                	mov    %ecx,%esi
  102997:	89 d7                	mov    %edx,%edi
  102999:	ac                   	lods   %ds:(%esi),%al
  10299a:	ae                   	scas   %es:(%edi),%al
  10299b:	75 08                	jne    1029a5 <strcmp+0x2e>
  10299d:	84 c0                	test   %al,%al
  10299f:	75 f8                	jne    102999 <strcmp+0x22>
  1029a1:	31 c0                	xor    %eax,%eax
  1029a3:	eb 04                	jmp    1029a9 <strcmp+0x32>
  1029a5:	19 c0                	sbb    %eax,%eax
  1029a7:	0c 01                	or     $0x1,%al
  1029a9:	89 fa                	mov    %edi,%edx
  1029ab:	89 f1                	mov    %esi,%ecx
  1029ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1029b0:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1029b3:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  1029b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  1029b9:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1029ba:	83 c4 20             	add    $0x20,%esp
  1029bd:	5e                   	pop    %esi
  1029be:	5f                   	pop    %edi
  1029bf:	5d                   	pop    %ebp
  1029c0:	c3                   	ret    

001029c1 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1029c1:	55                   	push   %ebp
  1029c2:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1029c4:	eb 0c                	jmp    1029d2 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  1029c6:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1029ca:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1029ce:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1029d2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029d6:	74 1a                	je     1029f2 <strncmp+0x31>
  1029d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1029db:	0f b6 00             	movzbl (%eax),%eax
  1029de:	84 c0                	test   %al,%al
  1029e0:	74 10                	je     1029f2 <strncmp+0x31>
  1029e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1029e5:	0f b6 10             	movzbl (%eax),%edx
  1029e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029eb:	0f b6 00             	movzbl (%eax),%eax
  1029ee:	38 c2                	cmp    %al,%dl
  1029f0:	74 d4                	je     1029c6 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  1029f2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029f6:	74 18                	je     102a10 <strncmp+0x4f>
  1029f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1029fb:	0f b6 00             	movzbl (%eax),%eax
  1029fe:	0f b6 d0             	movzbl %al,%edx
  102a01:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a04:	0f b6 00             	movzbl (%eax),%eax
  102a07:	0f b6 c0             	movzbl %al,%eax
  102a0a:	29 c2                	sub    %eax,%edx
  102a0c:	89 d0                	mov    %edx,%eax
  102a0e:	eb 05                	jmp    102a15 <strncmp+0x54>
  102a10:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102a15:	5d                   	pop    %ebp
  102a16:	c3                   	ret    

00102a17 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102a17:	55                   	push   %ebp
  102a18:	89 e5                	mov    %esp,%ebp
  102a1a:	83 ec 04             	sub    $0x4,%esp
  102a1d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a20:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102a23:	eb 14                	jmp    102a39 <strchr+0x22>
        if (*s == c) {
  102a25:	8b 45 08             	mov    0x8(%ebp),%eax
  102a28:	0f b6 00             	movzbl (%eax),%eax
  102a2b:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102a2e:	75 05                	jne    102a35 <strchr+0x1e>
            return (char *)s;
  102a30:	8b 45 08             	mov    0x8(%ebp),%eax
  102a33:	eb 13                	jmp    102a48 <strchr+0x31>
        }
        s ++;
  102a35:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102a39:	8b 45 08             	mov    0x8(%ebp),%eax
  102a3c:	0f b6 00             	movzbl (%eax),%eax
  102a3f:	84 c0                	test   %al,%al
  102a41:	75 e2                	jne    102a25 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102a43:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102a48:	c9                   	leave  
  102a49:	c3                   	ret    

00102a4a <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102a4a:	55                   	push   %ebp
  102a4b:	89 e5                	mov    %esp,%ebp
  102a4d:	83 ec 04             	sub    $0x4,%esp
  102a50:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a53:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102a56:	eb 11                	jmp    102a69 <strfind+0x1f>
        if (*s == c) {
  102a58:	8b 45 08             	mov    0x8(%ebp),%eax
  102a5b:	0f b6 00             	movzbl (%eax),%eax
  102a5e:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102a61:	75 02                	jne    102a65 <strfind+0x1b>
            break;
  102a63:	eb 0e                	jmp    102a73 <strfind+0x29>
        }
        s ++;
  102a65:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102a69:	8b 45 08             	mov    0x8(%ebp),%eax
  102a6c:	0f b6 00             	movzbl (%eax),%eax
  102a6f:	84 c0                	test   %al,%al
  102a71:	75 e5                	jne    102a58 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  102a73:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102a76:	c9                   	leave  
  102a77:	c3                   	ret    

00102a78 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102a78:	55                   	push   %ebp
  102a79:	89 e5                	mov    %esp,%ebp
  102a7b:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102a7e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102a85:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102a8c:	eb 04                	jmp    102a92 <strtol+0x1a>
        s ++;
  102a8e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102a92:	8b 45 08             	mov    0x8(%ebp),%eax
  102a95:	0f b6 00             	movzbl (%eax),%eax
  102a98:	3c 20                	cmp    $0x20,%al
  102a9a:	74 f2                	je     102a8e <strtol+0x16>
  102a9c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a9f:	0f b6 00             	movzbl (%eax),%eax
  102aa2:	3c 09                	cmp    $0x9,%al
  102aa4:	74 e8                	je     102a8e <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102aa6:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa9:	0f b6 00             	movzbl (%eax),%eax
  102aac:	3c 2b                	cmp    $0x2b,%al
  102aae:	75 06                	jne    102ab6 <strtol+0x3e>
        s ++;
  102ab0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102ab4:	eb 15                	jmp    102acb <strtol+0x53>
    }
    else if (*s == '-') {
  102ab6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ab9:	0f b6 00             	movzbl (%eax),%eax
  102abc:	3c 2d                	cmp    $0x2d,%al
  102abe:	75 0b                	jne    102acb <strtol+0x53>
        s ++, neg = 1;
  102ac0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102ac4:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102acb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102acf:	74 06                	je     102ad7 <strtol+0x5f>
  102ad1:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102ad5:	75 24                	jne    102afb <strtol+0x83>
  102ad7:	8b 45 08             	mov    0x8(%ebp),%eax
  102ada:	0f b6 00             	movzbl (%eax),%eax
  102add:	3c 30                	cmp    $0x30,%al
  102adf:	75 1a                	jne    102afb <strtol+0x83>
  102ae1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae4:	83 c0 01             	add    $0x1,%eax
  102ae7:	0f b6 00             	movzbl (%eax),%eax
  102aea:	3c 78                	cmp    $0x78,%al
  102aec:	75 0d                	jne    102afb <strtol+0x83>
        s += 2, base = 16;
  102aee:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102af2:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102af9:	eb 2a                	jmp    102b25 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102afb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102aff:	75 17                	jne    102b18 <strtol+0xa0>
  102b01:	8b 45 08             	mov    0x8(%ebp),%eax
  102b04:	0f b6 00             	movzbl (%eax),%eax
  102b07:	3c 30                	cmp    $0x30,%al
  102b09:	75 0d                	jne    102b18 <strtol+0xa0>
        s ++, base = 8;
  102b0b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102b0f:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102b16:	eb 0d                	jmp    102b25 <strtol+0xad>
    }
    else if (base == 0) {
  102b18:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b1c:	75 07                	jne    102b25 <strtol+0xad>
        base = 10;
  102b1e:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102b25:	8b 45 08             	mov    0x8(%ebp),%eax
  102b28:	0f b6 00             	movzbl (%eax),%eax
  102b2b:	3c 2f                	cmp    $0x2f,%al
  102b2d:	7e 1b                	jle    102b4a <strtol+0xd2>
  102b2f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b32:	0f b6 00             	movzbl (%eax),%eax
  102b35:	3c 39                	cmp    $0x39,%al
  102b37:	7f 11                	jg     102b4a <strtol+0xd2>
            dig = *s - '0';
  102b39:	8b 45 08             	mov    0x8(%ebp),%eax
  102b3c:	0f b6 00             	movzbl (%eax),%eax
  102b3f:	0f be c0             	movsbl %al,%eax
  102b42:	83 e8 30             	sub    $0x30,%eax
  102b45:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b48:	eb 48                	jmp    102b92 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102b4a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b4d:	0f b6 00             	movzbl (%eax),%eax
  102b50:	3c 60                	cmp    $0x60,%al
  102b52:	7e 1b                	jle    102b6f <strtol+0xf7>
  102b54:	8b 45 08             	mov    0x8(%ebp),%eax
  102b57:	0f b6 00             	movzbl (%eax),%eax
  102b5a:	3c 7a                	cmp    $0x7a,%al
  102b5c:	7f 11                	jg     102b6f <strtol+0xf7>
            dig = *s - 'a' + 10;
  102b5e:	8b 45 08             	mov    0x8(%ebp),%eax
  102b61:	0f b6 00             	movzbl (%eax),%eax
  102b64:	0f be c0             	movsbl %al,%eax
  102b67:	83 e8 57             	sub    $0x57,%eax
  102b6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b6d:	eb 23                	jmp    102b92 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102b6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b72:	0f b6 00             	movzbl (%eax),%eax
  102b75:	3c 40                	cmp    $0x40,%al
  102b77:	7e 3d                	jle    102bb6 <strtol+0x13e>
  102b79:	8b 45 08             	mov    0x8(%ebp),%eax
  102b7c:	0f b6 00             	movzbl (%eax),%eax
  102b7f:	3c 5a                	cmp    $0x5a,%al
  102b81:	7f 33                	jg     102bb6 <strtol+0x13e>
            dig = *s - 'A' + 10;
  102b83:	8b 45 08             	mov    0x8(%ebp),%eax
  102b86:	0f b6 00             	movzbl (%eax),%eax
  102b89:	0f be c0             	movsbl %al,%eax
  102b8c:	83 e8 37             	sub    $0x37,%eax
  102b8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102b92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b95:	3b 45 10             	cmp    0x10(%ebp),%eax
  102b98:	7c 02                	jl     102b9c <strtol+0x124>
            break;
  102b9a:	eb 1a                	jmp    102bb6 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  102b9c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102ba0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102ba3:	0f af 45 10          	imul   0x10(%ebp),%eax
  102ba7:	89 c2                	mov    %eax,%edx
  102ba9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bac:	01 d0                	add    %edx,%eax
  102bae:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102bb1:	e9 6f ff ff ff       	jmp    102b25 <strtol+0xad>

    if (endptr) {
  102bb6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102bba:	74 08                	je     102bc4 <strtol+0x14c>
        *endptr = (char *) s;
  102bbc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bbf:	8b 55 08             	mov    0x8(%ebp),%edx
  102bc2:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102bc4:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102bc8:	74 07                	je     102bd1 <strtol+0x159>
  102bca:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102bcd:	f7 d8                	neg    %eax
  102bcf:	eb 03                	jmp    102bd4 <strtol+0x15c>
  102bd1:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102bd4:	c9                   	leave  
  102bd5:	c3                   	ret    

00102bd6 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102bd6:	55                   	push   %ebp
  102bd7:	89 e5                	mov    %esp,%ebp
  102bd9:	57                   	push   %edi
  102bda:	83 ec 24             	sub    $0x24,%esp
  102bdd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102be0:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102be3:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102be7:	8b 55 08             	mov    0x8(%ebp),%edx
  102bea:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102bed:	88 45 f7             	mov    %al,-0x9(%ebp)
  102bf0:	8b 45 10             	mov    0x10(%ebp),%eax
  102bf3:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102bf6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102bf9:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102bfd:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102c00:	89 d7                	mov    %edx,%edi
  102c02:	f3 aa                	rep stos %al,%es:(%edi)
  102c04:	89 fa                	mov    %edi,%edx
  102c06:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102c09:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102c0c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c0f:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102c10:	83 c4 24             	add    $0x24,%esp
  102c13:	5f                   	pop    %edi
  102c14:	5d                   	pop    %ebp
  102c15:	c3                   	ret    

00102c16 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102c16:	55                   	push   %ebp
  102c17:	89 e5                	mov    %esp,%ebp
  102c19:	57                   	push   %edi
  102c1a:	56                   	push   %esi
  102c1b:	53                   	push   %ebx
  102c1c:	83 ec 30             	sub    $0x30,%esp
  102c1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c22:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c25:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c28:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102c2b:	8b 45 10             	mov    0x10(%ebp),%eax
  102c2e:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102c31:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c34:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102c37:	73 42                	jae    102c7b <memmove+0x65>
  102c39:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c3c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102c3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c42:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102c45:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c48:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102c4b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102c4e:	c1 e8 02             	shr    $0x2,%eax
  102c51:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102c53:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102c56:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c59:	89 d7                	mov    %edx,%edi
  102c5b:	89 c6                	mov    %eax,%esi
  102c5d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102c5f:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102c62:	83 e1 03             	and    $0x3,%ecx
  102c65:	74 02                	je     102c69 <memmove+0x53>
  102c67:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102c69:	89 f0                	mov    %esi,%eax
  102c6b:	89 fa                	mov    %edi,%edx
  102c6d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102c70:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102c73:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102c76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102c79:	eb 36                	jmp    102cb1 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102c7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c7e:	8d 50 ff             	lea    -0x1(%eax),%edx
  102c81:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c84:	01 c2                	add    %eax,%edx
  102c86:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c89:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102c8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c8f:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  102c92:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c95:	89 c1                	mov    %eax,%ecx
  102c97:	89 d8                	mov    %ebx,%eax
  102c99:	89 d6                	mov    %edx,%esi
  102c9b:	89 c7                	mov    %eax,%edi
  102c9d:	fd                   	std    
  102c9e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ca0:	fc                   	cld    
  102ca1:	89 f8                	mov    %edi,%eax
  102ca3:	89 f2                	mov    %esi,%edx
  102ca5:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102ca8:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102cab:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  102cae:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102cb1:	83 c4 30             	add    $0x30,%esp
  102cb4:	5b                   	pop    %ebx
  102cb5:	5e                   	pop    %esi
  102cb6:	5f                   	pop    %edi
  102cb7:	5d                   	pop    %ebp
  102cb8:	c3                   	ret    

00102cb9 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102cb9:	55                   	push   %ebp
  102cba:	89 e5                	mov    %esp,%ebp
  102cbc:	57                   	push   %edi
  102cbd:	56                   	push   %esi
  102cbe:	83 ec 20             	sub    $0x20,%esp
  102cc1:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cc7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cca:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ccd:	8b 45 10             	mov    0x10(%ebp),%eax
  102cd0:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102cd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102cd6:	c1 e8 02             	shr    $0x2,%eax
  102cd9:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102cdb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102cde:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ce1:	89 d7                	mov    %edx,%edi
  102ce3:	89 c6                	mov    %eax,%esi
  102ce5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ce7:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102cea:	83 e1 03             	and    $0x3,%ecx
  102ced:	74 02                	je     102cf1 <memcpy+0x38>
  102cef:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102cf1:	89 f0                	mov    %esi,%eax
  102cf3:	89 fa                	mov    %edi,%edx
  102cf5:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102cf8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102cfb:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102cfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102d01:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102d02:	83 c4 20             	add    $0x20,%esp
  102d05:	5e                   	pop    %esi
  102d06:	5f                   	pop    %edi
  102d07:	5d                   	pop    %ebp
  102d08:	c3                   	ret    

00102d09 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102d09:	55                   	push   %ebp
  102d0a:	89 e5                	mov    %esp,%ebp
  102d0c:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102d0f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d12:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102d15:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d18:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102d1b:	eb 30                	jmp    102d4d <memcmp+0x44>
        if (*s1 != *s2) {
  102d1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d20:	0f b6 10             	movzbl (%eax),%edx
  102d23:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d26:	0f b6 00             	movzbl (%eax),%eax
  102d29:	38 c2                	cmp    %al,%dl
  102d2b:	74 18                	je     102d45 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102d2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d30:	0f b6 00             	movzbl (%eax),%eax
  102d33:	0f b6 d0             	movzbl %al,%edx
  102d36:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d39:	0f b6 00             	movzbl (%eax),%eax
  102d3c:	0f b6 c0             	movzbl %al,%eax
  102d3f:	29 c2                	sub    %eax,%edx
  102d41:	89 d0                	mov    %edx,%eax
  102d43:	eb 1a                	jmp    102d5f <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102d45:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102d49:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  102d4d:	8b 45 10             	mov    0x10(%ebp),%eax
  102d50:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d53:	89 55 10             	mov    %edx,0x10(%ebp)
  102d56:	85 c0                	test   %eax,%eax
  102d58:	75 c3                	jne    102d1d <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  102d5a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102d5f:	c9                   	leave  
  102d60:	c3                   	ret    

00102d61 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102d61:	55                   	push   %ebp
  102d62:	89 e5                	mov    %esp,%ebp
  102d64:	83 ec 38             	sub    $0x38,%esp
  102d67:	8b 45 10             	mov    0x10(%ebp),%eax
  102d6a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102d6d:	8b 45 14             	mov    0x14(%ebp),%eax
  102d70:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102d73:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102d76:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102d79:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d7c:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102d7f:	8b 45 18             	mov    0x18(%ebp),%eax
  102d82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102d85:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d88:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102d8b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102d8e:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102d91:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d94:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d97:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102d9b:	74 1c                	je     102db9 <printnum+0x58>
  102d9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102da0:	ba 00 00 00 00       	mov    $0x0,%edx
  102da5:	f7 75 e4             	divl   -0x1c(%ebp)
  102da8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102dab:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102dae:	ba 00 00 00 00       	mov    $0x0,%edx
  102db3:	f7 75 e4             	divl   -0x1c(%ebp)
  102db6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102db9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dbc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102dbf:	f7 75 e4             	divl   -0x1c(%ebp)
  102dc2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102dc5:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102dc8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dcb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102dce:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102dd1:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102dd4:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102dd7:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102dda:	8b 45 18             	mov    0x18(%ebp),%eax
  102ddd:	ba 00 00 00 00       	mov    $0x0,%edx
  102de2:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102de5:	77 41                	ja     102e28 <printnum+0xc7>
  102de7:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102dea:	72 05                	jb     102df1 <printnum+0x90>
  102dec:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102def:	77 37                	ja     102e28 <printnum+0xc7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102df1:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102df4:	83 e8 01             	sub    $0x1,%eax
  102df7:	83 ec 04             	sub    $0x4,%esp
  102dfa:	ff 75 20             	pushl  0x20(%ebp)
  102dfd:	50                   	push   %eax
  102dfe:	ff 75 18             	pushl  0x18(%ebp)
  102e01:	ff 75 ec             	pushl  -0x14(%ebp)
  102e04:	ff 75 e8             	pushl  -0x18(%ebp)
  102e07:	ff 75 0c             	pushl  0xc(%ebp)
  102e0a:	ff 75 08             	pushl  0x8(%ebp)
  102e0d:	e8 4f ff ff ff       	call   102d61 <printnum>
  102e12:	83 c4 20             	add    $0x20,%esp
  102e15:	eb 1b                	jmp    102e32 <printnum+0xd1>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102e17:	83 ec 08             	sub    $0x8,%esp
  102e1a:	ff 75 0c             	pushl  0xc(%ebp)
  102e1d:	ff 75 20             	pushl  0x20(%ebp)
  102e20:	8b 45 08             	mov    0x8(%ebp),%eax
  102e23:	ff d0                	call   *%eax
  102e25:	83 c4 10             	add    $0x10,%esp
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102e28:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102e2c:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102e30:	7f e5                	jg     102e17 <printnum+0xb6>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102e32:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102e35:	05 50 3b 10 00       	add    $0x103b50,%eax
  102e3a:	0f b6 00             	movzbl (%eax),%eax
  102e3d:	0f be c0             	movsbl %al,%eax
  102e40:	83 ec 08             	sub    $0x8,%esp
  102e43:	ff 75 0c             	pushl  0xc(%ebp)
  102e46:	50                   	push   %eax
  102e47:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4a:	ff d0                	call   *%eax
  102e4c:	83 c4 10             	add    $0x10,%esp
}
  102e4f:	c9                   	leave  
  102e50:	c3                   	ret    

00102e51 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102e51:	55                   	push   %ebp
  102e52:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102e54:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102e58:	7e 14                	jle    102e6e <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102e5a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e5d:	8b 00                	mov    (%eax),%eax
  102e5f:	8d 48 08             	lea    0x8(%eax),%ecx
  102e62:	8b 55 08             	mov    0x8(%ebp),%edx
  102e65:	89 0a                	mov    %ecx,(%edx)
  102e67:	8b 50 04             	mov    0x4(%eax),%edx
  102e6a:	8b 00                	mov    (%eax),%eax
  102e6c:	eb 30                	jmp    102e9e <getuint+0x4d>
    }
    else if (lflag) {
  102e6e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102e72:	74 16                	je     102e8a <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102e74:	8b 45 08             	mov    0x8(%ebp),%eax
  102e77:	8b 00                	mov    (%eax),%eax
  102e79:	8d 48 04             	lea    0x4(%eax),%ecx
  102e7c:	8b 55 08             	mov    0x8(%ebp),%edx
  102e7f:	89 0a                	mov    %ecx,(%edx)
  102e81:	8b 00                	mov    (%eax),%eax
  102e83:	ba 00 00 00 00       	mov    $0x0,%edx
  102e88:	eb 14                	jmp    102e9e <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102e8a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e8d:	8b 00                	mov    (%eax),%eax
  102e8f:	8d 48 04             	lea    0x4(%eax),%ecx
  102e92:	8b 55 08             	mov    0x8(%ebp),%edx
  102e95:	89 0a                	mov    %ecx,(%edx)
  102e97:	8b 00                	mov    (%eax),%eax
  102e99:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102e9e:	5d                   	pop    %ebp
  102e9f:	c3                   	ret    

00102ea0 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102ea0:	55                   	push   %ebp
  102ea1:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102ea3:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102ea7:	7e 14                	jle    102ebd <getint+0x1d>
        return va_arg(*ap, long long);
  102ea9:	8b 45 08             	mov    0x8(%ebp),%eax
  102eac:	8b 00                	mov    (%eax),%eax
  102eae:	8d 48 08             	lea    0x8(%eax),%ecx
  102eb1:	8b 55 08             	mov    0x8(%ebp),%edx
  102eb4:	89 0a                	mov    %ecx,(%edx)
  102eb6:	8b 50 04             	mov    0x4(%eax),%edx
  102eb9:	8b 00                	mov    (%eax),%eax
  102ebb:	eb 28                	jmp    102ee5 <getint+0x45>
    }
    else if (lflag) {
  102ebd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102ec1:	74 12                	je     102ed5 <getint+0x35>
        return va_arg(*ap, long);
  102ec3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec6:	8b 00                	mov    (%eax),%eax
  102ec8:	8d 48 04             	lea    0x4(%eax),%ecx
  102ecb:	8b 55 08             	mov    0x8(%ebp),%edx
  102ece:	89 0a                	mov    %ecx,(%edx)
  102ed0:	8b 00                	mov    (%eax),%eax
  102ed2:	99                   	cltd   
  102ed3:	eb 10                	jmp    102ee5 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102ed5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed8:	8b 00                	mov    (%eax),%eax
  102eda:	8d 48 04             	lea    0x4(%eax),%ecx
  102edd:	8b 55 08             	mov    0x8(%ebp),%edx
  102ee0:	89 0a                	mov    %ecx,(%edx)
  102ee2:	8b 00                	mov    (%eax),%eax
  102ee4:	99                   	cltd   
    }
}
  102ee5:	5d                   	pop    %ebp
  102ee6:	c3                   	ret    

00102ee7 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102ee7:	55                   	push   %ebp
  102ee8:	89 e5                	mov    %esp,%ebp
  102eea:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  102eed:	8d 45 14             	lea    0x14(%ebp),%eax
  102ef0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102ef3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ef6:	50                   	push   %eax
  102ef7:	ff 75 10             	pushl  0x10(%ebp)
  102efa:	ff 75 0c             	pushl  0xc(%ebp)
  102efd:	ff 75 08             	pushl  0x8(%ebp)
  102f00:	e8 05 00 00 00       	call   102f0a <vprintfmt>
  102f05:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  102f08:	c9                   	leave  
  102f09:	c3                   	ret    

00102f0a <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102f0a:	55                   	push   %ebp
  102f0b:	89 e5                	mov    %esp,%ebp
  102f0d:	56                   	push   %esi
  102f0e:	53                   	push   %ebx
  102f0f:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f12:	eb 18                	jmp    102f2c <vprintfmt+0x22>
            if (ch == '\0') {
  102f14:	85 db                	test   %ebx,%ebx
  102f16:	75 05                	jne    102f1d <vprintfmt+0x13>
                return;
  102f18:	e9 8b 03 00 00       	jmp    1032a8 <vprintfmt+0x39e>
            }
            putch(ch, putdat);
  102f1d:	83 ec 08             	sub    $0x8,%esp
  102f20:	ff 75 0c             	pushl  0xc(%ebp)
  102f23:	53                   	push   %ebx
  102f24:	8b 45 08             	mov    0x8(%ebp),%eax
  102f27:	ff d0                	call   *%eax
  102f29:	83 c4 10             	add    $0x10,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f2c:	8b 45 10             	mov    0x10(%ebp),%eax
  102f2f:	8d 50 01             	lea    0x1(%eax),%edx
  102f32:	89 55 10             	mov    %edx,0x10(%ebp)
  102f35:	0f b6 00             	movzbl (%eax),%eax
  102f38:	0f b6 d8             	movzbl %al,%ebx
  102f3b:	83 fb 25             	cmp    $0x25,%ebx
  102f3e:	75 d4                	jne    102f14 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102f40:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102f44:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102f4b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102f4e:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102f51:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102f58:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102f5b:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102f5e:	8b 45 10             	mov    0x10(%ebp),%eax
  102f61:	8d 50 01             	lea    0x1(%eax),%edx
  102f64:	89 55 10             	mov    %edx,0x10(%ebp)
  102f67:	0f b6 00             	movzbl (%eax),%eax
  102f6a:	0f b6 d8             	movzbl %al,%ebx
  102f6d:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102f70:	83 f8 55             	cmp    $0x55,%eax
  102f73:	0f 87 02 03 00 00    	ja     10327b <vprintfmt+0x371>
  102f79:	8b 04 85 74 3b 10 00 	mov    0x103b74(,%eax,4),%eax
  102f80:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102f82:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102f86:	eb d6                	jmp    102f5e <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102f88:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102f8c:	eb d0                	jmp    102f5e <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102f8e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102f95:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102f98:	89 d0                	mov    %edx,%eax
  102f9a:	c1 e0 02             	shl    $0x2,%eax
  102f9d:	01 d0                	add    %edx,%eax
  102f9f:	01 c0                	add    %eax,%eax
  102fa1:	01 d8                	add    %ebx,%eax
  102fa3:	83 e8 30             	sub    $0x30,%eax
  102fa6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102fa9:	8b 45 10             	mov    0x10(%ebp),%eax
  102fac:	0f b6 00             	movzbl (%eax),%eax
  102faf:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102fb2:	83 fb 2f             	cmp    $0x2f,%ebx
  102fb5:	7e 0b                	jle    102fc2 <vprintfmt+0xb8>
  102fb7:	83 fb 39             	cmp    $0x39,%ebx
  102fba:	7f 06                	jg     102fc2 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102fbc:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102fc0:	eb d3                	jmp    102f95 <vprintfmt+0x8b>
            goto process_precision;
  102fc2:	eb 2e                	jmp    102ff2 <vprintfmt+0xe8>

        case '*':
            precision = va_arg(ap, int);
  102fc4:	8b 45 14             	mov    0x14(%ebp),%eax
  102fc7:	8d 50 04             	lea    0x4(%eax),%edx
  102fca:	89 55 14             	mov    %edx,0x14(%ebp)
  102fcd:	8b 00                	mov    (%eax),%eax
  102fcf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102fd2:	eb 1e                	jmp    102ff2 <vprintfmt+0xe8>

        case '.':
            if (width < 0)
  102fd4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fd8:	79 07                	jns    102fe1 <vprintfmt+0xd7>
                width = 0;
  102fda:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102fe1:	e9 78 ff ff ff       	jmp    102f5e <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102fe6:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102fed:	e9 6c ff ff ff       	jmp    102f5e <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102ff2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ff6:	79 0d                	jns    103005 <vprintfmt+0xfb>
                width = precision, precision = -1;
  102ff8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ffb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ffe:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103005:	e9 54 ff ff ff       	jmp    102f5e <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  10300a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  10300e:	e9 4b ff ff ff       	jmp    102f5e <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103013:	8b 45 14             	mov    0x14(%ebp),%eax
  103016:	8d 50 04             	lea    0x4(%eax),%edx
  103019:	89 55 14             	mov    %edx,0x14(%ebp)
  10301c:	8b 00                	mov    (%eax),%eax
  10301e:	83 ec 08             	sub    $0x8,%esp
  103021:	ff 75 0c             	pushl  0xc(%ebp)
  103024:	50                   	push   %eax
  103025:	8b 45 08             	mov    0x8(%ebp),%eax
  103028:	ff d0                	call   *%eax
  10302a:	83 c4 10             	add    $0x10,%esp
            break;
  10302d:	e9 71 02 00 00       	jmp    1032a3 <vprintfmt+0x399>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103032:	8b 45 14             	mov    0x14(%ebp),%eax
  103035:	8d 50 04             	lea    0x4(%eax),%edx
  103038:	89 55 14             	mov    %edx,0x14(%ebp)
  10303b:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  10303d:	85 db                	test   %ebx,%ebx
  10303f:	79 02                	jns    103043 <vprintfmt+0x139>
                err = -err;
  103041:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103043:	83 fb 06             	cmp    $0x6,%ebx
  103046:	7f 0b                	jg     103053 <vprintfmt+0x149>
  103048:	8b 34 9d 34 3b 10 00 	mov    0x103b34(,%ebx,4),%esi
  10304f:	85 f6                	test   %esi,%esi
  103051:	75 19                	jne    10306c <vprintfmt+0x162>
                printfmt(putch, putdat, "error %d", err);
  103053:	53                   	push   %ebx
  103054:	68 61 3b 10 00       	push   $0x103b61
  103059:	ff 75 0c             	pushl  0xc(%ebp)
  10305c:	ff 75 08             	pushl  0x8(%ebp)
  10305f:	e8 83 fe ff ff       	call   102ee7 <printfmt>
  103064:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103067:	e9 37 02 00 00       	jmp    1032a3 <vprintfmt+0x399>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  10306c:	56                   	push   %esi
  10306d:	68 6a 3b 10 00       	push   $0x103b6a
  103072:	ff 75 0c             	pushl  0xc(%ebp)
  103075:	ff 75 08             	pushl  0x8(%ebp)
  103078:	e8 6a fe ff ff       	call   102ee7 <printfmt>
  10307d:	83 c4 10             	add    $0x10,%esp
            }
            break;
  103080:	e9 1e 02 00 00       	jmp    1032a3 <vprintfmt+0x399>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103085:	8b 45 14             	mov    0x14(%ebp),%eax
  103088:	8d 50 04             	lea    0x4(%eax),%edx
  10308b:	89 55 14             	mov    %edx,0x14(%ebp)
  10308e:	8b 30                	mov    (%eax),%esi
  103090:	85 f6                	test   %esi,%esi
  103092:	75 05                	jne    103099 <vprintfmt+0x18f>
                p = "(null)";
  103094:	be 6d 3b 10 00       	mov    $0x103b6d,%esi
            }
            if (width > 0 && padc != '-') {
  103099:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10309d:	7e 3f                	jle    1030de <vprintfmt+0x1d4>
  10309f:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  1030a3:	74 39                	je     1030de <vprintfmt+0x1d4>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1030a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1030a8:	83 ec 08             	sub    $0x8,%esp
  1030ab:	50                   	push   %eax
  1030ac:	56                   	push   %esi
  1030ad:	e8 1b f8 ff ff       	call   1028cd <strnlen>
  1030b2:	83 c4 10             	add    $0x10,%esp
  1030b5:	89 c2                	mov    %eax,%edx
  1030b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1030ba:	29 d0                	sub    %edx,%eax
  1030bc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1030bf:	eb 17                	jmp    1030d8 <vprintfmt+0x1ce>
                    putch(padc, putdat);
  1030c1:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1030c5:	83 ec 08             	sub    $0x8,%esp
  1030c8:	ff 75 0c             	pushl  0xc(%ebp)
  1030cb:	50                   	push   %eax
  1030cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1030cf:	ff d0                	call   *%eax
  1030d1:	83 c4 10             	add    $0x10,%esp
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  1030d4:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1030d8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1030dc:	7f e3                	jg     1030c1 <vprintfmt+0x1b7>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1030de:	eb 35                	jmp    103115 <vprintfmt+0x20b>
                if (altflag && (ch < ' ' || ch > '~')) {
  1030e0:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1030e4:	74 1c                	je     103102 <vprintfmt+0x1f8>
  1030e6:	83 fb 1f             	cmp    $0x1f,%ebx
  1030e9:	7e 05                	jle    1030f0 <vprintfmt+0x1e6>
  1030eb:	83 fb 7e             	cmp    $0x7e,%ebx
  1030ee:	7e 12                	jle    103102 <vprintfmt+0x1f8>
                    putch('?', putdat);
  1030f0:	83 ec 08             	sub    $0x8,%esp
  1030f3:	ff 75 0c             	pushl  0xc(%ebp)
  1030f6:	6a 3f                	push   $0x3f
  1030f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1030fb:	ff d0                	call   *%eax
  1030fd:	83 c4 10             	add    $0x10,%esp
  103100:	eb 0f                	jmp    103111 <vprintfmt+0x207>
                }
                else {
                    putch(ch, putdat);
  103102:	83 ec 08             	sub    $0x8,%esp
  103105:	ff 75 0c             	pushl  0xc(%ebp)
  103108:	53                   	push   %ebx
  103109:	8b 45 08             	mov    0x8(%ebp),%eax
  10310c:	ff d0                	call   *%eax
  10310e:	83 c4 10             	add    $0x10,%esp
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103111:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103115:	89 f0                	mov    %esi,%eax
  103117:	8d 70 01             	lea    0x1(%eax),%esi
  10311a:	0f b6 00             	movzbl (%eax),%eax
  10311d:	0f be d8             	movsbl %al,%ebx
  103120:	85 db                	test   %ebx,%ebx
  103122:	74 10                	je     103134 <vprintfmt+0x22a>
  103124:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103128:	78 b6                	js     1030e0 <vprintfmt+0x1d6>
  10312a:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  10312e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103132:	79 ac                	jns    1030e0 <vprintfmt+0x1d6>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103134:	eb 14                	jmp    10314a <vprintfmt+0x240>
                putch(' ', putdat);
  103136:	83 ec 08             	sub    $0x8,%esp
  103139:	ff 75 0c             	pushl  0xc(%ebp)
  10313c:	6a 20                	push   $0x20
  10313e:	8b 45 08             	mov    0x8(%ebp),%eax
  103141:	ff d0                	call   *%eax
  103143:	83 c4 10             	add    $0x10,%esp
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103146:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  10314a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10314e:	7f e6                	jg     103136 <vprintfmt+0x22c>
                putch(' ', putdat);
            }
            break;
  103150:	e9 4e 01 00 00       	jmp    1032a3 <vprintfmt+0x399>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103155:	83 ec 08             	sub    $0x8,%esp
  103158:	ff 75 e0             	pushl  -0x20(%ebp)
  10315b:	8d 45 14             	lea    0x14(%ebp),%eax
  10315e:	50                   	push   %eax
  10315f:	e8 3c fd ff ff       	call   102ea0 <getint>
  103164:	83 c4 10             	add    $0x10,%esp
  103167:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10316a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  10316d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103170:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103173:	85 d2                	test   %edx,%edx
  103175:	79 23                	jns    10319a <vprintfmt+0x290>
                putch('-', putdat);
  103177:	83 ec 08             	sub    $0x8,%esp
  10317a:	ff 75 0c             	pushl  0xc(%ebp)
  10317d:	6a 2d                	push   $0x2d
  10317f:	8b 45 08             	mov    0x8(%ebp),%eax
  103182:	ff d0                	call   *%eax
  103184:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  103187:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10318a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10318d:	f7 d8                	neg    %eax
  10318f:	83 d2 00             	adc    $0x0,%edx
  103192:	f7 da                	neg    %edx
  103194:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103197:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  10319a:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1031a1:	e9 9f 00 00 00       	jmp    103245 <vprintfmt+0x33b>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1031a6:	83 ec 08             	sub    $0x8,%esp
  1031a9:	ff 75 e0             	pushl  -0x20(%ebp)
  1031ac:	8d 45 14             	lea    0x14(%ebp),%eax
  1031af:	50                   	push   %eax
  1031b0:	e8 9c fc ff ff       	call   102e51 <getuint>
  1031b5:	83 c4 10             	add    $0x10,%esp
  1031b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031bb:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1031be:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1031c5:	eb 7e                	jmp    103245 <vprintfmt+0x33b>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1031c7:	83 ec 08             	sub    $0x8,%esp
  1031ca:	ff 75 e0             	pushl  -0x20(%ebp)
  1031cd:	8d 45 14             	lea    0x14(%ebp),%eax
  1031d0:	50                   	push   %eax
  1031d1:	e8 7b fc ff ff       	call   102e51 <getuint>
  1031d6:	83 c4 10             	add    $0x10,%esp
  1031d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1031df:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1031e6:	eb 5d                	jmp    103245 <vprintfmt+0x33b>

        // pointer
        case 'p':
            putch('0', putdat);
  1031e8:	83 ec 08             	sub    $0x8,%esp
  1031eb:	ff 75 0c             	pushl  0xc(%ebp)
  1031ee:	6a 30                	push   $0x30
  1031f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f3:	ff d0                	call   *%eax
  1031f5:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1031f8:	83 ec 08             	sub    $0x8,%esp
  1031fb:	ff 75 0c             	pushl  0xc(%ebp)
  1031fe:	6a 78                	push   $0x78
  103200:	8b 45 08             	mov    0x8(%ebp),%eax
  103203:	ff d0                	call   *%eax
  103205:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103208:	8b 45 14             	mov    0x14(%ebp),%eax
  10320b:	8d 50 04             	lea    0x4(%eax),%edx
  10320e:	89 55 14             	mov    %edx,0x14(%ebp)
  103211:	8b 00                	mov    (%eax),%eax
  103213:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103216:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10321d:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103224:	eb 1f                	jmp    103245 <vprintfmt+0x33b>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103226:	83 ec 08             	sub    $0x8,%esp
  103229:	ff 75 e0             	pushl  -0x20(%ebp)
  10322c:	8d 45 14             	lea    0x14(%ebp),%eax
  10322f:	50                   	push   %eax
  103230:	e8 1c fc ff ff       	call   102e51 <getuint>
  103235:	83 c4 10             	add    $0x10,%esp
  103238:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10323b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10323e:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103245:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103249:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10324c:	83 ec 04             	sub    $0x4,%esp
  10324f:	52                   	push   %edx
  103250:	ff 75 e8             	pushl  -0x18(%ebp)
  103253:	50                   	push   %eax
  103254:	ff 75 f4             	pushl  -0xc(%ebp)
  103257:	ff 75 f0             	pushl  -0x10(%ebp)
  10325a:	ff 75 0c             	pushl  0xc(%ebp)
  10325d:	ff 75 08             	pushl  0x8(%ebp)
  103260:	e8 fc fa ff ff       	call   102d61 <printnum>
  103265:	83 c4 20             	add    $0x20,%esp
            break;
  103268:	eb 39                	jmp    1032a3 <vprintfmt+0x399>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  10326a:	83 ec 08             	sub    $0x8,%esp
  10326d:	ff 75 0c             	pushl  0xc(%ebp)
  103270:	53                   	push   %ebx
  103271:	8b 45 08             	mov    0x8(%ebp),%eax
  103274:	ff d0                	call   *%eax
  103276:	83 c4 10             	add    $0x10,%esp
            break;
  103279:	eb 28                	jmp    1032a3 <vprintfmt+0x399>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10327b:	83 ec 08             	sub    $0x8,%esp
  10327e:	ff 75 0c             	pushl  0xc(%ebp)
  103281:	6a 25                	push   $0x25
  103283:	8b 45 08             	mov    0x8(%ebp),%eax
  103286:	ff d0                	call   *%eax
  103288:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  10328b:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10328f:	eb 04                	jmp    103295 <vprintfmt+0x38b>
  103291:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103295:	8b 45 10             	mov    0x10(%ebp),%eax
  103298:	83 e8 01             	sub    $0x1,%eax
  10329b:	0f b6 00             	movzbl (%eax),%eax
  10329e:	3c 25                	cmp    $0x25,%al
  1032a0:	75 ef                	jne    103291 <vprintfmt+0x387>
                /* do nothing */;
            break;
  1032a2:	90                   	nop
        }
    }
  1032a3:	e9 6a fc ff ff       	jmp    102f12 <vprintfmt+0x8>
}
  1032a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1032ab:	5b                   	pop    %ebx
  1032ac:	5e                   	pop    %esi
  1032ad:	5d                   	pop    %ebp
  1032ae:	c3                   	ret    

001032af <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1032af:	55                   	push   %ebp
  1032b0:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1032b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032b5:	8b 40 08             	mov    0x8(%eax),%eax
  1032b8:	8d 50 01             	lea    0x1(%eax),%edx
  1032bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032be:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1032c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c4:	8b 10                	mov    (%eax),%edx
  1032c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c9:	8b 40 04             	mov    0x4(%eax),%eax
  1032cc:	39 c2                	cmp    %eax,%edx
  1032ce:	73 12                	jae    1032e2 <sprintputch+0x33>
        *b->buf ++ = ch;
  1032d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032d3:	8b 00                	mov    (%eax),%eax
  1032d5:	8d 48 01             	lea    0x1(%eax),%ecx
  1032d8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032db:	89 0a                	mov    %ecx,(%edx)
  1032dd:	8b 55 08             	mov    0x8(%ebp),%edx
  1032e0:	88 10                	mov    %dl,(%eax)
    }
}
  1032e2:	5d                   	pop    %ebp
  1032e3:	c3                   	ret    

001032e4 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1032e4:	55                   	push   %ebp
  1032e5:	89 e5                	mov    %esp,%ebp
  1032e7:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1032ea:	8d 45 14             	lea    0x14(%ebp),%eax
  1032ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1032f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032f3:	50                   	push   %eax
  1032f4:	ff 75 10             	pushl  0x10(%ebp)
  1032f7:	ff 75 0c             	pushl  0xc(%ebp)
  1032fa:	ff 75 08             	pushl  0x8(%ebp)
  1032fd:	e8 0b 00 00 00       	call   10330d <vsnprintf>
  103302:	83 c4 10             	add    $0x10,%esp
  103305:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103308:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10330b:	c9                   	leave  
  10330c:	c3                   	ret    

0010330d <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10330d:	55                   	push   %ebp
  10330e:	89 e5                	mov    %esp,%ebp
  103310:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103313:	8b 45 08             	mov    0x8(%ebp),%eax
  103316:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103319:	8b 45 0c             	mov    0xc(%ebp),%eax
  10331c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10331f:	8b 45 08             	mov    0x8(%ebp),%eax
  103322:	01 d0                	add    %edx,%eax
  103324:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103327:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10332e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103332:	74 0a                	je     10333e <vsnprintf+0x31>
  103334:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103337:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10333a:	39 c2                	cmp    %eax,%edx
  10333c:	76 07                	jbe    103345 <vsnprintf+0x38>
        return -E_INVAL;
  10333e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103343:	eb 20                	jmp    103365 <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103345:	ff 75 14             	pushl  0x14(%ebp)
  103348:	ff 75 10             	pushl  0x10(%ebp)
  10334b:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10334e:	50                   	push   %eax
  10334f:	68 af 32 10 00       	push   $0x1032af
  103354:	e8 b1 fb ff ff       	call   102f0a <vprintfmt>
  103359:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  10335c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10335f:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103362:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103365:	c9                   	leave  
  103366:	c3                   	ret    
