
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   b:	b8 30 00 00 00       	mov    $0x30,%eax
{
  10:	ff 71 fc             	pushl  -0x4(%ecx)
  13:	55                   	push   %ebp
  14:	89 e5                	mov    %esp,%ebp
  16:	57                   	push   %edi
  17:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  18:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1e:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1f:	31 db                	xor    %ebx,%ebx
{
  21:	51                   	push   %ecx
  22:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  28:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2f:	68 48 09 00 00       	push   $0x948
  34:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  36:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  3d:	74 72 65 
  40:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  47:	73 66 73 
  printf(1, "stressfs starting\n");
  4a:	e8 91 05 00 00       	call   5e0 <printf>
  memset(data, 'a', sizeof(data));
  4f:	83 c4 0c             	add    $0xc,%esp
  52:	68 00 02 00 00       	push   $0x200
  57:	6a 61                	push   $0x61
  59:	56                   	push   %esi
  5a:	e8 a1 01 00 00       	call   200 <memset>
  5f:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  62:	e8 fa 03 00 00       	call   461 <fork>
  67:	85 c0                	test   %eax,%eax
  69:	0f 8f bb 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6f:	83 c3 01             	add    $0x1,%ebx
  72:	83 fb 04             	cmp    $0x4,%ebx
  75:	75 eb                	jne    62 <main+0x62>
  77:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  7c:	83 ec 04             	sub    $0x4,%esp
  7f:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  80:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  85:	68 5b 09 00 00       	push   $0x95b
  8a:	6a 01                	push   $0x1
  8c:	e8 4f 05 00 00       	call   5e0 <printf>
  path[8] += i;
  91:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  93:	5f                   	pop    %edi
  path[8] += i;
  94:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  9a:	58                   	pop    %eax
  9b:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a1:	68 02 02 00 00       	push   $0x202
  a6:	50                   	push   %eax
  a7:	e8 fd 03 00 00       	call   4a9 <open>
  ac:	83 c4 10             	add    $0x10,%esp
  af:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b8:	83 ec 04             	sub    $0x4,%esp
  bb:	68 00 02 00 00       	push   $0x200
  c0:	56                   	push   %esi
  c1:	57                   	push   %edi
  c2:	e8 c2 03 00 00       	call   489 <write>
  for(i = 0; i < 20; i++)
  c7:	83 c4 10             	add    $0x10,%esp
  ca:	83 eb 01             	sub    $0x1,%ebx
  cd:	75 e9                	jne    b8 <main+0xb8>
  close(fd);
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	57                   	push   %edi
  d3:	e8 b9 03 00 00       	call   491 <close>

  printf(1, "read\n");
  d8:	58                   	pop    %eax
  d9:	5a                   	pop    %edx
  da:	68 65 09 00 00       	push   $0x965
  df:	6a 01                	push   $0x1
  e1:	e8 fa 04 00 00       	call   5e0 <printf>

  fd = open(path, O_RDONLY);
  e6:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  ec:	59                   	pop    %ecx
  ed:	5b                   	pop    %ebx
  ee:	6a 00                	push   $0x0
  f0:	bb 14 00 00 00       	mov    $0x14,%ebx
  f5:	50                   	push   %eax
  f6:	e8 ae 03 00 00       	call   4a9 <open>
  fb:	83 c4 10             	add    $0x10,%esp
  fe:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 72 03 00 00       	call   481 <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 71 03 00 00       	call   491 <close>

  wait();
 120:	e8 4c 03 00 00       	call   471 <wait>

  exit();
 125:	e8 3f 03 00 00       	call   469 <exit>
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 4b ff ff ff       	jmp    7c <main+0x7c>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "mmu.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 140:	f3 0f 1e fb          	endbr32 
 144:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 145:	31 c0                	xor    %eax,%eax
{
 147:	89 e5                	mov    %esp,%ebp
 149:	53                   	push   %ebx
 14a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 14d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	89 c8                	mov    %ecx,%eax
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	53                   	push   %ebx
 178:	8b 4d 08             	mov    0x8(%ebp),%ecx
 17b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 17e:	0f b6 01             	movzbl (%ecx),%eax
 181:	0f b6 1a             	movzbl (%edx),%ebx
 184:	84 c0                	test   %al,%al
 186:	75 19                	jne    1a1 <strcmp+0x31>
 188:	eb 26                	jmp    1b0 <strcmp+0x40>
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 190:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 194:	83 c1 01             	add    $0x1,%ecx
 197:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 19a:	0f b6 1a             	movzbl (%edx),%ebx
 19d:	84 c0                	test   %al,%al
 19f:	74 0f                	je     1b0 <strcmp+0x40>
 1a1:	38 d8                	cmp    %bl,%al
 1a3:	74 eb                	je     190 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1a5:	29 d8                	sub    %ebx,%eax
}
 1a7:	5b                   	pop    %ebx
 1a8:	5d                   	pop    %ebp
 1a9:	c3                   	ret    
 1aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1b2:	29 d8                	sub    %ebx,%eax
}
 1b4:	5b                   	pop    %ebx
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1be:	66 90                	xchg   %ax,%ax

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1ca:	80 3a 00             	cmpb   $0x0,(%edx)
 1cd:	74 21                	je     1f0 <strlen+0x30>
 1cf:	31 c0                	xor    %eax,%eax
 1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d8:	83 c0 01             	add    $0x1,%eax
 1db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1df:	89 c1                	mov    %eax,%ecx
 1e1:	75 f5                	jne    1d8 <strlen+0x18>
    ;
  return n;
}
 1e3:	89 c8                	mov    %ecx,%eax
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 1f0:	31 c9                	xor    %ecx,%ecx
}
 1f2:	5d                   	pop    %ebp
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 20b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20e:	8b 45 0c             	mov    0xc(%ebp),%eax
 211:	89 d7                	mov    %edx,%edi
 213:	fc                   	cld    
 214:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 216:	89 d0                	mov    %edx,%eax
 218:	5f                   	pop    %edi
 219:	5d                   	pop    %ebp
 21a:	c3                   	ret    
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22e:	0f b6 10             	movzbl (%eax),%edx
 231:	84 d2                	test   %dl,%dl
 233:	75 16                	jne    24b <strchr+0x2b>
 235:	eb 21                	jmp    258 <strchr+0x38>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax
 240:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 244:	83 c0 01             	add    $0x1,%eax
 247:	84 d2                	test   %dl,%dl
 249:	74 0d                	je     258 <strchr+0x38>
    if(*s == c)
 24b:	38 d1                	cmp    %dl,%cl
 24d:	75 f1                	jne    240 <strchr+0x20>
      return (char*)s;
  return 0;
}
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    
 251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 258:	31 c0                	xor    %eax,%eax
}
 25a:	5d                   	pop    %ebp
 25b:	c3                   	ret    
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	f3 0f 1e fb          	endbr32 
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	57                   	push   %edi
 268:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	31 f6                	xor    %esi,%esi
{
 26b:	53                   	push   %ebx
 26c:	89 f3                	mov    %esi,%ebx
 26e:	83 ec 1c             	sub    $0x1c,%esp
 271:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 274:	eb 33                	jmp    2a9 <gets+0x49>
 276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 280:	83 ec 04             	sub    $0x4,%esp
 283:	8d 45 e7             	lea    -0x19(%ebp),%eax
 286:	6a 01                	push   $0x1
 288:	50                   	push   %eax
 289:	6a 00                	push   $0x0
 28b:	e8 f1 01 00 00       	call   481 <read>
    if(cc < 1)
 290:	83 c4 10             	add    $0x10,%esp
 293:	85 c0                	test   %eax,%eax
 295:	7e 1c                	jle    2b3 <gets+0x53>
      break;
    buf[i++] = c;
 297:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 29b:	83 c7 01             	add    $0x1,%edi
 29e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2a1:	3c 0a                	cmp    $0xa,%al
 2a3:	74 23                	je     2c8 <gets+0x68>
 2a5:	3c 0d                	cmp    $0xd,%al
 2a7:	74 1f                	je     2c8 <gets+0x68>
  for(i=0; i+1 < max; ){
 2a9:	83 c3 01             	add    $0x1,%ebx
 2ac:	89 fe                	mov    %edi,%esi
 2ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2b1:	7c cd                	jl     280 <gets+0x20>
 2b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2b8:	c6 03 00             	movb   $0x0,(%ebx)
}
 2bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2be:	5b                   	pop    %ebx
 2bf:	5e                   	pop    %esi
 2c0:	5f                   	pop    %edi
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2c7:	90                   	nop
 2c8:	8b 75 08             	mov    0x8(%ebp),%esi
 2cb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ce:	01 de                	add    %ebx,%esi
 2d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2d2:	c6 03 00             	movb   $0x0,(%ebx)
}
 2d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d8:	5b                   	pop    %ebx
 2d9:	5e                   	pop    %esi
 2da:	5f                   	pop    %edi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi

000002e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2e0:	f3 0f 1e fb          	endbr32 
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	56                   	push   %esi
 2e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	6a 00                	push   $0x0
 2ee:	ff 75 08             	pushl  0x8(%ebp)
 2f1:	e8 b3 01 00 00       	call   4a9 <open>
  if(fd < 0)
 2f6:	83 c4 10             	add    $0x10,%esp
 2f9:	85 c0                	test   %eax,%eax
 2fb:	78 2b                	js     328 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 2fd:	83 ec 08             	sub    $0x8,%esp
 300:	ff 75 0c             	pushl  0xc(%ebp)
 303:	89 c3                	mov    %eax,%ebx
 305:	50                   	push   %eax
 306:	e8 b6 01 00 00       	call   4c1 <fstat>
  close(fd);
 30b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 30e:	89 c6                	mov    %eax,%esi
  close(fd);
 310:	e8 7c 01 00 00       	call   491 <close>
  return r;
 315:	83 c4 10             	add    $0x10,%esp
}
 318:	8d 65 f8             	lea    -0x8(%ebp),%esp
 31b:	89 f0                	mov    %esi,%eax
 31d:	5b                   	pop    %ebx
 31e:	5e                   	pop    %esi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 328:	be ff ff ff ff       	mov    $0xffffffff,%esi
 32d:	eb e9                	jmp    318 <stat+0x38>
 32f:	90                   	nop

00000330 <atoi>:

int
atoi(const char *s)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	53                   	push   %ebx
 338:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 33b:	0f be 02             	movsbl (%edx),%eax
 33e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 341:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 344:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 349:	77 1a                	ja     365 <atoi+0x35>
 34b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop
    n = n*10 + *s++ - '0';
 350:	83 c2 01             	add    $0x1,%edx
 353:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 356:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 35a:	0f be 02             	movsbl (%edx),%eax
 35d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 360:	80 fb 09             	cmp    $0x9,%bl
 363:	76 eb                	jbe    350 <atoi+0x20>
  return n;
}
 365:	89 c8                	mov    %ecx,%eax
 367:	5b                   	pop    %ebx
 368:	5d                   	pop    %ebp
 369:	c3                   	ret    
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	57                   	push   %edi
 378:	8b 45 10             	mov    0x10(%ebp),%eax
 37b:	8b 55 08             	mov    0x8(%ebp),%edx
 37e:	56                   	push   %esi
 37f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 382:	85 c0                	test   %eax,%eax
 384:	7e 0f                	jle    395 <memmove+0x25>
 386:	01 d0                	add    %edx,%eax
  dst = vdst;
 388:	89 d7                	mov    %edx,%edi
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 390:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 391:	39 f8                	cmp    %edi,%eax
 393:	75 fb                	jne    390 <memmove+0x20>
  return vdst;
}
 395:	5e                   	pop    %esi
 396:	89 d0                	mov    %edx,%eax
 398:	5f                   	pop    %edi
 399:	5d                   	pop    %ebp
 39a:	c3                   	ret    
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <thread_create>:

int 
thread_create(thread_t* pid,void* (*start_routine)(void *, void *),void* arg1, void* arg2){
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
 3aa:	68 00 10 00 00       	push   $0x1000
 3af:	e8 8c 04 00 00       	call   840 <malloc>
  *pid= clone(start_routine , arg1 , arg2 , stack);
 3b4:	50                   	push   %eax
 3b5:	ff 75 14             	pushl  0x14(%ebp)
 3b8:	ff 75 10             	pushl  0x10(%ebp)
 3bb:	ff 75 0c             	pushl  0xc(%ebp)
 3be:	e8 46 01 00 00       	call   509 <clone>
 3c3:	8b 55 08             	mov    0x8(%ebp),%edx
  if(*pid){
 3c6:	83 c4 20             	add    $0x20,%esp
 3c9:	85 c0                	test   %eax,%eax
  *pid= clone(start_routine , arg1 , arg2 , stack);
 3cb:	89 02                	mov    %eax,(%edx)
  if(*pid){
 3cd:	0f 94 c0             	sete   %al
    return 0; 
  }
  return -1;
}
 3d0:	c9                   	leave  
  if(*pid){
 3d1:	0f b6 c0             	movzbl %al,%eax
 3d4:	f7 d8                	neg    %eax
}
 3d6:	c3                   	ret    
 3d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3de:	66 90                	xchg   %ax,%ax

000003e0 <thread_join>:
int 
thread_join(thread_t tid,void** retval){
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	83 ec 10             	sub    $0x10,%esp
  // thread_join(thread_t pid , void **retval){
  // void* stackPtr;
  int x=join(tid,retval);
 3ea:	ff 75 0c             	pushl  0xc(%ebp)
 3ed:	ff 75 08             	pushl  0x8(%ebp)
 3f0:	e8 1c 01 00 00       	call   511 <join>
  if(x){
 3f5:	83 c4 10             	add    $0x10,%esp
    return 0;
  }
  return -1;
}
 3f8:	c9                   	leave  
  if(x){
 3f9:	85 c0                	test   %eax,%eax
 3fb:	0f 94 c0             	sete   %al
 3fe:	0f b6 c0             	movzbl %al,%eax
 401:	f7 d8                	neg    %eax
}
 403:	c3                   	ret    
 404:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop

00000410 <lock_init>:
// int
// thread_exit()

int 
lock_init(lock_t *lk){
 410:	f3 0f 1e fb          	endbr32 
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
  lk->flag=0;
 417:	8b 45 08             	mov    0x8(%ebp),%eax
 41a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 420:	31 c0                	xor    %eax,%eax
 422:	5d                   	pop    %ebp
 423:	c3                   	ret    
 424:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop

00000430 <lock_acquire>:
void 
lock_acquire(lock_t *lk){
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 435:	b9 01 00 00 00       	mov    $0x1,%ecx
 43a:	89 e5                	mov    %esp,%ebp
 43c:	8b 55 08             	mov    0x8(%ebp),%edx
 43f:	90                   	nop
 440:	89 c8                	mov    %ecx,%eax
 442:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lk->flag,1)!=0);
 445:	85 c0                	test   %eax,%eax
 447:	75 f7                	jne    440 <lock_acquire+0x10>
}
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret    
 44b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 44f:	90                   	nop

00000450 <lock_release>:
void 
lock_release(lock_t *lk){
 450:	f3 0f 1e fb          	endbr32 
 454:	55                   	push   %ebp
 455:	31 c0                	xor    %eax,%eax
 457:	89 e5                	mov    %esp,%ebp
 459:	8b 55 08             	mov    0x8(%ebp),%edx
 45c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->flag,0);
}
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret    

00000461 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 461:	b8 01 00 00 00       	mov    $0x1,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <exit>:
SYSCALL(exit)
 469:	b8 02 00 00 00       	mov    $0x2,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <wait>:
SYSCALL(wait)
 471:	b8 03 00 00 00       	mov    $0x3,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <pipe>:
SYSCALL(pipe)
 479:	b8 04 00 00 00       	mov    $0x4,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <read>:
SYSCALL(read)
 481:	b8 05 00 00 00       	mov    $0x5,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <write>:
SYSCALL(write)
 489:	b8 10 00 00 00       	mov    $0x10,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <close>:
SYSCALL(close)
 491:	b8 15 00 00 00       	mov    $0x15,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <kill>:
SYSCALL(kill)
 499:	b8 06 00 00 00       	mov    $0x6,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <exec>:
SYSCALL(exec)
 4a1:	b8 07 00 00 00       	mov    $0x7,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <open>:
SYSCALL(open)
 4a9:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <mknod>:
SYSCALL(mknod)
 4b1:	b8 11 00 00 00       	mov    $0x11,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <unlink>:
SYSCALL(unlink)
 4b9:	b8 12 00 00 00       	mov    $0x12,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <fstat>:
SYSCALL(fstat)
 4c1:	b8 08 00 00 00       	mov    $0x8,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <link>:
SYSCALL(link)
 4c9:	b8 13 00 00 00       	mov    $0x13,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <mkdir>:
SYSCALL(mkdir)
 4d1:	b8 14 00 00 00       	mov    $0x14,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <chdir>:
SYSCALL(chdir)
 4d9:	b8 09 00 00 00       	mov    $0x9,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <dup>:
SYSCALL(dup)
 4e1:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <getpid>:
SYSCALL(getpid)
 4e9:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <sbrk>:
SYSCALL(sbrk)
 4f1:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <sleep>:
SYSCALL(sleep)
 4f9:	b8 0d 00 00 00       	mov    $0xd,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <uptime>:
SYSCALL(uptime)
 501:	b8 0e 00 00 00       	mov    $0xe,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <clone>:
SYSCALL(clone)
 509:	b8 16 00 00 00       	mov    $0x16,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <join>:
SYSCALL(join)
 511:	b8 17 00 00 00       	mov    $0x17,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <thread_exit>:
 519:	b8 18 00 00 00       	mov    $0x18,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    
 521:	66 90                	xchg   %ax,%ax
 523:	66 90                	xchg   %ax,%ax
 525:	66 90                	xchg   %ax,%ax
 527:	66 90                	xchg   %ax,%ax
 529:	66 90                	xchg   %ax,%ax
 52b:	66 90                	xchg   %ax,%ax
 52d:	66 90                	xchg   %ax,%ax
 52f:	90                   	nop

00000530 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 3c             	sub    $0x3c,%esp
 539:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 53c:	89 d1                	mov    %edx,%ecx
{
 53e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 541:	85 d2                	test   %edx,%edx
 543:	0f 89 7f 00 00 00    	jns    5c8 <printint+0x98>
 549:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 54d:	74 79                	je     5c8 <printint+0x98>
    neg = 1;
 54f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 556:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 558:	31 db                	xor    %ebx,%ebx
 55a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 560:	89 c8                	mov    %ecx,%eax
 562:	31 d2                	xor    %edx,%edx
 564:	89 cf                	mov    %ecx,%edi
 566:	f7 75 c4             	divl   -0x3c(%ebp)
 569:	0f b6 92 74 09 00 00 	movzbl 0x974(%edx),%edx
 570:	89 45 c0             	mov    %eax,-0x40(%ebp)
 573:	89 d8                	mov    %ebx,%eax
 575:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 578:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 57b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 57e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 581:	76 dd                	jbe    560 <printint+0x30>
  if(neg)
 583:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 586:	85 c9                	test   %ecx,%ecx
 588:	74 0c                	je     596 <printint+0x66>
    buf[i++] = '-';
 58a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 58f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 591:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 596:	8b 7d b8             	mov    -0x48(%ebp),%edi
 599:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 59d:	eb 07                	jmp    5a6 <printint+0x76>
 59f:	90                   	nop
 5a0:	0f b6 13             	movzbl (%ebx),%edx
 5a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5a6:	83 ec 04             	sub    $0x4,%esp
 5a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5ac:	6a 01                	push   $0x1
 5ae:	56                   	push   %esi
 5af:	57                   	push   %edi
 5b0:	e8 d4 fe ff ff       	call   489 <write>
  while(--i >= 0)
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	39 de                	cmp    %ebx,%esi
 5ba:	75 e4                	jne    5a0 <printint+0x70>
    putc(fd, buf[i]);
}
 5bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bf:	5b                   	pop    %ebx
 5c0:	5e                   	pop    %esi
 5c1:	5f                   	pop    %edi
 5c2:	5d                   	pop    %ebp
 5c3:	c3                   	ret    
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5cf:	eb 87                	jmp    558 <printint+0x28>
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e0:	f3 0f 1e fb          	endbr32 
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	57                   	push   %edi
 5e8:	56                   	push   %esi
 5e9:	53                   	push   %ebx
 5ea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5ed:	8b 75 0c             	mov    0xc(%ebp),%esi
 5f0:	0f b6 1e             	movzbl (%esi),%ebx
 5f3:	84 db                	test   %bl,%bl
 5f5:	0f 84 b4 00 00 00    	je     6af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 5fb:	8d 45 10             	lea    0x10(%ebp),%eax
 5fe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 601:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 604:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 606:	89 45 d0             	mov    %eax,-0x30(%ebp)
 609:	eb 33                	jmp    63e <printf+0x5e>
 60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop
 610:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 613:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 618:	83 f8 25             	cmp    $0x25,%eax
 61b:	74 17                	je     634 <printf+0x54>
  write(fd, &c, 1);
 61d:	83 ec 04             	sub    $0x4,%esp
 620:	88 5d e7             	mov    %bl,-0x19(%ebp)
 623:	6a 01                	push   $0x1
 625:	57                   	push   %edi
 626:	ff 75 08             	pushl  0x8(%ebp)
 629:	e8 5b fe ff ff       	call   489 <write>
 62e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 631:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 634:	0f b6 1e             	movzbl (%esi),%ebx
 637:	83 c6 01             	add    $0x1,%esi
 63a:	84 db                	test   %bl,%bl
 63c:	74 71                	je     6af <printf+0xcf>
    c = fmt[i] & 0xff;
 63e:	0f be cb             	movsbl %bl,%ecx
 641:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 644:	85 d2                	test   %edx,%edx
 646:	74 c8                	je     610 <printf+0x30>
      }
    } else if(state == '%'){
 648:	83 fa 25             	cmp    $0x25,%edx
 64b:	75 e7                	jne    634 <printf+0x54>
      if(c == 'd'){
 64d:	83 f8 64             	cmp    $0x64,%eax
 650:	0f 84 9a 00 00 00    	je     6f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 656:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 65c:	83 f9 70             	cmp    $0x70,%ecx
 65f:	74 5f                	je     6c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 661:	83 f8 73             	cmp    $0x73,%eax
 664:	0f 84 d6 00 00 00    	je     740 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 66a:	83 f8 63             	cmp    $0x63,%eax
 66d:	0f 84 8d 00 00 00    	je     700 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 673:	83 f8 25             	cmp    $0x25,%eax
 676:	0f 84 b4 00 00 00    	je     730 <printf+0x150>
  write(fd, &c, 1);
 67c:	83 ec 04             	sub    $0x4,%esp
 67f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 683:	6a 01                	push   $0x1
 685:	57                   	push   %edi
 686:	ff 75 08             	pushl  0x8(%ebp)
 689:	e8 fb fd ff ff       	call   489 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 68e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 691:	83 c4 0c             	add    $0xc,%esp
 694:	6a 01                	push   $0x1
 696:	83 c6 01             	add    $0x1,%esi
 699:	57                   	push   %edi
 69a:	ff 75 08             	pushl  0x8(%ebp)
 69d:	e8 e7 fd ff ff       	call   489 <write>
  for(i = 0; fmt[i]; i++){
 6a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6ab:	84 db                	test   %bl,%bl
 6ad:	75 8f                	jne    63e <printf+0x5e>
    }
  }
}
 6af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6b2:	5b                   	pop    %ebx
 6b3:	5e                   	pop    %esi
 6b4:	5f                   	pop    %edi
 6b5:	5d                   	pop    %ebp
 6b6:	c3                   	ret    
 6b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6c8:	6a 00                	push   $0x0
 6ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	8b 13                	mov    (%ebx),%edx
 6d2:	e8 59 fe ff ff       	call   530 <printint>
        ap++;
 6d7:	89 d8                	mov    %ebx,%eax
 6d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6dc:	31 d2                	xor    %edx,%edx
        ap++;
 6de:	83 c0 04             	add    $0x4,%eax
 6e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e4:	e9 4b ff ff ff       	jmp    634 <printf+0x54>
 6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 6f0:	83 ec 0c             	sub    $0xc,%esp
 6f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f8:	6a 01                	push   $0x1
 6fa:	eb ce                	jmp    6ca <printf+0xea>
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 700:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 703:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 706:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 708:	6a 01                	push   $0x1
        ap++;
 70a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 70d:	57                   	push   %edi
 70e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 711:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 714:	e8 70 fd ff ff       	call   489 <write>
        ap++;
 719:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 71c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 71f:	31 d2                	xor    %edx,%edx
 721:	e9 0e ff ff ff       	jmp    634 <printf+0x54>
 726:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 730:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 733:	83 ec 04             	sub    $0x4,%esp
 736:	e9 59 ff ff ff       	jmp    694 <printf+0xb4>
 73b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 73f:	90                   	nop
        s = (char*)*ap;
 740:	8b 45 d0             	mov    -0x30(%ebp),%eax
 743:	8b 18                	mov    (%eax),%ebx
        ap++;
 745:	83 c0 04             	add    $0x4,%eax
 748:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 74b:	85 db                	test   %ebx,%ebx
 74d:	74 17                	je     766 <printf+0x186>
        while(*s != 0){
 74f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 752:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 754:	84 c0                	test   %al,%al
 756:	0f 84 d8 fe ff ff    	je     634 <printf+0x54>
 75c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 75f:	89 de                	mov    %ebx,%esi
 761:	8b 5d 08             	mov    0x8(%ebp),%ebx
 764:	eb 1a                	jmp    780 <printf+0x1a0>
          s = "(null)";
 766:	bb 6b 09 00 00       	mov    $0x96b,%ebx
        while(*s != 0){
 76b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 76e:	b8 28 00 00 00       	mov    $0x28,%eax
 773:	89 de                	mov    %ebx,%esi
 775:	8b 5d 08             	mov    0x8(%ebp),%ebx
 778:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77f:	90                   	nop
  write(fd, &c, 1);
 780:	83 ec 04             	sub    $0x4,%esp
          s++;
 783:	83 c6 01             	add    $0x1,%esi
 786:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 789:	6a 01                	push   $0x1
 78b:	57                   	push   %edi
 78c:	53                   	push   %ebx
 78d:	e8 f7 fc ff ff       	call   489 <write>
        while(*s != 0){
 792:	0f b6 06             	movzbl (%esi),%eax
 795:	83 c4 10             	add    $0x10,%esp
 798:	84 c0                	test   %al,%al
 79a:	75 e4                	jne    780 <printf+0x1a0>
 79c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 79f:	31 d2                	xor    %edx,%edx
 7a1:	e9 8e fe ff ff       	jmp    634 <printf+0x54>
 7a6:	66 90                	xchg   %ax,%ax
 7a8:	66 90                	xchg   %ax,%ax
 7aa:	66 90                	xchg   %ax,%ax
 7ac:	66 90                	xchg   %ax,%ax
 7ae:	66 90                	xchg   %ax,%ax

000007b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7b0:	f3 0f 1e fb          	endbr32 
 7b4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b5:	a1 cc 0c 00 00       	mov    0xccc,%eax
{
 7ba:	89 e5                	mov    %esp,%ebp
 7bc:	57                   	push   %edi
 7bd:	56                   	push   %esi
 7be:	53                   	push   %ebx
 7bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7c2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 7c4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c7:	39 c8                	cmp    %ecx,%eax
 7c9:	73 15                	jae    7e0 <free+0x30>
 7cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
 7d0:	39 d1                	cmp    %edx,%ecx
 7d2:	72 14                	jb     7e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d4:	39 d0                	cmp    %edx,%eax
 7d6:	73 10                	jae    7e8 <free+0x38>
{
 7d8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7da:	8b 10                	mov    (%eax),%edx
 7dc:	39 c8                	cmp    %ecx,%eax
 7de:	72 f0                	jb     7d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e0:	39 d0                	cmp    %edx,%eax
 7e2:	72 f4                	jb     7d8 <free+0x28>
 7e4:	39 d1                	cmp    %edx,%ecx
 7e6:	73 f0                	jae    7d8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ee:	39 fa                	cmp    %edi,%edx
 7f0:	74 1e                	je     810 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7f5:	8b 50 04             	mov    0x4(%eax),%edx
 7f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7fb:	39 f1                	cmp    %esi,%ecx
 7fd:	74 28                	je     827 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 801:	5b                   	pop    %ebx
  freep = p;
 802:	a3 cc 0c 00 00       	mov    %eax,0xccc
}
 807:	5e                   	pop    %esi
 808:	5f                   	pop    %edi
 809:	5d                   	pop    %ebp
 80a:	c3                   	ret    
 80b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 810:	03 72 04             	add    0x4(%edx),%esi
 813:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 816:	8b 10                	mov    (%eax),%edx
 818:	8b 12                	mov    (%edx),%edx
 81a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 81d:	8b 50 04             	mov    0x4(%eax),%edx
 820:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 823:	39 f1                	cmp    %esi,%ecx
 825:	75 d8                	jne    7ff <free+0x4f>
    p->s.size += bp->s.size;
 827:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 82a:	a3 cc 0c 00 00       	mov    %eax,0xccc
    p->s.size += bp->s.size;
 82f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 832:	8b 53 f8             	mov    -0x8(%ebx),%edx
 835:	89 10                	mov    %edx,(%eax)
}
 837:	5b                   	pop    %ebx
 838:	5e                   	pop    %esi
 839:	5f                   	pop    %edi
 83a:	5d                   	pop    %ebp
 83b:	c3                   	ret    
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000840 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 840:	f3 0f 1e fb          	endbr32 
 844:	55                   	push   %ebp
 845:	89 e5                	mov    %esp,%ebp
 847:	57                   	push   %edi
 848:	56                   	push   %esi
 849:	53                   	push   %ebx
 84a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 84d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 850:	8b 3d cc 0c 00 00    	mov    0xccc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 856:	8d 70 07             	lea    0x7(%eax),%esi
 859:	c1 ee 03             	shr    $0x3,%esi
 85c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 85f:	85 ff                	test   %edi,%edi
 861:	0f 84 a9 00 00 00    	je     910 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 867:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 869:	8b 48 04             	mov    0x4(%eax),%ecx
 86c:	39 f1                	cmp    %esi,%ecx
 86e:	73 6d                	jae    8dd <malloc+0x9d>
 870:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 876:	bb 00 10 00 00       	mov    $0x1000,%ebx
 87b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 87e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 885:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 888:	eb 17                	jmp    8a1 <malloc+0x61>
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 890:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 892:	8b 4a 04             	mov    0x4(%edx),%ecx
 895:	39 f1                	cmp    %esi,%ecx
 897:	73 4f                	jae    8e8 <malloc+0xa8>
 899:	8b 3d cc 0c 00 00    	mov    0xccc,%edi
 89f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8a1:	39 c7                	cmp    %eax,%edi
 8a3:	75 eb                	jne    890 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 8a5:	83 ec 0c             	sub    $0xc,%esp
 8a8:	ff 75 e4             	pushl  -0x1c(%ebp)
 8ab:	e8 41 fc ff ff       	call   4f1 <sbrk>
  if(p == (char*)-1)
 8b0:	83 c4 10             	add    $0x10,%esp
 8b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 8b6:	74 1b                	je     8d3 <malloc+0x93>
  hp->s.size = nu;
 8b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8bb:	83 ec 0c             	sub    $0xc,%esp
 8be:	83 c0 08             	add    $0x8,%eax
 8c1:	50                   	push   %eax
 8c2:	e8 e9 fe ff ff       	call   7b0 <free>
  return freep;
 8c7:	a1 cc 0c 00 00       	mov    0xccc,%eax
      if((p = morecore(nunits)) == 0)
 8cc:	83 c4 10             	add    $0x10,%esp
 8cf:	85 c0                	test   %eax,%eax
 8d1:	75 bd                	jne    890 <malloc+0x50>
        return 0;
  }
}
 8d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8d6:	31 c0                	xor    %eax,%eax
}
 8d8:	5b                   	pop    %ebx
 8d9:	5e                   	pop    %esi
 8da:	5f                   	pop    %edi
 8db:	5d                   	pop    %ebp
 8dc:	c3                   	ret    
    if(p->s.size >= nunits){
 8dd:	89 c2                	mov    %eax,%edx
 8df:	89 f8                	mov    %edi,%eax
 8e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 8e8:	39 ce                	cmp    %ecx,%esi
 8ea:	74 54                	je     940 <malloc+0x100>
        p->s.size -= nunits;
 8ec:	29 f1                	sub    %esi,%ecx
 8ee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 8f1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 8f4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 8f7:	a3 cc 0c 00 00       	mov    %eax,0xccc
}
 8fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8ff:	8d 42 08             	lea    0x8(%edx),%eax
}
 902:	5b                   	pop    %ebx
 903:	5e                   	pop    %esi
 904:	5f                   	pop    %edi
 905:	5d                   	pop    %ebp
 906:	c3                   	ret    
 907:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 910:	c7 05 cc 0c 00 00 d0 	movl   $0xcd0,0xccc
 917:	0c 00 00 
    base.s.size = 0;
 91a:	bf d0 0c 00 00       	mov    $0xcd0,%edi
    base.s.ptr = freep = prevp = &base;
 91f:	c7 05 d0 0c 00 00 d0 	movl   $0xcd0,0xcd0
 926:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 929:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 92b:	c7 05 d4 0c 00 00 00 	movl   $0x0,0xcd4
 932:	00 00 00 
    if(p->s.size >= nunits){
 935:	e9 36 ff ff ff       	jmp    870 <malloc+0x30>
 93a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 940:	8b 0a                	mov    (%edx),%ecx
 942:	89 08                	mov    %ecx,(%eax)
 944:	eb b1                	jmp    8f7 <malloc+0xb7>
