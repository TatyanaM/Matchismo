//
//  SetCardDeck.m
//  Matchino
//
//  Created by Mudryak on 29.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

-(id)init
{
    self = [super init];
    if (self)
    {
    for (NSNumber *symbolsCount in [SetCard validSymbolsCount]) {
      for (NSNumber *symbol in [SetCard validSymbols]) {
        for (NSNumber *color in [SetCard validColor]) {
            for (NSNumber *shadding in [SetCard validShadding]) {
                SetCard *playingCard = [[SetCard alloc] init];
                playingCard.symbolsCount = [symbolsCount integerValue];
                playingCard.symbol = [symbol integerValue];
                playingCard.color = [color integerValue];
                playingCard.shadding = [shadding integerValue];
                
                [self addCard:playingCard atTop:YES];
            }
        }
      }
    }
    }
    return self;
}




@end
