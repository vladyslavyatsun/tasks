//
//  CHABook+CHABookDictionary.m
//  task4
//
//  Created by Владислав Яцун on 7/10/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHABook+CHABookDictionary.h"

NSString *const kCHAKeyBookName = @"bookName";
NSString *const kCHAKeyBookYear = @"bookYear";
NSString *const kCHAKeyBookType = @"bookType";
NSString *const kCHAKeyBookId = @"bookId";

@implementation CHABook (CHABookDictionary)
- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary{
    return [self initWithName:aDictionary[kCHAKeyBookName]
                         Year:[aDictionary[kCHAKeyBookYear] integerValue]
                         Type:[aDictionary[kCHAKeyBookType] unsignedIntegerValue]
                       IdBook:aDictionary[kCHAKeyBookId]];
}

- (NSDictionary *)dictionaryRepresentation{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    if(self.name) dictionary[kCHAKeyBookName] = self.name;
    dictionary[kCHAKeyBookYear] = @(self.year);
    dictionary[kCHAKeyBookType] = @(self.type);
    if(self.idBook) dictionary[kCHAKeyBookId] = self.idBook;
    return dictionary;

}
@end
