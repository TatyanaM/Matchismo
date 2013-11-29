//
//  PlayingCard.h
//  Matchino
//
//  Created by Mudryak on 09.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

//делаем методы класса публичным
+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
