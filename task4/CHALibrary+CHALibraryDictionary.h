//
//  CHALibrary+CHALibraryDictionary.h
//  task4
//
//  Created by Владислав Яцун on 7/11/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHALibrary.h"

@interface CHALibrary (CHALibraryDictionary)
- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary;
- (NSDictionary *)dictionaryRepresentation;

@end
