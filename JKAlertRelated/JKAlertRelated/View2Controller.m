//
//  View2Controller.m
//  JKAlertRelated
//
//  Created by Jekin on 3/23/20.
//  Copyright © 2020 zhangjie. All rights reserved.
//

#import "View2Controller.h"
#import "JKAlertOperationManager.h"
@interface View2Controller ()

@end

@implementation View2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [JKAlertOperationManager unLock];
    [self dismissViewControllerAnimated:true completion:^{
        
    }];
    
}
@end
