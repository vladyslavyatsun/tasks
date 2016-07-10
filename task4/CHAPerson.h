//
//  CHAperson.h
//  task2
//
//  Created by Владислав Яцун on 7/6/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHABook.h"

@interface CHAPerson : NSObject
@property(readwrite, copy) NSString *personFirstName;
@property(readwrite, copy) NSString *personLastName;
@property NSInteger personYear;
@property(readonly) NSString *fullName;
@property(readonly) NSArray *personBooks;

-(instancetype)initPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear;
-(instancetype)initPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear personBooks :(NSArray *)personBooks;

+(instancetype)createPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear;

-(BOOL)isEqualWithoutBooks:(CHAPerson *)person;
-(BOOL)takeBook: (CHABook *)aBook;
-(BOOL)returnCurrentBook :(CHABook *)aBook;

@end
