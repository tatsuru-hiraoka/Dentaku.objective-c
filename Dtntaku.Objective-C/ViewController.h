//
//  ViewController.h
//  Dtntaku.Objective-C
//
//  Created by 平岡 建 on 2018/02/15.
//  Copyright © 2018年 平岡 建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSString *first;
    NSString *second;
    NSString *third;
    BOOL Function1;
    BOOL Function2;
    BOOL Function3;
    BOOL FP;
    BOOL SP;
    BOOL TP;
    BOOL FM;
    BOOL SM;
    BOOL TM;
    BOOL FK;
    BOOL SK;
    BOOL TK;
    BOOL FD;
    BOOL SD;
    BOOL TD;
    BOOL FPA;
    BOOL SPA;
    BOOL TPA;
    BOOL Equal;
    char op;
}
@property(nonatomic,retain) IBOutlet UILabel *formulaLabel;
-(IBAction) AC:(UIButton*)sender;
-(IBAction) Change:(UIButton*)sender;
/*-(IBAction) Percent:(UIButton*)sender;
-(IBAction) Division:(UIButton*)sender;
-(IBAction) Multiplication:(UIButton*)sender;
-(IBAction) Minus:(UIButton*)sender;
-(IBAction) Plus:(UIButton*)sender;*/
-(IBAction) Answer:(UIButton*)sender;
-(IBAction) Input:(UIButton*)sender;
-(IBAction) Comma:(UIButton*)sender;
-(IBAction) Function:(UIButton*)sender;
@end

