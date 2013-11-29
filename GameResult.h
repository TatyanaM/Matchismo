//
//  GameResult.h
//  Matchino
//
//  Created by Mudryak on 19.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

+(NSArray *)allGameResults; 

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (nonatomic) NSTimeInterval *duration;
@property (nonatomic) int score;


- (NSComparisonResult)compareScoreToGameResult:(GameResult *)otherResult;
- (NSComparisonResult)compareEndDateToGameResult:(GameResult *)otherResult;
- (NSComparisonResult)compareDurationToGameResult:(GameResult *)otherResult;
@end
