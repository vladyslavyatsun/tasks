//
//  CHAbook.h
//  task2
//
//  Created by Владислав Яцун on 7/5/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CHAPerson;

typedef enum
{
    kCHABookPaperback,
    kCHABookHardcover,
    kCHABookUndefined
} bookType;


@interface CHABook : NSObject

@property(readonly) NSString *idBook;
@property(readwrite, assign) CHAPerson *owner;
@property(readwrite, copy, nonatomic) NSString *name;
@property(readwrite) bookType type;
@property(readwrite) NSInteger year;

-(instancetype) initWithName:(NSString *)bookName  Year:(NSInteger)bookYear Type:(bookType)typeBook IdBook :(NSString *) idBook Owner :(CHAPerson *)owner;
-(instancetype) initWithName:(NSString *)bookName  Year:(NSInteger)bookYear Type:(bookType)typeBook IdBook :(NSString *) idBook;
-(instancetype) initWithName:(NSString *)bookName  Year:(NSInteger)bookYear Type:(bookType)typeBook;

+(CHABook *)createAutoreleseBookName:(NSString *)name Year:(NSInteger)year Type:(bookType)type IdBook:(NSString *)idBook;

@end
