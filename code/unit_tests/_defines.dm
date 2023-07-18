#define MAX_UNIT_TEST_RUN_TIME 3 MINUTES

#define UNIT_TEST_PASSED 0
#define UNIT_TEST_FAILED 1
#define UNIT_TEST_SKIPPED 2

#define TEST_FOCUS(test_path) ##test_path { focus = TRUE; }
