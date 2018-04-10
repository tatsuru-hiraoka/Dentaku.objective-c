//
//  ViewController.m
//  Dtntaku.Objective-C
//
//  Created by 平岡 建 on 2018/02/15.
//  Copyright © 2018年 平岡 建. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Function1=NO;
    Function2=NO;
    Function3=NO;
    FP=NO;
    SP=NO;
    TP=NO;
    FM=NO;
    SM=NO;
    TM=NO;
    FK=NO;
    SK=NO;
    TK=NO;
    FD=NO;
    SD=NO;
    TD=NO;
    FPA=NO;
    SPA=NO;
    TPA=NO;
    Equal=NO;
    first=nil;
    second=nil;
    third=nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction) AC:(UIButton*)sender{
    _formulaLabel.text=@"0";
    first=nil;
    second=nil;
    third=nil;
    Function1=NO;
    Function2=NO;
    Function3=NO;
    Equal=NO;
    FP=NO;
    SP=NO;
    TP=NO;
    FM=NO;
    SM=NO;
    TM=NO;
    FK=NO;
    SK=NO;
    TK=NO;
    FD=NO;
    SD=NO;
    TD=NO;
    FPA=NO;
    SPA=NO;
    TPA=NO;
}

-(IBAction) Change:(UIButton*)sender{
    BOOL minus = [_formulaLabel.text hasPrefix:@"-"];
    NSString *str=@"-";
    if (minus) {
        _formulaLabel.text=[_formulaLabel.text substringFromIndex:1];
    }
    else{
        _formulaLabel.text=[str stringByAppendingString:_formulaLabel.text];
    }
}

-(IBAction) Function:(UIButton*)sender{
    NSString *str=sender.titleLabel.text;
    BOOL Plus = [str isEqualToString:@"+"];
    BOOL Minus = [str isEqualToString:@"-"];
    BOOL Multiplication = [str isEqualToString:@"×"];
    BOOL Division = [str isEqualToString:@"÷"];
    BOOL Percent = [str isEqualToString:@"%"];
    Function1=YES;
    if (Function2==NO) {
        if(second==nil){
            if (Plus) {FP=YES;FK=NO;FM=NO;FD=NO;FPA=NO;}
            if (Minus) {FM=YES;FP=NO;FK=NO;FD=NO;FPA=NO;}
            if (Multiplication) {FK=YES;FP=NO;FM=NO;FD=NO;FPA=NO;}
            if (Division) {FD=YES;FP=NO;FK=NO;FM=NO;FPA=NO;}
            if (Percent) {FPA=YES;FP=NO;FM=NO;FK=NO;FD=NO;}
        }
        else if(third==nil){
            if (Plus) {SP=YES;SK=NO;SM=NO;}
            if (Minus) {SM=YES;SP=NO;SK=NO;}
            if (Multiplication) {SK=YES;SP=NO;SM=NO;}
            if (Division) {SD=YES;SP=NO;SK=NO;SM=NO;SPA=NO;}
            if (Percent) {SPA=YES;SP=NO;SM=NO;SK=NO;SD=NO;}
        }
    }
    if (Function2) {
        if (first==nil) {
            first=_formulaLabel.text;
            if (Plus) {FP=YES;}
            if (Minus) {FM=YES;}
            if (Multiplication) {FK=YES;}
            if (Division) {FD=YES;}
            if (Percent) {FPA=YES;}
        }
        else if(second==nil){
            second=_formulaLabel.text;
            if (Plus) {SP=YES;}
            if (Minus) {SM=YES;}
            if (Multiplication) {SK=YES;}
            if (Division) {SD=YES;}
            if (Percent) {SPA=YES;}
        }
        else if(third==nil){
            third=_formulaLabel.text;
            if (Plus) {TP=YES;}
            if (Minus) {TM=YES;}
            if (Multiplication) {TK=YES;}
            if (Division) {TD=YES;}
            if (Percent) {TPA=YES;}
        }
        float F=[first floatValue];
        float S=[second floatValue];
        float T=[third floatValue];
        
        if (FP&&SP) {
            float A=F+S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            // 小数点以下の0を除去して文字列に変換する
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            SP=NO;
        }
        if (FP&&SM) {
            float A=F-S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            SM=NO;
        }
        if (FM&&SP) {
            float A=F-S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            FM=NO;
            FP=YES;
            SP=NO;
        }
        if (FM&&SM) {
            float A=F-S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            SM=NO;
        }
        if (FK&&SP) {
            float A=F*S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            FK=NO;
            FP=YES;
            SP=NO;
        }
        if (FK&&SM) {
            float A=F*S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            FK=NO;
            FM=YES;
            SM=NO;
        }
        if (FK&&SK) {
            float A=F*S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            SK=NO;
        }
        if (FK&&SD) {
            float A=F*S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            FD=YES;
            FK=NO;
            SD=NO;
        }
        if (FD&&SP) {
            float A=F/S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            FD=NO;
            FP=YES;
            SP=NO;
        }
        if (FD&&SM) {
            float A=F/S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            FD=NO;
            FM=YES;
            SM=NO;
        }
        if (FD&&SK) {
            float A=F/S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            FD=NO;
            FK=YES;
            SK=NO;
        }
        if (FD&&SD) {
            float A=F/S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            SD=NO;
        }
        if (FP&&SK&&TP) {
            float A=S*T;
            A=F+A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            third=nil;
            SK=NO;
            TP=NO;
        }
        if (FP&&SK&&TM) {
            float A=S*T;
            A=F+A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            third=nil;
            SK=NO;
            TM=NO;
        }
        if (FP&&SK&&TK) {
            float A=S*T;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            second=str;
            third=nil;
            TK=NO;
        }
        if (FP&&SK&&TD) {
            float A=S*T;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            second=str;
            third=nil;
            SD=YES;
            SK=NO;
            TD=NO;
        }
        if (FP&&SD&&TP) {
            float A=S/T;
            A=F+A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            third=nil;
            SD=NO;
            TP=NO;
        }
        if (FP&&SD&&TM) {
            float A=S/T;
            A=F+A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            third=nil;
            FP=NO;
            FM=YES;
            SD=NO;
            TM=NO;
        }
        if (FP&&SD&&TK) {
            float A=S/T;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            second=str;
            third=nil;
            SD=NO;
            TK=NO;
            SK=YES;
        }
        if (FP&&SD&&TD) {
            float A=S/T;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            second=str;
            third=nil;
            TD=NO;
        }
        if (FM&&SK&&TP) {
            float A=S*T;
            A=F-A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            third=nil;
            FP=YES;
            SK=NO;
            TP=NO;
        }
        if (FM&&SK&&TM) {
            float A=S*T;
            A=F-A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            third=nil;
            SK=NO;
            TM=NO;
        }
        if (FM&&SK&&TK) {
            float A=S*T;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            second=str;
            third=nil;
            TK=NO;
        }
        if (FM&&SK&&TD) {
            float A=S*T;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            second=str;
            third=nil;
            SD=YES;
            SK=NO;
            TD=NO;
        }
        if (FM&&SD&&TP) {
            float A=S/T;
            A=F-A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            third=nil;
            FP=YES;
            SD=NO;
            TP=NO;
        }
        if (FM&&SD&&TM) {
            float A=S/T;
            A=F-A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            second=nil;
            third=nil;
            SD=NO;
            TM=NO;
        }
        if (FM&&SD&&TK) {
            float A=S/T;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            second=str;
            third=nil;
            SD=NO;
            TK=NO;
            SK=YES;
        }
        if (FM&&SD&&TD) {
            float A=S/T;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            second=str;
            third=nil;
            TD=NO;
        }
        Function2=NO;
    }
}

-(IBAction) Answer:(UIButton*)sender{
    float F=[first floatValue];
    float S=[second floatValue];
    float T=[third floatValue];
    float FO=[_formulaLabel.text floatValue];

    if (second==nil) {
        second=_formulaLabel.text;
        S=[second floatValue];
        if (FP) {
            float A=F+S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            NSLog(@"second nil FP");
            first=str;
        }
        if (FM) {
            float A=F-S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            NSLog(@"second nil FM");
            first=str;
        }
        if (FK) {
            float A=F*S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
        }
        if (FD) {
            float A=F/S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
        }
    }
    else if(third==nil){
        third=_formulaLabel.text;
        T=[third floatValue];
        if (FP) {
            float A=FO+S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            NSLog(@"third nil FP");
            first=str;
            third=nil;
        }
        if (FM) {
            float A=FO-S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            NSLog(@"third nil FM");
            first=str;
            third=nil;
        }
        if (FK) {
            float A=FO*S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            third=nil;
        }
        if (FD) {
            float A=FO/S;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            third=nil;
        }
        if (FP&&SK) {
            float A=S*T;
            A=F+A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            NSNumber* numberT = [[NSNumber alloc] initWithFloat:T];
            second=[numberT stringValue];
            third=nil;
            FP=NO;
            SK=NO;
            FK=YES;
            NSLog(@"third nil FP&&SK");
        }
        if (FP&&SD) {
            float A=S/T;
            A=F+A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            NSNumber* numberT = [[NSNumber alloc] initWithFloat:T];
            second=[numberT stringValue];
            third=nil;
            FP=NO;
            SD=NO;
            FD=YES;
            NSLog(@"third nil FP&&SD");
        }
        if (FM&&SK) {
            float A=S*T;
            A=F-A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            NSNumber* numberT = [[NSNumber alloc] initWithFloat:T];
            second=[numberT stringValue];
            third=nil;
            FM=NO;
            SK=NO;
            FK=YES;
            NSLog(@"third nil FM&&SK");
        }
        if (FM&&SD) {
            float A=S/T;
            A=F-A;
            NSNumber* number = [[NSNumber alloc] initWithFloat:A];
            NSString* str = [number stringValue];
            _formulaLabel.text=str;
            first=str;
            NSNumber* numberT = [[NSNumber alloc] initWithFloat:T];
            second=[numberT stringValue];
            third=nil;
            FM=NO;
            SD=NO;
            FD=YES;
            NSLog(@"third nil FM&&SD");
        }
    }
}

-(IBAction) Input:(UIButton*)sender{
    BOOL Zero = [_formulaLabel.text hasPrefix:@"0"];
    BOOL Comma = [_formulaLabel.text hasPrefix:@"0."];

    if (Function1) {
        if (Comma) {
            _formulaLabel.text=[_formulaLabel.text stringByAppendingString:sender.titleLabel.text];
        }
        else if(Zero){
            _formulaLabel.text=@"";
            _formulaLabel.text=sender.titleLabel.text;
        }
        else{
            _formulaLabel.text=@"";
            _formulaLabel.text=[_formulaLabel.text stringByAppendingString:sender.titleLabel.text];
        }
        Function1=NO;
    }
    else{
        if (Comma) {
            _formulaLabel.text=[_formulaLabel.text stringByAppendingString:sender.titleLabel.text];
        }
        else if(Zero){
            _formulaLabel.text=@"";
            _formulaLabel.text=sender.titleLabel.text;
        }
        else{
            _formulaLabel.text=[_formulaLabel.text stringByAppendingString:sender.titleLabel.text];
        }
    }
    Function2=YES;
}

-(IBAction) Comma:(UIButton*)sender{
    NSRange Comma = [_formulaLabel.text rangeOfString:@"."];
    if (Function1) {
        _formulaLabel.text=@"0";
        _formulaLabel.text=[_formulaLabel.text stringByAppendingString:sender.titleLabel.text];
    }
    else{
        if(Comma.location == NSNotFound){
            // みつからない場合の処理
            _formulaLabel.text=[_formulaLabel.text stringByAppendingString:sender.titleLabel.text];
        }else{
            // みつかった場合の処理
        }
    }
}
@end
