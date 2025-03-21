// RUN: %clang_cc1 -triple x86_64-pc-linux-gnu -emit-llvm < %s| FileCheck %s

void report(int value);

__attribute__((__noinline__)) char *passthru(char *ptr)
{
        return ptr;
}

int main(int argc, char *argv[]) {
        int is_lvalue = 0;

	// CHECK: call void @report(i32 noundef 0)
        report(__builtin_is_lvalue(5));
	// CHECK: call void @report(i32 noundef 0)
        report(__builtin_is_lvalue(main));
	// CHECK: call void @report(i32 noundef 1)
        report(__builtin_is_lvalue(is_lvalue));
	// CHECK: call void @report(i32 noundef 1)
        report(__builtin_is_lvalue((unsigned char)is_lvalue));
	// CHECK: call void @report(i32 noundef 0)
        report(__builtin_is_lvalue(is_lvalue++));
	// CHECK: call void @report(i32 noundef 0)
        report(__builtin_is_lvalue(++is_lvalue));
	// CHECK: call void @report(i32 noundef 0)
        report(__builtin_is_lvalue(passthru(argv[0])));
        return 0;
}
