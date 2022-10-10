#include <criterion/criterion.h>

Test(test_suite, success_test) {
    cr_assert(1);
}

Test(test_suite, fail_test) {
    cr_assert(0);
}
