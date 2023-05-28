
_testthreads:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  exit();
}

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	51                   	push   %ecx
  12:	83 ec 20             	sub    $0x20,%esp
  lock_init(lk);
  15:	ff 35 60 0f 00 00    	pushl  0xf60
  1b:	e8 50 05 00 00       	call   570 <lock_init>
  int arg1 = 152, arg2 = 1;
  thread_t t;
  // thread_t t1;
  // thread_t t2;
  int retval;
  printf(1, "below should be sequential print statements:\n");
  20:	58                   	pop    %eax
  21:	5a                   	pop    %edx
  22:	68 80 0b 00 00       	push   $0xb80
  27:	6a 01                	push   $0x1
  int arg1 = 152, arg2 = 1;
  29:	c7 45 e8 98 00 00 00 	movl   $0x98,-0x18(%ebp)
  30:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  printf(1, "below should be sequential print statements:\n");
  37:	e8 04 07 00 00       	call   740 <printf>
  thread_create(&t,f1, (void *)&arg1, (void *)&arg2);
  3c:	8d 45 ec             	lea    -0x14(%ebp),%eax
  3f:	50                   	push   %eax
  40:	8d 45 e8             	lea    -0x18(%ebp),%eax
  43:	50                   	push   %eax
  44:	8d 45 f0             	lea    -0x10(%ebp),%eax
  47:	68 90 00 00 00       	push   $0x90
  4c:	50                   	push   %eax
  4d:	e8 ae 04 00 00       	call   500 <thread_create>
  // int b=thread_create(&t1,f2, (void *)&arg1, (void *)&arg2);
  // int c=thread_create(&t2,f3, (void *)&arg1, (void *)&arg2);
  // printf(1,"%d %d %d ????\n" ,a,b,c);
  printf(1,"pid %d \n",t);
  52:	83 c4 1c             	add    $0x1c,%esp
  55:	ff 75 f0             	pushl  -0x10(%ebp)
  58:	68 6a 0b 00 00       	push   $0xb6a
  5d:	6a 01                	push   $0x1
  5f:	e8 dc 06 00 00       	call   740 <printf>
  // printf(1,"pid %d \n",t1);
  // printf(1,"pid %d \n",t2);
  thread_join(t,(void**) &retval);
  64:	59                   	pop    %ecx
  65:	58                   	pop    %eax
  66:	8d 45 f4             	lea    -0xc(%ebp),%eax
  69:	50                   	push   %eax
  6a:	ff 75 f0             	pushl  -0x10(%ebp)
  6d:	e8 ce 04 00 00       	call   540 <thread_join>
  printf(1,"retval : %d\n", retval);
  72:	83 c4 0c             	add    $0xc,%esp
  75:	ff 75 f4             	pushl  -0xc(%ebp)
  78:	68 73 0b 00 00       	push   $0xb73
  7d:	6a 01                	push   $0x1
  7f:	e8 bc 06 00 00       	call   740 <printf>
  // thread_create(&f3, (void *)&arg1, (void *)&arg2);
  // thread_join();
  // thread_join();
  // thread_join();
  
  exit();
  84:	e8 40 05 00 00       	call   5c9 <exit>
  89:	66 90                	xchg   %ax,%ax
  8b:	66 90                	xchg   %ax,%ax
  8d:	66 90                	xchg   %ax,%ax
  8f:	90                   	nop

00000090 <f1>:
void *f1(void* arg1, void* arg2) {
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	53                   	push   %ebx
  98:	83 ec 04             	sub    $0x4,%esp
  9b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (num) lock_acquire(lk);
  9e:	8b 03                	mov    (%ebx),%eax
  a0:	85 c0                	test   %eax,%eax
  a2:	75 4d                	jne    f1 <f1+0x61>
  printf(1, "1. this should print %s\n", num ? "first" : "whenever");
  a4:	50                   	push   %eax
  a5:	68 f4 0a 00 00       	push   $0xaf4
  aa:	68 ae 0a 00 00       	push   $0xaae
  af:	6a 01                	push   $0x1
  b1:	e8 8a 06 00 00       	call   740 <printf>
  printf(1, "1. sleep for %d ticks\n", SLEEP_TIME);
  b6:	83 c4 0c             	add    $0xc,%esp
  b9:	6a 64                	push   $0x64
  bb:	68 c7 0a 00 00       	push   $0xac7
  c0:	6a 01                	push   $0x1
  c2:	e8 79 06 00 00       	call   740 <printf>
  sleep(SLEEP_TIME);
  c7:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  ce:	e8 86 05 00 00       	call   659 <sleep>
  printf(1,"this is threads exit\n");
  d3:	5a                   	pop    %edx
  d4:	59                   	pop    %ecx
  d5:	68 de 0a 00 00       	push   $0xade
  da:	6a 01                	push   $0x1
  dc:	e8 5f 06 00 00       	call   740 <printf>
  thread_exit(arg1);
  e1:	89 1c 24             	mov    %ebx,(%esp)
  e4:	e8 90 05 00 00       	call   679 <thread_exit>
  e9:	83 c4 10             	add    $0x10,%esp
  exit();
  ec:	e8 d8 04 00 00       	call   5c9 <exit>
  if (num) lock_acquire(lk);
  f1:	83 ec 0c             	sub    $0xc,%esp
  f4:	ff 35 60 0f 00 00    	pushl  0xf60
  fa:	e8 91 04 00 00       	call   590 <lock_acquire>
  printf(1, "1. this should print %s\n", num ? "first" : "whenever");
  ff:	83 c4 0c             	add    $0xc,%esp
 102:	68 a8 0a 00 00       	push   $0xaa8
 107:	68 ae 0a 00 00       	push   $0xaae
 10c:	6a 01                	push   $0x1
 10e:	e8 2d 06 00 00       	call   740 <printf>
  printf(1, "1. sleep for %d ticks\n", SLEEP_TIME);
 113:	83 c4 0c             	add    $0xc,%esp
 116:	6a 64                	push   $0x64
 118:	68 c7 0a 00 00       	push   $0xac7
 11d:	6a 01                	push   $0x1
 11f:	e8 1c 06 00 00       	call   740 <printf>
  sleep(SLEEP_TIME);
 124:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 12b:	e8 29 05 00 00       	call   659 <sleep>
  printf(1,"this is threads exit\n");
 130:	58                   	pop    %eax
 131:	5a                   	pop    %edx
 132:	68 de 0a 00 00       	push   $0xade
 137:	6a 01                	push   $0x1
 139:	e8 02 06 00 00       	call   740 <printf>
  thread_exit(arg1);
 13e:	89 1c 24             	mov    %ebx,(%esp)
 141:	e8 33 05 00 00       	call   679 <thread_exit>
  if (num) lock_release(lk);
 146:	59                   	pop    %ecx
 147:	ff 35 60 0f 00 00    	pushl  0xf60
 14d:	e8 5e 04 00 00       	call   5b0 <lock_release>
 152:	83 c4 10             	add    $0x10,%esp
 155:	eb 95                	jmp    ec <f1+0x5c>
 157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15e:	66 90                	xchg   %ax,%ax

00000160 <f2>:
void *f2(void* arg1, void* arg2) {
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	83 ec 08             	sub    $0x8,%esp
  if (num) lock_acquire(lk);
 16a:	8b 45 08             	mov    0x8(%ebp),%eax
 16d:	8b 08                	mov    (%eax),%ecx
 16f:	85 c9                	test   %ecx,%ecx
 171:	75 37                	jne    1aa <f2+0x4a>
  printf(1, "2. this should print %s\n", num ? "second" : "whenever");
 173:	50                   	push   %eax
 174:	68 f4 0a 00 00       	push   $0xaf4
 179:	68 04 0b 00 00       	push   $0xb04
 17e:	6a 01                	push   $0x1
 180:	e8 bb 05 00 00       	call   740 <printf>
  printf(1, "2. sleep for %d ticks\n", SLEEP_TIME);
 185:	83 c4 0c             	add    $0xc,%esp
 188:	6a 64                	push   $0x64
 18a:	68 1d 0b 00 00       	push   $0xb1d
 18f:	6a 01                	push   $0x1
 191:	e8 aa 05 00 00       	call   740 <printf>
  sleep(SLEEP_TIME);
 196:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 19d:	e8 b7 04 00 00       	call   659 <sleep>
 1a2:	83 c4 10             	add    $0x10,%esp
  exit();
 1a5:	e8 1f 04 00 00       	call   5c9 <exit>
  if (num) lock_acquire(lk);
 1aa:	83 ec 0c             	sub    $0xc,%esp
 1ad:	ff 35 60 0f 00 00    	pushl  0xf60
 1b3:	e8 d8 03 00 00       	call   590 <lock_acquire>
  printf(1, "2. this should print %s\n", num ? "second" : "whenever");
 1b8:	83 c4 0c             	add    $0xc,%esp
 1bb:	68 fd 0a 00 00       	push   $0xafd
 1c0:	68 04 0b 00 00       	push   $0xb04
 1c5:	6a 01                	push   $0x1
 1c7:	e8 74 05 00 00       	call   740 <printf>
  printf(1, "2. sleep for %d ticks\n", SLEEP_TIME);
 1cc:	83 c4 0c             	add    $0xc,%esp
 1cf:	6a 64                	push   $0x64
 1d1:	68 1d 0b 00 00       	push   $0xb1d
 1d6:	6a 01                	push   $0x1
 1d8:	e8 63 05 00 00       	call   740 <printf>
  sleep(SLEEP_TIME);
 1dd:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1e4:	e8 70 04 00 00       	call   659 <sleep>
  if (num) lock_release(lk);
 1e9:	5a                   	pop    %edx
 1ea:	ff 35 60 0f 00 00    	pushl  0xf60
 1f0:	e8 bb 03 00 00       	call   5b0 <lock_release>
 1f5:	83 c4 10             	add    $0x10,%esp
 1f8:	eb ab                	jmp    1a5 <f2+0x45>
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <f3>:
void *f3(void* arg1, void* arg2) {
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	83 ec 08             	sub    $0x8,%esp
  if (num) lock_acquire(lk);
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	8b 08                	mov    (%eax),%ecx
 20f:	85 c9                	test   %ecx,%ecx
 211:	75 37                	jne    24a <f3+0x4a>
  printf(1, "3. this should print %s\n", num ? "third" : "whenever");
 213:	50                   	push   %eax
 214:	68 f4 0a 00 00       	push   $0xaf4
 219:	68 3a 0b 00 00       	push   $0xb3a
 21e:	6a 01                	push   $0x1
 220:	e8 1b 05 00 00       	call   740 <printf>
  printf(1, "3. sleep for %d ticks\n", SLEEP_TIME);
 225:	83 c4 0c             	add    $0xc,%esp
 228:	6a 64                	push   $0x64
 22a:	68 53 0b 00 00       	push   $0xb53
 22f:	6a 01                	push   $0x1
 231:	e8 0a 05 00 00       	call   740 <printf>
  sleep(SLEEP_TIME);
 236:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 23d:	e8 17 04 00 00       	call   659 <sleep>
 242:	83 c4 10             	add    $0x10,%esp
  exit();
 245:	e8 7f 03 00 00       	call   5c9 <exit>
  if (num) lock_acquire(lk);
 24a:	83 ec 0c             	sub    $0xc,%esp
 24d:	ff 35 60 0f 00 00    	pushl  0xf60
 253:	e8 38 03 00 00       	call   590 <lock_acquire>
  printf(1, "3. this should print %s\n", num ? "third" : "whenever");
 258:	83 c4 0c             	add    $0xc,%esp
 25b:	68 34 0b 00 00       	push   $0xb34
 260:	68 3a 0b 00 00       	push   $0xb3a
 265:	6a 01                	push   $0x1
 267:	e8 d4 04 00 00       	call   740 <printf>
  printf(1, "3. sleep for %d ticks\n", SLEEP_TIME);
 26c:	83 c4 0c             	add    $0xc,%esp
 26f:	6a 64                	push   $0x64
 271:	68 53 0b 00 00       	push   $0xb53
 276:	6a 01                	push   $0x1
 278:	e8 c3 04 00 00       	call   740 <printf>
  sleep(SLEEP_TIME);
 27d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 284:	e8 d0 03 00 00       	call   659 <sleep>
  if (num) lock_release(lk);
 289:	5a                   	pop    %edx
 28a:	ff 35 60 0f 00 00    	pushl  0xf60
 290:	e8 1b 03 00 00       	call   5b0 <lock_release>
 295:	83 c4 10             	add    $0x10,%esp
 298:	eb ab                	jmp    245 <f3+0x45>
 29a:	66 90                	xchg   %ax,%ax
 29c:	66 90                	xchg   %ax,%ax
 29e:	66 90                	xchg   %ax,%ax

000002a0 <strcpy>:
#include "mmu.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2a5:	31 c0                	xor    %eax,%eax
{
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	53                   	push   %ebx
 2aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 2b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2b7:	83 c0 01             	add    $0x1,%eax
 2ba:	84 d2                	test   %dl,%dl
 2bc:	75 f2                	jne    2b0 <strcpy+0x10>
    ;
  return os;
}
 2be:	89 c8                	mov    %ecx,%eax
 2c0:	5b                   	pop    %ebx
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	53                   	push   %ebx
 2d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2de:	0f b6 01             	movzbl (%ecx),%eax
 2e1:	0f b6 1a             	movzbl (%edx),%ebx
 2e4:	84 c0                	test   %al,%al
 2e6:	75 19                	jne    301 <strcmp+0x31>
 2e8:	eb 26                	jmp    310 <strcmp+0x40>
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 2f4:	83 c1 01             	add    $0x1,%ecx
 2f7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2fa:	0f b6 1a             	movzbl (%edx),%ebx
 2fd:	84 c0                	test   %al,%al
 2ff:	74 0f                	je     310 <strcmp+0x40>
 301:	38 d8                	cmp    %bl,%al
 303:	74 eb                	je     2f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 305:	29 d8                	sub    %ebx,%eax
}
 307:	5b                   	pop    %ebx
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 310:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 312:	29 d8                	sub    %ebx,%eax
}
 314:	5b                   	pop    %ebx
 315:	5d                   	pop    %ebp
 316:	c3                   	ret    
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax

00000320 <strlen>:

uint
strlen(const char *s)
{
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 32a:	80 3a 00             	cmpb   $0x0,(%edx)
 32d:	74 21                	je     350 <strlen+0x30>
 32f:	31 c0                	xor    %eax,%eax
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 338:	83 c0 01             	add    $0x1,%eax
 33b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 33f:	89 c1                	mov    %eax,%ecx
 341:	75 f5                	jne    338 <strlen+0x18>
    ;
  return n;
}
 343:	89 c8                	mov    %ecx,%eax
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    
 347:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 350:	31 c9                	xor    %ecx,%ecx
}
 352:	5d                   	pop    %ebp
 353:	89 c8                	mov    %ecx,%eax
 355:	c3                   	ret    
 356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <memset>:

void*
memset(void *dst, int c, uint n)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 36b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 36e:	8b 45 0c             	mov    0xc(%ebp),%eax
 371:	89 d7                	mov    %edx,%edi
 373:	fc                   	cld    
 374:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 376:	89 d0                	mov    %edx,%eax
 378:	5f                   	pop    %edi
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    
 37b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <strchr>:

char*
strchr(const char *s, char c)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	8b 45 08             	mov    0x8(%ebp),%eax
 38a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 38e:	0f b6 10             	movzbl (%eax),%edx
 391:	84 d2                	test   %dl,%dl
 393:	75 16                	jne    3ab <strchr+0x2b>
 395:	eb 21                	jmp    3b8 <strchr+0x38>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax
 3a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3a4:	83 c0 01             	add    $0x1,%eax
 3a7:	84 d2                	test   %dl,%dl
 3a9:	74 0d                	je     3b8 <strchr+0x38>
    if(*s == c)
 3ab:	38 d1                	cmp    %dl,%cl
 3ad:	75 f1                	jne    3a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 3af:	5d                   	pop    %ebp
 3b0:	c3                   	ret    
 3b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3b8:	31 c0                	xor    %eax,%eax
}
 3ba:	5d                   	pop    %ebp
 3bb:	c3                   	ret    
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <gets>:

char*
gets(char *buf, int max)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3c9:	31 f6                	xor    %esi,%esi
{
 3cb:	53                   	push   %ebx
 3cc:	89 f3                	mov    %esi,%ebx
 3ce:	83 ec 1c             	sub    $0x1c,%esp
 3d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 3d4:	eb 33                	jmp    409 <gets+0x49>
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3e6:	6a 01                	push   $0x1
 3e8:	50                   	push   %eax
 3e9:	6a 00                	push   $0x0
 3eb:	e8 f1 01 00 00       	call   5e1 <read>
    if(cc < 1)
 3f0:	83 c4 10             	add    $0x10,%esp
 3f3:	85 c0                	test   %eax,%eax
 3f5:	7e 1c                	jle    413 <gets+0x53>
      break;
    buf[i++] = c;
 3f7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3fb:	83 c7 01             	add    $0x1,%edi
 3fe:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 401:	3c 0a                	cmp    $0xa,%al
 403:	74 23                	je     428 <gets+0x68>
 405:	3c 0d                	cmp    $0xd,%al
 407:	74 1f                	je     428 <gets+0x68>
  for(i=0; i+1 < max; ){
 409:	83 c3 01             	add    $0x1,%ebx
 40c:	89 fe                	mov    %edi,%esi
 40e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 411:	7c cd                	jl     3e0 <gets+0x20>
 413:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 415:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 418:	c6 03 00             	movb   $0x0,(%ebx)
}
 41b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41e:	5b                   	pop    %ebx
 41f:	5e                   	pop    %esi
 420:	5f                   	pop    %edi
 421:	5d                   	pop    %ebp
 422:	c3                   	ret    
 423:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 427:	90                   	nop
 428:	8b 75 08             	mov    0x8(%ebp),%esi
 42b:	8b 45 08             	mov    0x8(%ebp),%eax
 42e:	01 de                	add    %ebx,%esi
 430:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 432:	c6 03 00             	movb   $0x0,(%ebx)
}
 435:	8d 65 f4             	lea    -0xc(%ebp),%esp
 438:	5b                   	pop    %ebx
 439:	5e                   	pop    %esi
 43a:	5f                   	pop    %edi
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    
 43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <stat>:

int
stat(const char *n, struct stat *st)
{
 440:	f3 0f 1e fb          	endbr32 
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	56                   	push   %esi
 448:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 449:	83 ec 08             	sub    $0x8,%esp
 44c:	6a 00                	push   $0x0
 44e:	ff 75 08             	pushl  0x8(%ebp)
 451:	e8 b3 01 00 00       	call   609 <open>
  if(fd < 0)
 456:	83 c4 10             	add    $0x10,%esp
 459:	85 c0                	test   %eax,%eax
 45b:	78 2b                	js     488 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 45d:	83 ec 08             	sub    $0x8,%esp
 460:	ff 75 0c             	pushl  0xc(%ebp)
 463:	89 c3                	mov    %eax,%ebx
 465:	50                   	push   %eax
 466:	e8 b6 01 00 00       	call   621 <fstat>
  close(fd);
 46b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 46e:	89 c6                	mov    %eax,%esi
  close(fd);
 470:	e8 7c 01 00 00       	call   5f1 <close>
  return r;
 475:	83 c4 10             	add    $0x10,%esp
}
 478:	8d 65 f8             	lea    -0x8(%ebp),%esp
 47b:	89 f0                	mov    %esi,%eax
 47d:	5b                   	pop    %ebx
 47e:	5e                   	pop    %esi
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 488:	be ff ff ff ff       	mov    $0xffffffff,%esi
 48d:	eb e9                	jmp    478 <stat+0x38>
 48f:	90                   	nop

00000490 <atoi>:

int
atoi(const char *s)
{
 490:	f3 0f 1e fb          	endbr32 
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	53                   	push   %ebx
 498:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 49b:	0f be 02             	movsbl (%edx),%eax
 49e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4a1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4a4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 4a9:	77 1a                	ja     4c5 <atoi+0x35>
 4ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
    n = n*10 + *s++ - '0';
 4b0:	83 c2 01             	add    $0x1,%edx
 4b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 4ba:	0f be 02             	movsbl (%edx),%eax
 4bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4c0:	80 fb 09             	cmp    $0x9,%bl
 4c3:	76 eb                	jbe    4b0 <atoi+0x20>
  return n;
}
 4c5:	89 c8                	mov    %ecx,%eax
 4c7:	5b                   	pop    %ebx
 4c8:	5d                   	pop    %ebp
 4c9:	c3                   	ret    
 4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	57                   	push   %edi
 4d8:	8b 45 10             	mov    0x10(%ebp),%eax
 4db:	8b 55 08             	mov    0x8(%ebp),%edx
 4de:	56                   	push   %esi
 4df:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4e2:	85 c0                	test   %eax,%eax
 4e4:	7e 0f                	jle    4f5 <memmove+0x25>
 4e6:	01 d0                	add    %edx,%eax
  dst = vdst;
 4e8:	89 d7                	mov    %edx,%edi
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4f1:	39 f8                	cmp    %edi,%eax
 4f3:	75 fb                	jne    4f0 <memmove+0x20>
  return vdst;
}
 4f5:	5e                   	pop    %esi
 4f6:	89 d0                	mov    %edx,%eax
 4f8:	5f                   	pop    %edi
 4f9:	5d                   	pop    %ebp
 4fa:	c3                   	ret    
 4fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <thread_create>:

int 
thread_create(thread_t* pid,void* (*start_routine)(void *, void *),void* arg1, void* arg2){
 500:	f3 0f 1e fb          	endbr32 
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
 50a:	68 00 10 00 00       	push   $0x1000
 50f:	e8 8c 04 00 00       	call   9a0 <malloc>
  *pid= clone(start_routine , arg1 , arg2 , stack);
 514:	50                   	push   %eax
 515:	ff 75 14             	pushl  0x14(%ebp)
 518:	ff 75 10             	pushl  0x10(%ebp)
 51b:	ff 75 0c             	pushl  0xc(%ebp)
 51e:	e8 46 01 00 00       	call   669 <clone>
 523:	8b 55 08             	mov    0x8(%ebp),%edx
  if(*pid){
 526:	83 c4 20             	add    $0x20,%esp
 529:	85 c0                	test   %eax,%eax
  *pid= clone(start_routine , arg1 , arg2 , stack);
 52b:	89 02                	mov    %eax,(%edx)
  if(*pid){
 52d:	0f 94 c0             	sete   %al
    return 0; 
  }
  return -1;
}
 530:	c9                   	leave  
  if(*pid){
 531:	0f b6 c0             	movzbl %al,%eax
 534:	f7 d8                	neg    %eax
}
 536:	c3                   	ret    
 537:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53e:	66 90                	xchg   %ax,%ax

00000540 <thread_join>:
int 
thread_join(thread_t tid,void** retval){
 540:	f3 0f 1e fb          	endbr32 
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	83 ec 10             	sub    $0x10,%esp
  // thread_join(thread_t pid , void **retval){
  // void* stackPtr;
  int x=join(tid,retval);
 54a:	ff 75 0c             	pushl  0xc(%ebp)
 54d:	ff 75 08             	pushl  0x8(%ebp)
 550:	e8 1c 01 00 00       	call   671 <join>
  if(x){
 555:	83 c4 10             	add    $0x10,%esp
    return 0;
  }
  return -1;
}
 558:	c9                   	leave  
  if(x){
 559:	85 c0                	test   %eax,%eax
 55b:	0f 94 c0             	sete   %al
 55e:	0f b6 c0             	movzbl %al,%eax
 561:	f7 d8                	neg    %eax
}
 563:	c3                   	ret    
 564:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop

00000570 <lock_init>:
// int
// thread_exit()

int 
lock_init(lock_t *lk){
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
  lk->flag=0;
 577:	8b 45 08             	mov    0x8(%ebp),%eax
 57a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 580:	31 c0                	xor    %eax,%eax
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    
 584:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop

00000590 <lock_acquire>:
void 
lock_acquire(lock_t *lk){
 590:	f3 0f 1e fb          	endbr32 
 594:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 595:	b9 01 00 00 00       	mov    $0x1,%ecx
 59a:	89 e5                	mov    %esp,%ebp
 59c:	8b 55 08             	mov    0x8(%ebp),%edx
 59f:	90                   	nop
 5a0:	89 c8                	mov    %ecx,%eax
 5a2:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lk->flag,1)!=0);
 5a5:	85 c0                	test   %eax,%eax
 5a7:	75 f7                	jne    5a0 <lock_acquire+0x10>
}
 5a9:	5d                   	pop    %ebp
 5aa:	c3                   	ret    
 5ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <lock_release>:
void 
lock_release(lock_t *lk){
 5b0:	f3 0f 1e fb          	endbr32 
 5b4:	55                   	push   %ebp
 5b5:	31 c0                	xor    %eax,%eax
 5b7:	89 e5                	mov    %esp,%ebp
 5b9:	8b 55 08             	mov    0x8(%ebp),%edx
 5bc:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->flag,0);
}
 5bf:	5d                   	pop    %ebp
 5c0:	c3                   	ret    

000005c1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5c1:	b8 01 00 00 00       	mov    $0x1,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <exit>:
SYSCALL(exit)
 5c9:	b8 02 00 00 00       	mov    $0x2,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <wait>:
SYSCALL(wait)
 5d1:	b8 03 00 00 00       	mov    $0x3,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <pipe>:
SYSCALL(pipe)
 5d9:	b8 04 00 00 00       	mov    $0x4,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <read>:
SYSCALL(read)
 5e1:	b8 05 00 00 00       	mov    $0x5,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <write>:
SYSCALL(write)
 5e9:	b8 10 00 00 00       	mov    $0x10,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <close>:
SYSCALL(close)
 5f1:	b8 15 00 00 00       	mov    $0x15,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <kill>:
SYSCALL(kill)
 5f9:	b8 06 00 00 00       	mov    $0x6,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <exec>:
SYSCALL(exec)
 601:	b8 07 00 00 00       	mov    $0x7,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <open>:
SYSCALL(open)
 609:	b8 0f 00 00 00       	mov    $0xf,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <mknod>:
SYSCALL(mknod)
 611:	b8 11 00 00 00       	mov    $0x11,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <unlink>:
SYSCALL(unlink)
 619:	b8 12 00 00 00       	mov    $0x12,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <fstat>:
SYSCALL(fstat)
 621:	b8 08 00 00 00       	mov    $0x8,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <link>:
SYSCALL(link)
 629:	b8 13 00 00 00       	mov    $0x13,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <mkdir>:
SYSCALL(mkdir)
 631:	b8 14 00 00 00       	mov    $0x14,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <chdir>:
SYSCALL(chdir)
 639:	b8 09 00 00 00       	mov    $0x9,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <dup>:
SYSCALL(dup)
 641:	b8 0a 00 00 00       	mov    $0xa,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <getpid>:
SYSCALL(getpid)
 649:	b8 0b 00 00 00       	mov    $0xb,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <sbrk>:
SYSCALL(sbrk)
 651:	b8 0c 00 00 00       	mov    $0xc,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <sleep>:
SYSCALL(sleep)
 659:	b8 0d 00 00 00       	mov    $0xd,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <uptime>:
SYSCALL(uptime)
 661:	b8 0e 00 00 00       	mov    $0xe,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <clone>:
SYSCALL(clone)
 669:	b8 16 00 00 00       	mov    $0x16,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <join>:
SYSCALL(join)
 671:	b8 17 00 00 00       	mov    $0x17,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <thread_exit>:
 679:	b8 18 00 00 00       	mov    $0x18,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    
 681:	66 90                	xchg   %ax,%ax
 683:	66 90                	xchg   %ax,%ax
 685:	66 90                	xchg   %ax,%ax
 687:	66 90                	xchg   %ax,%ax
 689:	66 90                	xchg   %ax,%ax
 68b:	66 90                	xchg   %ax,%ax
 68d:	66 90                	xchg   %ax,%ax
 68f:	90                   	nop

00000690 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 3c             	sub    $0x3c,%esp
 699:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 69c:	89 d1                	mov    %edx,%ecx
{
 69e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 6a1:	85 d2                	test   %edx,%edx
 6a3:	0f 89 7f 00 00 00    	jns    728 <printint+0x98>
 6a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 6ad:	74 79                	je     728 <printint+0x98>
    neg = 1;
 6af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 6b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 6b8:	31 db                	xor    %ebx,%ebx
 6ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 6c0:	89 c8                	mov    %ecx,%eax
 6c2:	31 d2                	xor    %edx,%edx
 6c4:	89 cf                	mov    %ecx,%edi
 6c6:	f7 75 c4             	divl   -0x3c(%ebp)
 6c9:	0f b6 92 b8 0b 00 00 	movzbl 0xbb8(%edx),%edx
 6d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 6d3:	89 d8                	mov    %ebx,%eax
 6d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 6d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 6db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 6de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6e1:	76 dd                	jbe    6c0 <printint+0x30>
  if(neg)
 6e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6e6:	85 c9                	test   %ecx,%ecx
 6e8:	74 0c                	je     6f6 <printint+0x66>
    buf[i++] = '-';
 6ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6fd:	eb 07                	jmp    706 <printint+0x76>
 6ff:	90                   	nop
 700:	0f b6 13             	movzbl (%ebx),%edx
 703:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 706:	83 ec 04             	sub    $0x4,%esp
 709:	88 55 d7             	mov    %dl,-0x29(%ebp)
 70c:	6a 01                	push   $0x1
 70e:	56                   	push   %esi
 70f:	57                   	push   %edi
 710:	e8 d4 fe ff ff       	call   5e9 <write>
  while(--i >= 0)
 715:	83 c4 10             	add    $0x10,%esp
 718:	39 de                	cmp    %ebx,%esi
 71a:	75 e4                	jne    700 <printint+0x70>
    putc(fd, buf[i]);
}
 71c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 71f:	5b                   	pop    %ebx
 720:	5e                   	pop    %esi
 721:	5f                   	pop    %edi
 722:	5d                   	pop    %ebp
 723:	c3                   	ret    
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 728:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 72f:	eb 87                	jmp    6b8 <printint+0x28>
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73f:	90                   	nop

00000740 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 740:	f3 0f 1e fb          	endbr32 
 744:	55                   	push   %ebp
 745:	89 e5                	mov    %esp,%ebp
 747:	57                   	push   %edi
 748:	56                   	push   %esi
 749:	53                   	push   %ebx
 74a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 74d:	8b 75 0c             	mov    0xc(%ebp),%esi
 750:	0f b6 1e             	movzbl (%esi),%ebx
 753:	84 db                	test   %bl,%bl
 755:	0f 84 b4 00 00 00    	je     80f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 75b:	8d 45 10             	lea    0x10(%ebp),%eax
 75e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 761:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 764:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 766:	89 45 d0             	mov    %eax,-0x30(%ebp)
 769:	eb 33                	jmp    79e <printf+0x5e>
 76b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
 770:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 773:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 778:	83 f8 25             	cmp    $0x25,%eax
 77b:	74 17                	je     794 <printf+0x54>
  write(fd, &c, 1);
 77d:	83 ec 04             	sub    $0x4,%esp
 780:	88 5d e7             	mov    %bl,-0x19(%ebp)
 783:	6a 01                	push   $0x1
 785:	57                   	push   %edi
 786:	ff 75 08             	pushl  0x8(%ebp)
 789:	e8 5b fe ff ff       	call   5e9 <write>
 78e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 791:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 794:	0f b6 1e             	movzbl (%esi),%ebx
 797:	83 c6 01             	add    $0x1,%esi
 79a:	84 db                	test   %bl,%bl
 79c:	74 71                	je     80f <printf+0xcf>
    c = fmt[i] & 0xff;
 79e:	0f be cb             	movsbl %bl,%ecx
 7a1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 7a4:	85 d2                	test   %edx,%edx
 7a6:	74 c8                	je     770 <printf+0x30>
      }
    } else if(state == '%'){
 7a8:	83 fa 25             	cmp    $0x25,%edx
 7ab:	75 e7                	jne    794 <printf+0x54>
      if(c == 'd'){
 7ad:	83 f8 64             	cmp    $0x64,%eax
 7b0:	0f 84 9a 00 00 00    	je     850 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7b6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 7bc:	83 f9 70             	cmp    $0x70,%ecx
 7bf:	74 5f                	je     820 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7c1:	83 f8 73             	cmp    $0x73,%eax
 7c4:	0f 84 d6 00 00 00    	je     8a0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7ca:	83 f8 63             	cmp    $0x63,%eax
 7cd:	0f 84 8d 00 00 00    	je     860 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7d3:	83 f8 25             	cmp    $0x25,%eax
 7d6:	0f 84 b4 00 00 00    	je     890 <printf+0x150>
  write(fd, &c, 1);
 7dc:	83 ec 04             	sub    $0x4,%esp
 7df:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7e3:	6a 01                	push   $0x1
 7e5:	57                   	push   %edi
 7e6:	ff 75 08             	pushl  0x8(%ebp)
 7e9:	e8 fb fd ff ff       	call   5e9 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 7ee:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7f1:	83 c4 0c             	add    $0xc,%esp
 7f4:	6a 01                	push   $0x1
 7f6:	83 c6 01             	add    $0x1,%esi
 7f9:	57                   	push   %edi
 7fa:	ff 75 08             	pushl  0x8(%ebp)
 7fd:	e8 e7 fd ff ff       	call   5e9 <write>
  for(i = 0; fmt[i]; i++){
 802:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 806:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 809:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 80b:	84 db                	test   %bl,%bl
 80d:	75 8f                	jne    79e <printf+0x5e>
    }
  }
}
 80f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 812:	5b                   	pop    %ebx
 813:	5e                   	pop    %esi
 814:	5f                   	pop    %edi
 815:	5d                   	pop    %ebp
 816:	c3                   	ret    
 817:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 81e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 820:	83 ec 0c             	sub    $0xc,%esp
 823:	b9 10 00 00 00       	mov    $0x10,%ecx
 828:	6a 00                	push   $0x0
 82a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 82d:	8b 45 08             	mov    0x8(%ebp),%eax
 830:	8b 13                	mov    (%ebx),%edx
 832:	e8 59 fe ff ff       	call   690 <printint>
        ap++;
 837:	89 d8                	mov    %ebx,%eax
 839:	83 c4 10             	add    $0x10,%esp
      state = 0;
 83c:	31 d2                	xor    %edx,%edx
        ap++;
 83e:	83 c0 04             	add    $0x4,%eax
 841:	89 45 d0             	mov    %eax,-0x30(%ebp)
 844:	e9 4b ff ff ff       	jmp    794 <printf+0x54>
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 850:	83 ec 0c             	sub    $0xc,%esp
 853:	b9 0a 00 00 00       	mov    $0xa,%ecx
 858:	6a 01                	push   $0x1
 85a:	eb ce                	jmp    82a <printf+0xea>
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 860:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 863:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 866:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 868:	6a 01                	push   $0x1
        ap++;
 86a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 86d:	57                   	push   %edi
 86e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 871:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 874:	e8 70 fd ff ff       	call   5e9 <write>
        ap++;
 879:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 87c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 87f:	31 d2                	xor    %edx,%edx
 881:	e9 0e ff ff ff       	jmp    794 <printf+0x54>
 886:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 88d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 890:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 893:	83 ec 04             	sub    $0x4,%esp
 896:	e9 59 ff ff ff       	jmp    7f4 <printf+0xb4>
 89b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 89f:	90                   	nop
        s = (char*)*ap;
 8a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8a3:	8b 18                	mov    (%eax),%ebx
        ap++;
 8a5:	83 c0 04             	add    $0x4,%eax
 8a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8ab:	85 db                	test   %ebx,%ebx
 8ad:	74 17                	je     8c6 <printf+0x186>
        while(*s != 0){
 8af:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 8b2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 8b4:	84 c0                	test   %al,%al
 8b6:	0f 84 d8 fe ff ff    	je     794 <printf+0x54>
 8bc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8bf:	89 de                	mov    %ebx,%esi
 8c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8c4:	eb 1a                	jmp    8e0 <printf+0x1a0>
          s = "(null)";
 8c6:	bb ae 0b 00 00       	mov    $0xbae,%ebx
        while(*s != 0){
 8cb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 8ce:	b8 28 00 00 00       	mov    $0x28,%eax
 8d3:	89 de                	mov    %ebx,%esi
 8d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8df:	90                   	nop
  write(fd, &c, 1);
 8e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 8e3:	83 c6 01             	add    $0x1,%esi
 8e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8e9:	6a 01                	push   $0x1
 8eb:	57                   	push   %edi
 8ec:	53                   	push   %ebx
 8ed:	e8 f7 fc ff ff       	call   5e9 <write>
        while(*s != 0){
 8f2:	0f b6 06             	movzbl (%esi),%eax
 8f5:	83 c4 10             	add    $0x10,%esp
 8f8:	84 c0                	test   %al,%al
 8fa:	75 e4                	jne    8e0 <printf+0x1a0>
 8fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 8ff:	31 d2                	xor    %edx,%edx
 901:	e9 8e fe ff ff       	jmp    794 <printf+0x54>
 906:	66 90                	xchg   %ax,%ax
 908:	66 90                	xchg   %ax,%ax
 90a:	66 90                	xchg   %ax,%ax
 90c:	66 90                	xchg   %ax,%ax
 90e:	66 90                	xchg   %ax,%ax

00000910 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 910:	f3 0f 1e fb          	endbr32 
 914:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 915:	a1 54 0f 00 00       	mov    0xf54,%eax
{
 91a:	89 e5                	mov    %esp,%ebp
 91c:	57                   	push   %edi
 91d:	56                   	push   %esi
 91e:	53                   	push   %ebx
 91f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 922:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 924:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 927:	39 c8                	cmp    %ecx,%eax
 929:	73 15                	jae    940 <free+0x30>
 92b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 92f:	90                   	nop
 930:	39 d1                	cmp    %edx,%ecx
 932:	72 14                	jb     948 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 934:	39 d0                	cmp    %edx,%eax
 936:	73 10                	jae    948 <free+0x38>
{
 938:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 93a:	8b 10                	mov    (%eax),%edx
 93c:	39 c8                	cmp    %ecx,%eax
 93e:	72 f0                	jb     930 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 940:	39 d0                	cmp    %edx,%eax
 942:	72 f4                	jb     938 <free+0x28>
 944:	39 d1                	cmp    %edx,%ecx
 946:	73 f0                	jae    938 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 948:	8b 73 fc             	mov    -0x4(%ebx),%esi
 94b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 94e:	39 fa                	cmp    %edi,%edx
 950:	74 1e                	je     970 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 952:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 955:	8b 50 04             	mov    0x4(%eax),%edx
 958:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 95b:	39 f1                	cmp    %esi,%ecx
 95d:	74 28                	je     987 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 95f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 961:	5b                   	pop    %ebx
  freep = p;
 962:	a3 54 0f 00 00       	mov    %eax,0xf54
}
 967:	5e                   	pop    %esi
 968:	5f                   	pop    %edi
 969:	5d                   	pop    %ebp
 96a:	c3                   	ret    
 96b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 96f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 970:	03 72 04             	add    0x4(%edx),%esi
 973:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 976:	8b 10                	mov    (%eax),%edx
 978:	8b 12                	mov    (%edx),%edx
 97a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 97d:	8b 50 04             	mov    0x4(%eax),%edx
 980:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 983:	39 f1                	cmp    %esi,%ecx
 985:	75 d8                	jne    95f <free+0x4f>
    p->s.size += bp->s.size;
 987:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 98a:	a3 54 0f 00 00       	mov    %eax,0xf54
    p->s.size += bp->s.size;
 98f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 992:	8b 53 f8             	mov    -0x8(%ebx),%edx
 995:	89 10                	mov    %edx,(%eax)
}
 997:	5b                   	pop    %ebx
 998:	5e                   	pop    %esi
 999:	5f                   	pop    %edi
 99a:	5d                   	pop    %ebp
 99b:	c3                   	ret    
 99c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9a0:	f3 0f 1e fb          	endbr32 
 9a4:	55                   	push   %ebp
 9a5:	89 e5                	mov    %esp,%ebp
 9a7:	57                   	push   %edi
 9a8:	56                   	push   %esi
 9a9:	53                   	push   %ebx
 9aa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9ad:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9b0:	8b 3d 54 0f 00 00    	mov    0xf54,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b6:	8d 70 07             	lea    0x7(%eax),%esi
 9b9:	c1 ee 03             	shr    $0x3,%esi
 9bc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 9bf:	85 ff                	test   %edi,%edi
 9c1:	0f 84 a9 00 00 00    	je     a70 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 9c9:	8b 48 04             	mov    0x4(%eax),%ecx
 9cc:	39 f1                	cmp    %esi,%ecx
 9ce:	73 6d                	jae    a3d <malloc+0x9d>
 9d0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 9d6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9db:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 9de:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 9e5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 9e8:	eb 17                	jmp    a01 <malloc+0x61>
 9ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 9f2:	8b 4a 04             	mov    0x4(%edx),%ecx
 9f5:	39 f1                	cmp    %esi,%ecx
 9f7:	73 4f                	jae    a48 <malloc+0xa8>
 9f9:	8b 3d 54 0f 00 00    	mov    0xf54,%edi
 9ff:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a01:	39 c7                	cmp    %eax,%edi
 a03:	75 eb                	jne    9f0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 a05:	83 ec 0c             	sub    $0xc,%esp
 a08:	ff 75 e4             	pushl  -0x1c(%ebp)
 a0b:	e8 41 fc ff ff       	call   651 <sbrk>
  if(p == (char*)-1)
 a10:	83 c4 10             	add    $0x10,%esp
 a13:	83 f8 ff             	cmp    $0xffffffff,%eax
 a16:	74 1b                	je     a33 <malloc+0x93>
  hp->s.size = nu;
 a18:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a1b:	83 ec 0c             	sub    $0xc,%esp
 a1e:	83 c0 08             	add    $0x8,%eax
 a21:	50                   	push   %eax
 a22:	e8 e9 fe ff ff       	call   910 <free>
  return freep;
 a27:	a1 54 0f 00 00       	mov    0xf54,%eax
      if((p = morecore(nunits)) == 0)
 a2c:	83 c4 10             	add    $0x10,%esp
 a2f:	85 c0                	test   %eax,%eax
 a31:	75 bd                	jne    9f0 <malloc+0x50>
        return 0;
  }
}
 a33:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a36:	31 c0                	xor    %eax,%eax
}
 a38:	5b                   	pop    %ebx
 a39:	5e                   	pop    %esi
 a3a:	5f                   	pop    %edi
 a3b:	5d                   	pop    %ebp
 a3c:	c3                   	ret    
    if(p->s.size >= nunits){
 a3d:	89 c2                	mov    %eax,%edx
 a3f:	89 f8                	mov    %edi,%eax
 a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 a48:	39 ce                	cmp    %ecx,%esi
 a4a:	74 54                	je     aa0 <malloc+0x100>
        p->s.size -= nunits;
 a4c:	29 f1                	sub    %esi,%ecx
 a4e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 a51:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 a54:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 a57:	a3 54 0f 00 00       	mov    %eax,0xf54
}
 a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a5f:	8d 42 08             	lea    0x8(%edx),%eax
}
 a62:	5b                   	pop    %ebx
 a63:	5e                   	pop    %esi
 a64:	5f                   	pop    %edi
 a65:	5d                   	pop    %ebp
 a66:	c3                   	ret    
 a67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a6e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 a70:	c7 05 54 0f 00 00 58 	movl   $0xf58,0xf54
 a77:	0f 00 00 
    base.s.size = 0;
 a7a:	bf 58 0f 00 00       	mov    $0xf58,%edi
    base.s.ptr = freep = prevp = &base;
 a7f:	c7 05 58 0f 00 00 58 	movl   $0xf58,0xf58
 a86:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a89:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 a8b:	c7 05 5c 0f 00 00 00 	movl   $0x0,0xf5c
 a92:	00 00 00 
    if(p->s.size >= nunits){
 a95:	e9 36 ff ff ff       	jmp    9d0 <malloc+0x30>
 a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 aa0:	8b 0a                	mov    (%edx),%ecx
 aa2:	89 08                	mov    %ecx,(%eax)
 aa4:	eb b1                	jmp    a57 <malloc+0xb7>
