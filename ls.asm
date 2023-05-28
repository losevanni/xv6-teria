
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	83 ec 0c             	sub    $0xc,%esp
  17:	8b 01                	mov    (%ecx),%eax
  19:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 28                	jle    49 <main+0x49>
  21:	8d 5a 04             	lea    0x4(%edx),%ebx
  24:	8d 34 82             	lea    (%edx,%eax,4),%esi
  27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2e:	66 90                	xchg   %ax,%ax
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	83 c3 04             	add    $0x4,%ebx
  38:	e8 c3 00 00 00       	call   100 <ls>
  for(i=1; i<argc; i++)
  3d:	83 c4 10             	add    $0x10,%esp
  40:	39 f3                	cmp    %esi,%ebx
  42:	75 ec                	jne    30 <main+0x30>
  exit();
  44:	e8 20 06 00 00       	call   669 <exit>
    ls(".");
  49:	83 ec 0c             	sub    $0xc,%esp
  4c:	68 90 0b 00 00       	push   $0xb90
  51:	e8 aa 00 00 00       	call   100 <ls>
    exit();
  56:	e8 0e 06 00 00       	call   669 <exit>
  5b:	66 90                	xchg   %ax,%ax
  5d:	66 90                	xchg   %ax,%ax
  5f:	90                   	nop

00000060 <fmtname>:
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	56                   	push   %esi
  68:	53                   	push   %ebx
  69:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  6c:	83 ec 0c             	sub    $0xc,%esp
  6f:	56                   	push   %esi
  70:	e8 4b 03 00 00       	call   3c0 <strlen>
  75:	83 c4 10             	add    $0x10,%esp
  78:	01 f0                	add    %esi,%eax
  7a:	89 c3                	mov    %eax,%ebx
  7c:	73 0b                	jae    89 <fmtname+0x29>
  7e:	eb 0e                	jmp    8e <fmtname+0x2e>
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 c6                	cmp    %eax,%esi
  85:	77 0a                	ja     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 26 03 00 00       	call   3c0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 4a                	ja     ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	53                   	push   %ebx
  a6:	e8 15 03 00 00       	call   3c0 <strlen>
  ab:	83 c4 0c             	add    $0xc,%esp
  ae:	50                   	push   %eax
  af:	53                   	push   %ebx
  b0:	68 64 0f 00 00       	push   $0xf64
  b5:	e8 b6 04 00 00       	call   570 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ba:	89 1c 24             	mov    %ebx,(%esp)
  bd:	e8 fe 02 00 00       	call   3c0 <strlen>
  c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  c5:	bb 64 0f 00 00       	mov    $0xf64,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  ca:	89 c6                	mov    %eax,%esi
  cc:	e8 ef 02 00 00       	call   3c0 <strlen>
  d1:	ba 0e 00 00 00       	mov    $0xe,%edx
  d6:	83 c4 0c             	add    $0xc,%esp
  d9:	29 f2                	sub    %esi,%edx
  db:	05 64 0f 00 00       	add    $0xf64,%eax
  e0:	52                   	push   %edx
  e1:	6a 20                	push   $0x20
  e3:	50                   	push   %eax
  e4:	e8 17 03 00 00       	call   400 <memset>
  return buf;
  e9:	83 c4 10             	add    $0x10,%esp
}
  ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
  ef:	89 d8                	mov    %ebx,%eax
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000100 <ls>:
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	57                   	push   %edi
 108:	56                   	push   %esi
 109:	53                   	push   %ebx
 10a:	81 ec 64 02 00 00    	sub    $0x264,%esp
 110:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
 113:	6a 00                	push   $0x0
 115:	57                   	push   %edi
 116:	e8 8e 05 00 00       	call   6a9 <open>
 11b:	83 c4 10             	add    $0x10,%esp
 11e:	85 c0                	test   %eax,%eax
 120:	0f 88 9a 01 00 00    	js     2c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
 126:	83 ec 08             	sub    $0x8,%esp
 129:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 12f:	89 c3                	mov    %eax,%ebx
 131:	56                   	push   %esi
 132:	50                   	push   %eax
 133:	e8 89 05 00 00       	call   6c1 <fstat>
 138:	83 c4 10             	add    $0x10,%esp
 13b:	85 c0                	test   %eax,%eax
 13d:	0f 88 bd 01 00 00    	js     300 <ls+0x200>
  switch(st.type){
 143:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
 14a:	66 83 f8 01          	cmp    $0x1,%ax
 14e:	74 60                	je     1b0 <ls+0xb0>
 150:	66 83 f8 02          	cmp    $0x2,%ax
 154:	74 1a                	je     170 <ls+0x70>
  close(fd);
 156:	83 ec 0c             	sub    $0xc,%esp
 159:	53                   	push   %ebx
 15a:	e8 32 05 00 00       	call   691 <close>
 15f:	83 c4 10             	add    $0x10,%esp
}
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 17f:	57                   	push   %edi
 180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 186:	e8 d5 fe ff ff       	call   60 <fmtname>
 18b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 191:	59                   	pop    %ecx
 192:	5f                   	pop    %edi
 193:	52                   	push   %edx
 194:	56                   	push   %esi
 195:	6a 02                	push   $0x2
 197:	50                   	push   %eax
 198:	68 70 0b 00 00       	push   $0xb70
 19d:	6a 01                	push   $0x1
 19f:	e8 3c 06 00 00       	call   7e0 <printf>
    break;
 1a4:	83 c4 20             	add    $0x20,%esp
 1a7:	eb ad                	jmp    156 <ls+0x56>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	57                   	push   %edi
 1b4:	e8 07 02 00 00       	call   3c0 <strlen>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	83 c0 10             	add    $0x10,%eax
 1bf:	3d 00 02 00 00       	cmp    $0x200,%eax
 1c4:	0f 87 16 01 00 00    	ja     2e0 <ls+0x1e0>
    strcpy(buf, path);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	57                   	push   %edi
 1ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1d4:	57                   	push   %edi
 1d5:	e8 66 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
 1da:	89 3c 24             	mov    %edi,(%esp)
 1dd:	e8 de 01 00 00       	call   3c0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
 1f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 1f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	83 ec 04             	sub    $0x4,%esp
 203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 209:	6a 10                	push   $0x10
 20b:	50                   	push   %eax
 20c:	53                   	push   %ebx
 20d:	e8 6f 04 00 00       	call   681 <read>
 212:	83 c4 10             	add    $0x10,%esp
 215:	83 f8 10             	cmp    $0x10,%eax
 218:	0f 85 38 ff ff ff    	jne    156 <ls+0x56>
      if(de.inum == 0)
 21e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 225:	00 
 226:	74 d8                	je     200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 231:	6a 0e                	push   $0xe
 233:	50                   	push   %eax
 234:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
 23a:	e8 31 03 00 00       	call   570 <memmove>
      p[DIRSIZ] = 0;
 23f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 249:	58                   	pop    %eax
 24a:	5a                   	pop    %edx
 24b:	56                   	push   %esi
 24c:	57                   	push   %edi
 24d:	e8 8e 02 00 00       	call   4e0 <stat>
 252:	83 c4 10             	add    $0x10,%esp
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 cb 00 00 00    	js     328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	83 ec 0c             	sub    $0xc,%esp
 260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 26c:	57                   	push   %edi
 26d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 27a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 286:	e8 d5 fd ff ff       	call   60 <fmtname>
 28b:	5a                   	pop    %edx
 28c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 292:	59                   	pop    %ecx
 293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 299:	51                   	push   %ecx
 29a:	52                   	push   %edx
 29b:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 2a1:	50                   	push   %eax
 2a2:	68 70 0b 00 00       	push   $0xb70
 2a7:	6a 01                	push   $0x1
 2a9:	e8 32 05 00 00       	call   7e0 <printf>
 2ae:	83 c4 20             	add    $0x20,%esp
 2b1:	e9 4a ff ff ff       	jmp    200 <ls+0x100>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	57                   	push   %edi
 2c4:	68 48 0b 00 00       	push   $0xb48
 2c9:	6a 02                	push   $0x2
 2cb:	e8 10 05 00 00       	call   7e0 <printf>
    return;
 2d0:	83 c4 10             	add    $0x10,%esp
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop
      printf(1, "ls: path too long\n");
 2e0:	83 ec 08             	sub    $0x8,%esp
 2e3:	68 7d 0b 00 00       	push   $0xb7d
 2e8:	6a 01                	push   $0x1
 2ea:	e8 f1 04 00 00       	call   7e0 <printf>
      break;
 2ef:	83 c4 10             	add    $0x10,%esp
 2f2:	e9 5f fe ff ff       	jmp    156 <ls+0x56>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	57                   	push   %edi
 304:	68 5c 0b 00 00       	push   $0xb5c
 309:	6a 02                	push   $0x2
 30b:	e8 d0 04 00 00       	call   7e0 <printf>
    close(fd);
 310:	89 1c 24             	mov    %ebx,(%esp)
 313:	e8 79 03 00 00       	call   691 <close>
    return;
 318:	83 c4 10             	add    $0x10,%esp
}
 31b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31e:	5b                   	pop    %ebx
 31f:	5e                   	pop    %esi
 320:	5f                   	pop    %edi
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    
 323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
 328:	83 ec 04             	sub    $0x4,%esp
 32b:	57                   	push   %edi
 32c:	68 5c 0b 00 00       	push   $0xb5c
 331:	6a 01                	push   $0x1
 333:	e8 a8 04 00 00       	call   7e0 <printf>
        continue;
 338:	83 c4 10             	add    $0x10,%esp
 33b:	e9 c0 fe ff ff       	jmp    200 <ls+0x100>

00000340 <strcpy>:
#include "mmu.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 345:	31 c0                	xor    %eax,%eax
{
 347:	89 e5                	mov    %esp,%ebp
 349:	53                   	push   %ebx
 34a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	84 d2                	test   %dl,%dl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	89 c8                	mov    %ecx,%eax
 360:	5b                   	pop    %ebx
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    
 363:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	f3 0f 1e fb          	endbr32 
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	53                   	push   %ebx
 378:	8b 4d 08             	mov    0x8(%ebp),%ecx
 37b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 37e:	0f b6 01             	movzbl (%ecx),%eax
 381:	0f b6 1a             	movzbl (%edx),%ebx
 384:	84 c0                	test   %al,%al
 386:	75 19                	jne    3a1 <strcmp+0x31>
 388:	eb 26                	jmp    3b0 <strcmp+0x40>
 38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 390:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 394:	83 c1 01             	add    $0x1,%ecx
 397:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 39a:	0f b6 1a             	movzbl (%edx),%ebx
 39d:	84 c0                	test   %al,%al
 39f:	74 0f                	je     3b0 <strcmp+0x40>
 3a1:	38 d8                	cmp    %bl,%al
 3a3:	74 eb                	je     390 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3a5:	29 d8                	sub    %ebx,%eax
}
 3a7:	5b                   	pop    %ebx
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    
 3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3b2:	29 d8                	sub    %ebx,%eax
}
 3b4:	5b                   	pop    %ebx
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax

000003c0 <strlen>:

uint
strlen(const char *s)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 3ca:	80 3a 00             	cmpb   $0x0,(%edx)
 3cd:	74 21                	je     3f0 <strlen+0x30>
 3cf:	31 c0                	xor    %eax,%eax
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	83 c0 01             	add    $0x1,%eax
 3db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3df:	89 c1                	mov    %eax,%ecx
 3e1:	75 f5                	jne    3d8 <strlen+0x18>
    ;
  return n;
}
 3e3:	89 c8                	mov    %ecx,%eax
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
 3e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 3f0:	31 c9                	xor    %ecx,%ecx
}
 3f2:	5d                   	pop    %ebp
 3f3:	89 c8                	mov    %ecx,%eax
 3f5:	c3                   	ret    
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	f3 0f 1e fb          	endbr32 
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	57                   	push   %edi
 408:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 40b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	89 d7                	mov    %edx,%edi
 413:	fc                   	cld    
 414:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 416:	89 d0                	mov    %edx,%eax
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42e:	0f b6 10             	movzbl (%eax),%edx
 431:	84 d2                	test   %dl,%dl
 433:	75 16                	jne    44b <strchr+0x2b>
 435:	eb 21                	jmp    458 <strchr+0x38>
 437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43e:	66 90                	xchg   %ax,%ax
 440:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 444:	83 c0 01             	add    $0x1,%eax
 447:	84 d2                	test   %dl,%dl
 449:	74 0d                	je     458 <strchr+0x38>
    if(*s == c)
 44b:	38 d1                	cmp    %dl,%cl
 44d:	75 f1                	jne    440 <strchr+0x20>
      return (char*)s;
  return 0;
}
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    
 451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 458:	31 c0                	xor    %eax,%eax
}
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	f3 0f 1e fb          	endbr32 
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	57                   	push   %edi
 468:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 469:	31 f6                	xor    %esi,%esi
{
 46b:	53                   	push   %ebx
 46c:	89 f3                	mov    %esi,%ebx
 46e:	83 ec 1c             	sub    $0x1c,%esp
 471:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 474:	eb 33                	jmp    4a9 <gets+0x49>
 476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 480:	83 ec 04             	sub    $0x4,%esp
 483:	8d 45 e7             	lea    -0x19(%ebp),%eax
 486:	6a 01                	push   $0x1
 488:	50                   	push   %eax
 489:	6a 00                	push   $0x0
 48b:	e8 f1 01 00 00       	call   681 <read>
    if(cc < 1)
 490:	83 c4 10             	add    $0x10,%esp
 493:	85 c0                	test   %eax,%eax
 495:	7e 1c                	jle    4b3 <gets+0x53>
      break;
    buf[i++] = c;
 497:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 49b:	83 c7 01             	add    $0x1,%edi
 49e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 4a1:	3c 0a                	cmp    $0xa,%al
 4a3:	74 23                	je     4c8 <gets+0x68>
 4a5:	3c 0d                	cmp    $0xd,%al
 4a7:	74 1f                	je     4c8 <gets+0x68>
  for(i=0; i+1 < max; ){
 4a9:	83 c3 01             	add    $0x1,%ebx
 4ac:	89 fe                	mov    %edi,%esi
 4ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4b1:	7c cd                	jl     480 <gets+0x20>
 4b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4b8:	c6 03 00             	movb   $0x0,(%ebx)
}
 4bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4be:	5b                   	pop    %ebx
 4bf:	5e                   	pop    %esi
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    
 4c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c7:	90                   	nop
 4c8:	8b 75 08             	mov    0x8(%ebp),%esi
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	01 de                	add    %ebx,%esi
 4d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4d2:	c6 03 00             	movb   $0x0,(%ebx)
}
 4d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d8:	5b                   	pop    %ebx
 4d9:	5e                   	pop    %esi
 4da:	5f                   	pop    %edi
 4db:	5d                   	pop    %ebp
 4dc:	c3                   	ret    
 4dd:	8d 76 00             	lea    0x0(%esi),%esi

000004e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e0:	f3 0f 1e fb          	endbr32 
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	56                   	push   %esi
 4e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	83 ec 08             	sub    $0x8,%esp
 4ec:	6a 00                	push   $0x0
 4ee:	ff 75 08             	pushl  0x8(%ebp)
 4f1:	e8 b3 01 00 00       	call   6a9 <open>
  if(fd < 0)
 4f6:	83 c4 10             	add    $0x10,%esp
 4f9:	85 c0                	test   %eax,%eax
 4fb:	78 2b                	js     528 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 4fd:	83 ec 08             	sub    $0x8,%esp
 500:	ff 75 0c             	pushl  0xc(%ebp)
 503:	89 c3                	mov    %eax,%ebx
 505:	50                   	push   %eax
 506:	e8 b6 01 00 00       	call   6c1 <fstat>
  close(fd);
 50b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 50e:	89 c6                	mov    %eax,%esi
  close(fd);
 510:	e8 7c 01 00 00       	call   691 <close>
  return r;
 515:	83 c4 10             	add    $0x10,%esp
}
 518:	8d 65 f8             	lea    -0x8(%ebp),%esp
 51b:	89 f0                	mov    %esi,%eax
 51d:	5b                   	pop    %ebx
 51e:	5e                   	pop    %esi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret    
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 528:	be ff ff ff ff       	mov    $0xffffffff,%esi
 52d:	eb e9                	jmp    518 <stat+0x38>
 52f:	90                   	nop

00000530 <atoi>:

int
atoi(const char *s)
{
 530:	f3 0f 1e fb          	endbr32 
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	53                   	push   %ebx
 538:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 53b:	0f be 02             	movsbl (%edx),%eax
 53e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 541:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 544:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 549:	77 1a                	ja     565 <atoi+0x35>
 54b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 54f:	90                   	nop
    n = n*10 + *s++ - '0';
 550:	83 c2 01             	add    $0x1,%edx
 553:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 556:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 55a:	0f be 02             	movsbl (%edx),%eax
 55d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 560:	80 fb 09             	cmp    $0x9,%bl
 563:	76 eb                	jbe    550 <atoi+0x20>
  return n;
}
 565:	89 c8                	mov    %ecx,%eax
 567:	5b                   	pop    %ebx
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    
 56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000570 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 570:	f3 0f 1e fb          	endbr32 
 574:	55                   	push   %ebp
 575:	89 e5                	mov    %esp,%ebp
 577:	57                   	push   %edi
 578:	8b 45 10             	mov    0x10(%ebp),%eax
 57b:	8b 55 08             	mov    0x8(%ebp),%edx
 57e:	56                   	push   %esi
 57f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 582:	85 c0                	test   %eax,%eax
 584:	7e 0f                	jle    595 <memmove+0x25>
 586:	01 d0                	add    %edx,%eax
  dst = vdst;
 588:	89 d7                	mov    %edx,%edi
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 590:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 591:	39 f8                	cmp    %edi,%eax
 593:	75 fb                	jne    590 <memmove+0x20>
  return vdst;
}
 595:	5e                   	pop    %esi
 596:	89 d0                	mov    %edx,%eax
 598:	5f                   	pop    %edi
 599:	5d                   	pop    %ebp
 59a:	c3                   	ret    
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <thread_create>:

int 
thread_create(thread_t* pid,void* (*start_routine)(void *, void *),void* arg1, void* arg2){
 5a0:	f3 0f 1e fb          	endbr32 
 5a4:	55                   	push   %ebp
 5a5:	89 e5                	mov    %esp,%ebp
 5a7:	83 ec 14             	sub    $0x14,%esp
  void* stack;
  stack = malloc(PGSIZE);
 5aa:	68 00 10 00 00       	push   $0x1000
 5af:	e8 8c 04 00 00       	call   a40 <malloc>
  *pid= clone(start_routine , arg1 , arg2 , stack);
 5b4:	50                   	push   %eax
 5b5:	ff 75 14             	pushl  0x14(%ebp)
 5b8:	ff 75 10             	pushl  0x10(%ebp)
 5bb:	ff 75 0c             	pushl  0xc(%ebp)
 5be:	e8 46 01 00 00       	call   709 <clone>
 5c3:	8b 55 08             	mov    0x8(%ebp),%edx
  if(*pid){
 5c6:	83 c4 20             	add    $0x20,%esp
 5c9:	85 c0                	test   %eax,%eax
  *pid= clone(start_routine , arg1 , arg2 , stack);
 5cb:	89 02                	mov    %eax,(%edx)
  if(*pid){
 5cd:	0f 94 c0             	sete   %al
    return 0; 
  }
  return -1;
}
 5d0:	c9                   	leave  
  if(*pid){
 5d1:	0f b6 c0             	movzbl %al,%eax
 5d4:	f7 d8                	neg    %eax
}
 5d6:	c3                   	ret    
 5d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5de:	66 90                	xchg   %ax,%ax

000005e0 <thread_join>:
int 
thread_join(thread_t tid,void** retval){
 5e0:	f3 0f 1e fb          	endbr32 
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	83 ec 10             	sub    $0x10,%esp
  // thread_join(thread_t pid , void **retval){
  // void* stackPtr;
  int x=join(tid,retval);
 5ea:	ff 75 0c             	pushl  0xc(%ebp)
 5ed:	ff 75 08             	pushl  0x8(%ebp)
 5f0:	e8 1c 01 00 00       	call   711 <join>
  if(x){
 5f5:	83 c4 10             	add    $0x10,%esp
    return 0;
  }
  return -1;
}
 5f8:	c9                   	leave  
  if(x){
 5f9:	85 c0                	test   %eax,%eax
 5fb:	0f 94 c0             	sete   %al
 5fe:	0f b6 c0             	movzbl %al,%eax
 601:	f7 d8                	neg    %eax
}
 603:	c3                   	ret    
 604:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop

00000610 <lock_init>:
// int
// thread_exit()

int 
lock_init(lock_t *lk){
 610:	f3 0f 1e fb          	endbr32 
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
  lk->flag=0;
 617:	8b 45 08             	mov    0x8(%ebp),%eax
 61a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  return 0;
}
 620:	31 c0                	xor    %eax,%eax
 622:	5d                   	pop    %ebp
 623:	c3                   	ret    
 624:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop

00000630 <lock_acquire>:
void 
lock_acquire(lock_t *lk){
 630:	f3 0f 1e fb          	endbr32 
 634:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 635:	b9 01 00 00 00       	mov    $0x1,%ecx
 63a:	89 e5                	mov    %esp,%ebp
 63c:	8b 55 08             	mov    0x8(%ebp),%edx
 63f:	90                   	nop
 640:	89 c8                	mov    %ecx,%eax
 642:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lk->flag,1)!=0);
 645:	85 c0                	test   %eax,%eax
 647:	75 f7                	jne    640 <lock_acquire+0x10>
}
 649:	5d                   	pop    %ebp
 64a:	c3                   	ret    
 64b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop

00000650 <lock_release>:
void 
lock_release(lock_t *lk){
 650:	f3 0f 1e fb          	endbr32 
 654:	55                   	push   %ebp
 655:	31 c0                	xor    %eax,%eax
 657:	89 e5                	mov    %esp,%ebp
 659:	8b 55 08             	mov    0x8(%ebp),%edx
 65c:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->flag,0);
}
 65f:	5d                   	pop    %ebp
 660:	c3                   	ret    

00000661 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 661:	b8 01 00 00 00       	mov    $0x1,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <exit>:
SYSCALL(exit)
 669:	b8 02 00 00 00       	mov    $0x2,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <wait>:
SYSCALL(wait)
 671:	b8 03 00 00 00       	mov    $0x3,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <pipe>:
SYSCALL(pipe)
 679:	b8 04 00 00 00       	mov    $0x4,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <read>:
SYSCALL(read)
 681:	b8 05 00 00 00       	mov    $0x5,%eax
 686:	cd 40                	int    $0x40
 688:	c3                   	ret    

00000689 <write>:
SYSCALL(write)
 689:	b8 10 00 00 00       	mov    $0x10,%eax
 68e:	cd 40                	int    $0x40
 690:	c3                   	ret    

00000691 <close>:
SYSCALL(close)
 691:	b8 15 00 00 00       	mov    $0x15,%eax
 696:	cd 40                	int    $0x40
 698:	c3                   	ret    

00000699 <kill>:
SYSCALL(kill)
 699:	b8 06 00 00 00       	mov    $0x6,%eax
 69e:	cd 40                	int    $0x40
 6a0:	c3                   	ret    

000006a1 <exec>:
SYSCALL(exec)
 6a1:	b8 07 00 00 00       	mov    $0x7,%eax
 6a6:	cd 40                	int    $0x40
 6a8:	c3                   	ret    

000006a9 <open>:
SYSCALL(open)
 6a9:	b8 0f 00 00 00       	mov    $0xf,%eax
 6ae:	cd 40                	int    $0x40
 6b0:	c3                   	ret    

000006b1 <mknod>:
SYSCALL(mknod)
 6b1:	b8 11 00 00 00       	mov    $0x11,%eax
 6b6:	cd 40                	int    $0x40
 6b8:	c3                   	ret    

000006b9 <unlink>:
SYSCALL(unlink)
 6b9:	b8 12 00 00 00       	mov    $0x12,%eax
 6be:	cd 40                	int    $0x40
 6c0:	c3                   	ret    

000006c1 <fstat>:
SYSCALL(fstat)
 6c1:	b8 08 00 00 00       	mov    $0x8,%eax
 6c6:	cd 40                	int    $0x40
 6c8:	c3                   	ret    

000006c9 <link>:
SYSCALL(link)
 6c9:	b8 13 00 00 00       	mov    $0x13,%eax
 6ce:	cd 40                	int    $0x40
 6d0:	c3                   	ret    

000006d1 <mkdir>:
SYSCALL(mkdir)
 6d1:	b8 14 00 00 00       	mov    $0x14,%eax
 6d6:	cd 40                	int    $0x40
 6d8:	c3                   	ret    

000006d9 <chdir>:
SYSCALL(chdir)
 6d9:	b8 09 00 00 00       	mov    $0x9,%eax
 6de:	cd 40                	int    $0x40
 6e0:	c3                   	ret    

000006e1 <dup>:
SYSCALL(dup)
 6e1:	b8 0a 00 00 00       	mov    $0xa,%eax
 6e6:	cd 40                	int    $0x40
 6e8:	c3                   	ret    

000006e9 <getpid>:
SYSCALL(getpid)
 6e9:	b8 0b 00 00 00       	mov    $0xb,%eax
 6ee:	cd 40                	int    $0x40
 6f0:	c3                   	ret    

000006f1 <sbrk>:
SYSCALL(sbrk)
 6f1:	b8 0c 00 00 00       	mov    $0xc,%eax
 6f6:	cd 40                	int    $0x40
 6f8:	c3                   	ret    

000006f9 <sleep>:
SYSCALL(sleep)
 6f9:	b8 0d 00 00 00       	mov    $0xd,%eax
 6fe:	cd 40                	int    $0x40
 700:	c3                   	ret    

00000701 <uptime>:
SYSCALL(uptime)
 701:	b8 0e 00 00 00       	mov    $0xe,%eax
 706:	cd 40                	int    $0x40
 708:	c3                   	ret    

00000709 <clone>:
SYSCALL(clone)
 709:	b8 16 00 00 00       	mov    $0x16,%eax
 70e:	cd 40                	int    $0x40
 710:	c3                   	ret    

00000711 <join>:
SYSCALL(join)
 711:	b8 17 00 00 00       	mov    $0x17,%eax
 716:	cd 40                	int    $0x40
 718:	c3                   	ret    

00000719 <thread_exit>:
 719:	b8 18 00 00 00       	mov    $0x18,%eax
 71e:	cd 40                	int    $0x40
 720:	c3                   	ret    
 721:	66 90                	xchg   %ax,%ax
 723:	66 90                	xchg   %ax,%ax
 725:	66 90                	xchg   %ax,%ax
 727:	66 90                	xchg   %ax,%ax
 729:	66 90                	xchg   %ax,%ax
 72b:	66 90                	xchg   %ax,%ax
 72d:	66 90                	xchg   %ax,%ax
 72f:	90                   	nop

00000730 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 3c             	sub    $0x3c,%esp
 739:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 73c:	89 d1                	mov    %edx,%ecx
{
 73e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 741:	85 d2                	test   %edx,%edx
 743:	0f 89 7f 00 00 00    	jns    7c8 <printint+0x98>
 749:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 74d:	74 79                	je     7c8 <printint+0x98>
    neg = 1;
 74f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 756:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 758:	31 db                	xor    %ebx,%ebx
 75a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 75d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 760:	89 c8                	mov    %ecx,%eax
 762:	31 d2                	xor    %edx,%edx
 764:	89 cf                	mov    %ecx,%edi
 766:	f7 75 c4             	divl   -0x3c(%ebp)
 769:	0f b6 92 9c 0b 00 00 	movzbl 0xb9c(%edx),%edx
 770:	89 45 c0             	mov    %eax,-0x40(%ebp)
 773:	89 d8                	mov    %ebx,%eax
 775:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 778:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 77b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 77e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 781:	76 dd                	jbe    760 <printint+0x30>
  if(neg)
 783:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 786:	85 c9                	test   %ecx,%ecx
 788:	74 0c                	je     796 <printint+0x66>
    buf[i++] = '-';
 78a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 78f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 791:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 796:	8b 7d b8             	mov    -0x48(%ebp),%edi
 799:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 79d:	eb 07                	jmp    7a6 <printint+0x76>
 79f:	90                   	nop
 7a0:	0f b6 13             	movzbl (%ebx),%edx
 7a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7a6:	83 ec 04             	sub    $0x4,%esp
 7a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7ac:	6a 01                	push   $0x1
 7ae:	56                   	push   %esi
 7af:	57                   	push   %edi
 7b0:	e8 d4 fe ff ff       	call   689 <write>
  while(--i >= 0)
 7b5:	83 c4 10             	add    $0x10,%esp
 7b8:	39 de                	cmp    %ebx,%esi
 7ba:	75 e4                	jne    7a0 <printint+0x70>
    putc(fd, buf[i]);
}
 7bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7bf:	5b                   	pop    %ebx
 7c0:	5e                   	pop    %esi
 7c1:	5f                   	pop    %edi
 7c2:	5d                   	pop    %ebp
 7c3:	c3                   	ret    
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 7cf:	eb 87                	jmp    758 <printint+0x28>
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop

000007e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 7e0:	f3 0f 1e fb          	endbr32 
 7e4:	55                   	push   %ebp
 7e5:	89 e5                	mov    %esp,%ebp
 7e7:	57                   	push   %edi
 7e8:	56                   	push   %esi
 7e9:	53                   	push   %ebx
 7ea:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7ed:	8b 75 0c             	mov    0xc(%ebp),%esi
 7f0:	0f b6 1e             	movzbl (%esi),%ebx
 7f3:	84 db                	test   %bl,%bl
 7f5:	0f 84 b4 00 00 00    	je     8af <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 7fb:	8d 45 10             	lea    0x10(%ebp),%eax
 7fe:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 801:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 804:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 806:	89 45 d0             	mov    %eax,-0x30(%ebp)
 809:	eb 33                	jmp    83e <printf+0x5e>
 80b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80f:	90                   	nop
 810:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 813:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 818:	83 f8 25             	cmp    $0x25,%eax
 81b:	74 17                	je     834 <printf+0x54>
  write(fd, &c, 1);
 81d:	83 ec 04             	sub    $0x4,%esp
 820:	88 5d e7             	mov    %bl,-0x19(%ebp)
 823:	6a 01                	push   $0x1
 825:	57                   	push   %edi
 826:	ff 75 08             	pushl  0x8(%ebp)
 829:	e8 5b fe ff ff       	call   689 <write>
 82e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 831:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 834:	0f b6 1e             	movzbl (%esi),%ebx
 837:	83 c6 01             	add    $0x1,%esi
 83a:	84 db                	test   %bl,%bl
 83c:	74 71                	je     8af <printf+0xcf>
    c = fmt[i] & 0xff;
 83e:	0f be cb             	movsbl %bl,%ecx
 841:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 844:	85 d2                	test   %edx,%edx
 846:	74 c8                	je     810 <printf+0x30>
      }
    } else if(state == '%'){
 848:	83 fa 25             	cmp    $0x25,%edx
 84b:	75 e7                	jne    834 <printf+0x54>
      if(c == 'd'){
 84d:	83 f8 64             	cmp    $0x64,%eax
 850:	0f 84 9a 00 00 00    	je     8f0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 856:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 85c:	83 f9 70             	cmp    $0x70,%ecx
 85f:	74 5f                	je     8c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 861:	83 f8 73             	cmp    $0x73,%eax
 864:	0f 84 d6 00 00 00    	je     940 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 86a:	83 f8 63             	cmp    $0x63,%eax
 86d:	0f 84 8d 00 00 00    	je     900 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 873:	83 f8 25             	cmp    $0x25,%eax
 876:	0f 84 b4 00 00 00    	je     930 <printf+0x150>
  write(fd, &c, 1);
 87c:	83 ec 04             	sub    $0x4,%esp
 87f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 883:	6a 01                	push   $0x1
 885:	57                   	push   %edi
 886:	ff 75 08             	pushl  0x8(%ebp)
 889:	e8 fb fd ff ff       	call   689 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 88e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 891:	83 c4 0c             	add    $0xc,%esp
 894:	6a 01                	push   $0x1
 896:	83 c6 01             	add    $0x1,%esi
 899:	57                   	push   %edi
 89a:	ff 75 08             	pushl  0x8(%ebp)
 89d:	e8 e7 fd ff ff       	call   689 <write>
  for(i = 0; fmt[i]; i++){
 8a2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 8a6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 8a9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 8ab:	84 db                	test   %bl,%bl
 8ad:	75 8f                	jne    83e <printf+0x5e>
    }
  }
}
 8af:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8b2:	5b                   	pop    %ebx
 8b3:	5e                   	pop    %esi
 8b4:	5f                   	pop    %edi
 8b5:	5d                   	pop    %ebp
 8b6:	c3                   	ret    
 8b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8be:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 8c0:	83 ec 0c             	sub    $0xc,%esp
 8c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8c8:	6a 00                	push   $0x0
 8ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8cd:	8b 45 08             	mov    0x8(%ebp),%eax
 8d0:	8b 13                	mov    (%ebx),%edx
 8d2:	e8 59 fe ff ff       	call   730 <printint>
        ap++;
 8d7:	89 d8                	mov    %ebx,%eax
 8d9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8dc:	31 d2                	xor    %edx,%edx
        ap++;
 8de:	83 c0 04             	add    $0x4,%eax
 8e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8e4:	e9 4b ff ff ff       	jmp    834 <printf+0x54>
 8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 8f0:	83 ec 0c             	sub    $0xc,%esp
 8f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8f8:	6a 01                	push   $0x1
 8fa:	eb ce                	jmp    8ca <printf+0xea>
 8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 900:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 903:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 906:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 908:	6a 01                	push   $0x1
        ap++;
 90a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 90d:	57                   	push   %edi
 90e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 911:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 914:	e8 70 fd ff ff       	call   689 <write>
        ap++;
 919:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 91c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 91f:	31 d2                	xor    %edx,%edx
 921:	e9 0e ff ff ff       	jmp    834 <printf+0x54>
 926:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 92d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 930:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 933:	83 ec 04             	sub    $0x4,%esp
 936:	e9 59 ff ff ff       	jmp    894 <printf+0xb4>
 93b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 93f:	90                   	nop
        s = (char*)*ap;
 940:	8b 45 d0             	mov    -0x30(%ebp),%eax
 943:	8b 18                	mov    (%eax),%ebx
        ap++;
 945:	83 c0 04             	add    $0x4,%eax
 948:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 94b:	85 db                	test   %ebx,%ebx
 94d:	74 17                	je     966 <printf+0x186>
        while(*s != 0){
 94f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 952:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 954:	84 c0                	test   %al,%al
 956:	0f 84 d8 fe ff ff    	je     834 <printf+0x54>
 95c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 95f:	89 de                	mov    %ebx,%esi
 961:	8b 5d 08             	mov    0x8(%ebp),%ebx
 964:	eb 1a                	jmp    980 <printf+0x1a0>
          s = "(null)";
 966:	bb 92 0b 00 00       	mov    $0xb92,%ebx
        while(*s != 0){
 96b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 96e:	b8 28 00 00 00       	mov    $0x28,%eax
 973:	89 de                	mov    %ebx,%esi
 975:	8b 5d 08             	mov    0x8(%ebp),%ebx
 978:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97f:	90                   	nop
  write(fd, &c, 1);
 980:	83 ec 04             	sub    $0x4,%esp
          s++;
 983:	83 c6 01             	add    $0x1,%esi
 986:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 989:	6a 01                	push   $0x1
 98b:	57                   	push   %edi
 98c:	53                   	push   %ebx
 98d:	e8 f7 fc ff ff       	call   689 <write>
        while(*s != 0){
 992:	0f b6 06             	movzbl (%esi),%eax
 995:	83 c4 10             	add    $0x10,%esp
 998:	84 c0                	test   %al,%al
 99a:	75 e4                	jne    980 <printf+0x1a0>
 99c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 99f:	31 d2                	xor    %edx,%edx
 9a1:	e9 8e fe ff ff       	jmp    834 <printf+0x54>
 9a6:	66 90                	xchg   %ax,%ax
 9a8:	66 90                	xchg   %ax,%ax
 9aa:	66 90                	xchg   %ax,%ax
 9ac:	66 90                	xchg   %ax,%ax
 9ae:	66 90                	xchg   %ax,%ax

000009b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9b0:	f3 0f 1e fb          	endbr32 
 9b4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9b5:	a1 74 0f 00 00       	mov    0xf74,%eax
{
 9ba:	89 e5                	mov    %esp,%ebp
 9bc:	57                   	push   %edi
 9bd:	56                   	push   %esi
 9be:	53                   	push   %ebx
 9bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 9c2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 9c4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c7:	39 c8                	cmp    %ecx,%eax
 9c9:	73 15                	jae    9e0 <free+0x30>
 9cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9cf:	90                   	nop
 9d0:	39 d1                	cmp    %edx,%ecx
 9d2:	72 14                	jb     9e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9d4:	39 d0                	cmp    %edx,%eax
 9d6:	73 10                	jae    9e8 <free+0x38>
{
 9d8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9da:	8b 10                	mov    (%eax),%edx
 9dc:	39 c8                	cmp    %ecx,%eax
 9de:	72 f0                	jb     9d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e0:	39 d0                	cmp    %edx,%eax
 9e2:	72 f4                	jb     9d8 <free+0x28>
 9e4:	39 d1                	cmp    %edx,%ecx
 9e6:	73 f0                	jae    9d8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ee:	39 fa                	cmp    %edi,%edx
 9f0:	74 1e                	je     a10 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9f5:	8b 50 04             	mov    0x4(%eax),%edx
 9f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9fb:	39 f1                	cmp    %esi,%ecx
 9fd:	74 28                	je     a27 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 a01:	5b                   	pop    %ebx
  freep = p;
 a02:	a3 74 0f 00 00       	mov    %eax,0xf74
}
 a07:	5e                   	pop    %esi
 a08:	5f                   	pop    %edi
 a09:	5d                   	pop    %ebp
 a0a:	c3                   	ret    
 a0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a0f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 a10:	03 72 04             	add    0x4(%edx),%esi
 a13:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a16:	8b 10                	mov    (%eax),%edx
 a18:	8b 12                	mov    (%edx),%edx
 a1a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a1d:	8b 50 04             	mov    0x4(%eax),%edx
 a20:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a23:	39 f1                	cmp    %esi,%ecx
 a25:	75 d8                	jne    9ff <free+0x4f>
    p->s.size += bp->s.size;
 a27:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 a2a:	a3 74 0f 00 00       	mov    %eax,0xf74
    p->s.size += bp->s.size;
 a2f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a32:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a35:	89 10                	mov    %edx,(%eax)
}
 a37:	5b                   	pop    %ebx
 a38:	5e                   	pop    %esi
 a39:	5f                   	pop    %edi
 a3a:	5d                   	pop    %ebp
 a3b:	c3                   	ret    
 a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a40:	f3 0f 1e fb          	endbr32 
 a44:	55                   	push   %ebp
 a45:	89 e5                	mov    %esp,%ebp
 a47:	57                   	push   %edi
 a48:	56                   	push   %esi
 a49:	53                   	push   %ebx
 a4a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a4d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a50:	8b 3d 74 0f 00 00    	mov    0xf74,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a56:	8d 70 07             	lea    0x7(%eax),%esi
 a59:	c1 ee 03             	shr    $0x3,%esi
 a5c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a5f:	85 ff                	test   %edi,%edi
 a61:	0f 84 a9 00 00 00    	je     b10 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a67:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 a69:	8b 48 04             	mov    0x4(%eax),%ecx
 a6c:	39 f1                	cmp    %esi,%ecx
 a6e:	73 6d                	jae    add <malloc+0x9d>
 a70:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 a76:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a7b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a7e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 a85:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 a88:	eb 17                	jmp    aa1 <malloc+0x61>
 a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a90:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 a92:	8b 4a 04             	mov    0x4(%edx),%ecx
 a95:	39 f1                	cmp    %esi,%ecx
 a97:	73 4f                	jae    ae8 <malloc+0xa8>
 a99:	8b 3d 74 0f 00 00    	mov    0xf74,%edi
 a9f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aa1:	39 c7                	cmp    %eax,%edi
 aa3:	75 eb                	jne    a90 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 aa5:	83 ec 0c             	sub    $0xc,%esp
 aa8:	ff 75 e4             	pushl  -0x1c(%ebp)
 aab:	e8 41 fc ff ff       	call   6f1 <sbrk>
  if(p == (char*)-1)
 ab0:	83 c4 10             	add    $0x10,%esp
 ab3:	83 f8 ff             	cmp    $0xffffffff,%eax
 ab6:	74 1b                	je     ad3 <malloc+0x93>
  hp->s.size = nu;
 ab8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 abb:	83 ec 0c             	sub    $0xc,%esp
 abe:	83 c0 08             	add    $0x8,%eax
 ac1:	50                   	push   %eax
 ac2:	e8 e9 fe ff ff       	call   9b0 <free>
  return freep;
 ac7:	a1 74 0f 00 00       	mov    0xf74,%eax
      if((p = morecore(nunits)) == 0)
 acc:	83 c4 10             	add    $0x10,%esp
 acf:	85 c0                	test   %eax,%eax
 ad1:	75 bd                	jne    a90 <malloc+0x50>
        return 0;
  }
}
 ad3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 ad6:	31 c0                	xor    %eax,%eax
}
 ad8:	5b                   	pop    %ebx
 ad9:	5e                   	pop    %esi
 ada:	5f                   	pop    %edi
 adb:	5d                   	pop    %ebp
 adc:	c3                   	ret    
    if(p->s.size >= nunits){
 add:	89 c2                	mov    %eax,%edx
 adf:	89 f8                	mov    %edi,%eax
 ae1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 ae8:	39 ce                	cmp    %ecx,%esi
 aea:	74 54                	je     b40 <malloc+0x100>
        p->s.size -= nunits;
 aec:	29 f1                	sub    %esi,%ecx
 aee:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 af1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 af4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 af7:	a3 74 0f 00 00       	mov    %eax,0xf74
}
 afc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 aff:	8d 42 08             	lea    0x8(%edx),%eax
}
 b02:	5b                   	pop    %ebx
 b03:	5e                   	pop    %esi
 b04:	5f                   	pop    %edi
 b05:	5d                   	pop    %ebp
 b06:	c3                   	ret    
 b07:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b0e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 b10:	c7 05 74 0f 00 00 78 	movl   $0xf78,0xf74
 b17:	0f 00 00 
    base.s.size = 0;
 b1a:	bf 78 0f 00 00       	mov    $0xf78,%edi
    base.s.ptr = freep = prevp = &base;
 b1f:	c7 05 78 0f 00 00 78 	movl   $0xf78,0xf78
 b26:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b29:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 b2b:	c7 05 7c 0f 00 00 00 	movl   $0x0,0xf7c
 b32:	00 00 00 
    if(p->s.size >= nunits){
 b35:	e9 36 ff ff ff       	jmp    a70 <malloc+0x30>
 b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b40:	8b 0a                	mov    (%edx),%ecx
 b42:	89 08                	mov    %ecx,(%eax)
 b44:	eb b1                	jmp    af7 <malloc+0xb7>
