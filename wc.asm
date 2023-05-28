
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	be 01 00 00 00       	mov    $0x1,%esi
  18:	53                   	push   %ebx
  19:	51                   	push   %ecx
  1a:	83 ec 18             	sub    $0x18,%esp
  1d:	8b 01                	mov    (%ecx),%eax
  1f:	8b 59 04             	mov    0x4(%ecx),%ebx
  22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  25:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  28:	83 f8 01             	cmp    $0x1,%eax
  2b:	7e 52                	jle    7f <main+0x7f>
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 bd 04 00 00       	call   4f9 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 83 04 00 00       	call   4e1 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 4e 04 00 00       	call   4b9 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 bb 09 00 00       	push   $0x9bb
  73:	6a 01                	push   $0x1
  75:	e8 b6 05 00 00       	call   630 <printf>
      exit();
  7a:	e8 3a 04 00 00       	call   4b9 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 ad 09 00 00       	push   $0x9ad
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 27 04 00 00       	call   4b9 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	f3 0f 1e fb          	endbr32 
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	57                   	push   %edi
  a8:	56                   	push   %esi
  a9:	53                   	push   %ebx
  l = w = c = 0;
  aa:	31 db                	xor    %ebx,%ebx
{
  ac:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  bd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c8:	83 ec 04             	sub    $0x4,%esp
  cb:	68 00 02 00 00       	push   $0x200
  d0:	68 80 0d 00 00       	push   $0xd80
  d5:	ff 75 08             	pushl  0x8(%ebp)
  d8:	e8 f4 03 00 00       	call   4d1 <read>
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	89 c6                	mov    %eax,%esi
  e2:	85 c0                	test   %eax,%eax
  e4:	7e 62                	jle    148 <wc+0xa8>
    for(i=0; i<n; i++){
  e6:	31 ff                	xor    %edi,%edi
  e8:	eb 14                	jmp    fe <wc+0x5e>
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  f7:	83 c7 01             	add    $0x1,%edi
  fa:	39 fe                	cmp    %edi,%esi
  fc:	74 42                	je     140 <wc+0xa0>
      if(buf[i] == '\n')
  fe:	0f be 87 80 0d 00 00 	movsbl 0xd80(%edi),%eax
        l++;
 105:	31 c9                	xor    %ecx,%ecx
 107:	3c 0a                	cmp    $0xa,%al
 109:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 10c:	83 ec 08             	sub    $0x8,%esp
 10f:	50                   	push   %eax
        l++;
 110:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 112:	68 98 09 00 00       	push   $0x998
 117:	e8 54 01 00 00       	call   270 <strchr>
 11c:	83 c4 10             	add    $0x10,%esp
 11f:	85 c0                	test   %eax,%eax
 121:	75 cd                	jne    f0 <wc+0x50>
      else if(!inword){
 123:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 126:	85 d2                	test   %edx,%edx
 128:	75 cd                	jne    f7 <wc+0x57>
    for(i=0; i<n; i++){
 12a:	83 c7 01             	add    $0x1,%edi
        w++;
 12d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 131:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 138:	39 fe                	cmp    %edi,%esi
 13a:	75 c2                	jne    fe <wc+0x5e>
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	01 75 dc             	add    %esi,-0x24(%ebp)
 143:	eb 83                	jmp    c8 <wc+0x28>
 145:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 148:	75 24                	jne    16e <wc+0xce>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 14a:	83 ec 08             	sub    $0x8,%esp
 14d:	ff 75 0c             	pushl  0xc(%ebp)
 150:	ff 75 dc             	pushl  -0x24(%ebp)
 153:	ff 75 e0             	pushl  -0x20(%ebp)
 156:	53                   	push   %ebx
 157:	68 ae 09 00 00       	push   $0x9ae
 15c:	6a 01                	push   $0x1
 15e:	e8 cd 04 00 00       	call   630 <printf>
}
 163:	83 c4 20             	add    $0x20,%esp
 166:	8d 65 f4             	lea    -0xc(%ebp),%esp
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
    printf(1, "wc: read error\n");
 16e:	50                   	push   %eax
 16f:	50                   	push   %eax
 170:	68 9e 09 00 00       	push   $0x99e
 175:	6a 01                	push   $0x1
 177:	e8 b4 04 00 00       	call   630 <printf>
    exit();
 17c:	e8 38 03 00 00       	call   4b9 <exit>
 181:	66 90                	xchg   %ax,%ax
 183:	66 90                	xchg   %ax,%ax
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "mmu.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 195:	31 c0                	xor    %eax,%eax
{
 197:	89 e5                	mov    %esp,%ebp
 199:	53                   	push   %ebx
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 1a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1a7:	83 c0 01             	add    $0x1,%eax
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	89 c8                	mov    %ecx,%eax
 1b0:	5b                   	pop    %ebx
 1b1:	5d                   	pop    %ebp
 1b2:	c3                   	ret    
 1b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	f3 0f 1e fb          	endbr32 
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	53                   	push   %ebx
 1c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1ce:	0f b6 01             	movzbl (%ecx),%eax
 1d1:	0f b6 1a             	movzbl (%edx),%ebx
 1d4:	84 c0                	test   %al,%al
 1d6:	75 19                	jne    1f1 <strcmp+0x31>
 1d8:	eb 26                	jmp    200 <strcmp+0x40>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1e4:	83 c1 01             	add    $0x1,%ecx
 1e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1ea:	0f b6 1a             	movzbl (%edx),%ebx
 1ed:	84 c0                	test   %al,%al
 1ef:	74 0f                	je     200 <strcmp+0x40>
 1f1:	38 d8                	cmp    %bl,%al
 1f3:	74 eb                	je     1e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1f5:	29 d8                	sub    %ebx,%eax
}
 1f7:	5b                   	pop    %ebx
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 200:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 202:	29 d8                	sub    %ebx,%eax
}
 204:	5b                   	pop    %ebx
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	f3 0f 1e fb          	endbr32 
 214:	55                   	push   %ebp
 215:	89 e5                	mov    %esp,%ebp
 217:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 21a:	80 3a 00             	cmpb   $0x0,(%edx)
 21d:	74 21                	je     240 <strlen+0x30>
 21f:	31 c0                	xor    %eax,%eax
 221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 228:	83 c0 01             	add    $0x1,%eax
 22b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 22f:	89 c1                	mov    %eax,%ecx
 231:	75 f5                	jne    228 <strlen+0x18>
    ;
  return n;
}
 233:	89 c8                	mov    %ecx,%eax
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	f3 0f 1e fb          	endbr32 
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	57                   	push   %edi
 258:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 25b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	89 d7                	mov    %edx,%edi
 263:	fc                   	cld    
 264:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    
 26b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27e:	0f b6 10             	movzbl (%eax),%edx
 281:	84 d2                	test   %dl,%dl
 283:	75 16                	jne    29b <strchr+0x2b>
 285:	eb 21                	jmp    2a8 <strchr+0x38>
 287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28e:	66 90                	xchg   %ax,%ax
 290:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 294:	83 c0 01             	add    $0x1,%eax
 297:	84 d2                	test   %dl,%dl
 299:	74 0d                	je     2a8 <strchr+0x38>
    if(*s == c)
 29b:	38 d1                	cmp    %dl,%cl
 29d:	75 f1                	jne    290 <strchr+0x20>
      return (char*)s;
  return 0;
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a8:	31 c0                	xor    %eax,%eax
}
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    
 2ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b9:	31 f6                	xor    %esi,%esi
{
 2bb:	53                   	push   %ebx
 2bc:	89 f3                	mov    %esi,%ebx
 2be:	83 ec 1c             	sub    $0x1c,%esp
 2c1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 2c4:	eb 33                	jmp    2f9 <gets+0x49>
 2c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2d6:	6a 01                	push   $0x1
 2d8:	50                   	push   %eax
 2d9:	6a 00                	push   $0x0
 2db:	e8 f1 01 00 00       	call   4d1 <read>
    if(cc < 1)
 2e0:	83 c4 10             	add    $0x10,%esp
 2e3:	85 c0                	test   %eax,%eax
 2e5:	7e 1c                	jle    303 <gets+0x53>
      break;
    buf[i++] = c;
 2e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2eb:	83 c7 01             	add    $0x1,%edi
 2ee:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2f1:	3c 0a                	cmp    $0xa,%al
 2f3:	74 23                	je     318 <gets+0x68>
 2f5:	3c 0d                	cmp    $0xd,%al
 2f7:	74 1f                	je     318 <gets+0x68>
  for(i=0; i+1 < max; ){
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	89 fe                	mov    %edi,%esi
 2fe:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 301:	7c cd                	jl     2d0 <gets+0x20>
 303:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 305:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 308:	c6 03 00             	movb   $0x0,(%ebx)
}
 30b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30e:	5b                   	pop    %ebx
 30f:	5e                   	pop    %esi
 310:	5f                   	pop    %edi
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 317:	90                   	nop
 318:	8b 75 08             	mov    0x8(%ebp),%esi
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	01 de                	add    %ebx,%esi
 320:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 322:	c6 03 00             	movb   $0x0,(%ebx)
}
 325:	8d 65 f4             	lea    -0xc(%ebp),%esp
 328:	5b                   	pop    %ebx
 329:	5e                   	pop    %esi
 32a:	5f                   	pop    %edi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	f3 0f 1e fb          	endbr32 
 334:	55                   	push   %ebp
 335:	89 e5                	mov    %esp,%ebp
 337:	56                   	push   %esi
 338:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	6a 00                	push   $0x0
 33e:	ff 75 08             	pushl  0x8(%ebp)
 341:	e8 b3 01 00 00       	call   4f9 <open>
  if(fd < 0)
 346:	83 c4 10             	add    $0x10,%esp
 349:	85 c0                	test   %eax,%eax
 34b:	78 2b                	js     378 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 34d:	83 ec 08             	sub    $0x8,%esp
 350:	ff 75 0c             	pushl  0xc(%ebp)
 353:	89 c3                	mov    %eax,%ebx
 355:	50                   	push   %eax
 356:	e8 b6 01 00 00       	call   511 <fstat>
  close(fd);
 35b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35e:	89 c6                	mov    %eax,%esi
  close(fd);
 360:	e8 7c 01 00 00       	call   4e1 <close>
  return r;
 365:	83 c4 10             	add    $0x10,%esp
}
 368:	8d 65 f8             	lea    -0x8(%ebp),%esp
 36b:	89 f0                	mov    %esi,%eax
 36d:	5b                   	pop    %ebx
 36e:	5e                   	pop    %esi
 36f:	5d                   	pop    %ebp
 370:	c3                   	ret    
 371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 378:	be ff ff ff ff       	mov    $0xffffffff,%esi
 37d:	eb e9                	jmp    368 <stat+0x38>
 37f:	90                   	nop

00000380 <atoi>:

int
atoi(const char *s)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	53                   	push   %ebx
 388:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 38b:	0f be 02             	movsbl (%edx),%eax
 38e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 391:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 394:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 399:	77 1a                	ja     3b5 <atoi+0x35>
 39b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop
    n = n*10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	89 c8                	mov    %ecx,%eax
 3b7:	5b                   	pop    %ebx
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    
 3ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	8b 45 10             	mov    0x10(%ebp),%eax
 3cb:	8b 55 08             	mov    0x8(%ebp),%edx
 3ce:	56                   	push   %esi
 3cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d2:	85 c0                	test   %eax,%eax
 3d4:	7e 0f                	jle    3e5 <memmove+0x25>
 3d6:	01 d0                	add    %edx,%eax
  dst = vdst;
 3d8:	89 d7                	mov    %edx,%edi
 3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <thread_create>:

int 
thread_create(thread_t* pid,void* (*start_routine)(void *, void *),void* arg1, void* arg2){
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
 3fa:	68 00 10 00 00       	push   $0x1000
 3ff:	e8 8c 04 00 00       	call   890 <malloc>
  *pid= clone(start_routine , arg1 , arg2 , stack);
 404:	50                   	push   %eax
 405:	ff 75 14             	pushl  0x14(%ebp)
 408:	ff 75 10             	pushl  0x10(%ebp)
 40b:	ff 75 0c             	pushl  0xc(%ebp)
 40e:	e8 46 01 00 00       	call   559 <clone>
 413:	8b 55 08             	mov    0x8(%ebp),%edx
  if(*pid){
 416:	83 c4 20             	add    $0x20,%esp
 419:	85 c0                	test   %eax,%eax
  *pid= clone(start_routine , arg1 , arg2 , stack);
 41b:	89 02                	mov    %eax,(%edx)
  if(*pid){
 41d:	0f 94 c0             	sete   %al
    return 0; 
  }
  return -1;
}
 420:	c9                   	leave  
  if(*pid){
 421:	0f b6 c0             	movzbl %al,%eax
 424:	f7 d8                	neg    %eax
}
 426:	c3                   	ret    
 427:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42e:	66 90                	xchg   %ax,%ax

00000430 <thread_join>:
int 
thread_join(thread_t tid,void** retval){
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	83 ec 10             	sub    $0x10,%esp
  // thread_join(thread_t pid , void **retval){
  // void* stackPtr;
  int x=join(tid,retval);
 43a:	ff 75 0c             	pushl  0xc(%ebp)
 43d:	ff 75 08             	pushl  0x8(%ebp)
 440:	e8 1c 01 00 00       	call   561 <join>
  if(x){
 445:	83 c4 10             	add    $0x10,%esp
    return 0;
  }
  return -1;
}
 448:	c9                   	leave  
  if(x){
 449:	85 c0                	test   %eax,%eax
 44b:	0f 94 c0             	sete   %al
 44e:	0f b6 c0             	movzbl %al,%eax
 451:	f7 d8                	neg    %eax
}
 453:	c3                   	ret    
 454:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 45f:	90                   	nop

00000460 <lock_init>:
// int
// thread_exit()

int 
lock_init(lock_t *lk){
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
  lk->flag=0;
 467:	8b 45 08             	mov    0x8(%ebp),%eax
 46a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 470:	31 c0                	xor    %eax,%eax
 472:	5d                   	pop    %ebp
 473:	c3                   	ret    
 474:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <lock_acquire>:
void 
lock_acquire(lock_t *lk){
 480:	f3 0f 1e fb          	endbr32 
 484:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 485:	b9 01 00 00 00       	mov    $0x1,%ecx
 48a:	89 e5                	mov    %esp,%ebp
 48c:	8b 55 08             	mov    0x8(%ebp),%edx
 48f:	90                   	nop
 490:	89 c8                	mov    %ecx,%eax
 492:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lk->flag,1)!=0);
 495:	85 c0                	test   %eax,%eax
 497:	75 f7                	jne    490 <lock_acquire+0x10>
}
 499:	5d                   	pop    %ebp
 49a:	c3                   	ret    
 49b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <lock_release>:
void 
lock_release(lock_t *lk){
 4a0:	f3 0f 1e fb          	endbr32 
 4a4:	55                   	push   %ebp
 4a5:	31 c0                	xor    %eax,%eax
 4a7:	89 e5                	mov    %esp,%ebp
 4a9:	8b 55 08             	mov    0x8(%ebp),%edx
 4ac:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->flag,0);
}
 4af:	5d                   	pop    %ebp
 4b0:	c3                   	ret    

000004b1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4b1:	b8 01 00 00 00       	mov    $0x1,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <exit>:
SYSCALL(exit)
 4b9:	b8 02 00 00 00       	mov    $0x2,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <wait>:
SYSCALL(wait)
 4c1:	b8 03 00 00 00       	mov    $0x3,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <pipe>:
SYSCALL(pipe)
 4c9:	b8 04 00 00 00       	mov    $0x4,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <read>:
SYSCALL(read)
 4d1:	b8 05 00 00 00       	mov    $0x5,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <write>:
SYSCALL(write)
 4d9:	b8 10 00 00 00       	mov    $0x10,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <close>:
SYSCALL(close)
 4e1:	b8 15 00 00 00       	mov    $0x15,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <kill>:
SYSCALL(kill)
 4e9:	b8 06 00 00 00       	mov    $0x6,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <exec>:
SYSCALL(exec)
 4f1:	b8 07 00 00 00       	mov    $0x7,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <open>:
SYSCALL(open)
 4f9:	b8 0f 00 00 00       	mov    $0xf,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <mknod>:
SYSCALL(mknod)
 501:	b8 11 00 00 00       	mov    $0x11,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <unlink>:
SYSCALL(unlink)
 509:	b8 12 00 00 00       	mov    $0x12,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <fstat>:
SYSCALL(fstat)
 511:	b8 08 00 00 00       	mov    $0x8,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <link>:
SYSCALL(link)
 519:	b8 13 00 00 00       	mov    $0x13,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <mkdir>:
SYSCALL(mkdir)
 521:	b8 14 00 00 00       	mov    $0x14,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <chdir>:
SYSCALL(chdir)
 529:	b8 09 00 00 00       	mov    $0x9,%eax
 52e:	cd 40                	int    $0x40
 530:	c3                   	ret    

00000531 <dup>:
SYSCALL(dup)
 531:	b8 0a 00 00 00       	mov    $0xa,%eax
 536:	cd 40                	int    $0x40
 538:	c3                   	ret    

00000539 <getpid>:
SYSCALL(getpid)
 539:	b8 0b 00 00 00       	mov    $0xb,%eax
 53e:	cd 40                	int    $0x40
 540:	c3                   	ret    

00000541 <sbrk>:
SYSCALL(sbrk)
 541:	b8 0c 00 00 00       	mov    $0xc,%eax
 546:	cd 40                	int    $0x40
 548:	c3                   	ret    

00000549 <sleep>:
SYSCALL(sleep)
 549:	b8 0d 00 00 00       	mov    $0xd,%eax
 54e:	cd 40                	int    $0x40
 550:	c3                   	ret    

00000551 <uptime>:
SYSCALL(uptime)
 551:	b8 0e 00 00 00       	mov    $0xe,%eax
 556:	cd 40                	int    $0x40
 558:	c3                   	ret    

00000559 <clone>:
SYSCALL(clone)
 559:	b8 16 00 00 00       	mov    $0x16,%eax
 55e:	cd 40                	int    $0x40
 560:	c3                   	ret    

00000561 <join>:
SYSCALL(join)
 561:	b8 17 00 00 00       	mov    $0x17,%eax
 566:	cd 40                	int    $0x40
 568:	c3                   	ret    

00000569 <thread_exit>:
 569:	b8 18 00 00 00       	mov    $0x18,%eax
 56e:	cd 40                	int    $0x40
 570:	c3                   	ret    
 571:	66 90                	xchg   %ax,%ax
 573:	66 90                	xchg   %ax,%ax
 575:	66 90                	xchg   %ax,%ax
 577:	66 90                	xchg   %ax,%ax
 579:	66 90                	xchg   %ax,%ax
 57b:	66 90                	xchg   %ax,%ax
 57d:	66 90                	xchg   %ax,%ax
 57f:	90                   	nop

00000580 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
 585:	53                   	push   %ebx
 586:	83 ec 3c             	sub    $0x3c,%esp
 589:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 58c:	89 d1                	mov    %edx,%ecx
{
 58e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 591:	85 d2                	test   %edx,%edx
 593:	0f 89 7f 00 00 00    	jns    618 <printint+0x98>
 599:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 59d:	74 79                	je     618 <printint+0x98>
    neg = 1;
 59f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5a8:	31 db                	xor    %ebx,%ebx
 5aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5b0:	89 c8                	mov    %ecx,%eax
 5b2:	31 d2                	xor    %edx,%edx
 5b4:	89 cf                	mov    %ecx,%edi
 5b6:	f7 75 c4             	divl   -0x3c(%ebp)
 5b9:	0f b6 92 d8 09 00 00 	movzbl 0x9d8(%edx),%edx
 5c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5c3:	89 d8                	mov    %ebx,%eax
 5c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5d1:	76 dd                	jbe    5b0 <printint+0x30>
  if(neg)
 5d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5d6:	85 c9                	test   %ecx,%ecx
 5d8:	74 0c                	je     5e6 <printint+0x66>
    buf[i++] = '-';
 5da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5ed:	eb 07                	jmp    5f6 <printint+0x76>
 5ef:	90                   	nop
 5f0:	0f b6 13             	movzbl (%ebx),%edx
 5f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5f6:	83 ec 04             	sub    $0x4,%esp
 5f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5fc:	6a 01                	push   $0x1
 5fe:	56                   	push   %esi
 5ff:	57                   	push   %edi
 600:	e8 d4 fe ff ff       	call   4d9 <write>
  while(--i >= 0)
 605:	83 c4 10             	add    $0x10,%esp
 608:	39 de                	cmp    %ebx,%esi
 60a:	75 e4                	jne    5f0 <printint+0x70>
    putc(fd, buf[i]);
}
 60c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60f:	5b                   	pop    %ebx
 610:	5e                   	pop    %esi
 611:	5f                   	pop    %edi
 612:	5d                   	pop    %ebp
 613:	c3                   	ret    
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 618:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 61f:	eb 87                	jmp    5a8 <printint+0x28>
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 628:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop

00000630 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 630:	f3 0f 1e fb          	endbr32 
 634:	55                   	push   %ebp
 635:	89 e5                	mov    %esp,%ebp
 637:	57                   	push   %edi
 638:	56                   	push   %esi
 639:	53                   	push   %ebx
 63a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 63d:	8b 75 0c             	mov    0xc(%ebp),%esi
 640:	0f b6 1e             	movzbl (%esi),%ebx
 643:	84 db                	test   %bl,%bl
 645:	0f 84 b4 00 00 00    	je     6ff <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 64b:	8d 45 10             	lea    0x10(%ebp),%eax
 64e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 651:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 654:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 656:	89 45 d0             	mov    %eax,-0x30(%ebp)
 659:	eb 33                	jmp    68e <printf+0x5e>
 65b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop
 660:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 663:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 668:	83 f8 25             	cmp    $0x25,%eax
 66b:	74 17                	je     684 <printf+0x54>
  write(fd, &c, 1);
 66d:	83 ec 04             	sub    $0x4,%esp
 670:	88 5d e7             	mov    %bl,-0x19(%ebp)
 673:	6a 01                	push   $0x1
 675:	57                   	push   %edi
 676:	ff 75 08             	pushl  0x8(%ebp)
 679:	e8 5b fe ff ff       	call   4d9 <write>
 67e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 681:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 684:	0f b6 1e             	movzbl (%esi),%ebx
 687:	83 c6 01             	add    $0x1,%esi
 68a:	84 db                	test   %bl,%bl
 68c:	74 71                	je     6ff <printf+0xcf>
    c = fmt[i] & 0xff;
 68e:	0f be cb             	movsbl %bl,%ecx
 691:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 694:	85 d2                	test   %edx,%edx
 696:	74 c8                	je     660 <printf+0x30>
      }
    } else if(state == '%'){
 698:	83 fa 25             	cmp    $0x25,%edx
 69b:	75 e7                	jne    684 <printf+0x54>
      if(c == 'd'){
 69d:	83 f8 64             	cmp    $0x64,%eax
 6a0:	0f 84 9a 00 00 00    	je     740 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6a6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6ac:	83 f9 70             	cmp    $0x70,%ecx
 6af:	74 5f                	je     710 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6b1:	83 f8 73             	cmp    $0x73,%eax
 6b4:	0f 84 d6 00 00 00    	je     790 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ba:	83 f8 63             	cmp    $0x63,%eax
 6bd:	0f 84 8d 00 00 00    	je     750 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6c3:	83 f8 25             	cmp    $0x25,%eax
 6c6:	0f 84 b4 00 00 00    	je     780 <printf+0x150>
  write(fd, &c, 1);
 6cc:	83 ec 04             	sub    $0x4,%esp
 6cf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6d3:	6a 01                	push   $0x1
 6d5:	57                   	push   %edi
 6d6:	ff 75 08             	pushl  0x8(%ebp)
 6d9:	e8 fb fd ff ff       	call   4d9 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6de:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6e1:	83 c4 0c             	add    $0xc,%esp
 6e4:	6a 01                	push   $0x1
 6e6:	83 c6 01             	add    $0x1,%esi
 6e9:	57                   	push   %edi
 6ea:	ff 75 08             	pushl  0x8(%ebp)
 6ed:	e8 e7 fd ff ff       	call   4d9 <write>
  for(i = 0; fmt[i]; i++){
 6f2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 6f6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6f9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 6fb:	84 db                	test   %bl,%bl
 6fd:	75 8f                	jne    68e <printf+0x5e>
    }
  }
}
 6ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
 702:	5b                   	pop    %ebx
 703:	5e                   	pop    %esi
 704:	5f                   	pop    %edi
 705:	5d                   	pop    %ebp
 706:	c3                   	ret    
 707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 70e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	b9 10 00 00 00       	mov    $0x10,%ecx
 718:	6a 00                	push   $0x0
 71a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	8b 13                	mov    (%ebx),%edx
 722:	e8 59 fe ff ff       	call   580 <printint>
        ap++;
 727:	89 d8                	mov    %ebx,%eax
 729:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72c:	31 d2                	xor    %edx,%edx
        ap++;
 72e:	83 c0 04             	add    $0x4,%eax
 731:	89 45 d0             	mov    %eax,-0x30(%ebp)
 734:	e9 4b ff ff ff       	jmp    684 <printf+0x54>
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	b9 0a 00 00 00       	mov    $0xa,%ecx
 748:	6a 01                	push   $0x1
 74a:	eb ce                	jmp    71a <printf+0xea>
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 750:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 753:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 756:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 758:	6a 01                	push   $0x1
        ap++;
 75a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 75d:	57                   	push   %edi
 75e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 761:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 764:	e8 70 fd ff ff       	call   4d9 <write>
        ap++;
 769:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 76c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 76f:	31 d2                	xor    %edx,%edx
 771:	e9 0e ff ff ff       	jmp    684 <printf+0x54>
 776:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 77d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 780:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 783:	83 ec 04             	sub    $0x4,%esp
 786:	e9 59 ff ff ff       	jmp    6e4 <printf+0xb4>
 78b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 78f:	90                   	nop
        s = (char*)*ap;
 790:	8b 45 d0             	mov    -0x30(%ebp),%eax
 793:	8b 18                	mov    (%eax),%ebx
        ap++;
 795:	83 c0 04             	add    $0x4,%eax
 798:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 79b:	85 db                	test   %ebx,%ebx
 79d:	74 17                	je     7b6 <printf+0x186>
        while(*s != 0){
 79f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7a2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7a4:	84 c0                	test   %al,%al
 7a6:	0f 84 d8 fe ff ff    	je     684 <printf+0x54>
 7ac:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7af:	89 de                	mov    %ebx,%esi
 7b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7b4:	eb 1a                	jmp    7d0 <printf+0x1a0>
          s = "(null)";
 7b6:	bb cf 09 00 00       	mov    $0x9cf,%ebx
        while(*s != 0){
 7bb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7be:	b8 28 00 00 00       	mov    $0x28,%eax
 7c3:	89 de                	mov    %ebx,%esi
 7c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
  write(fd, &c, 1);
 7d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7d3:	83 c6 01             	add    $0x1,%esi
 7d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7d9:	6a 01                	push   $0x1
 7db:	57                   	push   %edi
 7dc:	53                   	push   %ebx
 7dd:	e8 f7 fc ff ff       	call   4d9 <write>
        while(*s != 0){
 7e2:	0f b6 06             	movzbl (%esi),%eax
 7e5:	83 c4 10             	add    $0x10,%esp
 7e8:	84 c0                	test   %al,%al
 7ea:	75 e4                	jne    7d0 <printf+0x1a0>
 7ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7ef:	31 d2                	xor    %edx,%edx
 7f1:	e9 8e fe ff ff       	jmp    684 <printf+0x54>
 7f6:	66 90                	xchg   %ax,%ax
 7f8:	66 90                	xchg   %ax,%ax
 7fa:	66 90                	xchg   %ax,%ax
 7fc:	66 90                	xchg   %ax,%ax
 7fe:	66 90                	xchg   %ax,%ax

00000800 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 800:	f3 0f 1e fb          	endbr32 
 804:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 805:	a1 60 0d 00 00       	mov    0xd60,%eax
{
 80a:	89 e5                	mov    %esp,%ebp
 80c:	57                   	push   %edi
 80d:	56                   	push   %esi
 80e:	53                   	push   %ebx
 80f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 812:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 814:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 817:	39 c8                	cmp    %ecx,%eax
 819:	73 15                	jae    830 <free+0x30>
 81b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 81f:	90                   	nop
 820:	39 d1                	cmp    %edx,%ecx
 822:	72 14                	jb     838 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 824:	39 d0                	cmp    %edx,%eax
 826:	73 10                	jae    838 <free+0x38>
{
 828:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 82a:	8b 10                	mov    (%eax),%edx
 82c:	39 c8                	cmp    %ecx,%eax
 82e:	72 f0                	jb     820 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 830:	39 d0                	cmp    %edx,%eax
 832:	72 f4                	jb     828 <free+0x28>
 834:	39 d1                	cmp    %edx,%ecx
 836:	73 f0                	jae    828 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 838:	8b 73 fc             	mov    -0x4(%ebx),%esi
 83b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 83e:	39 fa                	cmp    %edi,%edx
 840:	74 1e                	je     860 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 842:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 845:	8b 50 04             	mov    0x4(%eax),%edx
 848:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 84b:	39 f1                	cmp    %esi,%ecx
 84d:	74 28                	je     877 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 84f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 851:	5b                   	pop    %ebx
  freep = p;
 852:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 857:	5e                   	pop    %esi
 858:	5f                   	pop    %edi
 859:	5d                   	pop    %ebp
 85a:	c3                   	ret    
 85b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 85f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 860:	03 72 04             	add    0x4(%edx),%esi
 863:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 866:	8b 10                	mov    (%eax),%edx
 868:	8b 12                	mov    (%edx),%edx
 86a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 86d:	8b 50 04             	mov    0x4(%eax),%edx
 870:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 873:	39 f1                	cmp    %esi,%ecx
 875:	75 d8                	jne    84f <free+0x4f>
    p->s.size += bp->s.size;
 877:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 87a:	a3 60 0d 00 00       	mov    %eax,0xd60
    p->s.size += bp->s.size;
 87f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 882:	8b 53 f8             	mov    -0x8(%ebx),%edx
 885:	89 10                	mov    %edx,(%eax)
}
 887:	5b                   	pop    %ebx
 888:	5e                   	pop    %esi
 889:	5f                   	pop    %edi
 88a:	5d                   	pop    %ebp
 88b:	c3                   	ret    
 88c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000890 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 890:	f3 0f 1e fb          	endbr32 
 894:	55                   	push   %ebp
 895:	89 e5                	mov    %esp,%ebp
 897:	57                   	push   %edi
 898:	56                   	push   %esi
 899:	53                   	push   %ebx
 89a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 89d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8a0:	8b 3d 60 0d 00 00    	mov    0xd60,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a6:	8d 70 07             	lea    0x7(%eax),%esi
 8a9:	c1 ee 03             	shr    $0x3,%esi
 8ac:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8af:	85 ff                	test   %edi,%edi
 8b1:	0f 84 a9 00 00 00    	je     960 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8b9:	8b 48 04             	mov    0x4(%eax),%ecx
 8bc:	39 f1                	cmp    %esi,%ecx
 8be:	73 6d                	jae    92d <malloc+0x9d>
 8c0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8c6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8cb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8ce:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 8d5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8d8:	eb 17                	jmp    8f1 <malloc+0x61>
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 8e2:	8b 4a 04             	mov    0x4(%edx),%ecx
 8e5:	39 f1                	cmp    %esi,%ecx
 8e7:	73 4f                	jae    938 <malloc+0xa8>
 8e9:	8b 3d 60 0d 00 00    	mov    0xd60,%edi
 8ef:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8f1:	39 c7                	cmp    %eax,%edi
 8f3:	75 eb                	jne    8e0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 8f5:	83 ec 0c             	sub    $0xc,%esp
 8f8:	ff 75 e4             	pushl  -0x1c(%ebp)
 8fb:	e8 41 fc ff ff       	call   541 <sbrk>
  if(p == (char*)-1)
 900:	83 c4 10             	add    $0x10,%esp
 903:	83 f8 ff             	cmp    $0xffffffff,%eax
 906:	74 1b                	je     923 <malloc+0x93>
  hp->s.size = nu;
 908:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 90b:	83 ec 0c             	sub    $0xc,%esp
 90e:	83 c0 08             	add    $0x8,%eax
 911:	50                   	push   %eax
 912:	e8 e9 fe ff ff       	call   800 <free>
  return freep;
 917:	a1 60 0d 00 00       	mov    0xd60,%eax
      if((p = morecore(nunits)) == 0)
 91c:	83 c4 10             	add    $0x10,%esp
 91f:	85 c0                	test   %eax,%eax
 921:	75 bd                	jne    8e0 <malloc+0x50>
        return 0;
  }
}
 923:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 926:	31 c0                	xor    %eax,%eax
}
 928:	5b                   	pop    %ebx
 929:	5e                   	pop    %esi
 92a:	5f                   	pop    %edi
 92b:	5d                   	pop    %ebp
 92c:	c3                   	ret    
    if(p->s.size >= nunits){
 92d:	89 c2                	mov    %eax,%edx
 92f:	89 f8                	mov    %edi,%eax
 931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 938:	39 ce                	cmp    %ecx,%esi
 93a:	74 54                	je     990 <malloc+0x100>
        p->s.size -= nunits;
 93c:	29 f1                	sub    %esi,%ecx
 93e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 941:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 944:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 947:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 94c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 94f:	8d 42 08             	lea    0x8(%edx),%eax
}
 952:	5b                   	pop    %ebx
 953:	5e                   	pop    %esi
 954:	5f                   	pop    %edi
 955:	5d                   	pop    %ebp
 956:	c3                   	ret    
 957:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 95e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 960:	c7 05 60 0d 00 00 64 	movl   $0xd64,0xd60
 967:	0d 00 00 
    base.s.size = 0;
 96a:	bf 64 0d 00 00       	mov    $0xd64,%edi
    base.s.ptr = freep = prevp = &base;
 96f:	c7 05 64 0d 00 00 64 	movl   $0xd64,0xd64
 976:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 979:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 97b:	c7 05 68 0d 00 00 00 	movl   $0x0,0xd68
 982:	00 00 00 
    if(p->s.size >= nunits){
 985:	e9 36 ff ff ff       	jmp    8c0 <malloc+0x30>
 98a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 990:	8b 0a                	mov    (%edx),%ecx
 992:	89 08                	mov    %ecx,(%eax)
 994:	eb b1                	jmp    947 <malloc+0xb7>
