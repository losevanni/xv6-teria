
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
  if(argc != 3){
   e:	83 39 03             	cmpl   $0x3,(%ecx)
{
  11:	55                   	push   %ebp
  12:	89 e5                	mov    %esp,%ebp
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  19:	74 13                	je     2e <main+0x2e>
    printf(2, "Usage: ln old new\n");
  1b:	52                   	push   %edx
  1c:	52                   	push   %edx
  1d:	68 68 08 00 00       	push   $0x868
  22:	6a 02                	push   $0x2
  24:	e8 d7 04 00 00       	call   500 <printf>
    exit();
  29:	e8 5b 03 00 00       	call   389 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2e:	50                   	push   %eax
  2f:	50                   	push   %eax
  30:	ff 73 08             	pushl  0x8(%ebx)
  33:	ff 73 04             	pushl  0x4(%ebx)
  36:	e8 ae 03 00 00       	call   3e9 <link>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  42:	e8 42 03 00 00       	call   389 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	ff 73 08             	pushl  0x8(%ebx)
  4a:	ff 73 04             	pushl  0x4(%ebx)
  4d:	68 7b 08 00 00       	push   $0x87b
  52:	6a 02                	push   $0x2
  54:	e8 a7 04 00 00       	call   500 <printf>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	eb e4                	jmp    42 <main+0x42>
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "mmu.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  65:	31 c0                	xor    %eax,%eax
{
  67:	89 e5                	mov    %esp,%ebp
  69:	53                   	push   %ebx
  6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  70:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  74:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  77:	83 c0 01             	add    $0x1,%eax
  7a:	84 d2                	test   %dl,%dl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	89 c8                	mov    %ecx,%eax
  80:	5b                   	pop    %ebx
  81:	5d                   	pop    %ebp
  82:	c3                   	ret    
  83:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	53                   	push   %ebx
  98:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  9e:	0f b6 01             	movzbl (%ecx),%eax
  a1:	0f b6 1a             	movzbl (%edx),%ebx
  a4:	84 c0                	test   %al,%al
  a6:	75 19                	jne    c1 <strcmp+0x31>
  a8:	eb 26                	jmp    d0 <strcmp+0x40>
  aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  b0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  b4:	83 c1 01             	add    $0x1,%ecx
  b7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  ba:	0f b6 1a             	movzbl (%edx),%ebx
  bd:	84 c0                	test   %al,%al
  bf:	74 0f                	je     d0 <strcmp+0x40>
  c1:	38 d8                	cmp    %bl,%al
  c3:	74 eb                	je     b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  c5:	29 d8                	sub    %ebx,%eax
}
  c7:	5b                   	pop    %ebx
  c8:	5d                   	pop    %ebp
  c9:	c3                   	ret    
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  d2:	29 d8                	sub    %ebx,%eax
}
  d4:	5b                   	pop    %ebx
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  de:	66 90                	xchg   %ax,%ax

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  ea:	80 3a 00             	cmpb   $0x0,(%edx)
  ed:	74 21                	je     110 <strlen+0x30>
  ef:	31 c0                	xor    %eax,%eax
  f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  f8:	83 c0 01             	add    $0x1,%eax
  fb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  ff:	89 c1                	mov    %eax,%ecx
 101:	75 f5                	jne    f8 <strlen+0x18>
    ;
  return n;
}
 103:	89 c8                	mov    %ecx,%eax
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    
 107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 110:	31 c9                	xor    %ecx,%ecx
}
 112:	5d                   	pop    %ebp
 113:	89 c8                	mov    %ecx,%eax
 115:	c3                   	ret    
 116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 12b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12e:	8b 45 0c             	mov    0xc(%ebp),%eax
 131:	89 d7                	mov    %edx,%edi
 133:	fc                   	cld    
 134:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 136:	89 d0                	mov    %edx,%eax
 138:	5f                   	pop    %edi
 139:	5d                   	pop    %ebp
 13a:	c3                   	ret    
 13b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 13f:	90                   	nop

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14e:	0f b6 10             	movzbl (%eax),%edx
 151:	84 d2                	test   %dl,%dl
 153:	75 16                	jne    16b <strchr+0x2b>
 155:	eb 21                	jmp    178 <strchr+0x38>
 157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15e:	66 90                	xchg   %ax,%ax
 160:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 164:	83 c0 01             	add    $0x1,%eax
 167:	84 d2                	test   %dl,%dl
 169:	74 0d                	je     178 <strchr+0x38>
    if(*s == c)
 16b:	38 d1                	cmp    %dl,%cl
 16d:	75 f1                	jne    160 <strchr+0x20>
      return (char*)s;
  return 0;
}
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret    
 171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 178:	31 c0                	xor    %eax,%eax
}
 17a:	5d                   	pop    %ebp
 17b:	c3                   	ret    
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	57                   	push   %edi
 188:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 189:	31 f6                	xor    %esi,%esi
{
 18b:	53                   	push   %ebx
 18c:	89 f3                	mov    %esi,%ebx
 18e:	83 ec 1c             	sub    $0x1c,%esp
 191:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 194:	eb 33                	jmp    1c9 <gets+0x49>
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a6:	6a 01                	push   $0x1
 1a8:	50                   	push   %eax
 1a9:	6a 00                	push   $0x0
 1ab:	e8 f1 01 00 00       	call   3a1 <read>
    if(cc < 1)
 1b0:	83 c4 10             	add    $0x10,%esp
 1b3:	85 c0                	test   %eax,%eax
 1b5:	7e 1c                	jle    1d3 <gets+0x53>
      break;
    buf[i++] = c;
 1b7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1bb:	83 c7 01             	add    $0x1,%edi
 1be:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1c1:	3c 0a                	cmp    $0xa,%al
 1c3:	74 23                	je     1e8 <gets+0x68>
 1c5:	3c 0d                	cmp    $0xd,%al
 1c7:	74 1f                	je     1e8 <gets+0x68>
  for(i=0; i+1 < max; ){
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	89 fe                	mov    %edi,%esi
 1ce:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d1:	7c cd                	jl     1a0 <gets+0x20>
 1d3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1d5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1d8:	c6 03 00             	movb   $0x0,(%ebx)
}
 1db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1de:	5b                   	pop    %ebx
 1df:	5e                   	pop    %esi
 1e0:	5f                   	pop    %edi
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	8b 75 08             	mov    0x8(%ebp),%esi
 1eb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ee:	01 de                	add    %ebx,%esi
 1f0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1f2:	c6 03 00             	movb   $0x0,(%ebx)
}
 1f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f8:	5b                   	pop    %ebx
 1f9:	5e                   	pop    %esi
 1fa:	5f                   	pop    %edi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	56                   	push   %esi
 208:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	6a 00                	push   $0x0
 20e:	ff 75 08             	pushl  0x8(%ebp)
 211:	e8 b3 01 00 00       	call   3c9 <open>
  if(fd < 0)
 216:	83 c4 10             	add    $0x10,%esp
 219:	85 c0                	test   %eax,%eax
 21b:	78 2b                	js     248 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 21d:	83 ec 08             	sub    $0x8,%esp
 220:	ff 75 0c             	pushl  0xc(%ebp)
 223:	89 c3                	mov    %eax,%ebx
 225:	50                   	push   %eax
 226:	e8 b6 01 00 00       	call   3e1 <fstat>
  close(fd);
 22b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22e:	89 c6                	mov    %eax,%esi
  close(fd);
 230:	e8 7c 01 00 00       	call   3b1 <close>
  return r;
 235:	83 c4 10             	add    $0x10,%esp
}
 238:	8d 65 f8             	lea    -0x8(%ebp),%esp
 23b:	89 f0                	mov    %esi,%eax
 23d:	5b                   	pop    %ebx
 23e:	5e                   	pop    %esi
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 248:	be ff ff ff ff       	mov    $0xffffffff,%esi
 24d:	eb e9                	jmp    238 <stat+0x38>
 24f:	90                   	nop

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	53                   	push   %ebx
 258:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 25b:	0f be 02             	movsbl (%edx),%eax
 25e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 261:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 264:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 269:	77 1a                	ja     285 <atoi+0x35>
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop
    n = n*10 + *s++ - '0';
 270:	83 c2 01             	add    $0x1,%edx
 273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 27a:	0f be 02             	movsbl (%edx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
  return n;
}
 285:	89 c8                	mov    %ecx,%eax
 287:	5b                   	pop    %ebx
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	f3 0f 1e fb          	endbr32 
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	57                   	push   %edi
 298:	8b 45 10             	mov    0x10(%ebp),%eax
 29b:	8b 55 08             	mov    0x8(%ebp),%edx
 29e:	56                   	push   %esi
 29f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a2:	85 c0                	test   %eax,%eax
 2a4:	7e 0f                	jle    2b5 <memmove+0x25>
 2a6:	01 d0                	add    %edx,%eax
  dst = vdst;
 2a8:	89 d7                	mov    %edx,%edi
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 f8                	cmp    %edi,%eax
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	89 d0                	mov    %edx,%eax
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <thread_create>:

int 
thread_create(thread_t* pid,void* (*start_routine)(void *, void *),void* arg1, void* arg2){
 2c0:	f3 0f 1e fb          	endbr32 
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
 2ca:	68 00 10 00 00       	push   $0x1000
 2cf:	e8 8c 04 00 00       	call   760 <malloc>
  *pid= clone(start_routine , arg1 , arg2 , stack);
 2d4:	50                   	push   %eax
 2d5:	ff 75 14             	pushl  0x14(%ebp)
 2d8:	ff 75 10             	pushl  0x10(%ebp)
 2db:	ff 75 0c             	pushl  0xc(%ebp)
 2de:	e8 46 01 00 00       	call   429 <clone>
 2e3:	8b 55 08             	mov    0x8(%ebp),%edx
  if(*pid){
 2e6:	83 c4 20             	add    $0x20,%esp
 2e9:	85 c0                	test   %eax,%eax
  *pid= clone(start_routine , arg1 , arg2 , stack);
 2eb:	89 02                	mov    %eax,(%edx)
  if(*pid){
 2ed:	0f 94 c0             	sete   %al
    return 0; 
  }
  return -1;
}
 2f0:	c9                   	leave  
  if(*pid){
 2f1:	0f b6 c0             	movzbl %al,%eax
 2f4:	f7 d8                	neg    %eax
}
 2f6:	c3                   	ret    
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax

00000300 <thread_join>:
int 
thread_join(thread_t tid,void** retval){
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 ec 10             	sub    $0x10,%esp
  // thread_join(thread_t pid , void **retval){
  // void* stackPtr;
  int x=join(tid,retval);
 30a:	ff 75 0c             	pushl  0xc(%ebp)
 30d:	ff 75 08             	pushl  0x8(%ebp)
 310:	e8 1c 01 00 00       	call   431 <join>
  if(x){
 315:	83 c4 10             	add    $0x10,%esp
    return 0;
  }
  return -1;
}
 318:	c9                   	leave  
  if(x){
 319:	85 c0                	test   %eax,%eax
 31b:	0f 94 c0             	sete   %al
 31e:	0f b6 c0             	movzbl %al,%eax
 321:	f7 d8                	neg    %eax
}
 323:	c3                   	ret    
 324:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <lock_init>:
// int
// thread_exit()

int 
lock_init(lock_t *lk){
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
  lk->flag=0;
 337:	8b 45 08             	mov    0x8(%ebp),%eax
 33a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 340:	31 c0                	xor    %eax,%eax
 342:	5d                   	pop    %ebp
 343:	c3                   	ret    
 344:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <lock_acquire>:
void 
lock_acquire(lock_t *lk){
 350:	f3 0f 1e fb          	endbr32 
 354:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 355:	b9 01 00 00 00       	mov    $0x1,%ecx
 35a:	89 e5                	mov    %esp,%ebp
 35c:	8b 55 08             	mov    0x8(%ebp),%edx
 35f:	90                   	nop
 360:	89 c8                	mov    %ecx,%eax
 362:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lk->flag,1)!=0);
 365:	85 c0                	test   %eax,%eax
 367:	75 f7                	jne    360 <lock_acquire+0x10>
}
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <lock_release>:
void 
lock_release(lock_t *lk){
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	31 c0                	xor    %eax,%eax
 377:	89 e5                	mov    %esp,%ebp
 379:	8b 55 08             	mov    0x8(%ebp),%edx
 37c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->flag,0);
}
 37f:	5d                   	pop    %ebp
 380:	c3                   	ret    

00000381 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 381:	b8 01 00 00 00       	mov    $0x1,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <exit>:
SYSCALL(exit)
 389:	b8 02 00 00 00       	mov    $0x2,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <wait>:
SYSCALL(wait)
 391:	b8 03 00 00 00       	mov    $0x3,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <pipe>:
SYSCALL(pipe)
 399:	b8 04 00 00 00       	mov    $0x4,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <read>:
SYSCALL(read)
 3a1:	b8 05 00 00 00       	mov    $0x5,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <write>:
SYSCALL(write)
 3a9:	b8 10 00 00 00       	mov    $0x10,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <close>:
SYSCALL(close)
 3b1:	b8 15 00 00 00       	mov    $0x15,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <kill>:
SYSCALL(kill)
 3b9:	b8 06 00 00 00       	mov    $0x6,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <exec>:
SYSCALL(exec)
 3c1:	b8 07 00 00 00       	mov    $0x7,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <open>:
SYSCALL(open)
 3c9:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <mknod>:
SYSCALL(mknod)
 3d1:	b8 11 00 00 00       	mov    $0x11,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <unlink>:
SYSCALL(unlink)
 3d9:	b8 12 00 00 00       	mov    $0x12,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <fstat>:
SYSCALL(fstat)
 3e1:	b8 08 00 00 00       	mov    $0x8,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <link>:
SYSCALL(link)
 3e9:	b8 13 00 00 00       	mov    $0x13,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <mkdir>:
SYSCALL(mkdir)
 3f1:	b8 14 00 00 00       	mov    $0x14,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <chdir>:
SYSCALL(chdir)
 3f9:	b8 09 00 00 00       	mov    $0x9,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <dup>:
SYSCALL(dup)
 401:	b8 0a 00 00 00       	mov    $0xa,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <getpid>:
SYSCALL(getpid)
 409:	b8 0b 00 00 00       	mov    $0xb,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <sbrk>:
SYSCALL(sbrk)
 411:	b8 0c 00 00 00       	mov    $0xc,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <sleep>:
SYSCALL(sleep)
 419:	b8 0d 00 00 00       	mov    $0xd,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <uptime>:
SYSCALL(uptime)
 421:	b8 0e 00 00 00       	mov    $0xe,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <clone>:
SYSCALL(clone)
 429:	b8 16 00 00 00       	mov    $0x16,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <join>:
SYSCALL(join)
 431:	b8 17 00 00 00       	mov    $0x17,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <thread_exit>:
 439:	b8 18 00 00 00       	mov    $0x18,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    
 441:	66 90                	xchg   %ax,%ax
 443:	66 90                	xchg   %ax,%ax
 445:	66 90                	xchg   %ax,%ax
 447:	66 90                	xchg   %ax,%ax
 449:	66 90                	xchg   %ax,%ax
 44b:	66 90                	xchg   %ax,%ax
 44d:	66 90                	xchg   %ax,%ax
 44f:	90                   	nop

00000450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 3c             	sub    $0x3c,%esp
 459:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 45c:	89 d1                	mov    %edx,%ecx
{
 45e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 461:	85 d2                	test   %edx,%edx
 463:	0f 89 7f 00 00 00    	jns    4e8 <printint+0x98>
 469:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 46d:	74 79                	je     4e8 <printint+0x98>
    neg = 1;
 46f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 476:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 478:	31 db                	xor    %ebx,%ebx
 47a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 480:	89 c8                	mov    %ecx,%eax
 482:	31 d2                	xor    %edx,%edx
 484:	89 cf                	mov    %ecx,%edi
 486:	f7 75 c4             	divl   -0x3c(%ebp)
 489:	0f b6 92 98 08 00 00 	movzbl 0x898(%edx),%edx
 490:	89 45 c0             	mov    %eax,-0x40(%ebp)
 493:	89 d8                	mov    %ebx,%eax
 495:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 498:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 49b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 49e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4a1:	76 dd                	jbe    480 <printint+0x30>
  if(neg)
 4a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4a6:	85 c9                	test   %ecx,%ecx
 4a8:	74 0c                	je     4b6 <printint+0x66>
    buf[i++] = '-';
 4aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4bd:	eb 07                	jmp    4c6 <printint+0x76>
 4bf:	90                   	nop
 4c0:	0f b6 13             	movzbl (%ebx),%edx
 4c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4c6:	83 ec 04             	sub    $0x4,%esp
 4c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4cc:	6a 01                	push   $0x1
 4ce:	56                   	push   %esi
 4cf:	57                   	push   %edi
 4d0:	e8 d4 fe ff ff       	call   3a9 <write>
  while(--i >= 0)
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	39 de                	cmp    %ebx,%esi
 4da:	75 e4                	jne    4c0 <printint+0x70>
    putc(fd, buf[i]);
}
 4dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4df:	5b                   	pop    %ebx
 4e0:	5e                   	pop    %esi
 4e1:	5f                   	pop    %edi
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4ef:	eb 87                	jmp    478 <printint+0x28>
 4f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop

00000500 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 500:	f3 0f 1e fb          	endbr32 
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	57                   	push   %edi
 508:	56                   	push   %esi
 509:	53                   	push   %ebx
 50a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 50d:	8b 75 0c             	mov    0xc(%ebp),%esi
 510:	0f b6 1e             	movzbl (%esi),%ebx
 513:	84 db                	test   %bl,%bl
 515:	0f 84 b4 00 00 00    	je     5cf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 51b:	8d 45 10             	lea    0x10(%ebp),%eax
 51e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 521:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 524:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 526:	89 45 d0             	mov    %eax,-0x30(%ebp)
 529:	eb 33                	jmp    55e <printf+0x5e>
 52b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop
 530:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 533:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 538:	83 f8 25             	cmp    $0x25,%eax
 53b:	74 17                	je     554 <printf+0x54>
  write(fd, &c, 1);
 53d:	83 ec 04             	sub    $0x4,%esp
 540:	88 5d e7             	mov    %bl,-0x19(%ebp)
 543:	6a 01                	push   $0x1
 545:	57                   	push   %edi
 546:	ff 75 08             	pushl  0x8(%ebp)
 549:	e8 5b fe ff ff       	call   3a9 <write>
 54e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 551:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 554:	0f b6 1e             	movzbl (%esi),%ebx
 557:	83 c6 01             	add    $0x1,%esi
 55a:	84 db                	test   %bl,%bl
 55c:	74 71                	je     5cf <printf+0xcf>
    c = fmt[i] & 0xff;
 55e:	0f be cb             	movsbl %bl,%ecx
 561:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 564:	85 d2                	test   %edx,%edx
 566:	74 c8                	je     530 <printf+0x30>
      }
    } else if(state == '%'){
 568:	83 fa 25             	cmp    $0x25,%edx
 56b:	75 e7                	jne    554 <printf+0x54>
      if(c == 'd'){
 56d:	83 f8 64             	cmp    $0x64,%eax
 570:	0f 84 9a 00 00 00    	je     610 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 576:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 57c:	83 f9 70             	cmp    $0x70,%ecx
 57f:	74 5f                	je     5e0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 581:	83 f8 73             	cmp    $0x73,%eax
 584:	0f 84 d6 00 00 00    	je     660 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 58a:	83 f8 63             	cmp    $0x63,%eax
 58d:	0f 84 8d 00 00 00    	je     620 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 593:	83 f8 25             	cmp    $0x25,%eax
 596:	0f 84 b4 00 00 00    	je     650 <printf+0x150>
  write(fd, &c, 1);
 59c:	83 ec 04             	sub    $0x4,%esp
 59f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5a3:	6a 01                	push   $0x1
 5a5:	57                   	push   %edi
 5a6:	ff 75 08             	pushl  0x8(%ebp)
 5a9:	e8 fb fd ff ff       	call   3a9 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5ae:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 5b1:	83 c4 0c             	add    $0xc,%esp
 5b4:	6a 01                	push   $0x1
 5b6:	83 c6 01             	add    $0x1,%esi
 5b9:	57                   	push   %edi
 5ba:	ff 75 08             	pushl  0x8(%ebp)
 5bd:	e8 e7 fd ff ff       	call   3a9 <write>
  for(i = 0; fmt[i]; i++){
 5c2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 5c6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5c9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 5cb:	84 db                	test   %bl,%bl
 5cd:	75 8f                	jne    55e <printf+0x5e>
    }
  }
}
 5cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d2:	5b                   	pop    %ebx
 5d3:	5e                   	pop    %esi
 5d4:	5f                   	pop    %edi
 5d5:	5d                   	pop    %ebp
 5d6:	c3                   	ret    
 5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5de:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5e8:	6a 00                	push   $0x0
 5ea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5ed:	8b 45 08             	mov    0x8(%ebp),%eax
 5f0:	8b 13                	mov    (%ebx),%edx
 5f2:	e8 59 fe ff ff       	call   450 <printint>
        ap++;
 5f7:	89 d8                	mov    %ebx,%eax
 5f9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5fc:	31 d2                	xor    %edx,%edx
        ap++;
 5fe:	83 c0 04             	add    $0x4,%eax
 601:	89 45 d0             	mov    %eax,-0x30(%ebp)
 604:	e9 4b ff ff ff       	jmp    554 <printf+0x54>
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 610:	83 ec 0c             	sub    $0xc,%esp
 613:	b9 0a 00 00 00       	mov    $0xa,%ecx
 618:	6a 01                	push   $0x1
 61a:	eb ce                	jmp    5ea <printf+0xea>
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 620:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 623:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 626:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 628:	6a 01                	push   $0x1
        ap++;
 62a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 62d:	57                   	push   %edi
 62e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 631:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 634:	e8 70 fd ff ff       	call   3a9 <write>
        ap++;
 639:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 63c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 63f:	31 d2                	xor    %edx,%edx
 641:	e9 0e ff ff ff       	jmp    554 <printf+0x54>
 646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 650:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 653:	83 ec 04             	sub    $0x4,%esp
 656:	e9 59 ff ff ff       	jmp    5b4 <printf+0xb4>
 65b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop
        s = (char*)*ap;
 660:	8b 45 d0             	mov    -0x30(%ebp),%eax
 663:	8b 18                	mov    (%eax),%ebx
        ap++;
 665:	83 c0 04             	add    $0x4,%eax
 668:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 66b:	85 db                	test   %ebx,%ebx
 66d:	74 17                	je     686 <printf+0x186>
        while(*s != 0){
 66f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 672:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 674:	84 c0                	test   %al,%al
 676:	0f 84 d8 fe ff ff    	je     554 <printf+0x54>
 67c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 67f:	89 de                	mov    %ebx,%esi
 681:	8b 5d 08             	mov    0x8(%ebp),%ebx
 684:	eb 1a                	jmp    6a0 <printf+0x1a0>
          s = "(null)";
 686:	bb 8f 08 00 00       	mov    $0x88f,%ebx
        while(*s != 0){
 68b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 68e:	b8 28 00 00 00       	mov    $0x28,%eax
 693:	89 de                	mov    %ebx,%esi
 695:	8b 5d 08             	mov    0x8(%ebp),%ebx
 698:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 69f:	90                   	nop
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6a3:	83 c6 01             	add    $0x1,%esi
 6a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a9:	6a 01                	push   $0x1
 6ab:	57                   	push   %edi
 6ac:	53                   	push   %ebx
 6ad:	e8 f7 fc ff ff       	call   3a9 <write>
        while(*s != 0){
 6b2:	0f b6 06             	movzbl (%esi),%eax
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	84 c0                	test   %al,%al
 6ba:	75 e4                	jne    6a0 <printf+0x1a0>
 6bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 6bf:	31 d2                	xor    %edx,%edx
 6c1:	e9 8e fe ff ff       	jmp    554 <printf+0x54>
 6c6:	66 90                	xchg   %ax,%ax
 6c8:	66 90                	xchg   %ax,%ax
 6ca:	66 90                	xchg   %ax,%ax
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d0:	f3 0f 1e fb          	endbr32 
 6d4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d5:	a1 e4 0b 00 00       	mov    0xbe4,%eax
{
 6da:	89 e5                	mov    %esp,%ebp
 6dc:	57                   	push   %edi
 6dd:	56                   	push   %esi
 6de:	53                   	push   %ebx
 6df:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6e2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 6e4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e7:	39 c8                	cmp    %ecx,%eax
 6e9:	73 15                	jae    700 <free+0x30>
 6eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6ef:	90                   	nop
 6f0:	39 d1                	cmp    %edx,%ecx
 6f2:	72 14                	jb     708 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f4:	39 d0                	cmp    %edx,%eax
 6f6:	73 10                	jae    708 <free+0x38>
{
 6f8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fa:	8b 10                	mov    (%eax),%edx
 6fc:	39 c8                	cmp    %ecx,%eax
 6fe:	72 f0                	jb     6f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 700:	39 d0                	cmp    %edx,%eax
 702:	72 f4                	jb     6f8 <free+0x28>
 704:	39 d1                	cmp    %edx,%ecx
 706:	73 f0                	jae    6f8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70e:	39 fa                	cmp    %edi,%edx
 710:	74 1e                	je     730 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 712:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 715:	8b 50 04             	mov    0x4(%eax),%edx
 718:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 71b:	39 f1                	cmp    %esi,%ecx
 71d:	74 28                	je     747 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 71f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 721:	5b                   	pop    %ebx
  freep = p;
 722:	a3 e4 0b 00 00       	mov    %eax,0xbe4
}
 727:	5e                   	pop    %esi
 728:	5f                   	pop    %edi
 729:	5d                   	pop    %ebp
 72a:	c3                   	ret    
 72b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 72f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 730:	03 72 04             	add    0x4(%edx),%esi
 733:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 736:	8b 10                	mov    (%eax),%edx
 738:	8b 12                	mov    (%edx),%edx
 73a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 73d:	8b 50 04             	mov    0x4(%eax),%edx
 740:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 743:	39 f1                	cmp    %esi,%ecx
 745:	75 d8                	jne    71f <free+0x4f>
    p->s.size += bp->s.size;
 747:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 74a:	a3 e4 0b 00 00       	mov    %eax,0xbe4
    p->s.size += bp->s.size;
 74f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 752:	8b 53 f8             	mov    -0x8(%ebx),%edx
 755:	89 10                	mov    %edx,(%eax)
}
 757:	5b                   	pop    %ebx
 758:	5e                   	pop    %esi
 759:	5f                   	pop    %edi
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 760:	f3 0f 1e fb          	endbr32 
 764:	55                   	push   %ebp
 765:	89 e5                	mov    %esp,%ebp
 767:	57                   	push   %edi
 768:	56                   	push   %esi
 769:	53                   	push   %ebx
 76a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 76d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 770:	8b 3d e4 0b 00 00    	mov    0xbe4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 776:	8d 70 07             	lea    0x7(%eax),%esi
 779:	c1 ee 03             	shr    $0x3,%esi
 77c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 77f:	85 ff                	test   %edi,%edi
 781:	0f 84 a9 00 00 00    	je     830 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 787:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 789:	8b 48 04             	mov    0x4(%eax),%ecx
 78c:	39 f1                	cmp    %esi,%ecx
 78e:	73 6d                	jae    7fd <malloc+0x9d>
 790:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 796:	bb 00 10 00 00       	mov    $0x1000,%ebx
 79b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 79e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 7a5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 7a8:	eb 17                	jmp    7c1 <malloc+0x61>
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 7b2:	8b 4a 04             	mov    0x4(%edx),%ecx
 7b5:	39 f1                	cmp    %esi,%ecx
 7b7:	73 4f                	jae    808 <malloc+0xa8>
 7b9:	8b 3d e4 0b 00 00    	mov    0xbe4,%edi
 7bf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c1:	39 c7                	cmp    %eax,%edi
 7c3:	75 eb                	jne    7b0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 7c5:	83 ec 0c             	sub    $0xc,%esp
 7c8:	ff 75 e4             	pushl  -0x1c(%ebp)
 7cb:	e8 41 fc ff ff       	call   411 <sbrk>
  if(p == (char*)-1)
 7d0:	83 c4 10             	add    $0x10,%esp
 7d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d6:	74 1b                	je     7f3 <malloc+0x93>
  hp->s.size = nu;
 7d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7db:	83 ec 0c             	sub    $0xc,%esp
 7de:	83 c0 08             	add    $0x8,%eax
 7e1:	50                   	push   %eax
 7e2:	e8 e9 fe ff ff       	call   6d0 <free>
  return freep;
 7e7:	a1 e4 0b 00 00       	mov    0xbe4,%eax
      if((p = morecore(nunits)) == 0)
 7ec:	83 c4 10             	add    $0x10,%esp
 7ef:	85 c0                	test   %eax,%eax
 7f1:	75 bd                	jne    7b0 <malloc+0x50>
        return 0;
  }
}
 7f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7f6:	31 c0                	xor    %eax,%eax
}
 7f8:	5b                   	pop    %ebx
 7f9:	5e                   	pop    %esi
 7fa:	5f                   	pop    %edi
 7fb:	5d                   	pop    %ebp
 7fc:	c3                   	ret    
    if(p->s.size >= nunits){
 7fd:	89 c2                	mov    %eax,%edx
 7ff:	89 f8                	mov    %edi,%eax
 801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 808:	39 ce                	cmp    %ecx,%esi
 80a:	74 54                	je     860 <malloc+0x100>
        p->s.size -= nunits;
 80c:	29 f1                	sub    %esi,%ecx
 80e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 811:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 814:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 817:	a3 e4 0b 00 00       	mov    %eax,0xbe4
}
 81c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 81f:	8d 42 08             	lea    0x8(%edx),%eax
}
 822:	5b                   	pop    %ebx
 823:	5e                   	pop    %esi
 824:	5f                   	pop    %edi
 825:	5d                   	pop    %ebp
 826:	c3                   	ret    
 827:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 e4 0b 00 00 e8 	movl   $0xbe8,0xbe4
 837:	0b 00 00 
    base.s.size = 0;
 83a:	bf e8 0b 00 00       	mov    $0xbe8,%edi
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 e8 0b 00 00 e8 	movl   $0xbe8,0xbe8
 846:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 84b:	c7 05 ec 0b 00 00 00 	movl   $0x0,0xbec
 852:	00 00 00 
    if(p->s.size >= nunits){
 855:	e9 36 ff ff ff       	jmp    790 <malloc+0x30>
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 860:	8b 0a                	mov    (%edx),%ecx
 862:	89 08                	mov    %ecx,(%eax)
 864:	eb b1                	jmp    817 <malloc+0xb7>
