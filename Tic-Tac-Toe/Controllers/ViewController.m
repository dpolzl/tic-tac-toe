//
//  ViewController.m
//  Tic-Tac-Toe
//
//  Created by Damian Polzl <damianpolzl@gmail.com> on 9/12/20.
//  Copyright © 2020 Damian Polzl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction) playGame:(id)sender {
    
    self.createBoard;
    self.createStateBoard;
}

 - (void) createBoard {
     self.board = [NSMutableArray new];
     [self.board insertObject:[NSMutableDictionary dictionaryWithObjectsAndKeys: self.b0 , @"0" , self.b1, @"1", self.b2, @"2", nil] atIndex:0];
     [self.board insertObject:[NSMutableDictionary dictionaryWithObjectsAndKeys: self.b3 , @"3" , self.b4, @"4", self.b5, @"5", nil] atIndex:1];
     [self.board insertObject:[NSMutableDictionary dictionaryWithObjectsAndKeys: self.b6 , @"6" , self.b7, @"7", self.b8, @"8", nil] atIndex:2];
     
 }

- (void) createStateBoard {
    
    self.stateBoard = [NSMutableArray new];
    int size_board = (int)[self.board count] * (int)[self.board count];
    
    for(int i = 0; i < size_board ; ++i){
        [self.stateBoard addObject:@"-"];
    }
   
}

- (IBAction) selectOption:(id)sender {
   
    for (NSMutableDictionary *item in self.board) {
            [item enumerateKeysAndObjectsUsingBlock:^(NSString *key, UIButton *value, BOOL *stop) {
                if ([value isEqual:sender]) {
                    [value setBackgroundColor:[UIColor blueColor]];
                    [value setEnabled:NO];
                    [self.stateBoard replaceObjectAtIndex:[key integerValue] withObject:@"x"];
                }
            }];
    }
    
    self.machineOption;
    self.winner;
    
}

- (void) machineOption {
    
        [self.stateBoard enumerateObjectsUsingBlock:^(NSString *value, NSUInteger index, BOOL *stop) {
            if ([value isEqualToString:@"-"]) {
                [self.stateBoard replaceObjectAtIndex:index withObject:@"O"];
                for (NSMutableDictionary *item in self.board) {
                    [item enumerateKeysAndObjectsUsingBlock:^(NSString *key, UIButton *value, BOOL *stop) {
                        if ([key integerValue] == index) {
                            [value setEnabled:NO];
                            [value setBackgroundColor:[UIColor redColor]];
    
                            *stop = YES;
                        }
                    }];
                }
                
                *stop = YES;
            }
        }];
    
}

- (void) winner {
    
    NSMutableArray *winning = [NSMutableArray new];
    [winning insertObject:[NSArray arrayWithObjects:@"0", @"1", @"2", nil] atIndex:0];
    [winning insertObject:[NSArray arrayWithObjects:@"3", @"4", @"5", nil] atIndex:1];
    [winning insertObject:[NSArray arrayWithObjects:@"6", @"7", @"8", nil] atIndex:2];
    [winning insertObject:[NSArray arrayWithObjects:@"0", @"3", @"6", nil] atIndex:3];
    [winning insertObject:[NSArray arrayWithObjects:@"1", @"4", @"7", nil] atIndex:4];
    [winning insertObject:[NSArray arrayWithObjects:@"2", @"5", @"8", nil] atIndex:5];
    [winning insertObject:[NSArray arrayWithObjects:@"0", @"4", @"8", nil] atIndex:6];
    [winning insertObject:[NSArray arrayWithObjects:@"2", @"4", @"6", nil] atIndex:7];
    
    
    for (NSMutableArray *value in winning) {
        
        if ( ![[self.stateBoard objectAtIndex:[[value objectAtIndex:0] integerValue]] isEqualToString:@"-"]
            && [[self.stateBoard objectAtIndex:[[value objectAtIndex:0] integerValue]] isEqualToString:[self.stateBoard objectAtIndex:[[value objectAtIndex:1] integerValue]]]
            && [[self.stateBoard objectAtIndex:[[value objectAtIndex:1] integerValue]] isEqualToString:[self.stateBoard objectAtIndex:[[value objectAtIndex:2] integerValue]]] ) {
            
                if ([[self.stateBoard objectAtIndex:0] isEqualToString:@"x"]) {
                    self.endGame.text = @"Winner :-)!!!";
                    self.endGame.backgroundColor = [UIColor greenColor];
                } else {
                    self.endGame.text = @"Game Over :-(";
                    self.endGame.backgroundColor = [UIColor yellowColor];
            }
            
        }
        
    }
   
}

@end
