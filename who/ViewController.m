//
//  ViewController.m
//  who
//
//  Created by 翁高剑 on 15/3/2.
//  Copyright (c) 2015年 翁高剑. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

{
    NSArray *callArray, *resultArray ;
    NSString *currentString, *nextString, *resultString ;
    BOOL isFirstClick, shouldStop ;
    NSInteger indexOfItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isFirstClick = true;
    shouldStop = false;
    indexOfItem = 0;
    //初始化结果
    resultString = [NSString stringWithFormat:@""];
    // 初始化按键的称呼
    callArray = [[NSArray alloc] initWithObjects:
            @"父",@"母",@"夫",
            @"兄",@"姐",@"妻",
            @"弟",@"妹",@"的",
            @"子",@"女", nil];
    
    //定义输入的字符串
    currentString = [NSString stringWithFormat:@""];

    //可能的组合对于的称呼
    resultArray = [[NSArray alloc]initWithObjects:
                   //祖父母 14
                   @"祖父的妻",@"祖母",@"祖父的女",@"姑妈",
                   @"祖父的子",@"伯父",@"叔叔",
                   @"祖母的夫",@"祖父",@"祖母的女",@"姑妈",
                   @"祖母的子",@"伯父",@"叔叔",
                   //外祖父母 12
                   @"外祖父的妻",@"外祖母",@"外祖父的子",@"舅舅",
                   @"外祖父的女",@"姨妈",
                   @"外祖母的夫",@"外祖父",@"外祖母的子",@"舅舅",
                   @"外祖母的女",@"姨妈",
                   //姑妈姑丈 20
                   @"姑妈的父",@"祖父",@"姑妈的母",@"祖母",
                   @"姑妈的夫",@"姑丈",@"姑妈的子",@"表哥",@"表弟",
                   @"姑妈的女",@"表姐",@"表妹",
                   @"姑丈的妻",@"姑妈",@"姑丈的子",@"表哥",@"表弟",
                   @"姑丈的女",@"表姐",@"表妹",
                   //伯父伯母 29
                   @"伯父的父",@"祖父",@"伯父的母",@"祖母",
                   @"伯父的妻",@"伯母",@"伯父的兄",@"伯父",
                   @"伯父的弟",@"伯父",@"叔叔",
                   @"伯父的姐",@"姑妈",@"伯父的妹",@"姑妈",
                   @"伯父的子",@"堂哥",@"堂弟",
                   @"伯父的女",@"堂姐",@"堂妹",
                   @"伯母的夫",@"伯父",@"伯母的子",@"堂哥",@"堂弟",
                   @"伯母的女",@"堂姐",@"堂妹",
                   //叔叔婶婶 29
                   @"叔叔的父",@"祖父",@"叔叔的母",@"祖母",
                   @"叔叔的妻",@"婶婶",@"叔叔的兄",@"伯父",@"叔叔",
                   @"叔叔的弟",@"叔叔",@"叔叔的姐",@"姑妈",
                   @"叔叔的妹",@"姑妈",@"叔叔的子",@"堂哥",@"堂弟",
                   @"叔叔的女",@"堂姐",@"堂妹",
                   @"婶婶的夫",@"叔叔",@"婶婶的子",@"堂哥",@"堂弟",
                   @"婶婶的女",@"堂姐",@"堂妹",
                   //父亲母亲 40
                   @"父的父",@"祖父",@"父的母",@"祖母",
                   @"父的兄",@"伯父",@"父的弟",@"叔叔",
                   @"父的姐",@"姑妈",@"父的妹",@"姑妈",
                   @"父的子",@"哥哥",@"弟弟",
                   @"父的女",@"姐姐",@"妹妹",@"父的妻",@"母",
                   @"母的夫",@"父",@"母的父",@"外祖父",
                   @"母的母",@"外祖母",@"母的兄",@"舅舅",
                   @"母的弟",@"舅舅",@"母的姐",@"姨妈",
                   @"母的妹",@"姨妈",@"母的子",@"哥哥",@"弟弟",
                   @"母的女",@"姐姐",@"妹妹",
                   //舅舅舅妈 28
                   @"舅舅的父",@"外祖父",@"舅舅的母",@"外祖母",
                   @"舅舅的妻",@"舅妈",@"舅舅的子",@"表哥",@"表弟",
                   @"舅舅的女",@"表姐",@"表妹",@"舅舅的哥",@"舅舅",
                   @"舅舅的弟",@"舅舅",@"舅舅的姐",@"姨妈",
                   @"舅舅的妹",@"姨妈",
                   @"舅妈的夫",@"舅舅",@"舅妈的子",@"表哥",@"表弟",
                   @"舅妈的女",@"表姐",@"表妹",
                   //姨丈姨妈 22
                   @"姨丈的妻",@"姨妈",@"姨丈的子",@"表哥",@"表弟",
                   @"姨丈的女",@"表姐",@"表妹",
                   @"姨妈的父",@"外祖父",@"姨妈的子",@"表哥",@"表弟",
                   @"姨妈的母",@"外祖母",@"姨妈的女",@"表姐",@"表妹",
                   @"姨妈的哥",@"舅舅",@"姨妈的弟",@"舅舅",
                   //哥哥嫂嫂 16
                   @"兄的父",@"父",@"兄的母",@"母",
                   @"兄的妻",@"嫂嫂",@"兄的子",@"侄子",
                   @"兄的女",@"侄女",@"嫂嫂的夫",@"兄",
                   @"嫂嫂的子",@"侄子",@"嫂嫂的女",@"侄女",
                   //弟弟弟媳 16
                   @"弟的父",@"父",@"弟的母",@"母",
                   @"弟的妻",@"弟媳",@"弟的子",@"侄子",
                   @"弟的女",@"侄女",@"弟媳的夫",@"弟",
                   @"弟媳的子",@"侄子",@"弟媳的女",@"侄女",
                   //岳父岳母 16
                   @"岳父的子",@"大舅子",@"小舅子",
                   @"岳父的女",@"大姨子",@"小姨子",
                   @"岳父的妻",@"岳母",@"岳母的夫",@"岳父",
                   @"岳母的子",@"大舅子",@"小舅子",
                   @"岳母的女",@"大姨子",@"小姨子",
                   //自己妻子 18
//                   @"父",@"父",@"母",@"母",
//                   @"兄",@"兄",@"弟",@"弟",
//                   @"姐",@"姐",@"妹",@"妹",
//                   @"妻",@"妻",@"子",@"子",
//                   @"女",@"女",
                   @"妻的夫",@"自己",
                   @"妻的子",@"子",@"妻的女",@"女",
                   @"妻的父",@"岳父",@"妻的母",@"岳母",
                   @"妻的姐",@"大姨子",@"妻的妹",@"小姨子",
                   @"妻的兄",@"大舅子",@"妻的弟",@"小舅子",
                   //大舅子 14
                   @"大舅子的父",@"岳父",@"大舅子的母",@"岳母",
                   @"大舅子的哥",@"大舅子",@"大舅子的弟",@"大舅子",@"小舅子",
                   @"大舅子的姐",@"大姨子",
                   @"大舅子的妹",@"大姨子",@"小姨子",
                   // 小舅子 14
                   @"小舅子的父",@"岳父",@"小舅子的母",@"岳母",
                   @"小舅子的哥",@"大舅子",@"小舅子",
                   @"小舅子的弟",@"小舅子",@"小舅子的姐",@"大姨子",@"大姨子",
                   @"小舅子的妹",@"小姨子",
                   //大姨子
                   @"大姨子的父",@"岳父",@"大姨子的母",@"岳母",
                   @"大姨子的哥",@"大舅子",@"大姨子的姐",@"大姨子",
                   @"大姨子的弟",@"大舅子",@"小舅子",
                   @"大姨子的妹",@"大姨子",@"小姨子",
                   //小姨子
                   @"小姨子的父",@"岳父",@"小姨子的母",@"岳母",
                   @"小姨子的弟",@"小舅子",@"小姨子的妹",@"小姨子",
                   @"小姨子的哥",@"大舅子",@"小舅子",
                   @"小姨子的姐",@"大姨子",@"小姨子",
                   //姐姐姐夫
                   @"姐的父",@"父",@"姐的母",@"母",
                   @"姐的兄",@"兄",@"",@"",
                   @"",@"",@"",@"",
                   @"",@"",@"",@"",
                   @"",@"",@"",@"",
                   nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)clickButton:(UIButton *)sender
{
    if (!shouldStop)
    {
    
        NSInteger digit = sender.tag;
        NSLog(@"the digit is %li",(long)digit);
        if (currentString.length == 0) //防止将当前字符全部删去后出现错误输出
        {
            isFirstClick = true;
        }
        //currentString = callArray[digit];
        currentString = [currentString stringByAppendingString:callArray[digit]];
        self.state.text =currentString;
    /*
    string = [string stringByAppendingString:callArray[digit]];
    //string = [string stringByAppendingString:callArray[digit]];
    NSLog(@"the string is %@",callArray[digit]);
    NSLog(@"the string is %@",string);
    self.result.text =string;
     */
    }
}

- (IBAction)showResult:(id)sender {
    
    indexOfItem = [resultArray indexOfObject:currentString];
    NSLog(@"the value is %li",(long)indexOfItem);
    if(indexOfItem == LONG_LONG_MAX)//如果输入的字符串在数组中没有则返回错误
    {
        resultString = @"对不起，关系太乱，脑子宕机了。。。请自行对照关系图谱确认！^_^";
        shouldStop = true;
        self.state.text = resultString;
        self.result.text = @"";
    }
    else
    {
        if (isFirstClick)
        {
            resultString = @"请输入关系";
            self.result.text = resultString;
        }
        else
        {
            if (indexOfItem == 4 || indexOfItem == 11 || indexOfItem == 54 || indexOfItem == 81 )
            {
                self.result.text = @"";
                self.conditional.text = @"比父亲年长或者年轻？";
            }
            else if (indexOfItem == 32 || indexOfItem == 35 || indexOfItem == 40 || indexOfItem == 43 ||
                     indexOfItem == 61 || indexOfItem == 64 || indexOfItem == 69 || indexOfItem == 72 ||
                     indexOfItem == 90 || indexOfItem == 93 || indexOfItem == 98 || indexOfItem == 101 ||
                     indexOfItem == 116 || indexOfItem == 119 || indexOfItem == 138 || indexOfItem == 141 ||
                     indexOfItem == 150 || indexOfItem == 153 || indexOfItem == 166 || indexOfItem == 169 ||
                     indexOfItem == 202 || indexOfItem == 205 || indexOfItem == 210 || indexOfItem == 215 )
            {
                self.result.text = @"";
                self.conditional.text = @"比我年长或者年轻？";
            }
            else if (indexOfItem == 226 || indexOfItem == 229 || indexOfItem == 236 || indexOfItem == 239 ||
                     indexOfItem == 266 || indexOfItem == 269 || indexOfItem == 271)
            {
                self.result.text = @"";
                self.conditional.text = @"比妻子年长或者年轻？";
            }
            else
            {
                resultString = resultArray[indexOfItem + 1];
                self.result.text = resultString;
            }
        }
    }
}

- (IBAction)clickClear:(id)sender {
    //NSLog(@"the digit is %i",digit);
    self.state.text = nil;
    self.result.text = nil;
    self.conditional.text = nil;
    isFirstClick = true;
    shouldStop =false;
    currentString = @"";
}

- (IBAction)backSpace:(id)sender {
    if(currentString.length != 0)
    {
        currentString = [currentString substringToIndex:[currentString length] - 1];
        self.state.text =currentString;
    }
    else
    {
        isFirstClick = true;
    }
}

- (IBAction)stateChange:(id)sender {
    if (isFirstClick)
    {
        currentString = [currentString stringByAppendingString:callArray[8]];
        NSLog(@"currentString is %@",currentString);
        isFirstClick = false;
    }
    else
    {
        indexOfItem = [resultArray indexOfObject:currentString];
        NSLog(@"the value is %li",(long)indexOfItem);
        if(indexOfItem == LONG_LONG_MAX)//如果输入的字符串在数组中没有则返回错误
        {
            resultString = @"对不起，关系太乱，脑子宕机了。。。请自行对照关系图谱确认！^_^";
            shouldStop = true;
            self.state.text = resultString;
            self.result.text = @"";
        }
        else
        {
            resultString = resultArray[indexOfItem + 1];
            self.result.text = resultString;
        }
        currentString = [resultString stringByAppendingString:callArray[8]];
    }
}

- (IBAction)yonger:(id)sender
{
    resultString = resultArray[indexOfItem + 2];
    self.result.text = resultString;
}

- (IBAction)older:(id)sender
{
    resultString = resultArray[indexOfItem + 1];
    self.result.text = resultString;
}
@end
