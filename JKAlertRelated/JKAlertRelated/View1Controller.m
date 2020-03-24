//
//  View1Controller.m
//  JKAlertRelated
//
//  Created by Jekin on 3/23/20.
//  Copyright © 2020 zhangjie. All rights reserved.
//

#import "View1Controller.h"
#import "JKAlertOperationManager.h"
@interface View1Controller ()

@end

@implementation View1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     [JKAlertOperationManager unLock];
    [self dismissViewControllerAnimated:true completion:^{
       
    }];
    
}

@end
