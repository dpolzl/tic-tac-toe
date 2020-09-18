//
//  ViewController.h
//  Tic-Tac-Toe
//
//  Created by Damian Polzl <damianpolzl@gmail.com> on 9/12/20.
//  Copyright © 2020 Damian Polzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, strong) IBOutlet UIButton *b0;
@property(nonatomic, strong) IBOutlet UIButton *b1;
@property(nonatomic, strong) IBOutlet UIButton *b2;
@property(nonatomic, strong) IBOutlet UIButton *b3;
@property(nonatomic, strong) IBOutlet UIButton *b4;
@property(nonatomic, strong) IBOutlet UIButton *b5;
@property(nonatomic, strong) IBOutlet UIButton *b6;
@property(nonatomic, strong) IBOutlet UIButton *b7;
@property(nonatomic, strong) IBOutlet UIButton *b8;
@property(nonatomic, strong) IBOutlet UIButton *start;
@property(nonatomic, strong) IBOutlet UILabel *endGame;
@property(nonatomic, strong) NSMutableArray *board;
@property(nonatomic, strong) NSMutableArray *stateBoard;
@property(nonatomic, strong) UIColor *color;

- (IBAction) playGame:(id)sender;
- (void) createBoard;
- (void) createStateBoard;
- (IBAction) selectOption:(id)sender;
- (void) machineOption;
- (void) winner;

@end

