//
//  SetCardView.h
//  Matchino
//
//  Created by Mudryak on 09.10.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCardView : UIView

@property (nonatomic) NSUInteger symbol;
@property (nonatomic) NSUInteger color;
@property (nonatomic) NSUInteger shadding;
@property (nonatomic) NSUInteger symbolsCount;

@property (nonatomic) BOOL faceUp;

@end
