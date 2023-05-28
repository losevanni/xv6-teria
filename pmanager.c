#include "types.h"
#include "stat.h"
#include "user.h"
#include <stdio.h> // string.c 가있다?? 그안의 strncmp 도 나쁘지 않을듯
#include <string.h>
#define SIZE 100 // 상수 선언이 이거 맞겠지?

// #include ""
// 해야하는것 proc 에서 정보 조회
// 입력 받은값을 명령어 + 인자 분류하여 사용법

//각 프로세스의 이름, pid, 스택용 페이지의 개수, 할당받은 메모리의 크기, 메모리의 최대 제한 
// Process가 실행한 Thread의 정보를 고려하여 출력하여야 합니다.
// Thread의 경우 출력하지 않습니다 상태
// 보호가드 자료 

void list(){ //프로시저 처리만하고 I/O 없음 proc 에있는 함수 사용
    listall(); 
}

// 실행시 스택 사이즈를 지정하여 경로에 있는 것 실행
int execute(char *path, int stacksize){// 지선이가 만든 exec2 를 사용해야함 
    int ret=exec2(path,stacksize);
    // if문으로 실행 결과 분기 ㄱㄱ
    return ret;
}
// 해당 pid thread 를 고려하여 메모리 제한
int memlim(int pid , int limit){ // proc.c 에선언된 setmemory 를 사용해야함 syscall 에 등록해야함
    int ret=setmemorylimit(pid,limit);
    if(ret==-1){
        cprint("error setmemory limit set"); // fail mem limit set
        return -1;
    }
    return ret; 
}
// 이미 구현 되어있는것 kill , exit 그냥 user.h 에있는거 사용
int main(void){
    int tmp=0;
    char buf[SIZE]; // 입력 받을 명령어와 옵션 버퍼
    int readerr; // error 판단 변수
    char* ret0; // 명령어
    char* ret1; // 첫 번째 옵션
    char* ret2; // 두 번째 옵션
    while(tmp!=1){ // tmp 가 1이 아닌경우 반복 exit가입력 되면 끝
        memset(buf,0,SIZE); // 0 으로 초기화
        readerr=read(0,buf,(SIZE-1));
        // **각 함수 호출 하는 분기문 구현
        if(strcmp(buf,"list")){ //list formet string bug 발생 예상 지점
            list();
            continue; // if 아래 빠져 나가는 코드
        }else if(strcmp(buf,"exit")){ //입력 값이 exit 인경우 
            break; // 그냥 탈출하면 종료함 return 0 을 해서 
        }else{// kill , memlim, execute 만들기
            // 문자열 공백 기준으로 분리하여 0: 명령어 1: pid,path 2:limit,stacksize  분리 하여 분기문 작성
            ret0=strtok(buf," "); //
            ret1=strtok(buf," ");
            ret2=strtok(buf," ");
            if (strcmp(ret0,"kill")){
                kill(atoi(ret1)); // 문자를 정수로 변환하여 죽임
                continue;
            }else if (strcmp(ret0,"execute")){
                execute(ret1,atoi(ret2)); // path, stacksize
                continue;
            }else if (strcmp(ret0,"memlim")){
                memlim(atoi(ret1),atoi(ret2));// pid, iimit
                continue;
            }else{
                continue; // 아무것도 아니면 반복 ㄱㄱ
            }
        }
    }
    return 0;
}