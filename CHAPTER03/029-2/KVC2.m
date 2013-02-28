#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSDictionary *dict;
    
    // 키 ‘Name’에 ‘Akira Hayashi’를 넣은 사전을 생성함
    dict = [NSDictionary dictionaryWithObject:@"Akira Hayashi"
                                       forKey:@"Name"];
    // 위에서 생성한 사전을 키 ‘Person’에 넣은 사전을 생성함
    dict = [NSDictionary dictionaryWithObject:dict
                                       forKey:@"Person"];
    
    // 키 ‘Person’에서 취득한 프로퍼티에서 키 ‘Name’ 값을
    // 취득한 것처럼 ‘키 패스’를 지정해 값을 취득함
    NSString *name = [dict valueForKeyPath:@"Person.Name"];
    // 취득한 값을 로그에 출력
    NSLog(@"Name: %@", name);
    
    [pool drain];
    return 0;
}
