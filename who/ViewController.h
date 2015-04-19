//
//  ViewController.h
//  who
//
//  Created by 翁高剑 on 15/3/2.
//  Copyright (c) 2015年 翁高剑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//按键操作
-(IBAction)clickButton:(UIButton *)sender;
- (IBAction)showResult:(id)sender;
- (IBAction)clickClear:(id)sender;
- (IBAction)backSpace:(id)sender;
- (IBAction)stateChange:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *state;

@property (weak, nonatomic) IBOutlet UITextView *conditional;
@property (weak, nonatomic) IBOutlet UITextView *result;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexChoice;
- (IBAction)yonger:(id)sender;
- (IBAction)older:(id)sender;


@end

