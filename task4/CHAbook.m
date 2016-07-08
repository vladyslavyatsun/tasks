//
//  CHAbook.m
//  task2
//
//  Created by Владислав Яцун on 7/5/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHABook.h"

@implementation CHAbook

{
@private
    NSString *_name;
    int _year;
    bookType _type;
}


-(instancetype)init{
    self = [super init];
    if(self){
        _name = nil;
        _year = -1;
        _type = 3;
    }
    return self;
}

-(instancetype) initWithName:(NSString *)bookName  Year:(int)bookYear Type:(bookType)typeBook{
    self = [super init];
    if(self){
        _name = bookName;
        _year = bookYear;
        _type = typeBook;
    }
    return self;
}

-(NSString *) getName{
    return _name;
}
-(void) setName:(NSString *) newName{
    if(newName != self.getName){
        [newName retain];
        [_name release];
        _name = newName;
        
    }
}

-(int)getYear{
    return _year;
}

-(void) setYear:(int) newYear{
    _year = newYear;
}

-(bookType) getType{
    return _type;
}

-(void) setType:(bookType) newType{
    _type = newType;
}


+(CHAbook *)createAutoreleseBookName:(NSString *)name Year:(int)year Type:(bookType)type{
    return [[[self alloc]initWithName:name Year:year Type:type]autorelease];
}

-(NSString *) description{
    return [NSString stringWithFormat: @"\nName : %@\nYear : %d\nType : %@\n", self.getName, self.getYear, [self getStringTypeDescription]];
}

- (NSString *)getStringTypeDescription{
    NSString  * type = nil;
    switch (self.getType) {
        case paperback:
            type = @"paperback";
            break;
        case hardcover:
            type = @"hardcover";
            break;
        default:
            type = @"undefined";
    }
    return type;
}

-(void)dealloc{
    [self.getName release];
    [super dealloc];
}

@end
