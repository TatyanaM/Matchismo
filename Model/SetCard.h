//
//  PlayingSetCard.h
//  Matchino
//
//  Created by Mudryak on 29.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSUInteger symbol;
@property (nonatomic) NSUInteger color;
@property (nonatomic) NSUInteger shadding;
@property (nonatomic) NSUInteger symbolsCount;

+(NSArray *)validSymbols;
+(NSArray *)validColor;
+(NSArray *)validShadding;
+(NSArray *)validSymbolsCount;


@end
