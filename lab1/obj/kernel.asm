
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
  10001f:	e8 82 2a 00 00       	call   102aa6 <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 05 15 00 00       	call   101531 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 40 32 10 00 	movl   $0x103240,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 5c 32 10 00       	push   $0x10325c
  10003e:	e8 f1 01 00 00       	call   100234 <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 6f 08 00 00       	call   1008ba <print_kerninfo>

    grade_backtrace();
  10004b:	e8 71 00 00 00       	call   1000c1 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 16 27 00 00       	call   10276b <pmm_init>

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
  100109:	68 61 32 10 00       	push   $0x103261
  10010e:	e8 21 01 00 00       	call   100234 <cprintf>
  100113:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  100116:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011a:	0f b7 d0             	movzwl %ax,%edx
  10011d:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100122:	83 ec 04             	sub    $0x4,%esp
  100125:	52                   	push   %edx
  100126:	50                   	push   %eax
  100127:	68 6f 32 10 00       	push   $0x10326f
  10012c:	e8 03 01 00 00       	call   100234 <cprintf>
  100131:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  100134:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100138:	0f b7 d0             	movzwl %ax,%edx
  10013b:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  100140:	83 ec 04             	sub    $0x4,%esp
  100143:	52                   	push   %edx
  100144:	50                   	push   %eax
  100145:	68 7d 32 10 00       	push   $0x10327d
  10014a:	e8 e5 00 00 00       	call   100234 <cprintf>
  10014f:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  100152:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100156:	0f b7 d0             	movzwl %ax,%edx
  100159:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  10015e:	83 ec 04             	sub    $0x4,%esp
  100161:	52                   	push   %edx
  100162:	50                   	push   %eax
  100163:	68 8b 32 10 00       	push   $0x10328b
  100168:	e8 c7 00 00 00       	call   100234 <cprintf>
  10016d:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100170:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100174:	0f b7 d0             	movzwl %ax,%edx
  100177:	a1 80 ea 10 00       	mov    0x10ea80,%eax
  10017c:	83 ec 04             	sub    $0x4,%esp
  10017f:	52                   	push   %edx
  100180:	50                   	push   %eax
  100181:	68 99 32 10 00       	push   $0x103299
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
  1001b5:	68 a8 32 10 00       	push   $0x1032a8
  1001ba:	e8 75 00 00 00       	call   100234 <cprintf>
  1001bf:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001c2:	e8 d6 ff ff ff       	call   10019d <lab1_switch_to_user>
    lab1_print_cur_status();
  1001c7:	e8 15 ff ff ff       	call   1000e1 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001cc:	83 ec 0c             	sub    $0xc,%esp
  1001cf:	68 c8 32 10 00       	push   $0x1032c8
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
  100227:	e8 ae 2b 00 00       	call   102dda <vprintfmt>
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
  1002e9:	68 e7 32 10 00       	push   $0x1032e7
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
  1003c3:	68 ea 32 10 00       	push   $0x1032ea
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
  1003e5:	68 06 33 10 00       	push   $0x103306
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
  10041b:	68 08 33 10 00       	push   $0x103308
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
  10043d:	68 06 33 10 00       	push   $0x103306
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
  1005b5:	c7 00 28 33 10 00    	movl   $0x103328,(%eax)
    info->eip_line = 0;
  1005bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005be:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c8:	c7 40 08 28 33 10 00 	movl   $0x103328,0x8(%eax)
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
  1005ec:	c7 45 f4 8c 3b 10 00 	movl   $0x103b8c,-0xc(%ebp)
    stab_end = __STAB_END__;
  1005f3:	c7 45 f0 48 b2 10 00 	movl   $0x10b248,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  1005fa:	c7 45 ec 49 b2 10 00 	movl   $0x10b249,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100601:	c7 45 e8 3a d2 10 00 	movl   $0x10d23a,-0x18(%ebp)

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
  10073b:	e8 da 21 00 00       	call   10291a <strfind>
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
  1008c3:	68 32 33 10 00       	push   $0x103332
  1008c8:	e8 67 f9 ff ff       	call   100234 <cprintf>
  1008cd:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  1008d0:	83 ec 08             	sub    $0x8,%esp
  1008d3:	68 00 00 10 00       	push   $0x100000
  1008d8:	68 4b 33 10 00       	push   $0x10334b
  1008dd:	e8 52 f9 ff ff       	call   100234 <cprintf>
  1008e2:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  1008e5:	83 ec 08             	sub    $0x8,%esp
  1008e8:	68 37 32 10 00       	push   $0x103237
  1008ed:	68 63 33 10 00       	push   $0x103363
  1008f2:	e8 3d f9 ff ff       	call   100234 <cprintf>
  1008f7:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  1008fa:	83 ec 08             	sub    $0x8,%esp
  1008fd:	68 56 ea 10 00       	push   $0x10ea56
  100902:	68 7b 33 10 00       	push   $0x10337b
  100907:	e8 28 f9 ff ff       	call   100234 <cprintf>
  10090c:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  10090f:	83 ec 08             	sub    $0x8,%esp
  100912:	68 00 fe 10 00       	push   $0x10fe00
  100917:	68 93 33 10 00       	push   $0x103393
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
  100947:	68 ac 33 10 00       	push   $0x1033ac
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
  10097b:	68 d6 33 10 00       	push   $0x1033d6
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
  1009e2:	68 f2 33 10 00       	push   $0x1033f2
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
  100a2d:	68 04 34 10 00       	push   $0x103404
  100a32:	e8 fd f7 ff ff       	call   100234 <cprintf>
  100a37:	83 c4 10             	add    $0x10,%esp
        cprintf("  eip: 0x%08x   args", eip);
  100a3a:	83 ec 08             	sub    $0x8,%esp
  100a3d:	ff 75 f0             	pushl  -0x10(%ebp)
  100a40:	68 13 34 10 00       	push   $0x103413
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
  100a74:	68 28 34 10 00       	push   $0x103428
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
  100a8e:	68 31 34 10 00       	push   $0x103431
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
  100b02:	68 b4 34 10 00       	push   $0x1034b4
  100b07:	e8 db 1d 00 00       	call   1028e7 <strchr>
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
  100b2a:	68 b9 34 10 00       	push   $0x1034b9
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
  100b6e:	68 b4 34 10 00       	push   $0x1034b4
  100b73:	e8 6f 1d 00 00       	call   1028e7 <strchr>
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
  100bd8:	e8 6a 1c 00 00       	call   102847 <strcmp>
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
  100c26:	68 d7 34 10 00       	push   $0x1034d7
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
  100c43:	68 f0 34 10 00       	push   $0x1034f0
  100c48:	e8 e7 f5 ff ff       	call   100234 <cprintf>
  100c4d:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100c50:	83 ec 0c             	sub    $0xc,%esp
  100c53:	68 18 35 10 00       	push   $0x103518
  100c58:	e8 d7 f5 ff ff       	call   100234 <cprintf>
  100c5d:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100c60:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c64:	74 0e                	je     100c74 <kmonitor+0x3a>
        print_trapframe(tf);
  100c66:	83 ec 0c             	sub    $0xc,%esp
  100c69:	ff 75 08             	pushl  0x8(%ebp)
  100c6c:	e8 ad 0b 00 00       	call   10181e <print_trapframe>
  100c71:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c74:	83 ec 0c             	sub    $0xc,%esp
  100c77:	68 3d 35 10 00       	push   $0x10353d
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
  100ce3:	68 41 35 10 00       	push   $0x103541
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
  100d73:	68 4a 35 10 00       	push   $0x10354a
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
  101154:	e8 8d 19 00 00       	call   102ae6 <memmove>
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
  1014da:	68 65 35 10 00       	push   $0x103565
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
  101552:	68 71 35 10 00       	push   $0x103571
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
  1017c3:	68 c0 35 10 00       	push   $0x1035c0
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
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  1017d5:	5d                   	pop    %ebp
  1017d6:	c3                   	ret    

001017d7 <trapname>:

static const char *
trapname(int trapno) {
  1017d7:	55                   	push   %ebp
  1017d8:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1017da:	8b 45 08             	mov    0x8(%ebp),%eax
  1017dd:	83 f8 13             	cmp    $0x13,%eax
  1017e0:	77 0c                	ja     1017ee <trapname+0x17>
        return excnames[trapno];
  1017e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1017e5:	8b 04 85 40 39 10 00 	mov    0x103940(,%eax,4),%eax
  1017ec:	eb 18                	jmp    101806 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1017ee:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1017f2:	7e 0d                	jle    101801 <trapname+0x2a>
  1017f4:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1017f8:	7f 07                	jg     101801 <trapname+0x2a>
        return "Hardware Interrupt";
  1017fa:	b8 ca 35 10 00       	mov    $0x1035ca,%eax
  1017ff:	eb 05                	jmp    101806 <trapname+0x2f>
    }
    return "(unknown trap)";
  101801:	b8 dd 35 10 00       	mov    $0x1035dd,%eax
}
  101806:	5d                   	pop    %ebp
  101807:	c3                   	ret    

00101808 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101808:	55                   	push   %ebp
  101809:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  10180b:	8b 45 08             	mov    0x8(%ebp),%eax
  10180e:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101812:	66 83 f8 08          	cmp    $0x8,%ax
  101816:	0f 94 c0             	sete   %al
  101819:	0f b6 c0             	movzbl %al,%eax
}
  10181c:	5d                   	pop    %ebp
  10181d:	c3                   	ret    

0010181e <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  10181e:	55                   	push   %ebp
  10181f:	89 e5                	mov    %esp,%ebp
  101821:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  101824:	83 ec 08             	sub    $0x8,%esp
  101827:	ff 75 08             	pushl  0x8(%ebp)
  10182a:	68 1e 36 10 00       	push   $0x10361e
  10182f:	e8 00 ea ff ff       	call   100234 <cprintf>
  101834:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101837:	8b 45 08             	mov    0x8(%ebp),%eax
  10183a:	83 ec 0c             	sub    $0xc,%esp
  10183d:	50                   	push   %eax
  10183e:	e8 b7 01 00 00       	call   1019fa <print_regs>
  101843:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101846:	8b 45 08             	mov    0x8(%ebp),%eax
  101849:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  10184d:	0f b7 c0             	movzwl %ax,%eax
  101850:	83 ec 08             	sub    $0x8,%esp
  101853:	50                   	push   %eax
  101854:	68 2f 36 10 00       	push   $0x10362f
  101859:	e8 d6 e9 ff ff       	call   100234 <cprintf>
  10185e:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101861:	8b 45 08             	mov    0x8(%ebp),%eax
  101864:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101868:	0f b7 c0             	movzwl %ax,%eax
  10186b:	83 ec 08             	sub    $0x8,%esp
  10186e:	50                   	push   %eax
  10186f:	68 42 36 10 00       	push   $0x103642
  101874:	e8 bb e9 ff ff       	call   100234 <cprintf>
  101879:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  10187c:	8b 45 08             	mov    0x8(%ebp),%eax
  10187f:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101883:	0f b7 c0             	movzwl %ax,%eax
  101886:	83 ec 08             	sub    $0x8,%esp
  101889:	50                   	push   %eax
  10188a:	68 55 36 10 00       	push   $0x103655
  10188f:	e8 a0 e9 ff ff       	call   100234 <cprintf>
  101894:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101897:	8b 45 08             	mov    0x8(%ebp),%eax
  10189a:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  10189e:	0f b7 c0             	movzwl %ax,%eax
  1018a1:	83 ec 08             	sub    $0x8,%esp
  1018a4:	50                   	push   %eax
  1018a5:	68 68 36 10 00       	push   $0x103668
  1018aa:	e8 85 e9 ff ff       	call   100234 <cprintf>
  1018af:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1018b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1018b5:	8b 40 30             	mov    0x30(%eax),%eax
  1018b8:	83 ec 0c             	sub    $0xc,%esp
  1018bb:	50                   	push   %eax
  1018bc:	e8 16 ff ff ff       	call   1017d7 <trapname>
  1018c1:	83 c4 10             	add    $0x10,%esp
  1018c4:	89 c2                	mov    %eax,%edx
  1018c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1018c9:	8b 40 30             	mov    0x30(%eax),%eax
  1018cc:	83 ec 04             	sub    $0x4,%esp
  1018cf:	52                   	push   %edx
  1018d0:	50                   	push   %eax
  1018d1:	68 7b 36 10 00       	push   $0x10367b
  1018d6:	e8 59 e9 ff ff       	call   100234 <cprintf>
  1018db:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  1018de:	8b 45 08             	mov    0x8(%ebp),%eax
  1018e1:	8b 40 34             	mov    0x34(%eax),%eax
  1018e4:	83 ec 08             	sub    $0x8,%esp
  1018e7:	50                   	push   %eax
  1018e8:	68 8d 36 10 00       	push   $0x10368d
  1018ed:	e8 42 e9 ff ff       	call   100234 <cprintf>
  1018f2:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  1018f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1018f8:	8b 40 38             	mov    0x38(%eax),%eax
  1018fb:	83 ec 08             	sub    $0x8,%esp
  1018fe:	50                   	push   %eax
  1018ff:	68 9c 36 10 00       	push   $0x10369c
  101904:	e8 2b e9 ff ff       	call   100234 <cprintf>
  101909:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  10190c:	8b 45 08             	mov    0x8(%ebp),%eax
  10190f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101913:	0f b7 c0             	movzwl %ax,%eax
  101916:	83 ec 08             	sub    $0x8,%esp
  101919:	50                   	push   %eax
  10191a:	68 ab 36 10 00       	push   $0x1036ab
  10191f:	e8 10 e9 ff ff       	call   100234 <cprintf>
  101924:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101927:	8b 45 08             	mov    0x8(%ebp),%eax
  10192a:	8b 40 40             	mov    0x40(%eax),%eax
  10192d:	83 ec 08             	sub    $0x8,%esp
  101930:	50                   	push   %eax
  101931:	68 be 36 10 00       	push   $0x1036be
  101936:	e8 f9 e8 ff ff       	call   100234 <cprintf>
  10193b:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  10193e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101945:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  10194c:	eb 3f                	jmp    10198d <print_trapframe+0x16f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  10194e:	8b 45 08             	mov    0x8(%ebp),%eax
  101951:	8b 50 40             	mov    0x40(%eax),%edx
  101954:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101957:	21 d0                	and    %edx,%eax
  101959:	85 c0                	test   %eax,%eax
  10195b:	74 29                	je     101986 <print_trapframe+0x168>
  10195d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101960:	8b 04 85 c0 e5 10 00 	mov    0x10e5c0(,%eax,4),%eax
  101967:	85 c0                	test   %eax,%eax
  101969:	74 1b                	je     101986 <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  10196b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10196e:	8b 04 85 c0 e5 10 00 	mov    0x10e5c0(,%eax,4),%eax
  101975:	83 ec 08             	sub    $0x8,%esp
  101978:	50                   	push   %eax
  101979:	68 cd 36 10 00       	push   $0x1036cd
  10197e:	e8 b1 e8 ff ff       	call   100234 <cprintf>
  101983:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101986:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10198a:	d1 65 f0             	shll   -0x10(%ebp)
  10198d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101990:	83 f8 17             	cmp    $0x17,%eax
  101993:	76 b9                	jbe    10194e <print_trapframe+0x130>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101995:	8b 45 08             	mov    0x8(%ebp),%eax
  101998:	8b 40 40             	mov    0x40(%eax),%eax
  10199b:	25 00 30 00 00       	and    $0x3000,%eax
  1019a0:	c1 e8 0c             	shr    $0xc,%eax
  1019a3:	83 ec 08             	sub    $0x8,%esp
  1019a6:	50                   	push   %eax
  1019a7:	68 d1 36 10 00       	push   $0x1036d1
  1019ac:	e8 83 e8 ff ff       	call   100234 <cprintf>
  1019b1:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  1019b4:	83 ec 0c             	sub    $0xc,%esp
  1019b7:	ff 75 08             	pushl  0x8(%ebp)
  1019ba:	e8 49 fe ff ff       	call   101808 <trap_in_kernel>
  1019bf:	83 c4 10             	add    $0x10,%esp
  1019c2:	85 c0                	test   %eax,%eax
  1019c4:	75 32                	jne    1019f8 <print_trapframe+0x1da>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  1019c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1019c9:	8b 40 44             	mov    0x44(%eax),%eax
  1019cc:	83 ec 08             	sub    $0x8,%esp
  1019cf:	50                   	push   %eax
  1019d0:	68 da 36 10 00       	push   $0x1036da
  1019d5:	e8 5a e8 ff ff       	call   100234 <cprintf>
  1019da:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  1019dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e0:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  1019e4:	0f b7 c0             	movzwl %ax,%eax
  1019e7:	83 ec 08             	sub    $0x8,%esp
  1019ea:	50                   	push   %eax
  1019eb:	68 e9 36 10 00       	push   $0x1036e9
  1019f0:	e8 3f e8 ff ff       	call   100234 <cprintf>
  1019f5:	83 c4 10             	add    $0x10,%esp
    }
}
  1019f8:	c9                   	leave  
  1019f9:	c3                   	ret    

001019fa <print_regs>:

void
print_regs(struct pushregs *regs) {
  1019fa:	55                   	push   %ebp
  1019fb:	89 e5                	mov    %esp,%ebp
  1019fd:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101a00:	8b 45 08             	mov    0x8(%ebp),%eax
  101a03:	8b 00                	mov    (%eax),%eax
  101a05:	83 ec 08             	sub    $0x8,%esp
  101a08:	50                   	push   %eax
  101a09:	68 fc 36 10 00       	push   $0x1036fc
  101a0e:	e8 21 e8 ff ff       	call   100234 <cprintf>
  101a13:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101a16:	8b 45 08             	mov    0x8(%ebp),%eax
  101a19:	8b 40 04             	mov    0x4(%eax),%eax
  101a1c:	83 ec 08             	sub    $0x8,%esp
  101a1f:	50                   	push   %eax
  101a20:	68 0b 37 10 00       	push   $0x10370b
  101a25:	e8 0a e8 ff ff       	call   100234 <cprintf>
  101a2a:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101a2d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a30:	8b 40 08             	mov    0x8(%eax),%eax
  101a33:	83 ec 08             	sub    $0x8,%esp
  101a36:	50                   	push   %eax
  101a37:	68 1a 37 10 00       	push   $0x10371a
  101a3c:	e8 f3 e7 ff ff       	call   100234 <cprintf>
  101a41:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101a44:	8b 45 08             	mov    0x8(%ebp),%eax
  101a47:	8b 40 0c             	mov    0xc(%eax),%eax
  101a4a:	83 ec 08             	sub    $0x8,%esp
  101a4d:	50                   	push   %eax
  101a4e:	68 29 37 10 00       	push   $0x103729
  101a53:	e8 dc e7 ff ff       	call   100234 <cprintf>
  101a58:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101a5b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a5e:	8b 40 10             	mov    0x10(%eax),%eax
  101a61:	83 ec 08             	sub    $0x8,%esp
  101a64:	50                   	push   %eax
  101a65:	68 38 37 10 00       	push   $0x103738
  101a6a:	e8 c5 e7 ff ff       	call   100234 <cprintf>
  101a6f:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101a72:	8b 45 08             	mov    0x8(%ebp),%eax
  101a75:	8b 40 14             	mov    0x14(%eax),%eax
  101a78:	83 ec 08             	sub    $0x8,%esp
  101a7b:	50                   	push   %eax
  101a7c:	68 47 37 10 00       	push   $0x103747
  101a81:	e8 ae e7 ff ff       	call   100234 <cprintf>
  101a86:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101a89:	8b 45 08             	mov    0x8(%ebp),%eax
  101a8c:	8b 40 18             	mov    0x18(%eax),%eax
  101a8f:	83 ec 08             	sub    $0x8,%esp
  101a92:	50                   	push   %eax
  101a93:	68 56 37 10 00       	push   $0x103756
  101a98:	e8 97 e7 ff ff       	call   100234 <cprintf>
  101a9d:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101aa0:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa3:	8b 40 1c             	mov    0x1c(%eax),%eax
  101aa6:	83 ec 08             	sub    $0x8,%esp
  101aa9:	50                   	push   %eax
  101aaa:	68 65 37 10 00       	push   $0x103765
  101aaf:	e8 80 e7 ff ff       	call   100234 <cprintf>
  101ab4:	83 c4 10             	add    $0x10,%esp
}
  101ab7:	c9                   	leave  
  101ab8:	c3                   	ret    

00101ab9 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101ab9:	55                   	push   %ebp
  101aba:	89 e5                	mov    %esp,%ebp
  101abc:	83 ec 18             	sub    $0x18,%esp
    char c;

    switch (tf->tf_trapno) {
  101abf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac2:	8b 40 30             	mov    0x30(%eax),%eax
  101ac5:	83 f8 2f             	cmp    $0x2f,%eax
  101ac8:	77 1e                	ja     101ae8 <trap_dispatch+0x2f>
  101aca:	83 f8 2e             	cmp    $0x2e,%eax
  101acd:	0f 83 b4 00 00 00    	jae    101b87 <trap_dispatch+0xce>
  101ad3:	83 f8 21             	cmp    $0x21,%eax
  101ad6:	74 3e                	je     101b16 <trap_dispatch+0x5d>
  101ad8:	83 f8 24             	cmp    $0x24,%eax
  101adb:	74 15                	je     101af2 <trap_dispatch+0x39>
  101add:	83 f8 20             	cmp    $0x20,%eax
  101ae0:	0f 84 a4 00 00 00    	je     101b8a <trap_dispatch+0xd1>
  101ae6:	eb 69                	jmp    101b51 <trap_dispatch+0x98>
  101ae8:	83 e8 78             	sub    $0x78,%eax
  101aeb:	83 f8 01             	cmp    $0x1,%eax
  101aee:	77 61                	ja     101b51 <trap_dispatch+0x98>
  101af0:	eb 48                	jmp    101b3a <trap_dispatch+0x81>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101af2:	e8 99 fa ff ff       	call   101590 <cons_getc>
  101af7:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101afa:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101afe:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b02:	83 ec 04             	sub    $0x4,%esp
  101b05:	52                   	push   %edx
  101b06:	50                   	push   %eax
  101b07:	68 74 37 10 00       	push   $0x103774
  101b0c:	e8 23 e7 ff ff       	call   100234 <cprintf>
  101b11:	83 c4 10             	add    $0x10,%esp
        break;
  101b14:	eb 75                	jmp    101b8b <trap_dispatch+0xd2>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101b16:	e8 75 fa ff ff       	call   101590 <cons_getc>
  101b1b:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101b1e:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b22:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b26:	83 ec 04             	sub    $0x4,%esp
  101b29:	52                   	push   %edx
  101b2a:	50                   	push   %eax
  101b2b:	68 86 37 10 00       	push   $0x103786
  101b30:	e8 ff e6 ff ff       	call   100234 <cprintf>
  101b35:	83 c4 10             	add    $0x10,%esp
        break;
  101b38:	eb 51                	jmp    101b8b <trap_dispatch+0xd2>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101b3a:	83 ec 04             	sub    $0x4,%esp
  101b3d:	68 95 37 10 00       	push   $0x103795
  101b42:	68 a2 00 00 00       	push   $0xa2
  101b47:	68 a5 37 10 00       	push   $0x1037a5
  101b4c:	e8 48 e8 ff ff       	call   100399 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101b51:	8b 45 08             	mov    0x8(%ebp),%eax
  101b54:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b58:	0f b7 c0             	movzwl %ax,%eax
  101b5b:	83 e0 03             	and    $0x3,%eax
  101b5e:	85 c0                	test   %eax,%eax
  101b60:	75 29                	jne    101b8b <trap_dispatch+0xd2>
            print_trapframe(tf);
  101b62:	83 ec 0c             	sub    $0xc,%esp
  101b65:	ff 75 08             	pushl  0x8(%ebp)
  101b68:	e8 b1 fc ff ff       	call   10181e <print_trapframe>
  101b6d:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101b70:	83 ec 04             	sub    $0x4,%esp
  101b73:	68 b6 37 10 00       	push   $0x1037b6
  101b78:	68 ac 00 00 00       	push   $0xac
  101b7d:	68 a5 37 10 00       	push   $0x1037a5
  101b82:	e8 12 e8 ff ff       	call   100399 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101b87:	90                   	nop
  101b88:	eb 01                	jmp    101b8b <trap_dispatch+0xd2>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
  101b8a:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101b8b:	c9                   	leave  
  101b8c:	c3                   	ret    

00101b8d <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101b8d:	55                   	push   %ebp
  101b8e:	89 e5                	mov    %esp,%ebp
  101b90:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101b93:	83 ec 0c             	sub    $0xc,%esp
  101b96:	ff 75 08             	pushl  0x8(%ebp)
  101b99:	e8 1b ff ff ff       	call   101ab9 <trap_dispatch>
  101b9e:	83 c4 10             	add    $0x10,%esp
}
  101ba1:	c9                   	leave  
  101ba2:	c3                   	ret    

00101ba3 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101ba3:	6a 00                	push   $0x0
  pushl $0
  101ba5:	6a 00                	push   $0x0
  jmp __alltraps
  101ba7:	e9 67 0a 00 00       	jmp    102613 <__alltraps>

00101bac <vector1>:
.globl vector1
vector1:
  pushl $0
  101bac:	6a 00                	push   $0x0
  pushl $1
  101bae:	6a 01                	push   $0x1
  jmp __alltraps
  101bb0:	e9 5e 0a 00 00       	jmp    102613 <__alltraps>

00101bb5 <vector2>:
.globl vector2
vector2:
  pushl $0
  101bb5:	6a 00                	push   $0x0
  pushl $2
  101bb7:	6a 02                	push   $0x2
  jmp __alltraps
  101bb9:	e9 55 0a 00 00       	jmp    102613 <__alltraps>

00101bbe <vector3>:
.globl vector3
vector3:
  pushl $0
  101bbe:	6a 00                	push   $0x0
  pushl $3
  101bc0:	6a 03                	push   $0x3
  jmp __alltraps
  101bc2:	e9 4c 0a 00 00       	jmp    102613 <__alltraps>

00101bc7 <vector4>:
.globl vector4
vector4:
  pushl $0
  101bc7:	6a 00                	push   $0x0
  pushl $4
  101bc9:	6a 04                	push   $0x4
  jmp __alltraps
  101bcb:	e9 43 0a 00 00       	jmp    102613 <__alltraps>

00101bd0 <vector5>:
.globl vector5
vector5:
  pushl $0
  101bd0:	6a 00                	push   $0x0
  pushl $5
  101bd2:	6a 05                	push   $0x5
  jmp __alltraps
  101bd4:	e9 3a 0a 00 00       	jmp    102613 <__alltraps>

00101bd9 <vector6>:
.globl vector6
vector6:
  pushl $0
  101bd9:	6a 00                	push   $0x0
  pushl $6
  101bdb:	6a 06                	push   $0x6
  jmp __alltraps
  101bdd:	e9 31 0a 00 00       	jmp    102613 <__alltraps>

00101be2 <vector7>:
.globl vector7
vector7:
  pushl $0
  101be2:	6a 00                	push   $0x0
  pushl $7
  101be4:	6a 07                	push   $0x7
  jmp __alltraps
  101be6:	e9 28 0a 00 00       	jmp    102613 <__alltraps>

00101beb <vector8>:
.globl vector8
vector8:
  pushl $8
  101beb:	6a 08                	push   $0x8
  jmp __alltraps
  101bed:	e9 21 0a 00 00       	jmp    102613 <__alltraps>

00101bf2 <vector9>:
.globl vector9
vector9:
  pushl $9
  101bf2:	6a 09                	push   $0x9
  jmp __alltraps
  101bf4:	e9 1a 0a 00 00       	jmp    102613 <__alltraps>

00101bf9 <vector10>:
.globl vector10
vector10:
  pushl $10
  101bf9:	6a 0a                	push   $0xa
  jmp __alltraps
  101bfb:	e9 13 0a 00 00       	jmp    102613 <__alltraps>

00101c00 <vector11>:
.globl vector11
vector11:
  pushl $11
  101c00:	6a 0b                	push   $0xb
  jmp __alltraps
  101c02:	e9 0c 0a 00 00       	jmp    102613 <__alltraps>

00101c07 <vector12>:
.globl vector12
vector12:
  pushl $12
  101c07:	6a 0c                	push   $0xc
  jmp __alltraps
  101c09:	e9 05 0a 00 00       	jmp    102613 <__alltraps>

00101c0e <vector13>:
.globl vector13
vector13:
  pushl $13
  101c0e:	6a 0d                	push   $0xd
  jmp __alltraps
  101c10:	e9 fe 09 00 00       	jmp    102613 <__alltraps>

00101c15 <vector14>:
.globl vector14
vector14:
  pushl $14
  101c15:	6a 0e                	push   $0xe
  jmp __alltraps
  101c17:	e9 f7 09 00 00       	jmp    102613 <__alltraps>

00101c1c <vector15>:
.globl vector15
vector15:
  pushl $0
  101c1c:	6a 00                	push   $0x0
  pushl $15
  101c1e:	6a 0f                	push   $0xf
  jmp __alltraps
  101c20:	e9 ee 09 00 00       	jmp    102613 <__alltraps>

00101c25 <vector16>:
.globl vector16
vector16:
  pushl $0
  101c25:	6a 00                	push   $0x0
  pushl $16
  101c27:	6a 10                	push   $0x10
  jmp __alltraps
  101c29:	e9 e5 09 00 00       	jmp    102613 <__alltraps>

00101c2e <vector17>:
.globl vector17
vector17:
  pushl $17
  101c2e:	6a 11                	push   $0x11
  jmp __alltraps
  101c30:	e9 de 09 00 00       	jmp    102613 <__alltraps>

00101c35 <vector18>:
.globl vector18
vector18:
  pushl $0
  101c35:	6a 00                	push   $0x0
  pushl $18
  101c37:	6a 12                	push   $0x12
  jmp __alltraps
  101c39:	e9 d5 09 00 00       	jmp    102613 <__alltraps>

00101c3e <vector19>:
.globl vector19
vector19:
  pushl $0
  101c3e:	6a 00                	push   $0x0
  pushl $19
  101c40:	6a 13                	push   $0x13
  jmp __alltraps
  101c42:	e9 cc 09 00 00       	jmp    102613 <__alltraps>

00101c47 <vector20>:
.globl vector20
vector20:
  pushl $0
  101c47:	6a 00                	push   $0x0
  pushl $20
  101c49:	6a 14                	push   $0x14
  jmp __alltraps
  101c4b:	e9 c3 09 00 00       	jmp    102613 <__alltraps>

00101c50 <vector21>:
.globl vector21
vector21:
  pushl $0
  101c50:	6a 00                	push   $0x0
  pushl $21
  101c52:	6a 15                	push   $0x15
  jmp __alltraps
  101c54:	e9 ba 09 00 00       	jmp    102613 <__alltraps>

00101c59 <vector22>:
.globl vector22
vector22:
  pushl $0
  101c59:	6a 00                	push   $0x0
  pushl $22
  101c5b:	6a 16                	push   $0x16
  jmp __alltraps
  101c5d:	e9 b1 09 00 00       	jmp    102613 <__alltraps>

00101c62 <vector23>:
.globl vector23
vector23:
  pushl $0
  101c62:	6a 00                	push   $0x0
  pushl $23
  101c64:	6a 17                	push   $0x17
  jmp __alltraps
  101c66:	e9 a8 09 00 00       	jmp    102613 <__alltraps>

00101c6b <vector24>:
.globl vector24
vector24:
  pushl $0
  101c6b:	6a 00                	push   $0x0
  pushl $24
  101c6d:	6a 18                	push   $0x18
  jmp __alltraps
  101c6f:	e9 9f 09 00 00       	jmp    102613 <__alltraps>

00101c74 <vector25>:
.globl vector25
vector25:
  pushl $0
  101c74:	6a 00                	push   $0x0
  pushl $25
  101c76:	6a 19                	push   $0x19
  jmp __alltraps
  101c78:	e9 96 09 00 00       	jmp    102613 <__alltraps>

00101c7d <vector26>:
.globl vector26
vector26:
  pushl $0
  101c7d:	6a 00                	push   $0x0
  pushl $26
  101c7f:	6a 1a                	push   $0x1a
  jmp __alltraps
  101c81:	e9 8d 09 00 00       	jmp    102613 <__alltraps>

00101c86 <vector27>:
.globl vector27
vector27:
  pushl $0
  101c86:	6a 00                	push   $0x0
  pushl $27
  101c88:	6a 1b                	push   $0x1b
  jmp __alltraps
  101c8a:	e9 84 09 00 00       	jmp    102613 <__alltraps>

00101c8f <vector28>:
.globl vector28
vector28:
  pushl $0
  101c8f:	6a 00                	push   $0x0
  pushl $28
  101c91:	6a 1c                	push   $0x1c
  jmp __alltraps
  101c93:	e9 7b 09 00 00       	jmp    102613 <__alltraps>

00101c98 <vector29>:
.globl vector29
vector29:
  pushl $0
  101c98:	6a 00                	push   $0x0
  pushl $29
  101c9a:	6a 1d                	push   $0x1d
  jmp __alltraps
  101c9c:	e9 72 09 00 00       	jmp    102613 <__alltraps>

00101ca1 <vector30>:
.globl vector30
vector30:
  pushl $0
  101ca1:	6a 00                	push   $0x0
  pushl $30
  101ca3:	6a 1e                	push   $0x1e
  jmp __alltraps
  101ca5:	e9 69 09 00 00       	jmp    102613 <__alltraps>

00101caa <vector31>:
.globl vector31
vector31:
  pushl $0
  101caa:	6a 00                	push   $0x0
  pushl $31
  101cac:	6a 1f                	push   $0x1f
  jmp __alltraps
  101cae:	e9 60 09 00 00       	jmp    102613 <__alltraps>

00101cb3 <vector32>:
.globl vector32
vector32:
  pushl $0
  101cb3:	6a 00                	push   $0x0
  pushl $32
  101cb5:	6a 20                	push   $0x20
  jmp __alltraps
  101cb7:	e9 57 09 00 00       	jmp    102613 <__alltraps>

00101cbc <vector33>:
.globl vector33
vector33:
  pushl $0
  101cbc:	6a 00                	push   $0x0
  pushl $33
  101cbe:	6a 21                	push   $0x21
  jmp __alltraps
  101cc0:	e9 4e 09 00 00       	jmp    102613 <__alltraps>

00101cc5 <vector34>:
.globl vector34
vector34:
  pushl $0
  101cc5:	6a 00                	push   $0x0
  pushl $34
  101cc7:	6a 22                	push   $0x22
  jmp __alltraps
  101cc9:	e9 45 09 00 00       	jmp    102613 <__alltraps>

00101cce <vector35>:
.globl vector35
vector35:
  pushl $0
  101cce:	6a 00                	push   $0x0
  pushl $35
  101cd0:	6a 23                	push   $0x23
  jmp __alltraps
  101cd2:	e9 3c 09 00 00       	jmp    102613 <__alltraps>

00101cd7 <vector36>:
.globl vector36
vector36:
  pushl $0
  101cd7:	6a 00                	push   $0x0
  pushl $36
  101cd9:	6a 24                	push   $0x24
  jmp __alltraps
  101cdb:	e9 33 09 00 00       	jmp    102613 <__alltraps>

00101ce0 <vector37>:
.globl vector37
vector37:
  pushl $0
  101ce0:	6a 00                	push   $0x0
  pushl $37
  101ce2:	6a 25                	push   $0x25
  jmp __alltraps
  101ce4:	e9 2a 09 00 00       	jmp    102613 <__alltraps>

00101ce9 <vector38>:
.globl vector38
vector38:
  pushl $0
  101ce9:	6a 00                	push   $0x0
  pushl $38
  101ceb:	6a 26                	push   $0x26
  jmp __alltraps
  101ced:	e9 21 09 00 00       	jmp    102613 <__alltraps>

00101cf2 <vector39>:
.globl vector39
vector39:
  pushl $0
  101cf2:	6a 00                	push   $0x0
  pushl $39
  101cf4:	6a 27                	push   $0x27
  jmp __alltraps
  101cf6:	e9 18 09 00 00       	jmp    102613 <__alltraps>

00101cfb <vector40>:
.globl vector40
vector40:
  pushl $0
  101cfb:	6a 00                	push   $0x0
  pushl $40
  101cfd:	6a 28                	push   $0x28
  jmp __alltraps
  101cff:	e9 0f 09 00 00       	jmp    102613 <__alltraps>

00101d04 <vector41>:
.globl vector41
vector41:
  pushl $0
  101d04:	6a 00                	push   $0x0
  pushl $41
  101d06:	6a 29                	push   $0x29
  jmp __alltraps
  101d08:	e9 06 09 00 00       	jmp    102613 <__alltraps>

00101d0d <vector42>:
.globl vector42
vector42:
  pushl $0
  101d0d:	6a 00                	push   $0x0
  pushl $42
  101d0f:	6a 2a                	push   $0x2a
  jmp __alltraps
  101d11:	e9 fd 08 00 00       	jmp    102613 <__alltraps>

00101d16 <vector43>:
.globl vector43
vector43:
  pushl $0
  101d16:	6a 00                	push   $0x0
  pushl $43
  101d18:	6a 2b                	push   $0x2b
  jmp __alltraps
  101d1a:	e9 f4 08 00 00       	jmp    102613 <__alltraps>

00101d1f <vector44>:
.globl vector44
vector44:
  pushl $0
  101d1f:	6a 00                	push   $0x0
  pushl $44
  101d21:	6a 2c                	push   $0x2c
  jmp __alltraps
  101d23:	e9 eb 08 00 00       	jmp    102613 <__alltraps>

00101d28 <vector45>:
.globl vector45
vector45:
  pushl $0
  101d28:	6a 00                	push   $0x0
  pushl $45
  101d2a:	6a 2d                	push   $0x2d
  jmp __alltraps
  101d2c:	e9 e2 08 00 00       	jmp    102613 <__alltraps>

00101d31 <vector46>:
.globl vector46
vector46:
  pushl $0
  101d31:	6a 00                	push   $0x0
  pushl $46
  101d33:	6a 2e                	push   $0x2e
  jmp __alltraps
  101d35:	e9 d9 08 00 00       	jmp    102613 <__alltraps>

00101d3a <vector47>:
.globl vector47
vector47:
  pushl $0
  101d3a:	6a 00                	push   $0x0
  pushl $47
  101d3c:	6a 2f                	push   $0x2f
  jmp __alltraps
  101d3e:	e9 d0 08 00 00       	jmp    102613 <__alltraps>

00101d43 <vector48>:
.globl vector48
vector48:
  pushl $0
  101d43:	6a 00                	push   $0x0
  pushl $48
  101d45:	6a 30                	push   $0x30
  jmp __alltraps
  101d47:	e9 c7 08 00 00       	jmp    102613 <__alltraps>

00101d4c <vector49>:
.globl vector49
vector49:
  pushl $0
  101d4c:	6a 00                	push   $0x0
  pushl $49
  101d4e:	6a 31                	push   $0x31
  jmp __alltraps
  101d50:	e9 be 08 00 00       	jmp    102613 <__alltraps>

00101d55 <vector50>:
.globl vector50
vector50:
  pushl $0
  101d55:	6a 00                	push   $0x0
  pushl $50
  101d57:	6a 32                	push   $0x32
  jmp __alltraps
  101d59:	e9 b5 08 00 00       	jmp    102613 <__alltraps>

00101d5e <vector51>:
.globl vector51
vector51:
  pushl $0
  101d5e:	6a 00                	push   $0x0
  pushl $51
  101d60:	6a 33                	push   $0x33
  jmp __alltraps
  101d62:	e9 ac 08 00 00       	jmp    102613 <__alltraps>

00101d67 <vector52>:
.globl vector52
vector52:
  pushl $0
  101d67:	6a 00                	push   $0x0
  pushl $52
  101d69:	6a 34                	push   $0x34
  jmp __alltraps
  101d6b:	e9 a3 08 00 00       	jmp    102613 <__alltraps>

00101d70 <vector53>:
.globl vector53
vector53:
  pushl $0
  101d70:	6a 00                	push   $0x0
  pushl $53
  101d72:	6a 35                	push   $0x35
  jmp __alltraps
  101d74:	e9 9a 08 00 00       	jmp    102613 <__alltraps>

00101d79 <vector54>:
.globl vector54
vector54:
  pushl $0
  101d79:	6a 00                	push   $0x0
  pushl $54
  101d7b:	6a 36                	push   $0x36
  jmp __alltraps
  101d7d:	e9 91 08 00 00       	jmp    102613 <__alltraps>

00101d82 <vector55>:
.globl vector55
vector55:
  pushl $0
  101d82:	6a 00                	push   $0x0
  pushl $55
  101d84:	6a 37                	push   $0x37
  jmp __alltraps
  101d86:	e9 88 08 00 00       	jmp    102613 <__alltraps>

00101d8b <vector56>:
.globl vector56
vector56:
  pushl $0
  101d8b:	6a 00                	push   $0x0
  pushl $56
  101d8d:	6a 38                	push   $0x38
  jmp __alltraps
  101d8f:	e9 7f 08 00 00       	jmp    102613 <__alltraps>

00101d94 <vector57>:
.globl vector57
vector57:
  pushl $0
  101d94:	6a 00                	push   $0x0
  pushl $57
  101d96:	6a 39                	push   $0x39
  jmp __alltraps
  101d98:	e9 76 08 00 00       	jmp    102613 <__alltraps>

00101d9d <vector58>:
.globl vector58
vector58:
  pushl $0
  101d9d:	6a 00                	push   $0x0
  pushl $58
  101d9f:	6a 3a                	push   $0x3a
  jmp __alltraps
  101da1:	e9 6d 08 00 00       	jmp    102613 <__alltraps>

00101da6 <vector59>:
.globl vector59
vector59:
  pushl $0
  101da6:	6a 00                	push   $0x0
  pushl $59
  101da8:	6a 3b                	push   $0x3b
  jmp __alltraps
  101daa:	e9 64 08 00 00       	jmp    102613 <__alltraps>

00101daf <vector60>:
.globl vector60
vector60:
  pushl $0
  101daf:	6a 00                	push   $0x0
  pushl $60
  101db1:	6a 3c                	push   $0x3c
  jmp __alltraps
  101db3:	e9 5b 08 00 00       	jmp    102613 <__alltraps>

00101db8 <vector61>:
.globl vector61
vector61:
  pushl $0
  101db8:	6a 00                	push   $0x0
  pushl $61
  101dba:	6a 3d                	push   $0x3d
  jmp __alltraps
  101dbc:	e9 52 08 00 00       	jmp    102613 <__alltraps>

00101dc1 <vector62>:
.globl vector62
vector62:
  pushl $0
  101dc1:	6a 00                	push   $0x0
  pushl $62
  101dc3:	6a 3e                	push   $0x3e
  jmp __alltraps
  101dc5:	e9 49 08 00 00       	jmp    102613 <__alltraps>

00101dca <vector63>:
.globl vector63
vector63:
  pushl $0
  101dca:	6a 00                	push   $0x0
  pushl $63
  101dcc:	6a 3f                	push   $0x3f
  jmp __alltraps
  101dce:	e9 40 08 00 00       	jmp    102613 <__alltraps>

00101dd3 <vector64>:
.globl vector64
vector64:
  pushl $0
  101dd3:	6a 00                	push   $0x0
  pushl $64
  101dd5:	6a 40                	push   $0x40
  jmp __alltraps
  101dd7:	e9 37 08 00 00       	jmp    102613 <__alltraps>

00101ddc <vector65>:
.globl vector65
vector65:
  pushl $0
  101ddc:	6a 00                	push   $0x0
  pushl $65
  101dde:	6a 41                	push   $0x41
  jmp __alltraps
  101de0:	e9 2e 08 00 00       	jmp    102613 <__alltraps>

00101de5 <vector66>:
.globl vector66
vector66:
  pushl $0
  101de5:	6a 00                	push   $0x0
  pushl $66
  101de7:	6a 42                	push   $0x42
  jmp __alltraps
  101de9:	e9 25 08 00 00       	jmp    102613 <__alltraps>

00101dee <vector67>:
.globl vector67
vector67:
  pushl $0
  101dee:	6a 00                	push   $0x0
  pushl $67
  101df0:	6a 43                	push   $0x43
  jmp __alltraps
  101df2:	e9 1c 08 00 00       	jmp    102613 <__alltraps>

00101df7 <vector68>:
.globl vector68
vector68:
  pushl $0
  101df7:	6a 00                	push   $0x0
  pushl $68
  101df9:	6a 44                	push   $0x44
  jmp __alltraps
  101dfb:	e9 13 08 00 00       	jmp    102613 <__alltraps>

00101e00 <vector69>:
.globl vector69
vector69:
  pushl $0
  101e00:	6a 00                	push   $0x0
  pushl $69
  101e02:	6a 45                	push   $0x45
  jmp __alltraps
  101e04:	e9 0a 08 00 00       	jmp    102613 <__alltraps>

00101e09 <vector70>:
.globl vector70
vector70:
  pushl $0
  101e09:	6a 00                	push   $0x0
  pushl $70
  101e0b:	6a 46                	push   $0x46
  jmp __alltraps
  101e0d:	e9 01 08 00 00       	jmp    102613 <__alltraps>

00101e12 <vector71>:
.globl vector71
vector71:
  pushl $0
  101e12:	6a 00                	push   $0x0
  pushl $71
  101e14:	6a 47                	push   $0x47
  jmp __alltraps
  101e16:	e9 f8 07 00 00       	jmp    102613 <__alltraps>

00101e1b <vector72>:
.globl vector72
vector72:
  pushl $0
  101e1b:	6a 00                	push   $0x0
  pushl $72
  101e1d:	6a 48                	push   $0x48
  jmp __alltraps
  101e1f:	e9 ef 07 00 00       	jmp    102613 <__alltraps>

00101e24 <vector73>:
.globl vector73
vector73:
  pushl $0
  101e24:	6a 00                	push   $0x0
  pushl $73
  101e26:	6a 49                	push   $0x49
  jmp __alltraps
  101e28:	e9 e6 07 00 00       	jmp    102613 <__alltraps>

00101e2d <vector74>:
.globl vector74
vector74:
  pushl $0
  101e2d:	6a 00                	push   $0x0
  pushl $74
  101e2f:	6a 4a                	push   $0x4a
  jmp __alltraps
  101e31:	e9 dd 07 00 00       	jmp    102613 <__alltraps>

00101e36 <vector75>:
.globl vector75
vector75:
  pushl $0
  101e36:	6a 00                	push   $0x0
  pushl $75
  101e38:	6a 4b                	push   $0x4b
  jmp __alltraps
  101e3a:	e9 d4 07 00 00       	jmp    102613 <__alltraps>

00101e3f <vector76>:
.globl vector76
vector76:
  pushl $0
  101e3f:	6a 00                	push   $0x0
  pushl $76
  101e41:	6a 4c                	push   $0x4c
  jmp __alltraps
  101e43:	e9 cb 07 00 00       	jmp    102613 <__alltraps>

00101e48 <vector77>:
.globl vector77
vector77:
  pushl $0
  101e48:	6a 00                	push   $0x0
  pushl $77
  101e4a:	6a 4d                	push   $0x4d
  jmp __alltraps
  101e4c:	e9 c2 07 00 00       	jmp    102613 <__alltraps>

00101e51 <vector78>:
.globl vector78
vector78:
  pushl $0
  101e51:	6a 00                	push   $0x0
  pushl $78
  101e53:	6a 4e                	push   $0x4e
  jmp __alltraps
  101e55:	e9 b9 07 00 00       	jmp    102613 <__alltraps>

00101e5a <vector79>:
.globl vector79
vector79:
  pushl $0
  101e5a:	6a 00                	push   $0x0
  pushl $79
  101e5c:	6a 4f                	push   $0x4f
  jmp __alltraps
  101e5e:	e9 b0 07 00 00       	jmp    102613 <__alltraps>

00101e63 <vector80>:
.globl vector80
vector80:
  pushl $0
  101e63:	6a 00                	push   $0x0
  pushl $80
  101e65:	6a 50                	push   $0x50
  jmp __alltraps
  101e67:	e9 a7 07 00 00       	jmp    102613 <__alltraps>

00101e6c <vector81>:
.globl vector81
vector81:
  pushl $0
  101e6c:	6a 00                	push   $0x0
  pushl $81
  101e6e:	6a 51                	push   $0x51
  jmp __alltraps
  101e70:	e9 9e 07 00 00       	jmp    102613 <__alltraps>

00101e75 <vector82>:
.globl vector82
vector82:
  pushl $0
  101e75:	6a 00                	push   $0x0
  pushl $82
  101e77:	6a 52                	push   $0x52
  jmp __alltraps
  101e79:	e9 95 07 00 00       	jmp    102613 <__alltraps>

00101e7e <vector83>:
.globl vector83
vector83:
  pushl $0
  101e7e:	6a 00                	push   $0x0
  pushl $83
  101e80:	6a 53                	push   $0x53
  jmp __alltraps
  101e82:	e9 8c 07 00 00       	jmp    102613 <__alltraps>

00101e87 <vector84>:
.globl vector84
vector84:
  pushl $0
  101e87:	6a 00                	push   $0x0
  pushl $84
  101e89:	6a 54                	push   $0x54
  jmp __alltraps
  101e8b:	e9 83 07 00 00       	jmp    102613 <__alltraps>

00101e90 <vector85>:
.globl vector85
vector85:
  pushl $0
  101e90:	6a 00                	push   $0x0
  pushl $85
  101e92:	6a 55                	push   $0x55
  jmp __alltraps
  101e94:	e9 7a 07 00 00       	jmp    102613 <__alltraps>

00101e99 <vector86>:
.globl vector86
vector86:
  pushl $0
  101e99:	6a 00                	push   $0x0
  pushl $86
  101e9b:	6a 56                	push   $0x56
  jmp __alltraps
  101e9d:	e9 71 07 00 00       	jmp    102613 <__alltraps>

00101ea2 <vector87>:
.globl vector87
vector87:
  pushl $0
  101ea2:	6a 00                	push   $0x0
  pushl $87
  101ea4:	6a 57                	push   $0x57
  jmp __alltraps
  101ea6:	e9 68 07 00 00       	jmp    102613 <__alltraps>

00101eab <vector88>:
.globl vector88
vector88:
  pushl $0
  101eab:	6a 00                	push   $0x0
  pushl $88
  101ead:	6a 58                	push   $0x58
  jmp __alltraps
  101eaf:	e9 5f 07 00 00       	jmp    102613 <__alltraps>

00101eb4 <vector89>:
.globl vector89
vector89:
  pushl $0
  101eb4:	6a 00                	push   $0x0
  pushl $89
  101eb6:	6a 59                	push   $0x59
  jmp __alltraps
  101eb8:	e9 56 07 00 00       	jmp    102613 <__alltraps>

00101ebd <vector90>:
.globl vector90
vector90:
  pushl $0
  101ebd:	6a 00                	push   $0x0
  pushl $90
  101ebf:	6a 5a                	push   $0x5a
  jmp __alltraps
  101ec1:	e9 4d 07 00 00       	jmp    102613 <__alltraps>

00101ec6 <vector91>:
.globl vector91
vector91:
  pushl $0
  101ec6:	6a 00                	push   $0x0
  pushl $91
  101ec8:	6a 5b                	push   $0x5b
  jmp __alltraps
  101eca:	e9 44 07 00 00       	jmp    102613 <__alltraps>

00101ecf <vector92>:
.globl vector92
vector92:
  pushl $0
  101ecf:	6a 00                	push   $0x0
  pushl $92
  101ed1:	6a 5c                	push   $0x5c
  jmp __alltraps
  101ed3:	e9 3b 07 00 00       	jmp    102613 <__alltraps>

00101ed8 <vector93>:
.globl vector93
vector93:
  pushl $0
  101ed8:	6a 00                	push   $0x0
  pushl $93
  101eda:	6a 5d                	push   $0x5d
  jmp __alltraps
  101edc:	e9 32 07 00 00       	jmp    102613 <__alltraps>

00101ee1 <vector94>:
.globl vector94
vector94:
  pushl $0
  101ee1:	6a 00                	push   $0x0
  pushl $94
  101ee3:	6a 5e                	push   $0x5e
  jmp __alltraps
  101ee5:	e9 29 07 00 00       	jmp    102613 <__alltraps>

00101eea <vector95>:
.globl vector95
vector95:
  pushl $0
  101eea:	6a 00                	push   $0x0
  pushl $95
  101eec:	6a 5f                	push   $0x5f
  jmp __alltraps
  101eee:	e9 20 07 00 00       	jmp    102613 <__alltraps>

00101ef3 <vector96>:
.globl vector96
vector96:
  pushl $0
  101ef3:	6a 00                	push   $0x0
  pushl $96
  101ef5:	6a 60                	push   $0x60
  jmp __alltraps
  101ef7:	e9 17 07 00 00       	jmp    102613 <__alltraps>

00101efc <vector97>:
.globl vector97
vector97:
  pushl $0
  101efc:	6a 00                	push   $0x0
  pushl $97
  101efe:	6a 61                	push   $0x61
  jmp __alltraps
  101f00:	e9 0e 07 00 00       	jmp    102613 <__alltraps>

00101f05 <vector98>:
.globl vector98
vector98:
  pushl $0
  101f05:	6a 00                	push   $0x0
  pushl $98
  101f07:	6a 62                	push   $0x62
  jmp __alltraps
  101f09:	e9 05 07 00 00       	jmp    102613 <__alltraps>

00101f0e <vector99>:
.globl vector99
vector99:
  pushl $0
  101f0e:	6a 00                	push   $0x0
  pushl $99
  101f10:	6a 63                	push   $0x63
  jmp __alltraps
  101f12:	e9 fc 06 00 00       	jmp    102613 <__alltraps>

00101f17 <vector100>:
.globl vector100
vector100:
  pushl $0
  101f17:	6a 00                	push   $0x0
  pushl $100
  101f19:	6a 64                	push   $0x64
  jmp __alltraps
  101f1b:	e9 f3 06 00 00       	jmp    102613 <__alltraps>

00101f20 <vector101>:
.globl vector101
vector101:
  pushl $0
  101f20:	6a 00                	push   $0x0
  pushl $101
  101f22:	6a 65                	push   $0x65
  jmp __alltraps
  101f24:	e9 ea 06 00 00       	jmp    102613 <__alltraps>

00101f29 <vector102>:
.globl vector102
vector102:
  pushl $0
  101f29:	6a 00                	push   $0x0
  pushl $102
  101f2b:	6a 66                	push   $0x66
  jmp __alltraps
  101f2d:	e9 e1 06 00 00       	jmp    102613 <__alltraps>

00101f32 <vector103>:
.globl vector103
vector103:
  pushl $0
  101f32:	6a 00                	push   $0x0
  pushl $103
  101f34:	6a 67                	push   $0x67
  jmp __alltraps
  101f36:	e9 d8 06 00 00       	jmp    102613 <__alltraps>

00101f3b <vector104>:
.globl vector104
vector104:
  pushl $0
  101f3b:	6a 00                	push   $0x0
  pushl $104
  101f3d:	6a 68                	push   $0x68
  jmp __alltraps
  101f3f:	e9 cf 06 00 00       	jmp    102613 <__alltraps>

00101f44 <vector105>:
.globl vector105
vector105:
  pushl $0
  101f44:	6a 00                	push   $0x0
  pushl $105
  101f46:	6a 69                	push   $0x69
  jmp __alltraps
  101f48:	e9 c6 06 00 00       	jmp    102613 <__alltraps>

00101f4d <vector106>:
.globl vector106
vector106:
  pushl $0
  101f4d:	6a 00                	push   $0x0
  pushl $106
  101f4f:	6a 6a                	push   $0x6a
  jmp __alltraps
  101f51:	e9 bd 06 00 00       	jmp    102613 <__alltraps>

00101f56 <vector107>:
.globl vector107
vector107:
  pushl $0
  101f56:	6a 00                	push   $0x0
  pushl $107
  101f58:	6a 6b                	push   $0x6b
  jmp __alltraps
  101f5a:	e9 b4 06 00 00       	jmp    102613 <__alltraps>

00101f5f <vector108>:
.globl vector108
vector108:
  pushl $0
  101f5f:	6a 00                	push   $0x0
  pushl $108
  101f61:	6a 6c                	push   $0x6c
  jmp __alltraps
  101f63:	e9 ab 06 00 00       	jmp    102613 <__alltraps>

00101f68 <vector109>:
.globl vector109
vector109:
  pushl $0
  101f68:	6a 00                	push   $0x0
  pushl $109
  101f6a:	6a 6d                	push   $0x6d
  jmp __alltraps
  101f6c:	e9 a2 06 00 00       	jmp    102613 <__alltraps>

00101f71 <vector110>:
.globl vector110
vector110:
  pushl $0
  101f71:	6a 00                	push   $0x0
  pushl $110
  101f73:	6a 6e                	push   $0x6e
  jmp __alltraps
  101f75:	e9 99 06 00 00       	jmp    102613 <__alltraps>

00101f7a <vector111>:
.globl vector111
vector111:
  pushl $0
  101f7a:	6a 00                	push   $0x0
  pushl $111
  101f7c:	6a 6f                	push   $0x6f
  jmp __alltraps
  101f7e:	e9 90 06 00 00       	jmp    102613 <__alltraps>

00101f83 <vector112>:
.globl vector112
vector112:
  pushl $0
  101f83:	6a 00                	push   $0x0
  pushl $112
  101f85:	6a 70                	push   $0x70
  jmp __alltraps
  101f87:	e9 87 06 00 00       	jmp    102613 <__alltraps>

00101f8c <vector113>:
.globl vector113
vector113:
  pushl $0
  101f8c:	6a 00                	push   $0x0
  pushl $113
  101f8e:	6a 71                	push   $0x71
  jmp __alltraps
  101f90:	e9 7e 06 00 00       	jmp    102613 <__alltraps>

00101f95 <vector114>:
.globl vector114
vector114:
  pushl $0
  101f95:	6a 00                	push   $0x0
  pushl $114
  101f97:	6a 72                	push   $0x72
  jmp __alltraps
  101f99:	e9 75 06 00 00       	jmp    102613 <__alltraps>

00101f9e <vector115>:
.globl vector115
vector115:
  pushl $0
  101f9e:	6a 00                	push   $0x0
  pushl $115
  101fa0:	6a 73                	push   $0x73
  jmp __alltraps
  101fa2:	e9 6c 06 00 00       	jmp    102613 <__alltraps>

00101fa7 <vector116>:
.globl vector116
vector116:
  pushl $0
  101fa7:	6a 00                	push   $0x0
  pushl $116
  101fa9:	6a 74                	push   $0x74
  jmp __alltraps
  101fab:	e9 63 06 00 00       	jmp    102613 <__alltraps>

00101fb0 <vector117>:
.globl vector117
vector117:
  pushl $0
  101fb0:	6a 00                	push   $0x0
  pushl $117
  101fb2:	6a 75                	push   $0x75
  jmp __alltraps
  101fb4:	e9 5a 06 00 00       	jmp    102613 <__alltraps>

00101fb9 <vector118>:
.globl vector118
vector118:
  pushl $0
  101fb9:	6a 00                	push   $0x0
  pushl $118
  101fbb:	6a 76                	push   $0x76
  jmp __alltraps
  101fbd:	e9 51 06 00 00       	jmp    102613 <__alltraps>

00101fc2 <vector119>:
.globl vector119
vector119:
  pushl $0
  101fc2:	6a 00                	push   $0x0
  pushl $119
  101fc4:	6a 77                	push   $0x77
  jmp __alltraps
  101fc6:	e9 48 06 00 00       	jmp    102613 <__alltraps>

00101fcb <vector120>:
.globl vector120
vector120:
  pushl $0
  101fcb:	6a 00                	push   $0x0
  pushl $120
  101fcd:	6a 78                	push   $0x78
  jmp __alltraps
  101fcf:	e9 3f 06 00 00       	jmp    102613 <__alltraps>

00101fd4 <vector121>:
.globl vector121
vector121:
  pushl $0
  101fd4:	6a 00                	push   $0x0
  pushl $121
  101fd6:	6a 79                	push   $0x79
  jmp __alltraps
  101fd8:	e9 36 06 00 00       	jmp    102613 <__alltraps>

00101fdd <vector122>:
.globl vector122
vector122:
  pushl $0
  101fdd:	6a 00                	push   $0x0
  pushl $122
  101fdf:	6a 7a                	push   $0x7a
  jmp __alltraps
  101fe1:	e9 2d 06 00 00       	jmp    102613 <__alltraps>

00101fe6 <vector123>:
.globl vector123
vector123:
  pushl $0
  101fe6:	6a 00                	push   $0x0
  pushl $123
  101fe8:	6a 7b                	push   $0x7b
  jmp __alltraps
  101fea:	e9 24 06 00 00       	jmp    102613 <__alltraps>

00101fef <vector124>:
.globl vector124
vector124:
  pushl $0
  101fef:	6a 00                	push   $0x0
  pushl $124
  101ff1:	6a 7c                	push   $0x7c
  jmp __alltraps
  101ff3:	e9 1b 06 00 00       	jmp    102613 <__alltraps>

00101ff8 <vector125>:
.globl vector125
vector125:
  pushl $0
  101ff8:	6a 00                	push   $0x0
  pushl $125
  101ffa:	6a 7d                	push   $0x7d
  jmp __alltraps
  101ffc:	e9 12 06 00 00       	jmp    102613 <__alltraps>

00102001 <vector126>:
.globl vector126
vector126:
  pushl $0
  102001:	6a 00                	push   $0x0
  pushl $126
  102003:	6a 7e                	push   $0x7e
  jmp __alltraps
  102005:	e9 09 06 00 00       	jmp    102613 <__alltraps>

0010200a <vector127>:
.globl vector127
vector127:
  pushl $0
  10200a:	6a 00                	push   $0x0
  pushl $127
  10200c:	6a 7f                	push   $0x7f
  jmp __alltraps
  10200e:	e9 00 06 00 00       	jmp    102613 <__alltraps>

00102013 <vector128>:
.globl vector128
vector128:
  pushl $0
  102013:	6a 00                	push   $0x0
  pushl $128
  102015:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10201a:	e9 f4 05 00 00       	jmp    102613 <__alltraps>

0010201f <vector129>:
.globl vector129
vector129:
  pushl $0
  10201f:	6a 00                	push   $0x0
  pushl $129
  102021:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102026:	e9 e8 05 00 00       	jmp    102613 <__alltraps>

0010202b <vector130>:
.globl vector130
vector130:
  pushl $0
  10202b:	6a 00                	push   $0x0
  pushl $130
  10202d:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102032:	e9 dc 05 00 00       	jmp    102613 <__alltraps>

00102037 <vector131>:
.globl vector131
vector131:
  pushl $0
  102037:	6a 00                	push   $0x0
  pushl $131
  102039:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10203e:	e9 d0 05 00 00       	jmp    102613 <__alltraps>

00102043 <vector132>:
.globl vector132
vector132:
  pushl $0
  102043:	6a 00                	push   $0x0
  pushl $132
  102045:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10204a:	e9 c4 05 00 00       	jmp    102613 <__alltraps>

0010204f <vector133>:
.globl vector133
vector133:
  pushl $0
  10204f:	6a 00                	push   $0x0
  pushl $133
  102051:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102056:	e9 b8 05 00 00       	jmp    102613 <__alltraps>

0010205b <vector134>:
.globl vector134
vector134:
  pushl $0
  10205b:	6a 00                	push   $0x0
  pushl $134
  10205d:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102062:	e9 ac 05 00 00       	jmp    102613 <__alltraps>

00102067 <vector135>:
.globl vector135
vector135:
  pushl $0
  102067:	6a 00                	push   $0x0
  pushl $135
  102069:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10206e:	e9 a0 05 00 00       	jmp    102613 <__alltraps>

00102073 <vector136>:
.globl vector136
vector136:
  pushl $0
  102073:	6a 00                	push   $0x0
  pushl $136
  102075:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10207a:	e9 94 05 00 00       	jmp    102613 <__alltraps>

0010207f <vector137>:
.globl vector137
vector137:
  pushl $0
  10207f:	6a 00                	push   $0x0
  pushl $137
  102081:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102086:	e9 88 05 00 00       	jmp    102613 <__alltraps>

0010208b <vector138>:
.globl vector138
vector138:
  pushl $0
  10208b:	6a 00                	push   $0x0
  pushl $138
  10208d:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102092:	e9 7c 05 00 00       	jmp    102613 <__alltraps>

00102097 <vector139>:
.globl vector139
vector139:
  pushl $0
  102097:	6a 00                	push   $0x0
  pushl $139
  102099:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  10209e:	e9 70 05 00 00       	jmp    102613 <__alltraps>

001020a3 <vector140>:
.globl vector140
vector140:
  pushl $0
  1020a3:	6a 00                	push   $0x0
  pushl $140
  1020a5:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1020aa:	e9 64 05 00 00       	jmp    102613 <__alltraps>

001020af <vector141>:
.globl vector141
vector141:
  pushl $0
  1020af:	6a 00                	push   $0x0
  pushl $141
  1020b1:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1020b6:	e9 58 05 00 00       	jmp    102613 <__alltraps>

001020bb <vector142>:
.globl vector142
vector142:
  pushl $0
  1020bb:	6a 00                	push   $0x0
  pushl $142
  1020bd:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1020c2:	e9 4c 05 00 00       	jmp    102613 <__alltraps>

001020c7 <vector143>:
.globl vector143
vector143:
  pushl $0
  1020c7:	6a 00                	push   $0x0
  pushl $143
  1020c9:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1020ce:	e9 40 05 00 00       	jmp    102613 <__alltraps>

001020d3 <vector144>:
.globl vector144
vector144:
  pushl $0
  1020d3:	6a 00                	push   $0x0
  pushl $144
  1020d5:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1020da:	e9 34 05 00 00       	jmp    102613 <__alltraps>

001020df <vector145>:
.globl vector145
vector145:
  pushl $0
  1020df:	6a 00                	push   $0x0
  pushl $145
  1020e1:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1020e6:	e9 28 05 00 00       	jmp    102613 <__alltraps>

001020eb <vector146>:
.globl vector146
vector146:
  pushl $0
  1020eb:	6a 00                	push   $0x0
  pushl $146
  1020ed:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1020f2:	e9 1c 05 00 00       	jmp    102613 <__alltraps>

001020f7 <vector147>:
.globl vector147
vector147:
  pushl $0
  1020f7:	6a 00                	push   $0x0
  pushl $147
  1020f9:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1020fe:	e9 10 05 00 00       	jmp    102613 <__alltraps>

00102103 <vector148>:
.globl vector148
vector148:
  pushl $0
  102103:	6a 00                	push   $0x0
  pushl $148
  102105:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10210a:	e9 04 05 00 00       	jmp    102613 <__alltraps>

0010210f <vector149>:
.globl vector149
vector149:
  pushl $0
  10210f:	6a 00                	push   $0x0
  pushl $149
  102111:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102116:	e9 f8 04 00 00       	jmp    102613 <__alltraps>

0010211b <vector150>:
.globl vector150
vector150:
  pushl $0
  10211b:	6a 00                	push   $0x0
  pushl $150
  10211d:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102122:	e9 ec 04 00 00       	jmp    102613 <__alltraps>

00102127 <vector151>:
.globl vector151
vector151:
  pushl $0
  102127:	6a 00                	push   $0x0
  pushl $151
  102129:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10212e:	e9 e0 04 00 00       	jmp    102613 <__alltraps>

00102133 <vector152>:
.globl vector152
vector152:
  pushl $0
  102133:	6a 00                	push   $0x0
  pushl $152
  102135:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10213a:	e9 d4 04 00 00       	jmp    102613 <__alltraps>

0010213f <vector153>:
.globl vector153
vector153:
  pushl $0
  10213f:	6a 00                	push   $0x0
  pushl $153
  102141:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102146:	e9 c8 04 00 00       	jmp    102613 <__alltraps>

0010214b <vector154>:
.globl vector154
vector154:
  pushl $0
  10214b:	6a 00                	push   $0x0
  pushl $154
  10214d:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102152:	e9 bc 04 00 00       	jmp    102613 <__alltraps>

00102157 <vector155>:
.globl vector155
vector155:
  pushl $0
  102157:	6a 00                	push   $0x0
  pushl $155
  102159:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10215e:	e9 b0 04 00 00       	jmp    102613 <__alltraps>

00102163 <vector156>:
.globl vector156
vector156:
  pushl $0
  102163:	6a 00                	push   $0x0
  pushl $156
  102165:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10216a:	e9 a4 04 00 00       	jmp    102613 <__alltraps>

0010216f <vector157>:
.globl vector157
vector157:
  pushl $0
  10216f:	6a 00                	push   $0x0
  pushl $157
  102171:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102176:	e9 98 04 00 00       	jmp    102613 <__alltraps>

0010217b <vector158>:
.globl vector158
vector158:
  pushl $0
  10217b:	6a 00                	push   $0x0
  pushl $158
  10217d:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102182:	e9 8c 04 00 00       	jmp    102613 <__alltraps>

00102187 <vector159>:
.globl vector159
vector159:
  pushl $0
  102187:	6a 00                	push   $0x0
  pushl $159
  102189:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10218e:	e9 80 04 00 00       	jmp    102613 <__alltraps>

00102193 <vector160>:
.globl vector160
vector160:
  pushl $0
  102193:	6a 00                	push   $0x0
  pushl $160
  102195:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10219a:	e9 74 04 00 00       	jmp    102613 <__alltraps>

0010219f <vector161>:
.globl vector161
vector161:
  pushl $0
  10219f:	6a 00                	push   $0x0
  pushl $161
  1021a1:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1021a6:	e9 68 04 00 00       	jmp    102613 <__alltraps>

001021ab <vector162>:
.globl vector162
vector162:
  pushl $0
  1021ab:	6a 00                	push   $0x0
  pushl $162
  1021ad:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1021b2:	e9 5c 04 00 00       	jmp    102613 <__alltraps>

001021b7 <vector163>:
.globl vector163
vector163:
  pushl $0
  1021b7:	6a 00                	push   $0x0
  pushl $163
  1021b9:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1021be:	e9 50 04 00 00       	jmp    102613 <__alltraps>

001021c3 <vector164>:
.globl vector164
vector164:
  pushl $0
  1021c3:	6a 00                	push   $0x0
  pushl $164
  1021c5:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1021ca:	e9 44 04 00 00       	jmp    102613 <__alltraps>

001021cf <vector165>:
.globl vector165
vector165:
  pushl $0
  1021cf:	6a 00                	push   $0x0
  pushl $165
  1021d1:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1021d6:	e9 38 04 00 00       	jmp    102613 <__alltraps>

001021db <vector166>:
.globl vector166
vector166:
  pushl $0
  1021db:	6a 00                	push   $0x0
  pushl $166
  1021dd:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1021e2:	e9 2c 04 00 00       	jmp    102613 <__alltraps>

001021e7 <vector167>:
.globl vector167
vector167:
  pushl $0
  1021e7:	6a 00                	push   $0x0
  pushl $167
  1021e9:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1021ee:	e9 20 04 00 00       	jmp    102613 <__alltraps>

001021f3 <vector168>:
.globl vector168
vector168:
  pushl $0
  1021f3:	6a 00                	push   $0x0
  pushl $168
  1021f5:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1021fa:	e9 14 04 00 00       	jmp    102613 <__alltraps>

001021ff <vector169>:
.globl vector169
vector169:
  pushl $0
  1021ff:	6a 00                	push   $0x0
  pushl $169
  102201:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102206:	e9 08 04 00 00       	jmp    102613 <__alltraps>

0010220b <vector170>:
.globl vector170
vector170:
  pushl $0
  10220b:	6a 00                	push   $0x0
  pushl $170
  10220d:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102212:	e9 fc 03 00 00       	jmp    102613 <__alltraps>

00102217 <vector171>:
.globl vector171
vector171:
  pushl $0
  102217:	6a 00                	push   $0x0
  pushl $171
  102219:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10221e:	e9 f0 03 00 00       	jmp    102613 <__alltraps>

00102223 <vector172>:
.globl vector172
vector172:
  pushl $0
  102223:	6a 00                	push   $0x0
  pushl $172
  102225:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10222a:	e9 e4 03 00 00       	jmp    102613 <__alltraps>

0010222f <vector173>:
.globl vector173
vector173:
  pushl $0
  10222f:	6a 00                	push   $0x0
  pushl $173
  102231:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102236:	e9 d8 03 00 00       	jmp    102613 <__alltraps>

0010223b <vector174>:
.globl vector174
vector174:
  pushl $0
  10223b:	6a 00                	push   $0x0
  pushl $174
  10223d:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102242:	e9 cc 03 00 00       	jmp    102613 <__alltraps>

00102247 <vector175>:
.globl vector175
vector175:
  pushl $0
  102247:	6a 00                	push   $0x0
  pushl $175
  102249:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10224e:	e9 c0 03 00 00       	jmp    102613 <__alltraps>

00102253 <vector176>:
.globl vector176
vector176:
  pushl $0
  102253:	6a 00                	push   $0x0
  pushl $176
  102255:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10225a:	e9 b4 03 00 00       	jmp    102613 <__alltraps>

0010225f <vector177>:
.globl vector177
vector177:
  pushl $0
  10225f:	6a 00                	push   $0x0
  pushl $177
  102261:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102266:	e9 a8 03 00 00       	jmp    102613 <__alltraps>

0010226b <vector178>:
.globl vector178
vector178:
  pushl $0
  10226b:	6a 00                	push   $0x0
  pushl $178
  10226d:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102272:	e9 9c 03 00 00       	jmp    102613 <__alltraps>

00102277 <vector179>:
.globl vector179
vector179:
  pushl $0
  102277:	6a 00                	push   $0x0
  pushl $179
  102279:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10227e:	e9 90 03 00 00       	jmp    102613 <__alltraps>

00102283 <vector180>:
.globl vector180
vector180:
  pushl $0
  102283:	6a 00                	push   $0x0
  pushl $180
  102285:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10228a:	e9 84 03 00 00       	jmp    102613 <__alltraps>

0010228f <vector181>:
.globl vector181
vector181:
  pushl $0
  10228f:	6a 00                	push   $0x0
  pushl $181
  102291:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102296:	e9 78 03 00 00       	jmp    102613 <__alltraps>

0010229b <vector182>:
.globl vector182
vector182:
  pushl $0
  10229b:	6a 00                	push   $0x0
  pushl $182
  10229d:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1022a2:	e9 6c 03 00 00       	jmp    102613 <__alltraps>

001022a7 <vector183>:
.globl vector183
vector183:
  pushl $0
  1022a7:	6a 00                	push   $0x0
  pushl $183
  1022a9:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1022ae:	e9 60 03 00 00       	jmp    102613 <__alltraps>

001022b3 <vector184>:
.globl vector184
vector184:
  pushl $0
  1022b3:	6a 00                	push   $0x0
  pushl $184
  1022b5:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1022ba:	e9 54 03 00 00       	jmp    102613 <__alltraps>

001022bf <vector185>:
.globl vector185
vector185:
  pushl $0
  1022bf:	6a 00                	push   $0x0
  pushl $185
  1022c1:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1022c6:	e9 48 03 00 00       	jmp    102613 <__alltraps>

001022cb <vector186>:
.globl vector186
vector186:
  pushl $0
  1022cb:	6a 00                	push   $0x0
  pushl $186
  1022cd:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1022d2:	e9 3c 03 00 00       	jmp    102613 <__alltraps>

001022d7 <vector187>:
.globl vector187
vector187:
  pushl $0
  1022d7:	6a 00                	push   $0x0
  pushl $187
  1022d9:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1022de:	e9 30 03 00 00       	jmp    102613 <__alltraps>

001022e3 <vector188>:
.globl vector188
vector188:
  pushl $0
  1022e3:	6a 00                	push   $0x0
  pushl $188
  1022e5:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1022ea:	e9 24 03 00 00       	jmp    102613 <__alltraps>

001022ef <vector189>:
.globl vector189
vector189:
  pushl $0
  1022ef:	6a 00                	push   $0x0
  pushl $189
  1022f1:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1022f6:	e9 18 03 00 00       	jmp    102613 <__alltraps>

001022fb <vector190>:
.globl vector190
vector190:
  pushl $0
  1022fb:	6a 00                	push   $0x0
  pushl $190
  1022fd:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102302:	e9 0c 03 00 00       	jmp    102613 <__alltraps>

00102307 <vector191>:
.globl vector191
vector191:
  pushl $0
  102307:	6a 00                	push   $0x0
  pushl $191
  102309:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10230e:	e9 00 03 00 00       	jmp    102613 <__alltraps>

00102313 <vector192>:
.globl vector192
vector192:
  pushl $0
  102313:	6a 00                	push   $0x0
  pushl $192
  102315:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10231a:	e9 f4 02 00 00       	jmp    102613 <__alltraps>

0010231f <vector193>:
.globl vector193
vector193:
  pushl $0
  10231f:	6a 00                	push   $0x0
  pushl $193
  102321:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102326:	e9 e8 02 00 00       	jmp    102613 <__alltraps>

0010232b <vector194>:
.globl vector194
vector194:
  pushl $0
  10232b:	6a 00                	push   $0x0
  pushl $194
  10232d:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102332:	e9 dc 02 00 00       	jmp    102613 <__alltraps>

00102337 <vector195>:
.globl vector195
vector195:
  pushl $0
  102337:	6a 00                	push   $0x0
  pushl $195
  102339:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10233e:	e9 d0 02 00 00       	jmp    102613 <__alltraps>

00102343 <vector196>:
.globl vector196
vector196:
  pushl $0
  102343:	6a 00                	push   $0x0
  pushl $196
  102345:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10234a:	e9 c4 02 00 00       	jmp    102613 <__alltraps>

0010234f <vector197>:
.globl vector197
vector197:
  pushl $0
  10234f:	6a 00                	push   $0x0
  pushl $197
  102351:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102356:	e9 b8 02 00 00       	jmp    102613 <__alltraps>

0010235b <vector198>:
.globl vector198
vector198:
  pushl $0
  10235b:	6a 00                	push   $0x0
  pushl $198
  10235d:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102362:	e9 ac 02 00 00       	jmp    102613 <__alltraps>

00102367 <vector199>:
.globl vector199
vector199:
  pushl $0
  102367:	6a 00                	push   $0x0
  pushl $199
  102369:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10236e:	e9 a0 02 00 00       	jmp    102613 <__alltraps>

00102373 <vector200>:
.globl vector200
vector200:
  pushl $0
  102373:	6a 00                	push   $0x0
  pushl $200
  102375:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10237a:	e9 94 02 00 00       	jmp    102613 <__alltraps>

0010237f <vector201>:
.globl vector201
vector201:
  pushl $0
  10237f:	6a 00                	push   $0x0
  pushl $201
  102381:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102386:	e9 88 02 00 00       	jmp    102613 <__alltraps>

0010238b <vector202>:
.globl vector202
vector202:
  pushl $0
  10238b:	6a 00                	push   $0x0
  pushl $202
  10238d:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102392:	e9 7c 02 00 00       	jmp    102613 <__alltraps>

00102397 <vector203>:
.globl vector203
vector203:
  pushl $0
  102397:	6a 00                	push   $0x0
  pushl $203
  102399:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  10239e:	e9 70 02 00 00       	jmp    102613 <__alltraps>

001023a3 <vector204>:
.globl vector204
vector204:
  pushl $0
  1023a3:	6a 00                	push   $0x0
  pushl $204
  1023a5:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1023aa:	e9 64 02 00 00       	jmp    102613 <__alltraps>

001023af <vector205>:
.globl vector205
vector205:
  pushl $0
  1023af:	6a 00                	push   $0x0
  pushl $205
  1023b1:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1023b6:	e9 58 02 00 00       	jmp    102613 <__alltraps>

001023bb <vector206>:
.globl vector206
vector206:
  pushl $0
  1023bb:	6a 00                	push   $0x0
  pushl $206
  1023bd:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1023c2:	e9 4c 02 00 00       	jmp    102613 <__alltraps>

001023c7 <vector207>:
.globl vector207
vector207:
  pushl $0
  1023c7:	6a 00                	push   $0x0
  pushl $207
  1023c9:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1023ce:	e9 40 02 00 00       	jmp    102613 <__alltraps>

001023d3 <vector208>:
.globl vector208
vector208:
  pushl $0
  1023d3:	6a 00                	push   $0x0
  pushl $208
  1023d5:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1023da:	e9 34 02 00 00       	jmp    102613 <__alltraps>

001023df <vector209>:
.globl vector209
vector209:
  pushl $0
  1023df:	6a 00                	push   $0x0
  pushl $209
  1023e1:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1023e6:	e9 28 02 00 00       	jmp    102613 <__alltraps>

001023eb <vector210>:
.globl vector210
vector210:
  pushl $0
  1023eb:	6a 00                	push   $0x0
  pushl $210
  1023ed:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1023f2:	e9 1c 02 00 00       	jmp    102613 <__alltraps>

001023f7 <vector211>:
.globl vector211
vector211:
  pushl $0
  1023f7:	6a 00                	push   $0x0
  pushl $211
  1023f9:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1023fe:	e9 10 02 00 00       	jmp    102613 <__alltraps>

00102403 <vector212>:
.globl vector212
vector212:
  pushl $0
  102403:	6a 00                	push   $0x0
  pushl $212
  102405:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10240a:	e9 04 02 00 00       	jmp    102613 <__alltraps>

0010240f <vector213>:
.globl vector213
vector213:
  pushl $0
  10240f:	6a 00                	push   $0x0
  pushl $213
  102411:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102416:	e9 f8 01 00 00       	jmp    102613 <__alltraps>

0010241b <vector214>:
.globl vector214
vector214:
  pushl $0
  10241b:	6a 00                	push   $0x0
  pushl $214
  10241d:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102422:	e9 ec 01 00 00       	jmp    102613 <__alltraps>

00102427 <vector215>:
.globl vector215
vector215:
  pushl $0
  102427:	6a 00                	push   $0x0
  pushl $215
  102429:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10242e:	e9 e0 01 00 00       	jmp    102613 <__alltraps>

00102433 <vector216>:
.globl vector216
vector216:
  pushl $0
  102433:	6a 00                	push   $0x0
  pushl $216
  102435:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10243a:	e9 d4 01 00 00       	jmp    102613 <__alltraps>

0010243f <vector217>:
.globl vector217
vector217:
  pushl $0
  10243f:	6a 00                	push   $0x0
  pushl $217
  102441:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102446:	e9 c8 01 00 00       	jmp    102613 <__alltraps>

0010244b <vector218>:
.globl vector218
vector218:
  pushl $0
  10244b:	6a 00                	push   $0x0
  pushl $218
  10244d:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102452:	e9 bc 01 00 00       	jmp    102613 <__alltraps>

00102457 <vector219>:
.globl vector219
vector219:
  pushl $0
  102457:	6a 00                	push   $0x0
  pushl $219
  102459:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10245e:	e9 b0 01 00 00       	jmp    102613 <__alltraps>

00102463 <vector220>:
.globl vector220
vector220:
  pushl $0
  102463:	6a 00                	push   $0x0
  pushl $220
  102465:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10246a:	e9 a4 01 00 00       	jmp    102613 <__alltraps>

0010246f <vector221>:
.globl vector221
vector221:
  pushl $0
  10246f:	6a 00                	push   $0x0
  pushl $221
  102471:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102476:	e9 98 01 00 00       	jmp    102613 <__alltraps>

0010247b <vector222>:
.globl vector222
vector222:
  pushl $0
  10247b:	6a 00                	push   $0x0
  pushl $222
  10247d:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102482:	e9 8c 01 00 00       	jmp    102613 <__alltraps>

00102487 <vector223>:
.globl vector223
vector223:
  pushl $0
  102487:	6a 00                	push   $0x0
  pushl $223
  102489:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  10248e:	e9 80 01 00 00       	jmp    102613 <__alltraps>

00102493 <vector224>:
.globl vector224
vector224:
  pushl $0
  102493:	6a 00                	push   $0x0
  pushl $224
  102495:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10249a:	e9 74 01 00 00       	jmp    102613 <__alltraps>

0010249f <vector225>:
.globl vector225
vector225:
  pushl $0
  10249f:	6a 00                	push   $0x0
  pushl $225
  1024a1:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1024a6:	e9 68 01 00 00       	jmp    102613 <__alltraps>

001024ab <vector226>:
.globl vector226
vector226:
  pushl $0
  1024ab:	6a 00                	push   $0x0
  pushl $226
  1024ad:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1024b2:	e9 5c 01 00 00       	jmp    102613 <__alltraps>

001024b7 <vector227>:
.globl vector227
vector227:
  pushl $0
  1024b7:	6a 00                	push   $0x0
  pushl $227
  1024b9:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1024be:	e9 50 01 00 00       	jmp    102613 <__alltraps>

001024c3 <vector228>:
.globl vector228
vector228:
  pushl $0
  1024c3:	6a 00                	push   $0x0
  pushl $228
  1024c5:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1024ca:	e9 44 01 00 00       	jmp    102613 <__alltraps>

001024cf <vector229>:
.globl vector229
vector229:
  pushl $0
  1024cf:	6a 00                	push   $0x0
  pushl $229
  1024d1:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1024d6:	e9 38 01 00 00       	jmp    102613 <__alltraps>

001024db <vector230>:
.globl vector230
vector230:
  pushl $0
  1024db:	6a 00                	push   $0x0
  pushl $230
  1024dd:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1024e2:	e9 2c 01 00 00       	jmp    102613 <__alltraps>

001024e7 <vector231>:
.globl vector231
vector231:
  pushl $0
  1024e7:	6a 00                	push   $0x0
  pushl $231
  1024e9:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1024ee:	e9 20 01 00 00       	jmp    102613 <__alltraps>

001024f3 <vector232>:
.globl vector232
vector232:
  pushl $0
  1024f3:	6a 00                	push   $0x0
  pushl $232
  1024f5:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1024fa:	e9 14 01 00 00       	jmp    102613 <__alltraps>

001024ff <vector233>:
.globl vector233
vector233:
  pushl $0
  1024ff:	6a 00                	push   $0x0
  pushl $233
  102501:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102506:	e9 08 01 00 00       	jmp    102613 <__alltraps>

0010250b <vector234>:
.globl vector234
vector234:
  pushl $0
  10250b:	6a 00                	push   $0x0
  pushl $234
  10250d:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102512:	e9 fc 00 00 00       	jmp    102613 <__alltraps>

00102517 <vector235>:
.globl vector235
vector235:
  pushl $0
  102517:	6a 00                	push   $0x0
  pushl $235
  102519:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10251e:	e9 f0 00 00 00       	jmp    102613 <__alltraps>

00102523 <vector236>:
.globl vector236
vector236:
  pushl $0
  102523:	6a 00                	push   $0x0
  pushl $236
  102525:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10252a:	e9 e4 00 00 00       	jmp    102613 <__alltraps>

0010252f <vector237>:
.globl vector237
vector237:
  pushl $0
  10252f:	6a 00                	push   $0x0
  pushl $237
  102531:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102536:	e9 d8 00 00 00       	jmp    102613 <__alltraps>

0010253b <vector238>:
.globl vector238
vector238:
  pushl $0
  10253b:	6a 00                	push   $0x0
  pushl $238
  10253d:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102542:	e9 cc 00 00 00       	jmp    102613 <__alltraps>

00102547 <vector239>:
.globl vector239
vector239:
  pushl $0
  102547:	6a 00                	push   $0x0
  pushl $239
  102549:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10254e:	e9 c0 00 00 00       	jmp    102613 <__alltraps>

00102553 <vector240>:
.globl vector240
vector240:
  pushl $0
  102553:	6a 00                	push   $0x0
  pushl $240
  102555:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10255a:	e9 b4 00 00 00       	jmp    102613 <__alltraps>

0010255f <vector241>:
.globl vector241
vector241:
  pushl $0
  10255f:	6a 00                	push   $0x0
  pushl $241
  102561:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102566:	e9 a8 00 00 00       	jmp    102613 <__alltraps>

0010256b <vector242>:
.globl vector242
vector242:
  pushl $0
  10256b:	6a 00                	push   $0x0
  pushl $242
  10256d:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102572:	e9 9c 00 00 00       	jmp    102613 <__alltraps>

00102577 <vector243>:
.globl vector243
vector243:
  pushl $0
  102577:	6a 00                	push   $0x0
  pushl $243
  102579:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10257e:	e9 90 00 00 00       	jmp    102613 <__alltraps>

00102583 <vector244>:
.globl vector244
vector244:
  pushl $0
  102583:	6a 00                	push   $0x0
  pushl $244
  102585:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10258a:	e9 84 00 00 00       	jmp    102613 <__alltraps>

0010258f <vector245>:
.globl vector245
vector245:
  pushl $0
  10258f:	6a 00                	push   $0x0
  pushl $245
  102591:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102596:	e9 78 00 00 00       	jmp    102613 <__alltraps>

0010259b <vector246>:
.globl vector246
vector246:
  pushl $0
  10259b:	6a 00                	push   $0x0
  pushl $246
  10259d:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1025a2:	e9 6c 00 00 00       	jmp    102613 <__alltraps>

001025a7 <vector247>:
.globl vector247
vector247:
  pushl $0
  1025a7:	6a 00                	push   $0x0
  pushl $247
  1025a9:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1025ae:	e9 60 00 00 00       	jmp    102613 <__alltraps>

001025b3 <vector248>:
.globl vector248
vector248:
  pushl $0
  1025b3:	6a 00                	push   $0x0
  pushl $248
  1025b5:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1025ba:	e9 54 00 00 00       	jmp    102613 <__alltraps>

001025bf <vector249>:
.globl vector249
vector249:
  pushl $0
  1025bf:	6a 00                	push   $0x0
  pushl $249
  1025c1:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1025c6:	e9 48 00 00 00       	jmp    102613 <__alltraps>

001025cb <vector250>:
.globl vector250
vector250:
  pushl $0
  1025cb:	6a 00                	push   $0x0
  pushl $250
  1025cd:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1025d2:	e9 3c 00 00 00       	jmp    102613 <__alltraps>

001025d7 <vector251>:
.globl vector251
vector251:
  pushl $0
  1025d7:	6a 00                	push   $0x0
  pushl $251
  1025d9:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1025de:	e9 30 00 00 00       	jmp    102613 <__alltraps>

001025e3 <vector252>:
.globl vector252
vector252:
  pushl $0
  1025e3:	6a 00                	push   $0x0
  pushl $252
  1025e5:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1025ea:	e9 24 00 00 00       	jmp    102613 <__alltraps>

001025ef <vector253>:
.globl vector253
vector253:
  pushl $0
  1025ef:	6a 00                	push   $0x0
  pushl $253
  1025f1:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1025f6:	e9 18 00 00 00       	jmp    102613 <__alltraps>

001025fb <vector254>:
.globl vector254
vector254:
  pushl $0
  1025fb:	6a 00                	push   $0x0
  pushl $254
  1025fd:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102602:	e9 0c 00 00 00       	jmp    102613 <__alltraps>

00102607 <vector255>:
.globl vector255
vector255:
  pushl $0
  102607:	6a 00                	push   $0x0
  pushl $255
  102609:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10260e:	e9 00 00 00 00       	jmp    102613 <__alltraps>

00102613 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102613:	1e                   	push   %ds
    pushl %es
  102614:	06                   	push   %es
    pushl %fs
  102615:	0f a0                	push   %fs
    pushl %gs
  102617:	0f a8                	push   %gs
    pushal
  102619:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  10261a:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10261f:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102621:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102623:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102624:	e8 64 f5 ff ff       	call   101b8d <trap>

    # pop the pushed stack pointer
    popl %esp
  102629:	5c                   	pop    %esp

0010262a <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  10262a:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  10262b:	0f a9                	pop    %gs
    popl %fs
  10262d:	0f a1                	pop    %fs
    popl %es
  10262f:	07                   	pop    %es
    popl %ds
  102630:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102631:	83 c4 08             	add    $0x8,%esp
    iret
  102634:	cf                   	iret   

00102635 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102635:	55                   	push   %ebp
  102636:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102638:	8b 45 08             	mov    0x8(%ebp),%eax
  10263b:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10263e:	b8 23 00 00 00       	mov    $0x23,%eax
  102643:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102645:	b8 23 00 00 00       	mov    $0x23,%eax
  10264a:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10264c:	b8 10 00 00 00       	mov    $0x10,%eax
  102651:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102653:	b8 10 00 00 00       	mov    $0x10,%eax
  102658:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10265a:	b8 10 00 00 00       	mov    $0x10,%eax
  10265f:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102661:	ea 68 26 10 00 08 00 	ljmp   $0x8,$0x102668
}
  102668:	5d                   	pop    %ebp
  102669:	c3                   	ret    

0010266a <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10266a:	55                   	push   %ebp
  10266b:	89 e5                	mov    %esp,%ebp
  10266d:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102670:	b8 00 fa 10 00       	mov    $0x10fa00,%eax
  102675:	05 00 04 00 00       	add    $0x400,%eax
  10267a:	a3 84 f9 10 00       	mov    %eax,0x10f984
    ts.ts_ss0 = KERNEL_DS;
  10267f:	66 c7 05 88 f9 10 00 	movw   $0x10,0x10f988
  102686:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102688:	66 c7 05 48 ea 10 00 	movw   $0x68,0x10ea48
  10268f:	68 00 
  102691:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  102696:	66 a3 4a ea 10 00    	mov    %ax,0x10ea4a
  10269c:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  1026a1:	c1 e8 10             	shr    $0x10,%eax
  1026a4:	a2 4c ea 10 00       	mov    %al,0x10ea4c
  1026a9:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  1026b0:	83 e0 f0             	and    $0xfffffff0,%eax
  1026b3:	83 c8 09             	or     $0x9,%eax
  1026b6:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  1026bb:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  1026c2:	83 c8 10             	or     $0x10,%eax
  1026c5:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  1026ca:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  1026d1:	83 e0 9f             	and    $0xffffff9f,%eax
  1026d4:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  1026d9:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  1026e0:	83 c8 80             	or     $0xffffff80,%eax
  1026e3:	a2 4d ea 10 00       	mov    %al,0x10ea4d
  1026e8:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  1026ef:	83 e0 f0             	and    $0xfffffff0,%eax
  1026f2:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  1026f7:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  1026fe:	83 e0 ef             	and    $0xffffffef,%eax
  102701:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  102706:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  10270d:	83 e0 df             	and    $0xffffffdf,%eax
  102710:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  102715:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  10271c:	83 c8 40             	or     $0x40,%eax
  10271f:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  102724:	0f b6 05 4e ea 10 00 	movzbl 0x10ea4e,%eax
  10272b:	83 e0 7f             	and    $0x7f,%eax
  10272e:	a2 4e ea 10 00       	mov    %al,0x10ea4e
  102733:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  102738:	c1 e8 18             	shr    $0x18,%eax
  10273b:	a2 4f ea 10 00       	mov    %al,0x10ea4f
    gdt[SEG_TSS].sd_s = 0;
  102740:	0f b6 05 4d ea 10 00 	movzbl 0x10ea4d,%eax
  102747:	83 e0 ef             	and    $0xffffffef,%eax
  10274a:	a2 4d ea 10 00       	mov    %al,0x10ea4d

    // reload all segment registers
    lgdt(&gdt_pd);
  10274f:	68 50 ea 10 00       	push   $0x10ea50
  102754:	e8 dc fe ff ff       	call   102635 <lgdt>
  102759:	83 c4 04             	add    $0x4,%esp
  10275c:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102762:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102766:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102769:	c9                   	leave  
  10276a:	c3                   	ret    

0010276b <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  10276b:	55                   	push   %ebp
  10276c:	89 e5                	mov    %esp,%ebp
    gdt_init();
  10276e:	e8 f7 fe ff ff       	call   10266a <gdt_init>
}
  102773:	5d                   	pop    %ebp
  102774:	c3                   	ret    

00102775 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102775:	55                   	push   %ebp
  102776:	89 e5                	mov    %esp,%ebp
  102778:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10277b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102782:	eb 04                	jmp    102788 <strlen+0x13>
        cnt ++;
  102784:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102788:	8b 45 08             	mov    0x8(%ebp),%eax
  10278b:	8d 50 01             	lea    0x1(%eax),%edx
  10278e:	89 55 08             	mov    %edx,0x8(%ebp)
  102791:	0f b6 00             	movzbl (%eax),%eax
  102794:	84 c0                	test   %al,%al
  102796:	75 ec                	jne    102784 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102798:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10279b:	c9                   	leave  
  10279c:	c3                   	ret    

0010279d <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  10279d:	55                   	push   %ebp
  10279e:	89 e5                	mov    %esp,%ebp
  1027a0:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1027a3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1027aa:	eb 04                	jmp    1027b0 <strnlen+0x13>
        cnt ++;
  1027ac:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  1027b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1027b3:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1027b6:	73 10                	jae    1027c8 <strnlen+0x2b>
  1027b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1027bb:	8d 50 01             	lea    0x1(%eax),%edx
  1027be:	89 55 08             	mov    %edx,0x8(%ebp)
  1027c1:	0f b6 00             	movzbl (%eax),%eax
  1027c4:	84 c0                	test   %al,%al
  1027c6:	75 e4                	jne    1027ac <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  1027c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1027cb:	c9                   	leave  
  1027cc:	c3                   	ret    

001027cd <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  1027cd:	55                   	push   %ebp
  1027ce:	89 e5                	mov    %esp,%ebp
  1027d0:	57                   	push   %edi
  1027d1:	56                   	push   %esi
  1027d2:	83 ec 20             	sub    $0x20,%esp
  1027d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1027d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1027db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027de:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  1027e1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1027e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1027e7:	89 d1                	mov    %edx,%ecx
  1027e9:	89 c2                	mov    %eax,%edx
  1027eb:	89 ce                	mov    %ecx,%esi
  1027ed:	89 d7                	mov    %edx,%edi
  1027ef:	ac                   	lods   %ds:(%esi),%al
  1027f0:	aa                   	stos   %al,%es:(%edi)
  1027f1:	84 c0                	test   %al,%al
  1027f3:	75 fa                	jne    1027ef <strcpy+0x22>
  1027f5:	89 fa                	mov    %edi,%edx
  1027f7:	89 f1                	mov    %esi,%ecx
  1027f9:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1027fc:	89 55 e8             	mov    %edx,-0x18(%ebp)
  1027ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102802:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102805:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102806:	83 c4 20             	add    $0x20,%esp
  102809:	5e                   	pop    %esi
  10280a:	5f                   	pop    %edi
  10280b:	5d                   	pop    %ebp
  10280c:	c3                   	ret    

0010280d <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  10280d:	55                   	push   %ebp
  10280e:	89 e5                	mov    %esp,%ebp
  102810:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102813:	8b 45 08             	mov    0x8(%ebp),%eax
  102816:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102819:	eb 21                	jmp    10283c <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  10281b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10281e:	0f b6 10             	movzbl (%eax),%edx
  102821:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102824:	88 10                	mov    %dl,(%eax)
  102826:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102829:	0f b6 00             	movzbl (%eax),%eax
  10282c:	84 c0                	test   %al,%al
  10282e:	74 04                	je     102834 <strncpy+0x27>
            src ++;
  102830:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102834:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102838:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  10283c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102840:	75 d9                	jne    10281b <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102842:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102845:	c9                   	leave  
  102846:	c3                   	ret    

00102847 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102847:	55                   	push   %ebp
  102848:	89 e5                	mov    %esp,%ebp
  10284a:	57                   	push   %edi
  10284b:	56                   	push   %esi
  10284c:	83 ec 20             	sub    $0x20,%esp
  10284f:	8b 45 08             	mov    0x8(%ebp),%eax
  102852:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102855:	8b 45 0c             	mov    0xc(%ebp),%eax
  102858:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  10285b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10285e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102861:	89 d1                	mov    %edx,%ecx
  102863:	89 c2                	mov    %eax,%edx
  102865:	89 ce                	mov    %ecx,%esi
  102867:	89 d7                	mov    %edx,%edi
  102869:	ac                   	lods   %ds:(%esi),%al
  10286a:	ae                   	scas   %es:(%edi),%al
  10286b:	75 08                	jne    102875 <strcmp+0x2e>
  10286d:	84 c0                	test   %al,%al
  10286f:	75 f8                	jne    102869 <strcmp+0x22>
  102871:	31 c0                	xor    %eax,%eax
  102873:	eb 04                	jmp    102879 <strcmp+0x32>
  102875:	19 c0                	sbb    %eax,%eax
  102877:	0c 01                	or     $0x1,%al
  102879:	89 fa                	mov    %edi,%edx
  10287b:	89 f1                	mov    %esi,%ecx
  10287d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102880:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102883:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102886:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102889:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  10288a:	83 c4 20             	add    $0x20,%esp
  10288d:	5e                   	pop    %esi
  10288e:	5f                   	pop    %edi
  10288f:	5d                   	pop    %ebp
  102890:	c3                   	ret    

00102891 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102891:	55                   	push   %ebp
  102892:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102894:	eb 0c                	jmp    1028a2 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102896:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10289a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10289e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1028a2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1028a6:	74 1a                	je     1028c2 <strncmp+0x31>
  1028a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1028ab:	0f b6 00             	movzbl (%eax),%eax
  1028ae:	84 c0                	test   %al,%al
  1028b0:	74 10                	je     1028c2 <strncmp+0x31>
  1028b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1028b5:	0f b6 10             	movzbl (%eax),%edx
  1028b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028bb:	0f b6 00             	movzbl (%eax),%eax
  1028be:	38 c2                	cmp    %al,%dl
  1028c0:	74 d4                	je     102896 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  1028c2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1028c6:	74 18                	je     1028e0 <strncmp+0x4f>
  1028c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1028cb:	0f b6 00             	movzbl (%eax),%eax
  1028ce:	0f b6 d0             	movzbl %al,%edx
  1028d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028d4:	0f b6 00             	movzbl (%eax),%eax
  1028d7:	0f b6 c0             	movzbl %al,%eax
  1028da:	29 c2                	sub    %eax,%edx
  1028dc:	89 d0                	mov    %edx,%eax
  1028de:	eb 05                	jmp    1028e5 <strncmp+0x54>
  1028e0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1028e5:	5d                   	pop    %ebp
  1028e6:	c3                   	ret    

001028e7 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1028e7:	55                   	push   %ebp
  1028e8:	89 e5                	mov    %esp,%ebp
  1028ea:	83 ec 04             	sub    $0x4,%esp
  1028ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028f0:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1028f3:	eb 14                	jmp    102909 <strchr+0x22>
        if (*s == c) {
  1028f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1028f8:	0f b6 00             	movzbl (%eax),%eax
  1028fb:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1028fe:	75 05                	jne    102905 <strchr+0x1e>
            return (char *)s;
  102900:	8b 45 08             	mov    0x8(%ebp),%eax
  102903:	eb 13                	jmp    102918 <strchr+0x31>
        }
        s ++;
  102905:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102909:	8b 45 08             	mov    0x8(%ebp),%eax
  10290c:	0f b6 00             	movzbl (%eax),%eax
  10290f:	84 c0                	test   %al,%al
  102911:	75 e2                	jne    1028f5 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102913:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102918:	c9                   	leave  
  102919:	c3                   	ret    

0010291a <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  10291a:	55                   	push   %ebp
  10291b:	89 e5                	mov    %esp,%ebp
  10291d:	83 ec 04             	sub    $0x4,%esp
  102920:	8b 45 0c             	mov    0xc(%ebp),%eax
  102923:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102926:	eb 11                	jmp    102939 <strfind+0x1f>
        if (*s == c) {
  102928:	8b 45 08             	mov    0x8(%ebp),%eax
  10292b:	0f b6 00             	movzbl (%eax),%eax
  10292e:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102931:	75 02                	jne    102935 <strfind+0x1b>
            break;
  102933:	eb 0e                	jmp    102943 <strfind+0x29>
        }
        s ++;
  102935:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102939:	8b 45 08             	mov    0x8(%ebp),%eax
  10293c:	0f b6 00             	movzbl (%eax),%eax
  10293f:	84 c0                	test   %al,%al
  102941:	75 e5                	jne    102928 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  102943:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102946:	c9                   	leave  
  102947:	c3                   	ret    

00102948 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102948:	55                   	push   %ebp
  102949:	89 e5                	mov    %esp,%ebp
  10294b:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  10294e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102955:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10295c:	eb 04                	jmp    102962 <strtol+0x1a>
        s ++;
  10295e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102962:	8b 45 08             	mov    0x8(%ebp),%eax
  102965:	0f b6 00             	movzbl (%eax),%eax
  102968:	3c 20                	cmp    $0x20,%al
  10296a:	74 f2                	je     10295e <strtol+0x16>
  10296c:	8b 45 08             	mov    0x8(%ebp),%eax
  10296f:	0f b6 00             	movzbl (%eax),%eax
  102972:	3c 09                	cmp    $0x9,%al
  102974:	74 e8                	je     10295e <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102976:	8b 45 08             	mov    0x8(%ebp),%eax
  102979:	0f b6 00             	movzbl (%eax),%eax
  10297c:	3c 2b                	cmp    $0x2b,%al
  10297e:	75 06                	jne    102986 <strtol+0x3e>
        s ++;
  102980:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102984:	eb 15                	jmp    10299b <strtol+0x53>
    }
    else if (*s == '-') {
  102986:	8b 45 08             	mov    0x8(%ebp),%eax
  102989:	0f b6 00             	movzbl (%eax),%eax
  10298c:	3c 2d                	cmp    $0x2d,%al
  10298e:	75 0b                	jne    10299b <strtol+0x53>
        s ++, neg = 1;
  102990:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102994:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10299b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10299f:	74 06                	je     1029a7 <strtol+0x5f>
  1029a1:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1029a5:	75 24                	jne    1029cb <strtol+0x83>
  1029a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1029aa:	0f b6 00             	movzbl (%eax),%eax
  1029ad:	3c 30                	cmp    $0x30,%al
  1029af:	75 1a                	jne    1029cb <strtol+0x83>
  1029b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1029b4:	83 c0 01             	add    $0x1,%eax
  1029b7:	0f b6 00             	movzbl (%eax),%eax
  1029ba:	3c 78                	cmp    $0x78,%al
  1029bc:	75 0d                	jne    1029cb <strtol+0x83>
        s += 2, base = 16;
  1029be:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  1029c2:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  1029c9:	eb 2a                	jmp    1029f5 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  1029cb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029cf:	75 17                	jne    1029e8 <strtol+0xa0>
  1029d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1029d4:	0f b6 00             	movzbl (%eax),%eax
  1029d7:	3c 30                	cmp    $0x30,%al
  1029d9:	75 0d                	jne    1029e8 <strtol+0xa0>
        s ++, base = 8;
  1029db:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1029df:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1029e6:	eb 0d                	jmp    1029f5 <strtol+0xad>
    }
    else if (base == 0) {
  1029e8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029ec:	75 07                	jne    1029f5 <strtol+0xad>
        base = 10;
  1029ee:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1029f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1029f8:	0f b6 00             	movzbl (%eax),%eax
  1029fb:	3c 2f                	cmp    $0x2f,%al
  1029fd:	7e 1b                	jle    102a1a <strtol+0xd2>
  1029ff:	8b 45 08             	mov    0x8(%ebp),%eax
  102a02:	0f b6 00             	movzbl (%eax),%eax
  102a05:	3c 39                	cmp    $0x39,%al
  102a07:	7f 11                	jg     102a1a <strtol+0xd2>
            dig = *s - '0';
  102a09:	8b 45 08             	mov    0x8(%ebp),%eax
  102a0c:	0f b6 00             	movzbl (%eax),%eax
  102a0f:	0f be c0             	movsbl %al,%eax
  102a12:	83 e8 30             	sub    $0x30,%eax
  102a15:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a18:	eb 48                	jmp    102a62 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102a1a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a1d:	0f b6 00             	movzbl (%eax),%eax
  102a20:	3c 60                	cmp    $0x60,%al
  102a22:	7e 1b                	jle    102a3f <strtol+0xf7>
  102a24:	8b 45 08             	mov    0x8(%ebp),%eax
  102a27:	0f b6 00             	movzbl (%eax),%eax
  102a2a:	3c 7a                	cmp    $0x7a,%al
  102a2c:	7f 11                	jg     102a3f <strtol+0xf7>
            dig = *s - 'a' + 10;
  102a2e:	8b 45 08             	mov    0x8(%ebp),%eax
  102a31:	0f b6 00             	movzbl (%eax),%eax
  102a34:	0f be c0             	movsbl %al,%eax
  102a37:	83 e8 57             	sub    $0x57,%eax
  102a3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a3d:	eb 23                	jmp    102a62 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102a3f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a42:	0f b6 00             	movzbl (%eax),%eax
  102a45:	3c 40                	cmp    $0x40,%al
  102a47:	7e 3d                	jle    102a86 <strtol+0x13e>
  102a49:	8b 45 08             	mov    0x8(%ebp),%eax
  102a4c:	0f b6 00             	movzbl (%eax),%eax
  102a4f:	3c 5a                	cmp    $0x5a,%al
  102a51:	7f 33                	jg     102a86 <strtol+0x13e>
            dig = *s - 'A' + 10;
  102a53:	8b 45 08             	mov    0x8(%ebp),%eax
  102a56:	0f b6 00             	movzbl (%eax),%eax
  102a59:	0f be c0             	movsbl %al,%eax
  102a5c:	83 e8 37             	sub    $0x37,%eax
  102a5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102a62:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a65:	3b 45 10             	cmp    0x10(%ebp),%eax
  102a68:	7c 02                	jl     102a6c <strtol+0x124>
            break;
  102a6a:	eb 1a                	jmp    102a86 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  102a6c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a70:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a73:	0f af 45 10          	imul   0x10(%ebp),%eax
  102a77:	89 c2                	mov    %eax,%edx
  102a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a7c:	01 d0                	add    %edx,%eax
  102a7e:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102a81:	e9 6f ff ff ff       	jmp    1029f5 <strtol+0xad>

    if (endptr) {
  102a86:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a8a:	74 08                	je     102a94 <strtol+0x14c>
        *endptr = (char *) s;
  102a8c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a8f:	8b 55 08             	mov    0x8(%ebp),%edx
  102a92:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102a94:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102a98:	74 07                	je     102aa1 <strtol+0x159>
  102a9a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102a9d:	f7 d8                	neg    %eax
  102a9f:	eb 03                	jmp    102aa4 <strtol+0x15c>
  102aa1:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102aa4:	c9                   	leave  
  102aa5:	c3                   	ret    

00102aa6 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102aa6:	55                   	push   %ebp
  102aa7:	89 e5                	mov    %esp,%ebp
  102aa9:	57                   	push   %edi
  102aaa:	83 ec 24             	sub    $0x24,%esp
  102aad:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ab0:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102ab3:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102ab7:	8b 55 08             	mov    0x8(%ebp),%edx
  102aba:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102abd:	88 45 f7             	mov    %al,-0x9(%ebp)
  102ac0:	8b 45 10             	mov    0x10(%ebp),%eax
  102ac3:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102ac6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102ac9:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102acd:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102ad0:	89 d7                	mov    %edx,%edi
  102ad2:	f3 aa                	rep stos %al,%es:(%edi)
  102ad4:	89 fa                	mov    %edi,%edx
  102ad6:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102ad9:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102adc:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102adf:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102ae0:	83 c4 24             	add    $0x24,%esp
  102ae3:	5f                   	pop    %edi
  102ae4:	5d                   	pop    %ebp
  102ae5:	c3                   	ret    

00102ae6 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102ae6:	55                   	push   %ebp
  102ae7:	89 e5                	mov    %esp,%ebp
  102ae9:	57                   	push   %edi
  102aea:	56                   	push   %esi
  102aeb:	53                   	push   %ebx
  102aec:	83 ec 30             	sub    $0x30,%esp
  102aef:	8b 45 08             	mov    0x8(%ebp),%eax
  102af2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102af5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102af8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102afb:	8b 45 10             	mov    0x10(%ebp),%eax
  102afe:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102b01:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b04:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102b07:	73 42                	jae    102b4b <memmove+0x65>
  102b09:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b0c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102b0f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b12:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102b15:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b18:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102b1b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b1e:	c1 e8 02             	shr    $0x2,%eax
  102b21:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102b23:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b26:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b29:	89 d7                	mov    %edx,%edi
  102b2b:	89 c6                	mov    %eax,%esi
  102b2d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102b2f:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102b32:	83 e1 03             	and    $0x3,%ecx
  102b35:	74 02                	je     102b39 <memmove+0x53>
  102b37:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102b39:	89 f0                	mov    %esi,%eax
  102b3b:	89 fa                	mov    %edi,%edx
  102b3d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102b40:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102b43:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102b46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102b49:	eb 36                	jmp    102b81 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102b4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b4e:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b51:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b54:	01 c2                	add    %eax,%edx
  102b56:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b59:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102b5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b5f:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  102b62:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b65:	89 c1                	mov    %eax,%ecx
  102b67:	89 d8                	mov    %ebx,%eax
  102b69:	89 d6                	mov    %edx,%esi
  102b6b:	89 c7                	mov    %eax,%edi
  102b6d:	fd                   	std    
  102b6e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102b70:	fc                   	cld    
  102b71:	89 f8                	mov    %edi,%eax
  102b73:	89 f2                	mov    %esi,%edx
  102b75:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102b78:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102b7b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  102b7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102b81:	83 c4 30             	add    $0x30,%esp
  102b84:	5b                   	pop    %ebx
  102b85:	5e                   	pop    %esi
  102b86:	5f                   	pop    %edi
  102b87:	5d                   	pop    %ebp
  102b88:	c3                   	ret    

00102b89 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102b89:	55                   	push   %ebp
  102b8a:	89 e5                	mov    %esp,%ebp
  102b8c:	57                   	push   %edi
  102b8d:	56                   	push   %esi
  102b8e:	83 ec 20             	sub    $0x20,%esp
  102b91:	8b 45 08             	mov    0x8(%ebp),%eax
  102b94:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b97:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b9d:	8b 45 10             	mov    0x10(%ebp),%eax
  102ba0:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ba3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ba6:	c1 e8 02             	shr    $0x2,%eax
  102ba9:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102bab:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bb1:	89 d7                	mov    %edx,%edi
  102bb3:	89 c6                	mov    %eax,%esi
  102bb5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102bb7:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102bba:	83 e1 03             	and    $0x3,%ecx
  102bbd:	74 02                	je     102bc1 <memcpy+0x38>
  102bbf:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102bc1:	89 f0                	mov    %esi,%eax
  102bc3:	89 fa                	mov    %edi,%edx
  102bc5:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102bc8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102bcb:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102bd1:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102bd2:	83 c4 20             	add    $0x20,%esp
  102bd5:	5e                   	pop    %esi
  102bd6:	5f                   	pop    %edi
  102bd7:	5d                   	pop    %ebp
  102bd8:	c3                   	ret    

00102bd9 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102bd9:	55                   	push   %ebp
  102bda:	89 e5                	mov    %esp,%ebp
  102bdc:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102bdf:	8b 45 08             	mov    0x8(%ebp),%eax
  102be2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102be5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102be8:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102beb:	eb 30                	jmp    102c1d <memcmp+0x44>
        if (*s1 != *s2) {
  102bed:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102bf0:	0f b6 10             	movzbl (%eax),%edx
  102bf3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102bf6:	0f b6 00             	movzbl (%eax),%eax
  102bf9:	38 c2                	cmp    %al,%dl
  102bfb:	74 18                	je     102c15 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102bfd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c00:	0f b6 00             	movzbl (%eax),%eax
  102c03:	0f b6 d0             	movzbl %al,%edx
  102c06:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c09:	0f b6 00             	movzbl (%eax),%eax
  102c0c:	0f b6 c0             	movzbl %al,%eax
  102c0f:	29 c2                	sub    %eax,%edx
  102c11:	89 d0                	mov    %edx,%eax
  102c13:	eb 1a                	jmp    102c2f <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102c15:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102c19:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  102c1d:	8b 45 10             	mov    0x10(%ebp),%eax
  102c20:	8d 50 ff             	lea    -0x1(%eax),%edx
  102c23:	89 55 10             	mov    %edx,0x10(%ebp)
  102c26:	85 c0                	test   %eax,%eax
  102c28:	75 c3                	jne    102bed <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  102c2a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c2f:	c9                   	leave  
  102c30:	c3                   	ret    

00102c31 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102c31:	55                   	push   %ebp
  102c32:	89 e5                	mov    %esp,%ebp
  102c34:	83 ec 38             	sub    $0x38,%esp
  102c37:	8b 45 10             	mov    0x10(%ebp),%eax
  102c3a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102c3d:	8b 45 14             	mov    0x14(%ebp),%eax
  102c40:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102c43:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102c46:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102c49:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c4c:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102c4f:	8b 45 18             	mov    0x18(%ebp),%eax
  102c52:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102c55:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c58:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102c5b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102c5e:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102c61:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c64:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c67:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102c6b:	74 1c                	je     102c89 <printnum+0x58>
  102c6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c70:	ba 00 00 00 00       	mov    $0x0,%edx
  102c75:	f7 75 e4             	divl   -0x1c(%ebp)
  102c78:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102c7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c7e:	ba 00 00 00 00       	mov    $0x0,%edx
  102c83:	f7 75 e4             	divl   -0x1c(%ebp)
  102c86:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c89:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c8c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c8f:	f7 75 e4             	divl   -0x1c(%ebp)
  102c92:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102c95:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102c98:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c9b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102c9e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ca1:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102ca4:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102ca7:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102caa:	8b 45 18             	mov    0x18(%ebp),%eax
  102cad:	ba 00 00 00 00       	mov    $0x0,%edx
  102cb2:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102cb5:	77 41                	ja     102cf8 <printnum+0xc7>
  102cb7:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102cba:	72 05                	jb     102cc1 <printnum+0x90>
  102cbc:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102cbf:	77 37                	ja     102cf8 <printnum+0xc7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102cc1:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102cc4:	83 e8 01             	sub    $0x1,%eax
  102cc7:	83 ec 04             	sub    $0x4,%esp
  102cca:	ff 75 20             	pushl  0x20(%ebp)
  102ccd:	50                   	push   %eax
  102cce:	ff 75 18             	pushl  0x18(%ebp)
  102cd1:	ff 75 ec             	pushl  -0x14(%ebp)
  102cd4:	ff 75 e8             	pushl  -0x18(%ebp)
  102cd7:	ff 75 0c             	pushl  0xc(%ebp)
  102cda:	ff 75 08             	pushl  0x8(%ebp)
  102cdd:	e8 4f ff ff ff       	call   102c31 <printnum>
  102ce2:	83 c4 20             	add    $0x20,%esp
  102ce5:	eb 1b                	jmp    102d02 <printnum+0xd1>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102ce7:	83 ec 08             	sub    $0x8,%esp
  102cea:	ff 75 0c             	pushl  0xc(%ebp)
  102ced:	ff 75 20             	pushl  0x20(%ebp)
  102cf0:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf3:	ff d0                	call   *%eax
  102cf5:	83 c4 10             	add    $0x10,%esp
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102cf8:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102cfc:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102d00:	7f e5                	jg     102ce7 <printnum+0xb6>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102d02:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102d05:	05 10 3a 10 00       	add    $0x103a10,%eax
  102d0a:	0f b6 00             	movzbl (%eax),%eax
  102d0d:	0f be c0             	movsbl %al,%eax
  102d10:	83 ec 08             	sub    $0x8,%esp
  102d13:	ff 75 0c             	pushl  0xc(%ebp)
  102d16:	50                   	push   %eax
  102d17:	8b 45 08             	mov    0x8(%ebp),%eax
  102d1a:	ff d0                	call   *%eax
  102d1c:	83 c4 10             	add    $0x10,%esp
}
  102d1f:	c9                   	leave  
  102d20:	c3                   	ret    

00102d21 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102d21:	55                   	push   %ebp
  102d22:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102d24:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102d28:	7e 14                	jle    102d3e <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102d2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2d:	8b 00                	mov    (%eax),%eax
  102d2f:	8d 48 08             	lea    0x8(%eax),%ecx
  102d32:	8b 55 08             	mov    0x8(%ebp),%edx
  102d35:	89 0a                	mov    %ecx,(%edx)
  102d37:	8b 50 04             	mov    0x4(%eax),%edx
  102d3a:	8b 00                	mov    (%eax),%eax
  102d3c:	eb 30                	jmp    102d6e <getuint+0x4d>
    }
    else if (lflag) {
  102d3e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102d42:	74 16                	je     102d5a <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102d44:	8b 45 08             	mov    0x8(%ebp),%eax
  102d47:	8b 00                	mov    (%eax),%eax
  102d49:	8d 48 04             	lea    0x4(%eax),%ecx
  102d4c:	8b 55 08             	mov    0x8(%ebp),%edx
  102d4f:	89 0a                	mov    %ecx,(%edx)
  102d51:	8b 00                	mov    (%eax),%eax
  102d53:	ba 00 00 00 00       	mov    $0x0,%edx
  102d58:	eb 14                	jmp    102d6e <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102d5a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d5d:	8b 00                	mov    (%eax),%eax
  102d5f:	8d 48 04             	lea    0x4(%eax),%ecx
  102d62:	8b 55 08             	mov    0x8(%ebp),%edx
  102d65:	89 0a                	mov    %ecx,(%edx)
  102d67:	8b 00                	mov    (%eax),%eax
  102d69:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102d6e:	5d                   	pop    %ebp
  102d6f:	c3                   	ret    

00102d70 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102d70:	55                   	push   %ebp
  102d71:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102d73:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102d77:	7e 14                	jle    102d8d <getint+0x1d>
        return va_arg(*ap, long long);
  102d79:	8b 45 08             	mov    0x8(%ebp),%eax
  102d7c:	8b 00                	mov    (%eax),%eax
  102d7e:	8d 48 08             	lea    0x8(%eax),%ecx
  102d81:	8b 55 08             	mov    0x8(%ebp),%edx
  102d84:	89 0a                	mov    %ecx,(%edx)
  102d86:	8b 50 04             	mov    0x4(%eax),%edx
  102d89:	8b 00                	mov    (%eax),%eax
  102d8b:	eb 28                	jmp    102db5 <getint+0x45>
    }
    else if (lflag) {
  102d8d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102d91:	74 12                	je     102da5 <getint+0x35>
        return va_arg(*ap, long);
  102d93:	8b 45 08             	mov    0x8(%ebp),%eax
  102d96:	8b 00                	mov    (%eax),%eax
  102d98:	8d 48 04             	lea    0x4(%eax),%ecx
  102d9b:	8b 55 08             	mov    0x8(%ebp),%edx
  102d9e:	89 0a                	mov    %ecx,(%edx)
  102da0:	8b 00                	mov    (%eax),%eax
  102da2:	99                   	cltd   
  102da3:	eb 10                	jmp    102db5 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102da5:	8b 45 08             	mov    0x8(%ebp),%eax
  102da8:	8b 00                	mov    (%eax),%eax
  102daa:	8d 48 04             	lea    0x4(%eax),%ecx
  102dad:	8b 55 08             	mov    0x8(%ebp),%edx
  102db0:	89 0a                	mov    %ecx,(%edx)
  102db2:	8b 00                	mov    (%eax),%eax
  102db4:	99                   	cltd   
    }
}
  102db5:	5d                   	pop    %ebp
  102db6:	c3                   	ret    

00102db7 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102db7:	55                   	push   %ebp
  102db8:	89 e5                	mov    %esp,%ebp
  102dba:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  102dbd:	8d 45 14             	lea    0x14(%ebp),%eax
  102dc0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102dc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102dc6:	50                   	push   %eax
  102dc7:	ff 75 10             	pushl  0x10(%ebp)
  102dca:	ff 75 0c             	pushl  0xc(%ebp)
  102dcd:	ff 75 08             	pushl  0x8(%ebp)
  102dd0:	e8 05 00 00 00       	call   102dda <vprintfmt>
  102dd5:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  102dd8:	c9                   	leave  
  102dd9:	c3                   	ret    

00102dda <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102dda:	55                   	push   %ebp
  102ddb:	89 e5                	mov    %esp,%ebp
  102ddd:	56                   	push   %esi
  102dde:	53                   	push   %ebx
  102ddf:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102de2:	eb 18                	jmp    102dfc <vprintfmt+0x22>
            if (ch == '\0') {
  102de4:	85 db                	test   %ebx,%ebx
  102de6:	75 05                	jne    102ded <vprintfmt+0x13>
                return;
  102de8:	e9 8b 03 00 00       	jmp    103178 <vprintfmt+0x39e>
            }
            putch(ch, putdat);
  102ded:	83 ec 08             	sub    $0x8,%esp
  102df0:	ff 75 0c             	pushl  0xc(%ebp)
  102df3:	53                   	push   %ebx
  102df4:	8b 45 08             	mov    0x8(%ebp),%eax
  102df7:	ff d0                	call   *%eax
  102df9:	83 c4 10             	add    $0x10,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102dfc:	8b 45 10             	mov    0x10(%ebp),%eax
  102dff:	8d 50 01             	lea    0x1(%eax),%edx
  102e02:	89 55 10             	mov    %edx,0x10(%ebp)
  102e05:	0f b6 00             	movzbl (%eax),%eax
  102e08:	0f b6 d8             	movzbl %al,%ebx
  102e0b:	83 fb 25             	cmp    $0x25,%ebx
  102e0e:	75 d4                	jne    102de4 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102e10:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102e14:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102e1b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e1e:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102e21:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102e28:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e2b:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102e2e:	8b 45 10             	mov    0x10(%ebp),%eax
  102e31:	8d 50 01             	lea    0x1(%eax),%edx
  102e34:	89 55 10             	mov    %edx,0x10(%ebp)
  102e37:	0f b6 00             	movzbl (%eax),%eax
  102e3a:	0f b6 d8             	movzbl %al,%ebx
  102e3d:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102e40:	83 f8 55             	cmp    $0x55,%eax
  102e43:	0f 87 02 03 00 00    	ja     10314b <vprintfmt+0x371>
  102e49:	8b 04 85 34 3a 10 00 	mov    0x103a34(,%eax,4),%eax
  102e50:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102e52:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102e56:	eb d6                	jmp    102e2e <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102e58:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102e5c:	eb d0                	jmp    102e2e <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102e5e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102e65:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e68:	89 d0                	mov    %edx,%eax
  102e6a:	c1 e0 02             	shl    $0x2,%eax
  102e6d:	01 d0                	add    %edx,%eax
  102e6f:	01 c0                	add    %eax,%eax
  102e71:	01 d8                	add    %ebx,%eax
  102e73:	83 e8 30             	sub    $0x30,%eax
  102e76:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102e79:	8b 45 10             	mov    0x10(%ebp),%eax
  102e7c:	0f b6 00             	movzbl (%eax),%eax
  102e7f:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102e82:	83 fb 2f             	cmp    $0x2f,%ebx
  102e85:	7e 0b                	jle    102e92 <vprintfmt+0xb8>
  102e87:	83 fb 39             	cmp    $0x39,%ebx
  102e8a:	7f 06                	jg     102e92 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102e8c:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102e90:	eb d3                	jmp    102e65 <vprintfmt+0x8b>
            goto process_precision;
  102e92:	eb 2e                	jmp    102ec2 <vprintfmt+0xe8>

        case '*':
            precision = va_arg(ap, int);
  102e94:	8b 45 14             	mov    0x14(%ebp),%eax
  102e97:	8d 50 04             	lea    0x4(%eax),%edx
  102e9a:	89 55 14             	mov    %edx,0x14(%ebp)
  102e9d:	8b 00                	mov    (%eax),%eax
  102e9f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102ea2:	eb 1e                	jmp    102ec2 <vprintfmt+0xe8>

        case '.':
            if (width < 0)
  102ea4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ea8:	79 07                	jns    102eb1 <vprintfmt+0xd7>
                width = 0;
  102eaa:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102eb1:	e9 78 ff ff ff       	jmp    102e2e <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102eb6:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102ebd:	e9 6c ff ff ff       	jmp    102e2e <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102ec2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ec6:	79 0d                	jns    102ed5 <vprintfmt+0xfb>
                width = precision, precision = -1;
  102ec8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ecb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ece:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102ed5:	e9 54 ff ff ff       	jmp    102e2e <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102eda:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102ede:	e9 4b ff ff ff       	jmp    102e2e <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102ee3:	8b 45 14             	mov    0x14(%ebp),%eax
  102ee6:	8d 50 04             	lea    0x4(%eax),%edx
  102ee9:	89 55 14             	mov    %edx,0x14(%ebp)
  102eec:	8b 00                	mov    (%eax),%eax
  102eee:	83 ec 08             	sub    $0x8,%esp
  102ef1:	ff 75 0c             	pushl  0xc(%ebp)
  102ef4:	50                   	push   %eax
  102ef5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef8:	ff d0                	call   *%eax
  102efa:	83 c4 10             	add    $0x10,%esp
            break;
  102efd:	e9 71 02 00 00       	jmp    103173 <vprintfmt+0x399>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102f02:	8b 45 14             	mov    0x14(%ebp),%eax
  102f05:	8d 50 04             	lea    0x4(%eax),%edx
  102f08:	89 55 14             	mov    %edx,0x14(%ebp)
  102f0b:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102f0d:	85 db                	test   %ebx,%ebx
  102f0f:	79 02                	jns    102f13 <vprintfmt+0x139>
                err = -err;
  102f11:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102f13:	83 fb 06             	cmp    $0x6,%ebx
  102f16:	7f 0b                	jg     102f23 <vprintfmt+0x149>
  102f18:	8b 34 9d f4 39 10 00 	mov    0x1039f4(,%ebx,4),%esi
  102f1f:	85 f6                	test   %esi,%esi
  102f21:	75 19                	jne    102f3c <vprintfmt+0x162>
                printfmt(putch, putdat, "error %d", err);
  102f23:	53                   	push   %ebx
  102f24:	68 21 3a 10 00       	push   $0x103a21
  102f29:	ff 75 0c             	pushl  0xc(%ebp)
  102f2c:	ff 75 08             	pushl  0x8(%ebp)
  102f2f:	e8 83 fe ff ff       	call   102db7 <printfmt>
  102f34:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102f37:	e9 37 02 00 00       	jmp    103173 <vprintfmt+0x399>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102f3c:	56                   	push   %esi
  102f3d:	68 2a 3a 10 00       	push   $0x103a2a
  102f42:	ff 75 0c             	pushl  0xc(%ebp)
  102f45:	ff 75 08             	pushl  0x8(%ebp)
  102f48:	e8 6a fe ff ff       	call   102db7 <printfmt>
  102f4d:	83 c4 10             	add    $0x10,%esp
            }
            break;
  102f50:	e9 1e 02 00 00       	jmp    103173 <vprintfmt+0x399>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102f55:	8b 45 14             	mov    0x14(%ebp),%eax
  102f58:	8d 50 04             	lea    0x4(%eax),%edx
  102f5b:	89 55 14             	mov    %edx,0x14(%ebp)
  102f5e:	8b 30                	mov    (%eax),%esi
  102f60:	85 f6                	test   %esi,%esi
  102f62:	75 05                	jne    102f69 <vprintfmt+0x18f>
                p = "(null)";
  102f64:	be 2d 3a 10 00       	mov    $0x103a2d,%esi
            }
            if (width > 0 && padc != '-') {
  102f69:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f6d:	7e 3f                	jle    102fae <vprintfmt+0x1d4>
  102f6f:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102f73:	74 39                	je     102fae <vprintfmt+0x1d4>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102f75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102f78:	83 ec 08             	sub    $0x8,%esp
  102f7b:	50                   	push   %eax
  102f7c:	56                   	push   %esi
  102f7d:	e8 1b f8 ff ff       	call   10279d <strnlen>
  102f82:	83 c4 10             	add    $0x10,%esp
  102f85:	89 c2                	mov    %eax,%edx
  102f87:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f8a:	29 d0                	sub    %edx,%eax
  102f8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f8f:	eb 17                	jmp    102fa8 <vprintfmt+0x1ce>
                    putch(padc, putdat);
  102f91:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102f95:	83 ec 08             	sub    $0x8,%esp
  102f98:	ff 75 0c             	pushl  0xc(%ebp)
  102f9b:	50                   	push   %eax
  102f9c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f9f:	ff d0                	call   *%eax
  102fa1:	83 c4 10             	add    $0x10,%esp
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102fa4:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102fa8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fac:	7f e3                	jg     102f91 <vprintfmt+0x1b7>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102fae:	eb 35                	jmp    102fe5 <vprintfmt+0x20b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102fb0:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102fb4:	74 1c                	je     102fd2 <vprintfmt+0x1f8>
  102fb6:	83 fb 1f             	cmp    $0x1f,%ebx
  102fb9:	7e 05                	jle    102fc0 <vprintfmt+0x1e6>
  102fbb:	83 fb 7e             	cmp    $0x7e,%ebx
  102fbe:	7e 12                	jle    102fd2 <vprintfmt+0x1f8>
                    putch('?', putdat);
  102fc0:	83 ec 08             	sub    $0x8,%esp
  102fc3:	ff 75 0c             	pushl  0xc(%ebp)
  102fc6:	6a 3f                	push   $0x3f
  102fc8:	8b 45 08             	mov    0x8(%ebp),%eax
  102fcb:	ff d0                	call   *%eax
  102fcd:	83 c4 10             	add    $0x10,%esp
  102fd0:	eb 0f                	jmp    102fe1 <vprintfmt+0x207>
                }
                else {
                    putch(ch, putdat);
  102fd2:	83 ec 08             	sub    $0x8,%esp
  102fd5:	ff 75 0c             	pushl  0xc(%ebp)
  102fd8:	53                   	push   %ebx
  102fd9:	8b 45 08             	mov    0x8(%ebp),%eax
  102fdc:	ff d0                	call   *%eax
  102fde:	83 c4 10             	add    $0x10,%esp
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102fe1:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102fe5:	89 f0                	mov    %esi,%eax
  102fe7:	8d 70 01             	lea    0x1(%eax),%esi
  102fea:	0f b6 00             	movzbl (%eax),%eax
  102fed:	0f be d8             	movsbl %al,%ebx
  102ff0:	85 db                	test   %ebx,%ebx
  102ff2:	74 10                	je     103004 <vprintfmt+0x22a>
  102ff4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102ff8:	78 b6                	js     102fb0 <vprintfmt+0x1d6>
  102ffa:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102ffe:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103002:	79 ac                	jns    102fb0 <vprintfmt+0x1d6>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103004:	eb 14                	jmp    10301a <vprintfmt+0x240>
                putch(' ', putdat);
  103006:	83 ec 08             	sub    $0x8,%esp
  103009:	ff 75 0c             	pushl  0xc(%ebp)
  10300c:	6a 20                	push   $0x20
  10300e:	8b 45 08             	mov    0x8(%ebp),%eax
  103011:	ff d0                	call   *%eax
  103013:	83 c4 10             	add    $0x10,%esp
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103016:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  10301a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10301e:	7f e6                	jg     103006 <vprintfmt+0x22c>
                putch(' ', putdat);
            }
            break;
  103020:	e9 4e 01 00 00       	jmp    103173 <vprintfmt+0x399>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103025:	83 ec 08             	sub    $0x8,%esp
  103028:	ff 75 e0             	pushl  -0x20(%ebp)
  10302b:	8d 45 14             	lea    0x14(%ebp),%eax
  10302e:	50                   	push   %eax
  10302f:	e8 3c fd ff ff       	call   102d70 <getint>
  103034:	83 c4 10             	add    $0x10,%esp
  103037:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10303a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  10303d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103040:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103043:	85 d2                	test   %edx,%edx
  103045:	79 23                	jns    10306a <vprintfmt+0x290>
                putch('-', putdat);
  103047:	83 ec 08             	sub    $0x8,%esp
  10304a:	ff 75 0c             	pushl  0xc(%ebp)
  10304d:	6a 2d                	push   $0x2d
  10304f:	8b 45 08             	mov    0x8(%ebp),%eax
  103052:	ff d0                	call   *%eax
  103054:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  103057:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10305a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10305d:	f7 d8                	neg    %eax
  10305f:	83 d2 00             	adc    $0x0,%edx
  103062:	f7 da                	neg    %edx
  103064:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103067:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  10306a:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103071:	e9 9f 00 00 00       	jmp    103115 <vprintfmt+0x33b>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103076:	83 ec 08             	sub    $0x8,%esp
  103079:	ff 75 e0             	pushl  -0x20(%ebp)
  10307c:	8d 45 14             	lea    0x14(%ebp),%eax
  10307f:	50                   	push   %eax
  103080:	e8 9c fc ff ff       	call   102d21 <getuint>
  103085:	83 c4 10             	add    $0x10,%esp
  103088:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10308b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  10308e:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103095:	eb 7e                	jmp    103115 <vprintfmt+0x33b>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103097:	83 ec 08             	sub    $0x8,%esp
  10309a:	ff 75 e0             	pushl  -0x20(%ebp)
  10309d:	8d 45 14             	lea    0x14(%ebp),%eax
  1030a0:	50                   	push   %eax
  1030a1:	e8 7b fc ff ff       	call   102d21 <getuint>
  1030a6:	83 c4 10             	add    $0x10,%esp
  1030a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030ac:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1030af:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1030b6:	eb 5d                	jmp    103115 <vprintfmt+0x33b>

        // pointer
        case 'p':
            putch('0', putdat);
  1030b8:	83 ec 08             	sub    $0x8,%esp
  1030bb:	ff 75 0c             	pushl  0xc(%ebp)
  1030be:	6a 30                	push   $0x30
  1030c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c3:	ff d0                	call   *%eax
  1030c5:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1030c8:	83 ec 08             	sub    $0x8,%esp
  1030cb:	ff 75 0c             	pushl  0xc(%ebp)
  1030ce:	6a 78                	push   $0x78
  1030d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d3:	ff d0                	call   *%eax
  1030d5:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1030d8:	8b 45 14             	mov    0x14(%ebp),%eax
  1030db:	8d 50 04             	lea    0x4(%eax),%edx
  1030de:	89 55 14             	mov    %edx,0x14(%ebp)
  1030e1:	8b 00                	mov    (%eax),%eax
  1030e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  1030ed:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  1030f4:	eb 1f                	jmp    103115 <vprintfmt+0x33b>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  1030f6:	83 ec 08             	sub    $0x8,%esp
  1030f9:	ff 75 e0             	pushl  -0x20(%ebp)
  1030fc:	8d 45 14             	lea    0x14(%ebp),%eax
  1030ff:	50                   	push   %eax
  103100:	e8 1c fc ff ff       	call   102d21 <getuint>
  103105:	83 c4 10             	add    $0x10,%esp
  103108:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10310b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10310e:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103115:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103119:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10311c:	83 ec 04             	sub    $0x4,%esp
  10311f:	52                   	push   %edx
  103120:	ff 75 e8             	pushl  -0x18(%ebp)
  103123:	50                   	push   %eax
  103124:	ff 75 f4             	pushl  -0xc(%ebp)
  103127:	ff 75 f0             	pushl  -0x10(%ebp)
  10312a:	ff 75 0c             	pushl  0xc(%ebp)
  10312d:	ff 75 08             	pushl  0x8(%ebp)
  103130:	e8 fc fa ff ff       	call   102c31 <printnum>
  103135:	83 c4 20             	add    $0x20,%esp
            break;
  103138:	eb 39                	jmp    103173 <vprintfmt+0x399>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  10313a:	83 ec 08             	sub    $0x8,%esp
  10313d:	ff 75 0c             	pushl  0xc(%ebp)
  103140:	53                   	push   %ebx
  103141:	8b 45 08             	mov    0x8(%ebp),%eax
  103144:	ff d0                	call   *%eax
  103146:	83 c4 10             	add    $0x10,%esp
            break;
  103149:	eb 28                	jmp    103173 <vprintfmt+0x399>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10314b:	83 ec 08             	sub    $0x8,%esp
  10314e:	ff 75 0c             	pushl  0xc(%ebp)
  103151:	6a 25                	push   $0x25
  103153:	8b 45 08             	mov    0x8(%ebp),%eax
  103156:	ff d0                	call   *%eax
  103158:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  10315b:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10315f:	eb 04                	jmp    103165 <vprintfmt+0x38b>
  103161:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103165:	8b 45 10             	mov    0x10(%ebp),%eax
  103168:	83 e8 01             	sub    $0x1,%eax
  10316b:	0f b6 00             	movzbl (%eax),%eax
  10316e:	3c 25                	cmp    $0x25,%al
  103170:	75 ef                	jne    103161 <vprintfmt+0x387>
                /* do nothing */;
            break;
  103172:	90                   	nop
        }
    }
  103173:	e9 6a fc ff ff       	jmp    102de2 <vprintfmt+0x8>
}
  103178:	8d 65 f8             	lea    -0x8(%ebp),%esp
  10317b:	5b                   	pop    %ebx
  10317c:	5e                   	pop    %esi
  10317d:	5d                   	pop    %ebp
  10317e:	c3                   	ret    

0010317f <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10317f:	55                   	push   %ebp
  103180:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103182:	8b 45 0c             	mov    0xc(%ebp),%eax
  103185:	8b 40 08             	mov    0x8(%eax),%eax
  103188:	8d 50 01             	lea    0x1(%eax),%edx
  10318b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10318e:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103191:	8b 45 0c             	mov    0xc(%ebp),%eax
  103194:	8b 10                	mov    (%eax),%edx
  103196:	8b 45 0c             	mov    0xc(%ebp),%eax
  103199:	8b 40 04             	mov    0x4(%eax),%eax
  10319c:	39 c2                	cmp    %eax,%edx
  10319e:	73 12                	jae    1031b2 <sprintputch+0x33>
        *b->buf ++ = ch;
  1031a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031a3:	8b 00                	mov    (%eax),%eax
  1031a5:	8d 48 01             	lea    0x1(%eax),%ecx
  1031a8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1031ab:	89 0a                	mov    %ecx,(%edx)
  1031ad:	8b 55 08             	mov    0x8(%ebp),%edx
  1031b0:	88 10                	mov    %dl,(%eax)
    }
}
  1031b2:	5d                   	pop    %ebp
  1031b3:	c3                   	ret    

001031b4 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1031b4:	55                   	push   %ebp
  1031b5:	89 e5                	mov    %esp,%ebp
  1031b7:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1031ba:	8d 45 14             	lea    0x14(%ebp),%eax
  1031bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1031c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031c3:	50                   	push   %eax
  1031c4:	ff 75 10             	pushl  0x10(%ebp)
  1031c7:	ff 75 0c             	pushl  0xc(%ebp)
  1031ca:	ff 75 08             	pushl  0x8(%ebp)
  1031cd:	e8 0b 00 00 00       	call   1031dd <vsnprintf>
  1031d2:	83 c4 10             	add    $0x10,%esp
  1031d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1031d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1031db:	c9                   	leave  
  1031dc:	c3                   	ret    

001031dd <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1031dd:	55                   	push   %ebp
  1031de:	89 e5                	mov    %esp,%ebp
  1031e0:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1031e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1031e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031ec:	8d 50 ff             	lea    -0x1(%eax),%edx
  1031ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f2:	01 d0                	add    %edx,%eax
  1031f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1031fe:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103202:	74 0a                	je     10320e <vsnprintf+0x31>
  103204:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103207:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10320a:	39 c2                	cmp    %eax,%edx
  10320c:	76 07                	jbe    103215 <vsnprintf+0x38>
        return -E_INVAL;
  10320e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103213:	eb 20                	jmp    103235 <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103215:	ff 75 14             	pushl  0x14(%ebp)
  103218:	ff 75 10             	pushl  0x10(%ebp)
  10321b:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10321e:	50                   	push   %eax
  10321f:	68 7f 31 10 00       	push   $0x10317f
  103224:	e8 b1 fb ff ff       	call   102dda <vprintfmt>
  103229:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  10322c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10322f:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103232:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103235:	c9                   	leave  
  103236:	c3                   	ret    
