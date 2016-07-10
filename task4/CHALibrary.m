//
//  CHALibrary.m
//  task4
//
//  Created by Владислав Яцун on 7/9/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHALibrary.h"

@interface CHALibrary()
    @property NSMutableArray *mPersonArray;
    @property NSMutableArray *mBookArray;
@end

@implementation CHALibrary

-(instancetype)initWithPersonArray:(NSArray *)persons BookArray:(NSArray *)books{
    self = [super init];
    if(self != nil){
        [_mPersonArray addObjectsFromArray:persons];
        [_mBookArray addObjectsFromArray:books];
 //       [persons release];  // ??????
 //       [books release];    // ??????
    }
    return self;
}

-(BOOL)addPerson:(CHAPerson *)aPerson{
    BOOL result = NO;
    if(![self.personArray containsObject:aPerson]){
        [self.mPersonArray addObject:aPerson];
        result = YES;
    }
    return result;
}

-(BOOL)removePerson:(CHAPerson *)aPerson{
    BOOL result = NO;
    if([self.personArray containsObject:aPerson]){
        [self.mPersonArray removeObject:aPerson];
        result = YES;
    }
    return result;
}

-(BOOL)addBook:(CHABook *)aBook{
    BOOL result = NO;
    if(![self.bookArray containsObject:aBook]){
        [self.mBookArray addObject:aBook];
        result = YES;
    }
    return result;
}

-(BOOL)removeBook:(CHABook *)aBook{
    BOOL result = NO;
    if([self.bookArray containsObject:aBook]){
        [self.mBookArray removeObject:aBook];
        result = YES;
    }
    return result;
}

-(NSUInteger)hash{
    return ABS(([self.personArray count] * [self.bookArray count]) + 5);
}

-(BOOL)isEqual:(CHALibrary *)aLibrary{
    BOOL result = NO;
    if([aLibrary isKindOfClass:[CHALibrary class]]
       && self.hash == aLibrary.hash
       && [self.personArray isEqualToArray:aLibrary.personArray]
       && [self.bookArray isEqualToArray:aLibrary.bookArray]){
        result = YES;
    }
    return result;
}

-(NSArray *)personArray{
    return (NSArray *)self.mPersonArray;
}

-(NSArray *)bookArray{
    return (NSArray *)self.mBookArray;
}
@end
