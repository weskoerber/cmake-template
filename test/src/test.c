#include <criterion/criterion.h>
#include <hello/hello.h>

Test(test_suite_1, passing_test) {
  cr_assert(1);
}

Test(test_suite_2, failing_test) {
  cr_assert(0);
}

Test(test_suite_3, prints_hello) {
  hello();
}
