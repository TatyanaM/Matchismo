//
//  PlayingSetCard.m
//  Matchino
//
//  Created by Mudryak on 29.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

#pragma mark Cards values

+(NSArray *)validSymbols
{
  return @[@1,@2,@3];
}

+(NSArray *)validColor
{
  return @[@1,@2,@3];
}

+(NSArray *)validShadding
{
  return @[@1,@2,@3];
}

+(NSArray *)validSymbolsCount
{
  return @[@1,@2,@3];
}

-(void)setSymbol:(NSUInteger)symbol
{
    if ([[SetCard validSymbols] containsObject:@(symbol)]) _symbol = symbol;
}

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    SetCard *firstCard = [otherCards objectAtIndex:0];
    SetCard *secondCard = [otherCards objectAtIndex:1];
    
    BOOL sameCountOfSymbols = (firstCard.symbolsCount == self.symbolsCount) && (secondCard.symbolsCount == self.symbolsCount);
    BOOL sameColor = (firstCard.color == self.color) && (secondCard.color == self.color);
    BOOL sameSymbol = (firstCard.symbol == self.symbol) && (secondCard.symbol == self.symbol);
    BOOL sameShadding = (firstCard.shadding == self.shadding) && (secondCard.shadding == self.shadding);
    
    BOOL differentCountOfSymbols = !(self.symbolsCount == firstCard.symbolsCount) && !(firstCard.symbolsCount == secondCard.symbolsCount) && !(self.symbolsCount == secondCard.symbolsCount);
    BOOL differentColor = !(self.color == firstCard.color) && !(firstCard.color == secondCard.color) && !(self.color == secondCard.color);
    BOOL differentSymbol = !(self.symbol == firstCard.symbol) && !(firstCard.symbol == secondCard.symbol) && !(self.symbol == secondCard.symbol);
    BOOL differentShadding = !(self.shadding == firstCard.shadding) && !(firstCard.shadding == secondCard.shadding) && !(self.shadding == secondCard.shadding);

    if ((sameCountOfSymbols || differentCountOfSymbols) && (sameSymbol || differentSymbol) && (sameColor || differentColor) && (sameShadding || differentShadding))
    {
        score = 1;
    }
    return score;
}


@end
