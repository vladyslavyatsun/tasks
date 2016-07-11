//
//  CHALibrary+CHALibraryDictionary.m
//  task4
//
//  Created by Владислав Яцун on 7/11/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHALibrary+CHALibraryDictionary.h"

NSString *const kCHAKeyBooks = @"books";
NSString *const kCHAKeyPersons = @"persons";

@implementation CHALibrary (CHALibraryDictionary)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary {
    for (CHAPerson *person in aDictionary[kCHAKeyPersons]) {
        for (CHABook *book in person.personBooks) {
            [book setOwner:person];
        }
    }
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