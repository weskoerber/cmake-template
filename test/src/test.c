#include <criterion/criterion.h>

Test(test_suite_1, passing_test) {
  cr_assert(1);
}

Test(test_suite_2, failing_test) {
  cr_assert(0);
}
