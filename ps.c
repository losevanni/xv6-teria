#include "user.h"
#include "proc.h"
//각 프로세스의 이름, pid, 스택용 페이지의 개수, 할당받은 메모리의 크기, 메모리의 최대 제한 
// Process가 실행한 Thread의 정보를 고려하여 출력하여야 합니다.
// Thread의 경우 출력하지 않습니다
int main(){
    listall(); // proc 에있는 listall 사용
    exit();
}
// ps syscall
// https://medium.com/@harshalshree03/xv6-implementing-ps-nice-system-calls-and-priority-scheduling-b12fa10494e4