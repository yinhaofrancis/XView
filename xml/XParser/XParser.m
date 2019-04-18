//
//  XParser.m
//  xml
//
//  Created by KnowChat02 on 2019/4/18.
//  Copyright © 2019 KnowChat02. All rights reserved.
//

#import "XParser.h"
#import "XElement.h"
@interface XParser()<NSXMLParserDelegate>
@property (nonatomic, nullable) NSXMLParser *parser;
@end

@implementation XParser{
    NSMutableArray<id<XElement>> *elements;
    NSMutableDictionary<NSString*,Class> *elementDefine;
    id<XElement> root;
}
- (instancetype)initWithUrl:(NSURL *)layoutXML{
    self = [super init];
    if (self) {
        self.parser = [[NSXMLParser alloc] initWithContentsOfURL:layoutXML];
        self.parser.delegate = self;
        elements = [[NSMutableArray alloc] init];
        elementDefine = [[NSMutableDictionary alloc] init];
    }
    return self;
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    [elements.lastObject completeChildParser];
    if(elements.count == 1){
        root = elements.lastObject;
    }
    [elements removeLastObject];
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    id<XElement> e = [[[self findClassByName:elementName] alloc] initWithName:elementName attribute:attributeDict];
    if(elements.lastObject){
        [elements.lastObject addChild:e];
    }
    [elements addObject:e];
    
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"%@",parseError);
}

- (void)registerElement:(NSString *)name ElementClass:(nonnull Class)eCls{
    elementDefine[name] = eCls;
}

- (Class)findClassByName:(NSString*)name{
    Class cls = elementDefine[name];
    if(cls){
        return cls;
    }else{
        return NSClassFromString(name);
    }
}
- (id<XElement>)parse{
    
    if([self.parser parse]){
        return root;
    }
    root = nil;
    return nil;
    
}
@end
