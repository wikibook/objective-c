#import <Foundation/Foundation.h>

int main (int argc, const char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    // 파일을 트리 구조 방식으로 읽어옴
    // 아래 경로는 알맞게 변경해주세요
    // 여기에서는 ‘/Users/gaheeyoon/Test.xml’을 읽어옴
    NSURL *url = [NSURL fileURLWithPath:@"/Users/gaheeyoon/Test.xml"];
    NSXMLDocument *domDoc;
    
    domDoc = [[[NSXMLDocument alloc]
               initWithContentsOfURL:url
               options:0
               error:NULL] autorelease];
    
    // XQuery의 쿼리로 값을 취득
    // 여기에서는 ‘id’ 속성이 1보다 큰 ‘user’ 엘리먼트의 ‘name’ 엘리먼트를 취득
    NSMutableString *query = [NSMutableString stringWithCapacity:0];
    
    [query appendString:
     @"declare variable $id_min as xs:integer external;"];
    [query appendString:
     @"for $u in .//user where $u/@id >= $id_min return $u/name"];
    
    NSError *err = nil;
    NSArray *result;
    NSDictionary *dict;
    NSNumber* value;
    
    // 쿼리 변수 ‘id_min’을 ‘1’로 설정해 쿼리를 실행
    value = [NSNumber numberWithInteger:1];
    dict = [NSDictionary dictionaryWithObject:value
                                       forKey:@"id_min"];
    
    result = [domDoc objectsForXQuery:query
                            constants:dict
                                error:&err];
    
    NSLog(@"id >= %@\n%@", [dict objectForKey:@"id_min"], result);

    // 쿼리 변수 ‘id_min’을 ‘2’로 설정해 쿼리를 실행
    value = [NSNumber numberWithInteger:2];
    dict = [NSDictionary dictionaryWithObject:value
                                       forKey:@"id_min"];
    
    result = [domDoc objectsForXQuery:query
                            constants:dict
                                error:&err];
    
    NSLog(@"id >= %@\n%@", [dict objectForKey:@"id_min"], result);
                            
    [pool drain];
    return 0;
}