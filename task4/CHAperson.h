//
//  CHAperson.h
//  task2
//
//  Created by Владислав Яцун on 7/6/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHAbook.h"

@interface CHAperson : NSObject
@property(readwrite, copy) NSString *personFirstName;
@property(readwrite, copy) NSString *personLastName;
@property NSInteger personYear;
@property(readonly) NSString *fullName;
@property(readonly) CHAbook *currentBook;
@property(readonly) NSMutableArray *personBooks;

-(instancetype)initPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear;
+(instancetype)createPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear;

-(BOOL)takeBook: (CHAbook *)aBook;
-(BOOL)returnCurrentBook;

@end
