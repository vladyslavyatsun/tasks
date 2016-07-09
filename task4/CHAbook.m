//
//  CHAbook.m
//  task2
//
//  Created by Владислав Яцун on 7/5/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHABook.h"

@implementation CHAbook

//{
//@private
//    NSString *_name;
//    int _year;
//    bookType _type;
//    NSString *_idBook;
//}

//@synthesize idBook = _idBook;

-(instancetype)init{
    self = [self initWithName:nil Year:-1 Type:3 IdBook:nil];
    return self;
}

-(instancetype) initWithName:(NSString *)bookName  Year:(NSInteger)bookYear Type:(bookType)typeBook IdBook :(NSString *) idBook{
    self = [super init];
    if(self){
        _name = bookName;
        _year = bookYear;
        _type = typeBook;
        _idBook = idBook;
    }
    return self; 
}


-(instancetype) initWithName:(NSString *)bookName  Year:(NSInteger)bookYear Type:(bookType)typeBook{
    NSString *idBook = [[NSUUID alloc]init].UUIDString;
    self = [self initWithName:bookName Year:bookYear Type: typeBook IdBook:idBook];
    return self;
}

//-(NSString *) getName{
//    return _name;
//}
//-(void) setName:(NSString *) newName{
//    if(newName != self.getName){
//        [newName retain];
//        [_name release];
//        _name = newName;
//        
//    }
//}

//-(int)getYear{
//    return _year;
//}
//
//-(void) setYear:(int) newYear{
//    _year = newYear;
//}
//
//-(bookType) getType{
//    return _type;
//}
//
//-(void) setType:(bookType) newType{
//    _type = newType;
//}
//
//-(NSString *)idBook{
//    return _idBook;
//}


+(CHAbook *)createAutoreleseBookName:(NSString *)name Year:(NSInteger)year Type:(bookType)type IdBook:(NSString *)idBook{
    return [[[self alloc]initWithName:name Year:year Type:type IdBook:idBook]autorelease];
}

-(NSString *) description{
    return [NSString stringWithFormat: @"\nName : %@\nYear : %ld\nType : %@\n", self.name, self.year, [self getStringTypeDescription]];
}

- (NSString *)getStringTypeDescription{
    NSString  * type = nil;
    switch (self.type) {
        case kCHABookPaperback:
            type = @"paperback";
            break;
        case kCHABookHardcover:
            type = @"hardcover";
            break;
        default:
            type = @"undefined";
    }
    return type;
}

-(void)dealloc{
    [self.name release];
    [super dealloc];
}


-(NSUInteger)hash{
    return ABS(([self.name length]*3
            + self.type
            + self.year * 5
            + [self.idBook length] * 9) - 3);
}


-(BOOL)isEqual:(CHAbook *)aBook{
    BOOL result = NO;
    if([aBook isKindOfClass:[CHAbook class]]
       && self.hash == aBook.hash
       && [self.idBook isEqual: aBook.idBook]
       && [self.name isEqual:aBook.name]
       && self.type == aBook.type
       && self.year == aBook.year
       && [self.owner isEqual: aBook.owner])
    { result = YES;}
    return result;
}

@end
