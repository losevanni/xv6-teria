
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
  15:	ff 35 3c 10 00 00    	pushl  0x103c
  1b:	e8 c0 05 00 00       	call   5e0 <lock_init>
  int arg1 = 21, arg2 = 1;
  thread_t t;
  // thread_t t1;
  // thread_t t2;
  int retval;
  printf(1, "below should be sequential print statements:\n");
  20:	58                   	pop    %eax
  21:	5a                   	pop    %edx
  22:	68 58 0c 00 00       	push   $0xc58
  27:	6a 01                	push   $0x1
  int arg1 = 21, arg2 = 1;
  29:	c7 45 e8 15 00 00 00 	movl   $0x15,-0x18(%ebp)
  30:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  printf(1, "below should be sequential print statements:\n");
  37:	e8 74 07 00 00       	call   7b0 <printf>
  thread_create(&t,&f1, (void *)&arg1, (void *)&arg2);
  3c:	8d 45 ec             	lea    -0x14(%ebp),%eax
  3f:	50                   	push   %eax
  40:	8d 45 e8             	lea    -0x18(%ebp),%eax
  43:	50                   	push   %eax
  44:	8d 45 f0             	lea    -0x10(%ebp),%eax
  47:	68 e0 00 00 00       	push   $0xe0
  4c:	50                   	push   %eax
  4d:	e8 1e 05 00 00       	call   570 <thread_create>
  // int b=thread_create(&t1,f2, (void *)&arg1, (void *)&arg2);
  // int c=thread_create(&t2,f3, (void *)&arg1, (void *)&arg2);
  // printf(1,"%d %d %d ????\n" ,a,b,c);
  printf(1,"main tid = %d \n",t);
  52:	83 c4 1c             	add    $0x1c,%esp
  55:	ff 75 f0             	pushl  -0x10(%ebp)
  58:	68 de 0b 00 00       	push   $0xbde
  5d:	6a 01                	push   $0x1
  5f:	e8 4c 07 00 00       	call   7b0 <printf>
  // int id=sys_getpid();
  // printf(1,"my pid is ",id);

  // printf(1,"pid %d \n",t1);
  // printf(1,"pid %d \n",t2);
  thread_join(t,(void **)&retval);
  64:	59                   	pop    %ecx
  65:	58                   	pop    %eax
  66:	8d 45 f4             	lea    -0xc(%ebp),%eax
  69:	50                   	push   %eax
  6a:	ff 75 f0             	pushl  -0x10(%ebp)
  6d:	e8 3e 05 00 00       	call   5b0 <thread_join>
  printf(1,"main retval 1 : %d\n", *(void**)retval);
  72:	8b 45 f4             	mov    -0xc(%ebp),%eax
  75:	83 c4 0c             	add    $0xc,%esp
  78:	ff 30                	pushl  (%eax)
  7a:	68 ee 0b 00 00       	push   $0xbee
  7f:	6a 01                	push   $0x1
  81:	e8 2a 07 00 00       	call   7b0 <printf>
  printf(1,"main retval 2: %d\n", *(int*)(void*)&retval);
  86:	83 c4 0c             	add    $0xc,%esp
  89:	ff 75 f4             	pushl  -0xc(%ebp)
  8c:	68 02 0c 00 00       	push   $0xc02
  91:	6a 01                	push   $0x1
  93:	e8 18 07 00 00       	call   7b0 <printf>
  printf(1,"main retval 3*(int*) : %d\n", *(int*)retval);
  98:	8b 45 f4             	mov    -0xc(%ebp),%eax
  9b:	83 c4 0c             	add    $0xc,%esp
  9e:	ff 30                	pushl  (%eax)
  a0:	68 15 0c 00 00       	push   $0xc15
  a5:	6a 01                	push   $0x1
  a7:	e8 04 07 00 00       	call   7b0 <printf>
  printf(1,"main retval 4 : %d\n", *(int*)retval);
  ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  af:	83 c4 0c             	add    $0xc,%esp
  b2:	ff 30                	pushl  (%eax)
  b4:	68 30 0c 00 00       	push   $0xc30
  b9:	6a 01                	push   $0x1
  bb:	e8 f0 06 00 00       	call   7b0 <printf>
  
  printf(1,"main retval 5 : %d\n",retval);
  c0:	83 c4 0c             	add    $0xc,%esp
  c3:	ff 75 f4             	pushl  -0xc(%ebp)
  c6:	68 44 0c 00 00       	push   $0xc44
  cb:	6a 01                	push   $0x1
  cd:	e8 de 06 00 00       	call   7b0 <printf>
  // thread_create(&f3, (void *)&arg1, (void *)&arg2);
  // thread_join();
  // thread_join();
  // thread_join();
  
  exit();
  d2:	e8 62 05 00 00       	call   639 <exit>
  d7:	66 90                	xchg   %ax,%ax
  d9:	66 90                	xchg   %ax,%ax
  db:	66 90                	xchg   %ax,%ax
  dd:	66 90                	xchg   %ax,%ax
  df:	90                   	nop

000000e0 <f1>:
void *f1(void* arg1, void* arg2) {
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	56                   	push   %esi
  e8:	53                   	push   %ebx
  e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int num = *(int*)arg1;
  ec:	8b 33                	mov    (%ebx),%esi
  if (num) lock_acquire(lk);
  ee:	85 f6                	test   %esi,%esi
  f0:	75 5d                	jne    14f <f1+0x6f>
  printf(1, "1. this should print %s\n", num ? "first" : "whenever");
  f2:	50                   	push   %eax
  f3:	68 68 0b 00 00       	push   $0xb68
  f8:	68 1e 0b 00 00       	push   $0xb1e
  fd:	6a 01                	push   $0x1
  ff:	e8 ac 06 00 00       	call   7b0 <printf>
  printf(1,"num is : %d\n",num);
 104:	83 c4 0c             	add    $0xc,%esp
 107:	6a 00                	push   $0x0
 109:	68 37 0b 00 00       	push   $0xb37
 10e:	6a 01                	push   $0x1
 110:	e8 9b 06 00 00       	call   7b0 <printf>
  printf(1,"arg1 is : %d\n",arg1);
 115:	83 c4 0c             	add    $0xc,%esp
 118:	53                   	push   %ebx
 119:	68 44 0b 00 00       	push   $0xb44
 11e:	6a 01                	push   $0x1
 120:	e8 8b 06 00 00       	call   7b0 <printf>
  sleep(SLEEP_TIME);
 125:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 12c:	e8 98 05 00 00       	call   6c9 <sleep>
  printf(1,"this is threads exit\n");
 131:	5a                   	pop    %edx
 132:	59                   	pop    %ecx
 133:	68 52 0b 00 00       	push   $0xb52
 138:	6a 01                	push   $0x1
 13a:	e8 71 06 00 00       	call   7b0 <printf>
  thread_exit(arg1);
 13f:	89 1c 24             	mov    %ebx,(%esp)
 142:	e8 a2 05 00 00       	call   6e9 <thread_exit>
 147:	83 c4 10             	add    $0x10,%esp
  exit();
 14a:	e8 ea 04 00 00       	call   639 <exit>
  if (num) lock_acquire(lk);
 14f:	83 ec 0c             	sub    $0xc,%esp
 152:	ff 35 3c 10 00 00    	pushl  0x103c
 158:	e8 a3 04 00 00       	call   600 <lock_acquire>
  printf(1, "1. this should print %s\n", num ? "first" : "whenever");
 15d:	83 c4 0c             	add    $0xc,%esp
 160:	68 18 0b 00 00       	push   $0xb18
 165:	68 1e 0b 00 00       	push   $0xb1e
 16a:	6a 01                	push   $0x1
 16c:	e8 3f 06 00 00       	call   7b0 <printf>
  printf(1,"num is : %d\n",num);
 171:	83 c4 0c             	add    $0xc,%esp
 174:	56                   	push   %esi
 175:	68 37 0b 00 00       	push   $0xb37
 17a:	6a 01                	push   $0x1
 17c:	e8 2f 06 00 00       	call   7b0 <printf>
  printf(1,"arg1 is : %d\n",arg1);
 181:	83 c4 0c             	add    $0xc,%esp
 184:	53                   	push   %ebx
 185:	68 44 0b 00 00       	push   $0xb44
 18a:	6a 01                	push   $0x1
 18c:	e8 1f 06 00 00       	call   7b0 <printf>
  sleep(SLEEP_TIME);
 191:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 198:	e8 2c 05 00 00       	call   6c9 <sleep>
  printf(1,"this is threads exit\n");
 19d:	5e                   	pop    %esi
 19e:	58                   	pop    %eax
 19f:	68 52 0b 00 00       	push   $0xb52
 1a4:	6a 01                	push   $0x1
 1a6:	e8 05 06 00 00       	call   7b0 <printf>
  thread_exit(arg1);
 1ab:	89 1c 24             	mov    %ebx,(%esp)
 1ae:	e8 36 05 00 00       	call   6e9 <thread_exit>
  if (num) lock_release(lk);
 1b3:	58                   	pop    %eax
 1b4:	ff 35 3c 10 00 00    	pushl  0x103c
 1ba:	e8 61 04 00 00       	call   620 <lock_release>
 1bf:	83 c4 10             	add    $0x10,%esp
 1c2:	eb 86                	jmp    14a <f1+0x6a>
 1c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <f2>:
void *f2(void* arg1, void* arg2) {
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	83 ec 08             	sub    $0x8,%esp
  if (num) lock_acquire(lk);
 1da:	8b 45 08             	mov    0x8(%ebp),%eax
 1dd:	8b 08                	mov    (%eax),%ecx
 1df:	85 c9                	test   %ecx,%ecx
 1e1:	75 37                	jne    21a <f2+0x4a>
  printf(1, "2. this should print %s\n", num ? "second" : "whenever");
 1e3:	50                   	push   %eax
 1e4:	68 68 0b 00 00       	push   $0xb68
 1e9:	68 78 0b 00 00       	push   $0xb78
 1ee:	6a 01                	push   $0x1
 1f0:	e8 bb 05 00 00       	call   7b0 <printf>
  printf(1, "2. sleep for %d ticks\n", SLEEP_TIME);
 1f5:	83 c4 0c             	add    $0xc,%esp
 1f8:	6a 64                	push   $0x64
 1fa:	68 91 0b 00 00       	push   $0xb91
 1ff:	6a 01                	push   $0x1
 201:	e8 aa 05 00 00       	call   7b0 <printf>
  sleep(SLEEP_TIME);
 206:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 20d:	e8 b7 04 00 00       	call   6c9 <sleep>
 212:	83 c4 10             	add    $0x10,%esp
  exit();
 215:	e8 1f 04 00 00       	call   639 <exit>
  if (num) lock_acquire(lk);
 21a:	83 ec 0c             	sub    $0xc,%esp
 21d:	ff 35 3c 10 00 00    	pushl  0x103c
 223:	e8 d8 03 00 00       	call   600 <lock_acquire>
  printf(1, "2. this should print %s\n", num ? "second" : "whenever");
 228:	83 c4 0c             	add    $0xc,%esp
 22b:	68 71 0b 00 00       	push   $0xb71
 230:	68 78 0b 00 00       	push   $0xb78
 235:	6a 01                	push   $0x1
 237:	e8 74 05 00 00       	call   7b0 <printf>
  printf(1, "2. sleep for %d ticks\n", SLEEP_TIME);
 23c:	83 c4 0c             	add    $0xc,%esp
 23f:	6a 64                	push   $0x64
 241:	68 91 0b 00 00       	push   $0xb91
 246:	6a 01                	push   $0x1
 248:	e8 63 05 00 00       	call   7b0 <printf>
  sleep(SLEEP_TIME);
 24d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 254:	e8 70 04 00 00       	call   6c9 <sleep>
  if (num) lock_release(lk);
 259:	5a                   	pop    %edx
 25a:	ff 35 3c 10 00 00    	pushl  0x103c
 260:	e8 bb 03 00 00       	call   620 <lock_release>
 265:	83 c4 10             	add    $0x10,%esp
 268:	eb ab                	jmp    215 <f2+0x45>
 26a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000270 <f3>:
void *f3(void* arg1, void* arg2) {
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	83 ec 08             	sub    $0x8,%esp
  if (num) lock_acquire(lk);
 27a:	8b 45 08             	mov    0x8(%ebp),%eax
 27d:	8b 08                	mov    (%eax),%ecx
 27f:	85 c9                	test   %ecx,%ecx
 281:	75 37                	jne    2ba <f3+0x4a>
  printf(1, "3. this should print %s\n", num ? "third" : "whenever");
 283:	50                   	push   %eax
 284:	68 68 0b 00 00       	push   $0xb68
 289:	68 ae 0b 00 00       	push   $0xbae
 28e:	6a 01                	push   $0x1
 290:	e8 1b 05 00 00       	call   7b0 <printf>
  printf(1, "3. sleep for %d ticks\n", SLEEP_TIME);
 295:	83 c4 0c             	add    $0xc,%esp
 298:	6a 64                	push   $0x64
 29a:	68 c7 0b 00 00       	push   $0xbc7
 29f:	6a 01                	push   $0x1
 2a1:	e8 0a 05 00 00       	call   7b0 <printf>
  sleep(SLEEP_TIME);
 2a6:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 2ad:	e8 17 04 00 00       	call   6c9 <sleep>
 2b2:	83 c4 10             	add    $0x10,%esp
  exit();
 2b5:	e8 7f 03 00 00       	call   639 <exit>
  if (num) lock_acquire(lk);
 2ba:	83 ec 0c             	sub    $0xc,%esp
 2bd:	ff 35 3c 10 00 00    	pushl  0x103c
 2c3:	e8 38 03 00 00       	call   600 <lock_acquire>
  printf(1, "3. this should print %s\n", num ? "third" : "whenever");
 2c8:	83 c4 0c             	add    $0xc,%esp
 2cb:	68 a8 0b 00 00       	push   $0xba8
 2d0:	68 ae 0b 00 00       	push   $0xbae
 2d5:	6a 01                	push   $0x1
 2d7:	e8 d4 04 00 00       	call   7b0 <printf>
  printf(1, "3. sleep for %d ticks\n", SLEEP_TIME);
 2dc:	83 c4 0c             	add    $0xc,%esp
 2df:	6a 64                	push   $0x64
 2e1:	68 c7 0b 00 00       	push   $0xbc7
 2e6:	6a 01                	push   $0x1
 2e8:	e8 c3 04 00 00       	call   7b0 <printf>
  sleep(SLEEP_TIME);
 2ed:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 2f4:	e8 d0 03 00 00       	call   6c9 <sleep>
  if (num) lock_release(lk);
 2f9:	5a                   	pop    %edx
 2fa:	ff 35 3c 10 00 00    	pushl  0x103c
 300:	e8 1b 03 00 00       	call   620 <lock_release>
 305:	83 c4 10             	add    $0x10,%esp
 308:	eb ab                	jmp    2b5 <f3+0x45>
 30a:	66 90                	xchg   %ax,%ax
 30c:	66 90                	xchg   %ax,%ax
 30e:	66 90                	xchg   %ax,%ax

00000310 <strcpy>:
#include "mmu.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 315:	31 c0                	xor    %eax,%eax
{
 317:	89 e5                	mov    %esp,%ebp
 319:	53                   	push   %ebx
 31a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 31d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 320:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 324:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 327:	83 c0 01             	add    $0x1,%eax
 32a:	84 d2                	test   %dl,%dl
 32c:	75 f2                	jne    320 <strcpy+0x10>
    ;
  return os;
}
 32e:	89 c8                	mov    %ecx,%eax
 330:	5b                   	pop    %ebx
 331:	5d                   	pop    %ebp
 332:	c3                   	ret    
 333:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000340 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	53                   	push   %ebx
 348:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 34e:	0f b6 01             	movzbl (%ecx),%eax
 351:	0f b6 1a             	movzbl (%edx),%ebx
 354:	84 c0                	test   %al,%al
 356:	75 19                	jne    371 <strcmp+0x31>
 358:	eb 26                	jmp    380 <strcmp+0x40>
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 360:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 364:	83 c1 01             	add    $0x1,%ecx
 367:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 36a:	0f b6 1a             	movzbl (%edx),%ebx
 36d:	84 c0                	test   %al,%al
 36f:	74 0f                	je     380 <strcmp+0x40>
 371:	38 d8                	cmp    %bl,%al
 373:	74 eb                	je     360 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 375:	29 d8                	sub    %ebx,%eax
}
 377:	5b                   	pop    %ebx
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    
 37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 380:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 382:	29 d8                	sub    %ebx,%eax
}
 384:	5b                   	pop    %ebx
 385:	5d                   	pop    %ebp
 386:	c3                   	ret    
 387:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38e:	66 90                	xchg   %ax,%ax

00000390 <strlen>:

uint
strlen(const char *s)
{
 390:	f3 0f 1e fb          	endbr32 
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 39a:	80 3a 00             	cmpb   $0x0,(%edx)
 39d:	74 21                	je     3c0 <strlen+0x30>
 39f:	31 c0                	xor    %eax,%eax
 3a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3a8:	83 c0 01             	add    $0x1,%eax
 3ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3af:	89 c1                	mov    %eax,%ecx
 3b1:	75 f5                	jne    3a8 <strlen+0x18>
    ;
  return n;
}
 3b3:	89 c8                	mov    %ecx,%eax
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 3c0:	31 c9                	xor    %ecx,%ecx
}
 3c2:	5d                   	pop    %ebp
 3c3:	89 c8                	mov    %ecx,%eax
 3c5:	c3                   	ret    
 3c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi

000003d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3d0:	f3 0f 1e fb          	endbr32 
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	57                   	push   %edi
 3d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3db:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3de:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e1:	89 d7                	mov    %edx,%edi
 3e3:	fc                   	cld    
 3e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <strchr>:

char*
strchr(const char *s, char c)
{
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3fe:	0f b6 10             	movzbl (%eax),%edx
 401:	84 d2                	test   %dl,%dl
 403:	75 16                	jne    41b <strchr+0x2b>
 405:	eb 21                	jmp    428 <strchr+0x38>
 407:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40e:	66 90                	xchg   %ax,%ax
 410:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 414:	83 c0 01             	add    $0x1,%eax
 417:	84 d2                	test   %dl,%dl
 419:	74 0d                	je     428 <strchr+0x38>
    if(*s == c)
 41b:	38 d1                	cmp    %dl,%cl
 41d:	75 f1                	jne    410 <strchr+0x20>
      return (char*)s;
  return 0;
}
 41f:	5d                   	pop    %ebp
 420:	c3                   	ret    
 421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 428:	31 c0                	xor    %eax,%eax
}
 42a:	5d                   	pop    %ebp
 42b:	c3                   	ret    
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <gets>:

char*
gets(char *buf, int max)
{
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	57                   	push   %edi
 438:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 439:	31 f6                	xor    %esi,%esi
{
 43b:	53                   	push   %ebx
 43c:	89 f3                	mov    %esi,%ebx
 43e:	83 ec 1c             	sub    $0x1c,%esp
 441:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 444:	eb 33                	jmp    479 <gets+0x49>
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 450:	83 ec 04             	sub    $0x4,%esp
 453:	8d 45 e7             	lea    -0x19(%ebp),%eax
 456:	6a 01                	push   $0x1
 458:	50                   	push   %eax
 459:	6a 00                	push   $0x0
 45b:	e8 f1 01 00 00       	call   651 <read>
    if(cc < 1)
 460:	83 c4 10             	add    $0x10,%esp
 463:	85 c0                	test   %eax,%eax
 465:	7e 1c                	jle    483 <gets+0x53>
      break;
    buf[i++] = c;
 467:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 46b:	83 c7 01             	add    $0x1,%edi
 46e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 471:	3c 0a                	cmp    $0xa,%al
 473:	74 23                	je     498 <gets+0x68>
 475:	3c 0d                	cmp    $0xd,%al
 477:	74 1f                	je     498 <gets+0x68>
  for(i=0; i+1 < max; ){
 479:	83 c3 01             	add    $0x1,%ebx
 47c:	89 fe                	mov    %edi,%esi
 47e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 481:	7c cd                	jl     450 <gets+0x20>
 483:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 485:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 488:	c6 03 00             	movb   $0x0,(%ebx)
}
 48b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48e:	5b                   	pop    %ebx
 48f:	5e                   	pop    %esi
 490:	5f                   	pop    %edi
 491:	5d                   	pop    %ebp
 492:	c3                   	ret    
 493:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 497:	90                   	nop
 498:	8b 75 08             	mov    0x8(%ebp),%esi
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	01 de                	add    %ebx,%esi
 4a0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4a2:	c6 03 00             	movb   $0x0,(%ebx)
}
 4a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a8:	5b                   	pop    %ebx
 4a9:	5e                   	pop    %esi
 4aa:	5f                   	pop    %edi
 4ab:	5d                   	pop    %ebp
 4ac:	c3                   	ret    
 4ad:	8d 76 00             	lea    0x0(%esi),%esi

000004b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b0:	f3 0f 1e fb          	endbr32 
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	56                   	push   %esi
 4b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b9:	83 ec 08             	sub    $0x8,%esp
 4bc:	6a 00                	push   $0x0
 4be:	ff 75 08             	pushl  0x8(%ebp)
 4c1:	e8 b3 01 00 00       	call   679 <open>
  if(fd < 0)
 4c6:	83 c4 10             	add    $0x10,%esp
 4c9:	85 c0                	test   %eax,%eax
 4cb:	78 2b                	js     4f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 4cd:	83 ec 08             	sub    $0x8,%esp
 4d0:	ff 75 0c             	pushl  0xc(%ebp)
 4d3:	89 c3                	mov    %eax,%ebx
 4d5:	50                   	push   %eax
 4d6:	e8 b6 01 00 00       	call   691 <fstat>
  close(fd);
 4db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4de:	89 c6                	mov    %eax,%esi
  close(fd);
 4e0:	e8 7c 01 00 00       	call   661 <close>
  return r;
 4e5:	83 c4 10             	add    $0x10,%esp
}
 4e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4eb:	89 f0                	mov    %esi,%eax
 4ed:	5b                   	pop    %ebx
 4ee:	5e                   	pop    %esi
 4ef:	5d                   	pop    %ebp
 4f0:	c3                   	ret    
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 4f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4fd:	eb e9                	jmp    4e8 <stat+0x38>
 4ff:	90                   	nop

00000500 <atoi>:

int
atoi(const char *s)
{
 500:	f3 0f 1e fb          	endbr32 
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	53                   	push   %ebx
 508:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 50b:	0f be 02             	movsbl (%edx),%eax
 50e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 511:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 514:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 519:	77 1a                	ja     535 <atoi+0x35>
 51b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 51f:	90                   	nop
    n = n*10 + *s++ - '0';
 520:	83 c2 01             	add    $0x1,%edx
 523:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 526:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 52a:	0f be 02             	movsbl (%edx),%eax
 52d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 530:	80 fb 09             	cmp    $0x9,%bl
 533:	76 eb                	jbe    520 <atoi+0x20>
  return n;
}
 535:	89 c8                	mov    %ecx,%eax
 537:	5b                   	pop    %ebx
 538:	5d                   	pop    %ebp
 539:	c3                   	ret    
 53a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000540 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 540:	f3 0f 1e fb          	endbr32 
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	57                   	push   %edi
 548:	8b 45 10             	mov    0x10(%ebp),%eax
 54b:	8b 55 08             	mov    0x8(%ebp),%edx
 54e:	56                   	push   %esi
 54f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 552:	85 c0                	test   %eax,%eax
 554:	7e 0f                	jle    565 <memmove+0x25>
 556:	01 d0                	add    %edx,%eax
  dst = vdst;
 558:	89 d7                	mov    %edx,%edi
 55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 560:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 561:	39 f8                	cmp    %edi,%eax
 563:	75 fb                	jne    560 <memmove+0x20>
  return vdst;
}
 565:	5e                   	pop    %esi
 566:	89 d0                	mov    %edx,%eax
 568:	5f                   	pop    %edi
 569:	5d                   	pop    %ebp
 56a:	c3                   	ret    
 56b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop

00000570 <thread_create>:

int 
thread_create(thread_t* pid,void* (*start_routine)(void *, void *),void* arg1, void* arg2){
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
 57a:	68 00 10 00 00       	push   $0x1000
 57f:	e8 8c 04 00 00       	call   a10 <malloc>
  *pid= clone(start_routine , arg1 , arg2 , stack);
 584:	50                   	push   %eax
 585:	ff 75 14             	pushl  0x14(%ebp)
 588:	ff 75 10             	pushl  0x10(%ebp)
 58b:	ff 75 0c             	pushl  0xc(%ebp)
 58e:	e8 46 01 00 00       	call   6d9 <clone>
 593:	8b 55 08             	mov    0x8(%ebp),%edx
  if(*pid){
 596:	83 c4 20             	add    $0x20,%esp
 599:	85 c0                	test   %eax,%eax
  *pid= clone(start_routine , arg1 , arg2 , stack);
 59b:	89 02                	mov    %eax,(%edx)
  if(*pid){
 59d:	0f 94 c0             	sete   %al
    return 0; 
  }
  return -1;
}
 5a0:	c9                   	leave  
  if(*pid){
 5a1:	0f b6 c0             	movzbl %al,%eax
 5a4:	f7 d8                	neg    %eax
}
 5a6:	c3                   	ret    
 5a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ae:	66 90                	xchg   %ax,%ax

000005b0 <thread_join>:
int 
thread_join(thread_t tid,void** retval){
 5b0:	f3 0f 1e fb          	endbr32 
 5b4:	55                   	push   %ebp
 5b5:	89 e5                	mov    %esp,%ebp
 5b7:	83 ec 10             	sub    $0x10,%esp
  // thread_join(thread_t pid , void **retval){
  // void* stackPtr;
  int x=join(tid,retval);
 5ba:	ff 75 0c             	pushl  0xc(%ebp)
 5bd:	ff 75 08             	pushl  0x8(%ebp)
 5c0:	e8 1c 01 00 00       	call   6e1 <join>
  if(x){
 5c5:	83 c4 10             	add    $0x10,%esp
    return 0;
  }
  return -1;
}
 5c8:	c9                   	leave  
  if(x){
 5c9:	85 c0                	test   %eax,%eax
 5cb:	0f 94 c0             	sete   %al
 5ce:	0f b6 c0             	movzbl %al,%eax
 5d1:	f7 d8                	neg    %eax
}
 5d3:	c3                   	ret    
 5d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <lock_init>:
// int
// thread_exit()

int 
lock_init(lock_t *lk){
 5e0:	f3 0f 1e fb          	endbr32 
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
  lk->flag=0;
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 5f0:	31 c0                	xor    %eax,%eax
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret    
 5f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop

00000600 <lock_acquire>:
void 
lock_acquire(lock_t *lk){
 600:	f3 0f 1e fb          	endbr32 
 604:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 605:	b9 01 00 00 00       	mov    $0x1,%ecx
 60a:	89 e5                	mov    %esp,%ebp
 60c:	8b 55 08             	mov    0x8(%ebp),%edx
 60f:	90                   	nop
 610:	89 c8                	mov    %ecx,%eax
 612:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lk->flag,1)!=0);
 615:	85 c0                	test   %eax,%eax
 617:	75 f7                	jne    610 <lock_acquire+0x10>
}
 619:	5d                   	pop    %ebp
 61a:	c3                   	ret    
 61b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop

00000620 <lock_release>:
void 
lock_release(lock_t *lk){
 620:	f3 0f 1e fb          	endbr32 
 624:	55                   	push   %ebp
 625:	31 c0                	xor    %eax,%eax
 627:	89 e5                	mov    %esp,%ebp
 629:	8b 55 08             	mov    0x8(%ebp),%edx
 62c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->flag,0);
}
 62f:	5d                   	pop    %ebp
 630:	c3                   	ret    

00000631 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 631:	b8 01 00 00 00       	mov    $0x1,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <exit>:
SYSCALL(exit)
 639:	b8 02 00 00 00       	mov    $0x2,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <wait>:
SYSCALL(wait)
 641:	b8 03 00 00 00       	mov    $0x3,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <pipe>:
SYSCALL(pipe)
 649:	b8 04 00 00 00       	mov    $0x4,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <read>:
SYSCALL(read)
 651:	b8 05 00 00 00       	mov    $0x5,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <write>:
SYSCALL(write)
 659:	b8 10 00 00 00       	mov    $0x10,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <close>:
SYSCALL(close)
 661:	b8 15 00 00 00       	mov    $0x15,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <kill>:
SYSCALL(kill)
 669:	b8 06 00 00 00       	mov    $0x6,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <exec>:
SYSCALL(exec)
 671:	b8 07 00 00 00       	mov    $0x7,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <open>:
SYSCALL(open)
 679:	b8 0f 00 00 00       	mov    $0xf,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <mknod>:
SYSCALL(mknod)
 681:	b8 11 00 00 00       	mov    $0x11,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <unlink>:
SYSCALL(unlink)
 689:	b8 12 00 00 00       	mov    $0x12,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <fstat>:
SYSCALL(fstat)
 691:	b8 08 00 00 00       	mov    $0x8,%eax
 696:	cd 40                	int    $0x40
 698:	c3                   	ret    

00000699 <link>:
SYSCALL(link)
 699:	b8 13 00 00 00       	mov    $0x13,%eax
 69e:	cd 40                	int    $0x40
 6a0:	c3                   	ret    

000006a1 <mkdir>:
SYSCALL(mkdir)
 6a1:	b8 14 00 00 00       	mov    $0x14,%eax
 6a6:	cd 40                	int    $0x40
 6a8:	c3                   	ret    

000006a9 <chdir>:
SYSCALL(chdir)
 6a9:	b8 09 00 00 00       	mov    $0x9,%eax
 6ae:	cd 40                	int    $0x40
 6b0:	c3                   	ret    

000006b1 <dup>:
SYSCALL(dup)
 6b1:	b8 0a 00 00 00       	mov    $0xa,%eax
 6b6:	cd 40                	int    $0x40
 6b8:	c3                   	ret    

000006b9 <getpid>:
SYSCALL(getpid)
 6b9:	b8 0b 00 00 00       	mov    $0xb,%eax
 6be:	cd 40                	int    $0x40
 6c0:	c3                   	ret    

000006c1 <sbrk>:
SYSCALL(sbrk)
 6c1:	b8 0c 00 00 00       	mov    $0xc,%eax
 6c6:	cd 40                	int    $0x40
 6c8:	c3                   	ret    

000006c9 <sleep>:
SYSCALL(sleep)
 6c9:	b8 0d 00 00 00       	mov    $0xd,%eax
 6ce:	cd 40                	int    $0x40
 6d0:	c3                   	ret    

000006d1 <uptime>:
SYSCALL(uptime)
 6d1:	b8 0e 00 00 00       	mov    $0xe,%eax
 6d6:	cd 40                	int    $0x40
 6d8:	c3                   	ret    

000006d9 <clone>:
SYSCALL(clone)
 6d9:	b8 16 00 00 00       	mov    $0x16,%eax
 6de:	cd 40                	int    $0x40
 6e0:	c3                   	ret    

000006e1 <join>:
SYSCALL(join)
 6e1:	b8 17 00 00 00       	mov    $0x17,%eax
 6e6:	cd 40                	int    $0x40
 6e8:	c3                   	ret    

000006e9 <thread_exit>:
 6e9:	b8 18 00 00 00       	mov    $0x18,%eax
 6ee:	cd 40                	int    $0x40
 6f0:	c3                   	ret    
 6f1:	66 90                	xchg   %ax,%ax
 6f3:	66 90                	xchg   %ax,%ax
 6f5:	66 90                	xchg   %ax,%ax
 6f7:	66 90                	xchg   %ax,%ax
 6f9:	66 90                	xchg   %ax,%ax
 6fb:	66 90                	xchg   %ax,%ax
 6fd:	66 90                	xchg   %ax,%ax
 6ff:	90                   	nop

00000700 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 3c             	sub    $0x3c,%esp
 709:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 70c:	89 d1                	mov    %edx,%ecx
{
 70e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 711:	85 d2                	test   %edx,%edx
 713:	0f 89 7f 00 00 00    	jns    798 <printint+0x98>
 719:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 71d:	74 79                	je     798 <printint+0x98>
    neg = 1;
 71f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 726:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 728:	31 db                	xor    %ebx,%ebx
 72a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 730:	89 c8                	mov    %ecx,%eax
 732:	31 d2                	xor    %edx,%edx
 734:	89 cf                	mov    %ecx,%edi
 736:	f7 75 c4             	divl   -0x3c(%ebp)
 739:	0f b6 92 90 0c 00 00 	movzbl 0xc90(%edx),%edx
 740:	89 45 c0             	mov    %eax,-0x40(%ebp)
 743:	89 d8                	mov    %ebx,%eax
 745:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 748:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 74b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 74e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 751:	76 dd                	jbe    730 <printint+0x30>
  if(neg)
 753:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 756:	85 c9                	test   %ecx,%ecx
 758:	74 0c                	je     766 <printint+0x66>
    buf[i++] = '-';
 75a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 75f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 761:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 766:	8b 7d b8             	mov    -0x48(%ebp),%edi
 769:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 76d:	eb 07                	jmp    776 <printint+0x76>
 76f:	90                   	nop
 770:	0f b6 13             	movzbl (%ebx),%edx
 773:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 776:	83 ec 04             	sub    $0x4,%esp
 779:	88 55 d7             	mov    %dl,-0x29(%ebp)
 77c:	6a 01                	push   $0x1
 77e:	56                   	push   %esi
 77f:	57                   	push   %edi
 780:	e8 d4 fe ff ff       	call   659 <write>
  while(--i >= 0)
 785:	83 c4 10             	add    $0x10,%esp
 788:	39 de                	cmp    %ebx,%esi
 78a:	75 e4                	jne    770 <printint+0x70>
    putc(fd, buf[i]);
}
 78c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 78f:	5b                   	pop    %ebx
 790:	5e                   	pop    %esi
 791:	5f                   	pop    %edi
 792:	5d                   	pop    %ebp
 793:	c3                   	ret    
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 798:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 79f:	eb 87                	jmp    728 <printint+0x28>
 7a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7af:	90                   	nop

000007b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7b0:	f3 0f 1e fb          	endbr32 
 7b4:	55                   	push   %ebp
 7b5:	89 e5                	mov    %esp,%ebp
 7b7:	57                   	push   %edi
 7b8:	56                   	push   %esi
 7b9:	53                   	push   %ebx
 7ba:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7bd:	8b 75 0c             	mov    0xc(%ebp),%esi
 7c0:	0f b6 1e             	movzbl (%esi),%ebx
 7c3:	84 db                	test   %bl,%bl
 7c5:	0f 84 b4 00 00 00    	je     87f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 7cb:	8d 45 10             	lea    0x10(%ebp),%eax
 7ce:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 7d1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 7d4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 7d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7d9:	eb 33                	jmp    80e <printf+0x5e>
 7db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
 7e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7e3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 7e8:	83 f8 25             	cmp    $0x25,%eax
 7eb:	74 17                	je     804 <printf+0x54>
  write(fd, &c, 1);
 7ed:	83 ec 04             	sub    $0x4,%esp
 7f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7f3:	6a 01                	push   $0x1
 7f5:	57                   	push   %edi
 7f6:	ff 75 08             	pushl  0x8(%ebp)
 7f9:	e8 5b fe ff ff       	call   659 <write>
 7fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 801:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 804:	0f b6 1e             	movzbl (%esi),%ebx
 807:	83 c6 01             	add    $0x1,%esi
 80a:	84 db                	test   %bl,%bl
 80c:	74 71                	je     87f <printf+0xcf>
    c = fmt[i] & 0xff;
 80e:	0f be cb             	movsbl %bl,%ecx
 811:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 814:	85 d2                	test   %edx,%edx
 816:	74 c8                	je     7e0 <printf+0x30>
      }
    } else if(state == '%'){
 818:	83 fa 25             	cmp    $0x25,%edx
 81b:	75 e7                	jne    804 <printf+0x54>
      if(c == 'd'){
 81d:	83 f8 64             	cmp    $0x64,%eax
 820:	0f 84 9a 00 00 00    	je     8c0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 826:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 82c:	83 f9 70             	cmp    $0x70,%ecx
 82f:	74 5f                	je     890 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 831:	83 f8 73             	cmp    $0x73,%eax
 834:	0f 84 d6 00 00 00    	je     910 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 83a:	83 f8 63             	cmp    $0x63,%eax
 83d:	0f 84 8d 00 00 00    	je     8d0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 843:	83 f8 25             	cmp    $0x25,%eax
 846:	0f 84 b4 00 00 00    	je     900 <printf+0x150>
  write(fd, &c, 1);
 84c:	83 ec 04             	sub    $0x4,%esp
 84f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 853:	6a 01                	push   $0x1
 855:	57                   	push   %edi
 856:	ff 75 08             	pushl  0x8(%ebp)
 859:	e8 fb fd ff ff       	call   659 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 85e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 861:	83 c4 0c             	add    $0xc,%esp
 864:	6a 01                	push   $0x1
 866:	83 c6 01             	add    $0x1,%esi
 869:	57                   	push   %edi
 86a:	ff 75 08             	pushl  0x8(%ebp)
 86d:	e8 e7 fd ff ff       	call   659 <write>
  for(i = 0; fmt[i]; i++){
 872:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 876:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 879:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 87b:	84 db                	test   %bl,%bl
 87d:	75 8f                	jne    80e <printf+0x5e>
    }
  }
}
 87f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 882:	5b                   	pop    %ebx
 883:	5e                   	pop    %esi
 884:	5f                   	pop    %edi
 885:	5d                   	pop    %ebp
 886:	c3                   	ret    
 887:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 88e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 890:	83 ec 0c             	sub    $0xc,%esp
 893:	b9 10 00 00 00       	mov    $0x10,%ecx
 898:	6a 00                	push   $0x0
 89a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 89d:	8b 45 08             	mov    0x8(%ebp),%eax
 8a0:	8b 13                	mov    (%ebx),%edx
 8a2:	e8 59 fe ff ff       	call   700 <printint>
        ap++;
 8a7:	89 d8                	mov    %ebx,%eax
 8a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ac:	31 d2                	xor    %edx,%edx
        ap++;
 8ae:	83 c0 04             	add    $0x4,%eax
 8b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8b4:	e9 4b ff ff ff       	jmp    804 <printf+0x54>
 8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 8c0:	83 ec 0c             	sub    $0xc,%esp
 8c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8c8:	6a 01                	push   $0x1
 8ca:	eb ce                	jmp    89a <printf+0xea>
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 8d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 8d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8d6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 8d8:	6a 01                	push   $0x1
        ap++;
 8da:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 8dd:	57                   	push   %edi
 8de:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 8e1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8e4:	e8 70 fd ff ff       	call   659 <write>
        ap++;
 8e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 8ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ef:	31 d2                	xor    %edx,%edx
 8f1:	e9 0e ff ff ff       	jmp    804 <printf+0x54>
 8f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8fd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 900:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 903:	83 ec 04             	sub    $0x4,%esp
 906:	e9 59 ff ff ff       	jmp    864 <printf+0xb4>
 90b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 90f:	90                   	nop
        s = (char*)*ap;
 910:	8b 45 d0             	mov    -0x30(%ebp),%eax
 913:	8b 18                	mov    (%eax),%ebx
        ap++;
 915:	83 c0 04             	add    $0x4,%eax
 918:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 91b:	85 db                	test   %ebx,%ebx
 91d:	74 17                	je     936 <printf+0x186>
        while(*s != 0){
 91f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 922:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 924:	84 c0                	test   %al,%al
 926:	0f 84 d8 fe ff ff    	je     804 <printf+0x54>
 92c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 92f:	89 de                	mov    %ebx,%esi
 931:	8b 5d 08             	mov    0x8(%ebp),%ebx
 934:	eb 1a                	jmp    950 <printf+0x1a0>
          s = "(null)";
 936:	bb 86 0c 00 00       	mov    $0xc86,%ebx
        while(*s != 0){
 93b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 93e:	b8 28 00 00 00       	mov    $0x28,%eax
 943:	89 de                	mov    %ebx,%esi
 945:	8b 5d 08             	mov    0x8(%ebp),%ebx
 948:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 94f:	90                   	nop
  write(fd, &c, 1);
 950:	83 ec 04             	sub    $0x4,%esp
          s++;
 953:	83 c6 01             	add    $0x1,%esi
 956:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 959:	6a 01                	push   $0x1
 95b:	57                   	push   %edi
 95c:	53                   	push   %ebx
 95d:	e8 f7 fc ff ff       	call   659 <write>
        while(*s != 0){
 962:	0f b6 06             	movzbl (%esi),%eax
 965:	83 c4 10             	add    $0x10,%esp
 968:	84 c0                	test   %al,%al
 96a:	75 e4                	jne    950 <printf+0x1a0>
 96c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 96f:	31 d2                	xor    %edx,%edx
 971:	e9 8e fe ff ff       	jmp    804 <printf+0x54>
 976:	66 90                	xchg   %ax,%ax
 978:	66 90                	xchg   %ax,%ax
 97a:	66 90                	xchg   %ax,%ax
 97c:	66 90                	xchg   %ax,%ax
 97e:	66 90                	xchg   %ax,%ax

00000980 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 980:	f3 0f 1e fb          	endbr32 
 984:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 985:	a1 30 10 00 00       	mov    0x1030,%eax
{
 98a:	89 e5                	mov    %esp,%ebp
 98c:	57                   	push   %edi
 98d:	56                   	push   %esi
 98e:	53                   	push   %ebx
 98f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 992:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 994:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 997:	39 c8                	cmp    %ecx,%eax
 999:	73 15                	jae    9b0 <free+0x30>
 99b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 99f:	90                   	nop
 9a0:	39 d1                	cmp    %edx,%ecx
 9a2:	72 14                	jb     9b8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9a4:	39 d0                	cmp    %edx,%eax
 9a6:	73 10                	jae    9b8 <free+0x38>
{
 9a8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9aa:	8b 10                	mov    (%eax),%edx
 9ac:	39 c8                	cmp    %ecx,%eax
 9ae:	72 f0                	jb     9a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9b0:	39 d0                	cmp    %edx,%eax
 9b2:	72 f4                	jb     9a8 <free+0x28>
 9b4:	39 d1                	cmp    %edx,%ecx
 9b6:	73 f0                	jae    9a8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9be:	39 fa                	cmp    %edi,%edx
 9c0:	74 1e                	je     9e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9c5:	8b 50 04             	mov    0x4(%eax),%edx
 9c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9cb:	39 f1                	cmp    %esi,%ecx
 9cd:	74 28                	je     9f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9cf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 9d1:	5b                   	pop    %ebx
  freep = p;
 9d2:	a3 30 10 00 00       	mov    %eax,0x1030
}
 9d7:	5e                   	pop    %esi
 9d8:	5f                   	pop    %edi
 9d9:	5d                   	pop    %ebp
 9da:	c3                   	ret    
 9db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9df:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 9e0:	03 72 04             	add    0x4(%edx),%esi
 9e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9e6:	8b 10                	mov    (%eax),%edx
 9e8:	8b 12                	mov    (%edx),%edx
 9ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9ed:	8b 50 04             	mov    0x4(%eax),%edx
 9f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9f3:	39 f1                	cmp    %esi,%ecx
 9f5:	75 d8                	jne    9cf <free+0x4f>
    p->s.size += bp->s.size;
 9f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 9fa:	a3 30 10 00 00       	mov    %eax,0x1030
    p->s.size += bp->s.size;
 9ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a02:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a05:	89 10                	mov    %edx,(%eax)
}
 a07:	5b                   	pop    %ebx
 a08:	5e                   	pop    %esi
 a09:	5f                   	pop    %edi
 a0a:	5d                   	pop    %ebp
 a0b:	c3                   	ret    
 a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a10 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a10:	f3 0f 1e fb          	endbr32 
 a14:	55                   	push   %ebp
 a15:	89 e5                	mov    %esp,%ebp
 a17:	57                   	push   %edi
 a18:	56                   	push   %esi
 a19:	53                   	push   %ebx
 a1a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a1d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a20:	8b 3d 30 10 00 00    	mov    0x1030,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a26:	8d 70 07             	lea    0x7(%eax),%esi
 a29:	c1 ee 03             	shr    $0x3,%esi
 a2c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a2f:	85 ff                	test   %edi,%edi
 a31:	0f 84 a9 00 00 00    	je     ae0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a37:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 a39:	8b 48 04             	mov    0x4(%eax),%ecx
 a3c:	39 f1                	cmp    %esi,%ecx
 a3e:	73 6d                	jae    aad <malloc+0x9d>
 a40:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 a46:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a4b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a4e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 a55:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 a58:	eb 17                	jmp    a71 <malloc+0x61>
 a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a60:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 a62:	8b 4a 04             	mov    0x4(%edx),%ecx
 a65:	39 f1                	cmp    %esi,%ecx
 a67:	73 4f                	jae    ab8 <malloc+0xa8>
 a69:	8b 3d 30 10 00 00    	mov    0x1030,%edi
 a6f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a71:	39 c7                	cmp    %eax,%edi
 a73:	75 eb                	jne    a60 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 a75:	83 ec 0c             	sub    $0xc,%esp
 a78:	ff 75 e4             	pushl  -0x1c(%ebp)
 a7b:	e8 41 fc ff ff       	call   6c1 <sbrk>
  if(p == (char*)-1)
 a80:	83 c4 10             	add    $0x10,%esp
 a83:	83 f8 ff             	cmp    $0xffffffff,%eax
 a86:	74 1b                	je     aa3 <malloc+0x93>
  hp->s.size = nu;
 a88:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a8b:	83 ec 0c             	sub    $0xc,%esp
 a8e:	83 c0 08             	add    $0x8,%eax
 a91:	50                   	push   %eax
 a92:	e8 e9 fe ff ff       	call   980 <free>
  return freep;
 a97:	a1 30 10 00 00       	mov    0x1030,%eax
      if((p = morecore(nunits)) == 0)
 a9c:	83 c4 10             	add    $0x10,%esp
 a9f:	85 c0                	test   %eax,%eax
 aa1:	75 bd                	jne    a60 <malloc+0x50>
        return 0;
  }
}
 aa3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 aa6:	31 c0                	xor    %eax,%eax
}
 aa8:	5b                   	pop    %ebx
 aa9:	5e                   	pop    %esi
 aaa:	5f                   	pop    %edi
 aab:	5d                   	pop    %ebp
 aac:	c3                   	ret    
    if(p->s.size >= nunits){
 aad:	89 c2                	mov    %eax,%edx
 aaf:	89 f8                	mov    %edi,%eax
 ab1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 ab8:	39 ce                	cmp    %ecx,%esi
 aba:	74 54                	je     b10 <malloc+0x100>
        p->s.size -= nunits;
 abc:	29 f1                	sub    %esi,%ecx
 abe:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 ac1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 ac4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 ac7:	a3 30 10 00 00       	mov    %eax,0x1030
}
 acc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 acf:	8d 42 08             	lea    0x8(%edx),%eax
}
 ad2:	5b                   	pop    %ebx
 ad3:	5e                   	pop    %esi
 ad4:	5f                   	pop    %edi
 ad5:	5d                   	pop    %ebp
 ad6:	c3                   	ret    
 ad7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ade:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 ae0:	c7 05 30 10 00 00 34 	movl   $0x1034,0x1030
 ae7:	10 00 00 
    base.s.size = 0;
 aea:	bf 34 10 00 00       	mov    $0x1034,%edi
    base.s.ptr = freep = prevp = &base;
 aef:	c7 05 34 10 00 00 34 	movl   $0x1034,0x1034
 af6:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 afb:	c7 05 38 10 00 00 00 	movl   $0x0,0x1038
 b02:	00 00 00 
    if(p->s.size >= nunits){
 b05:	e9 36 ff ff ff       	jmp    a40 <malloc+0x30>
 b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b10:	8b 0a                	mov    (%edx),%ecx
 b12:	89 08                	mov    %ecx,(%eax)
 b14:	eb b1                	jmp    ac7 <malloc+0xb7>
