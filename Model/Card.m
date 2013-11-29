//
//  Card.m
//  Matchino
//
//  Created by Mudryak on 09.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contens isEqualToString:self.contens]) {
            score = 1;
        }
    }
    return score;
}




@end
