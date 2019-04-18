//
//  XLayoutParser.m
//  XParser
//
//  Created by KnowChat02 on 2019/4/16.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "XLayoutParser.h"
#import "UIView+XView.h"
@interface XLayoutParser()<NSXMLParserDelegate>
@property(nonatomic,nonnull)NSXMLParser* parser;
@property (nonatomic, nonnull) UIView *rootView;
@property (nonatomic, nonnull) NSMutableArray<id<XElementLoader>> *stack;
@end

@implementation XLayoutParser
- (instancetype)initWithOK:(BOOL)state {
    self = [super init];
    if (self) {
        self.stack = [[NSMutableArray alloc] init];
    }
    return self;
}
+ (XLayoutParser *)shared{
    static dispatch_once_t onceToken;
    static XLayoutParser* inst;
    dispatch_once(&onceToken, ^{
        inst = [[XLayoutParser alloc] initWithOK:false];
    });
    return inst;
}

- (UIView *)parseLayout:(NSString *)path{
    if([NSFileManager.defaultManager fileExistsAtPath:path]){
        self.parser = [[NSXMLParser alloc] initWithContentsOfURL:[[NSURL alloc] initFileURLWithPath:path]];
        self.parser.delegate = self;
        [self.parser parse];
        return self.rootView;
    }else{
        
    }
    return nil;
}
- (void)parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName model:(NSString *)model {
    NSLog(@"%@|%@",elementName,model);
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
}
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    
}
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
}
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"%@",parseError);
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    if([NSClassFromString(elementName) isSubclassOfClass:UIView.class] || [NSClassFromString(elementName) isKindOfClass:UIView.class]){
        UIView* current = [[NSClassFromString(elementName) alloc] initWithAttribute:attributeDict];
        [self processView:current];
    }else {
        id<XElementLoader> current = [[NSClassFromString(elementName) alloc] initWithAttribute:attributeDict];
        if([current conformsToProtocol:@protocol(XElementLoader)]){
            [self processProperty:current];
        }
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    [self.stack.lastObject completePropertyElement];
    [self.stack removeLastObject];
}
- (void)processView:(UIView*)View{
    if(self.stack.lastObject){
        UIView *v = (UIView*)self.stack.lastObject;
        [v addSubview:View];
    }else{
        self.rootView = View;
    }
    [self.stack addObject:View];
}
- (void)processProperty:(id<XElementLoader>)property{
    if(self.stack.lastObject){
        id<XElementLoader>v = (id<XElementLoader>)self.stack.lastObject;
        [v loadPropertyElement:property];
    }
    [self.stack addObject:property];
}
@end
