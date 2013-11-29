//
//  GameResultViewController.m
//  Matchino
//
//  Created by Mudryak on 18.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "GameResultViewController.h"
#import "GameResult.h"

@interface GameResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;
@property (nonatomic) SEL sortSelector;

@end

@implementation GameResultViewController

- (IBAction)clearHistory {
}

-(void)updateUI
{
    NSString *displayText = @"";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];

    for (GameResult *result in [[GameResult allGameResults] sortedArrayUsingSelector:self.sortSelector]) { // sorted
    displayText = [displayText stringByAppendingFormat:@"Score: %d (%@, %0d )\n", result.score, [formatter stringFromDate:result.end], result.duration];  // formatted date
    }
    self.display.text = displayText;
}


#pragma mark - Sorting

@synthesize sortSelector = _sortSelector;  

// return default sort selector if none set (by score)

- (SEL)sortSelector
{
    if (!_sortSelector) _sortSelector = @selector(compareScoreToGameResult:);
    return _sortSelector;
}

// update the UI when changing the sort selector

- (void)setSortSelector:(SEL)sortSelector
{
    _sortSelector = sortSelector;
    [self updateUI];
}

- (IBAction)sortByDate
{
    self.sortSelector = @selector(compareEndDateToGameResult:);
}

- (IBAction)sortByScore
{
    self.sortSelector = @selector(compareScoreToGameResult:);
}

- (IBAction)sortByDuration
{
    self.sortSelector = @selector(compareDurationToGameResult:);
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void)setup
{
    //initialization that can't wait until viewDidLoad
    
}

-(void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}



@end
