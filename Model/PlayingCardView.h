//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Mudryak on 29.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSInteger rank;
@property (strong, nonatomic) NSString *suit;

@property (nonatomic) BOOL faceUp;

-(void)pinch: (UIPinchGestureRecognizer *)gesture;

@end
