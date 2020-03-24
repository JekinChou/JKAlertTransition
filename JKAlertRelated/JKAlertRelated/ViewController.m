//
//  ViewController.m
//  JKAlertRelated
//
//  Created by zhangjie on 2018/7/17.
//  Copyright © 2018年 zhangjie. All rights reserved.
//

#import "ViewController.h"
#import "JKAlertViewController.h"
#import "JKAlertOperationManager.h"
#import "View1Controller.h"
#import "View2Controller.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//     dispatch_queue_t queue = dispatch_queue_create("com.se7en.alert", DISPATCH_QUEUE_SERIAL);
//        dispatch_async(queue, ^{
//            //创建一个初始为0的信号量
//            dispatch_semaphore_t sema = dispatch_semaphore_create(0);
//            //第一个弹框，UI的创建和显示，要在主线程
//            dispatch_async(dispatch_get_main_queue(), ^{
//                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"弹框1" message:@"第一个弹框" preferredStyle:UIAlertControllerStyleAlert];
//                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//                    //点击Alert上的按钮，我们发送一次信号。
//                    dispatch_semaphore_signal(sema);
//                }]];
//                [self presentViewController:alert animated:YES completion:nil];
//            });
//
//            //等待信号触发，注意，这里是在我们创建的队列中等待
//            dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//            //上面的等待到信号触发之后，再创建第二个Alert
//            dispatch_async(dispatch_get_main_queue(), ^{
//                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"弹框2" message:@"第二个弹框" preferredStyle:UIAlertControllerStyleAlert];
//                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//                    dispatch_semaphore_signal(sema);
//                }]];
//                [self presentViewController:alert animated:YES completion:nil];
//            });
//
//            //同理，创建第三个Alert
//            dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"弹框3" message:@"第三个弹框" preferredStyle:UIAlertControllerStyleAlert];
//                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//                    dispatch_semaphore_signal(sema);
//                }]];
//                [self presentViewController:alert animated:YES completion:nil];
//            });
//        });


    __weak typeof(self) weakself = self;
    [JKAlertOperationManager lock:^{
        View1Controller *alertController = [View1Controller new];
        //           alertController.view.backgroundColor = [UIColor redColor];
                   [weakself presentViewController:alertController animated:YES completion:nil];
    }];
    [JKAlertOperationManager lock:^{
        View2Controller *alertController = [View2Controller new];
//           alertController.view.backgroundColor = [UIColor blueColor];
           [weakself presentViewController:alertController animated:YES completion:nil];
    }];
    
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
