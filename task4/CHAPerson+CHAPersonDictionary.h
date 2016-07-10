//
//  CHAPerson+CHAPersonDictionary.h
//  task4
//
//  Created by Владислав Яцун on 7/10/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHAPerson.h"

@interface CHAPerson (CHAPersonDictionary)
- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary;
- (NSDictionary *)dictionaryRepresentation;
@end
