//
//  CHALibrary+CHADictionary.m
//  task4
//
//  Created by Владислав Яцун on 7/10/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHALibrary+CHADictionary.h"

NSString *const kCHAKeyBooks = @"books";
NSString *const kCHAKeyPersons = @"persons";

@implementation CHALibrary (CHADictionary)
- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary {
    return [self initWithPersonArray:aDictionary[kCHAKeyPersons] BookArray:aDictionary[kCHAKeyBooks]];
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    if (self.bookArray)
        dictionary [kCHAKeyBooks] = self.bookArray;
    if (self.personArray)
        dictionary [kCHAKeyPersons] = self.personArray;
    return dictionary;
}

@end
