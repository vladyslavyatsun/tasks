//
//  CHAPerson+CHAPersonDictionary.m
//  task4
//
//  Created by Владислав Яцун on 7/10/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHAPerson+CHAPersonDictionary.h"

NSString *const kCHAKeyFirstName = @"firstName";
NSString *const kCHAKeyLastName = @"lastName";
NSString *const kCHAKeyPersonYear = @"personYear";
NSString *const kCHAKeyPersonBooks = @"personBooks";


@implementation CHAPerson (CHAPersonDictionary)
- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary{
    CHAPerson *person = [[CHAPerson alloc]initPersonWithFirstName:aDictionary[kCHAKeyFirstName] PersonLastName:aDictionary[kCHAKeyLastName] PersonYear: [aDictionary[kCHAKeyPersonYear] integerValue] personBooks:aDictionary[kCHAKeyPersonBooks]];
    return person;
}

- (NSDictionary *)dictionaryRepresentation{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    if(self.personFirstName) dictionary[kCHAKeyFirstName] = self.personFirstName;
    if(self.personLastName) dictionary[kCHAKeyLastName] = self.personLastName;
    dictionary[kCHAKeyPersonYear] = @(self.personYear);
    if(self.personBooks) dictionary[kCHAKeyPersonBooks] = self.personBooks;
    return dictionary;
}
@end
