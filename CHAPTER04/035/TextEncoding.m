#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *str;
    
    // UNICODE의 버퍼로 문자열을 생성 
    unichar uniCharBuf[] = {
        0x0041,     // A
        0x0042,     // B
        0x0043,     // C
        0x0044      // D
    };
    str = [NSString stringWithCharacters:uniCharBuf
                                  length:4];
    NSLog(@"%@", str);
        
    // 'UTF-8'의 NULL 종단 문자열로 문자열을 생성 
    // 'ASCII 문자' 는 'UTF-8'과 C의 NULL 종단 문자열이 같으므로
    // 편의를 위해 여기서는 같은 버퍼를 사용하고 있음
    char utf8Str[] = "UTF-8 String";
    str = [NSString stringWithUTF8String:utf8Str];
    NSLog(@"%@", str);
    
    // C의 NULL 종단 문자열로 문자열을 생성 
    str = [NSString stringWithCString:utf8Str
                             encoding:NSUTF8StringEncoding];
    NSLog(@"%@", str);

    // 텍스트 데이터로 문자열을 생성 
    NSData *textData = [NSData dataWithBytes:utf8Str
                                      length:strlen(utf8Str)];
    str = [[[NSString alloc] initWithData:textData
                                 encoding:NSUTF8StringEncoding]
           autorelease];
    NSLog(@"%@", str);
    
    [pool drain];
    return 0;
}
