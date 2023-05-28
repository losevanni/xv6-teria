#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
// #include "defs.h"
#define SLEEP_TIME 100

lock_t* lk;

void *f1(void* arg1, void* arg2) {
  int num = *(int*)arg1;
  if (num) lock_acquire(lk);
  printf(1, "1. this should print %s\n", num ? "first" : "whenever");
  printf(1,"num is : %d\n",num);
  printf(1,"arg1 is : %d\n",arg1);
  sleep(SLEEP_TIME);
  printf(1,"this is threads exit\n");
  thread_exit(arg1);
  if (num) lock_release(lk);
  exit();
  // return 0;
}

void *f2(void* arg1, void* arg2) {
  int num = *(int*)arg1;
  if (num) lock_acquire(lk);
  printf(1, "2. this should print %s\n", num ? "second" : "whenever");
  printf(1, "2. sleep for %d ticks\n", SLEEP_TIME);
  sleep(SLEEP_TIME);
  if (num) lock_release(lk);
  exit();
}

void *f3(void* arg1, void* arg2) {
  int num = *(int*)arg1;
  if (num) lock_acquire(lk);
  printf(1, "3. this should print %s\n", num ? "third" : "whenever");
  printf(1, "3. sleep for %d ticks\n", SLEEP_TIME);
  sleep(SLEEP_TIME);
  if (num) lock_release(lk);
  exit();
}

int
main(int argc, char *argv[])
{
  lock_init(lk);
  int arg1 = 21, arg2 = 1;
  thread_t t;
  // thread_t t1;
  // thread_t t2;
  int retval;
  printf(1, "below should be sequential print statements:\n");
  thread_create(&t,&f1, (void *)&arg1, (void *)&arg2);
  // int b=thread_create(&t1,f2, (void *)&arg1, (void *)&arg2);
  // int c=thread_create(&t2,f3, (void *)&arg1, (void *)&arg2);
  // printf(1,"%d %d %d ????\n" ,a,b,c);
  printf(1,"main tid = %d \n",t);

  // int id=sys_getpid();
  // printf(1,"my pid is ",id);

  // printf(1,"pid %d \n",t1);
  // printf(1,"pid %d \n",t2);
  thread_join(t,(void **)&retval);
  // 이방식  아래와 같은 방식은 다 됨
  printf(1,"main retval 1 : %d\n", *(void**)retval);
  printf(1,"main retval 3*(int*) : %d\n", *(int*)retval);
  printf(1,"main retval 4 : %d\n", *(int*)retval); 

  // thread_join(t1);
  // thread_join(t2);
  // int retval;
  // int abcd=thread_join(t,(void**)&retval);
  // int abcd=thread_join(t);
  // if(abcd){
  //   printf(1,"not zero %d\n",abcd);
  // }else
  // {
  //   printf(1,"zero %d \n",abcd);
  // }
  
  

  // thread_join();
  // thread_join();

  // arg1 = 0;
  // printf(1, "below should be a jarbled mess:\n");
  // thread_create(&f1, (void *)&arg1, (void *)&arg2);
  // thread_create(&f2, (void *)&arg1, (void *)&arg2);
  // thread_create(&f3, (void *)&arg1, (void *)&arg2);
  // thread_join();
  // thread_join();
  // thread_join();
  
  exit();
}