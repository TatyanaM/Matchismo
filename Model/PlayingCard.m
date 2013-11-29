//
//  PlayingCard.m
//  Matchino
//
//  Created by Mudryak on 09.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *)cardsToMatch
{
    int score = 0;
    if (cardsToMatch.count == 1)
    {
        id otherCard = [cardsToMatch objectAtIndex:0];
        if ([otherCard isKindOfClass:[PlayingCard class]])
        {
            PlayingCard *otherPlayingCard = otherCard;
            if ([otherPlayingCard.suit isEqualToString:self.suit]) {
                score = 1;
            } else if (otherPlayingCard.rank == self.rank) {
                score = 4;
            }
        }
        
    }
    else if (cardsToMatch.count == 2)
    {
        PlayingCard *firstCard = [cardsToMatch  objectAtIndex:0];
        PlayingCard *secondCard = [cardsToMatch objectAtIndex:1];
        if ([firstCard.suit isEqualToString:self.suit] && [secondCard.suit isEqualToString:self.suit])
            score = 2;
        else if ((firstCard.rank == self.rank) && (secondCard.rank == self.rank))
            score = 8;
        
    }
    return score;
}

//возвращает описание текущей карты
-(NSString *)contens
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

#pragma mark Cards values

//обычно @synthesize генерируется автоматически. но если бы переписываем ОБА и сеттер и геттер - то мы должны вручную прописать @synthesize
@synthesize suit = _suit;

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

+(NSArray *)validSuits
{
    return @[@"♠",@"♣",@"♥",@"♦"];
}

//переписываем сеттер, чтобы быть уверенными что масти всегда будут такими
-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) _suit = suit;

}

//определяем возможные значения ранга карты
+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

//ограничеваем максимальный ранг карты
+(NSUInteger)maxRank { return [self rankStrings].count-1;}

//переписываем сеттер чтобы быть уверенными, что значение всегда будет корректным
//для себя - передаваемый параметр rank - число!!
-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) _rank = rank;
}
@end
