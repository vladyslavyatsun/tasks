//
//  CHALibrary.h
//  task4
//
//  Created by Владислав Яцун on 7/9/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHAPerson.h"
#import "CHALibrary+CHADictionary.h"

@interface CHALibrary : NSObject
@property(readonly)NSArray *personArray;
@property(readonly)NSArray *bookArray;

-(instancetype)initWithPersonArray:(NSArray *)persons BookArray:(NSArray *)books;

-(BOOL)addPerson:(CHAPerson *)aPerson;
-(BOOL)removePerson:(CHAPerson *)aPerson;

-(BOOL)addBook:(CHABook *)aBook;
-(BOOL)removeBook:(CHABook *)aBook;
@end
