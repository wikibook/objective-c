#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSLog(@"char               : %d, %d", CHAR_MIN, CHAR_MAX);
    NSLog(@"short              : %d, %d", SHRT_MIN, SHRT_MAX);
    NSLog(@"int                : %d, %d", INT_MIN, INT_MAX);
    NSLog(@"long               : %ld, %ld", LONG_MIN, LONG_MAX);
    NSLog(@"long long          : %lld, %lld", LLONG_MIN, LLONG_MAX);
    
    NSLog(@"unsigned char      : %u", UCHAR_MAX);
    NSLog(@"unsigned short     : %u", USHRT_MAX);
    NSLog(@"unsigned int       : %u", UINT_MAX);
    NSLog(@"unsigned long      : %lu", ULONG_MAX);
    NSLog(@"unsigned long long : %llu", ULLONG_MAX);
    
    [pool drain];
    return 0;
}

