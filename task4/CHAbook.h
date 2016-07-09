//
//  CHAbook.h
//  task2
//
//  Created by Владислав Яцун on 7/5/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CHAperson;

typedef enum
{
    kCHABookPaperback,
    kCHABookHardcover,
    kCHABookUndefined
} bookType;


@interface CHAbook : NSObject


@property(readonly) NSString *idBook;
@property(readwrite, assign) CHAperson *owner;
@property(readwrite, retain) NSString *name;
@property(readwrite) bookType type;
@property(readwrite) NSInteger year;

-(instancetype) initWithName:(NSString *)bookName  Year:(NSInteger)bookYear Type:(bookType)typeBook IdBook :(NSString *) idBook;

//-(NSString *) getName;
//-(void) setName:(NSString *) newName;
//-(bookType) getType;
//-(void) setType:(bookType) newType;
//-(int)getYear;
//-(void)setYear:(int) newYear;
//-(NSString *) idBook;

+(CHAbook *)createAutoreleseBookName:(NSString *)name Year:(NSInteger)year Type:(bookType)type IdBook:(NSString *)idBook;

@end
