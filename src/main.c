#include "lib.h"
#include <stdio.h>
#include <readline/readline.h>
#include <readline/history.h>
int main(void) {
  using_history();
  printf("%s\n", rl_library_version);
  func(0);
  return 0;
}
