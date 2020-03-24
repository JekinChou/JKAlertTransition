//
//  JKAlertOperationManager.m
//  JKAlertRelated
//
//  Created by Jekin on 3/23/20.
//  Copyright © 2020 zhangjie. All rights reserved.
//

#import "JKAlertOperationManager.h"
#import <pthread.h>

static NSThread *_alertThread = nil;
@interface JKAlertOperationManager ()

@end


@implementation JKAlertOperationManager {
    pthread_mutex_t _lock;
}

+ (instancetype)shareManager {
   static JKAlertOperationManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [JKAlertOperationManager  _getAlertThread];
        _instance = [[self alloc]init];
        pthread_mutex_init(&_instance->_lock, NULL);
    });
    return _instance;
}

- (void)dealloc {
    pthread_mutex_destroy(&_lock);
}


+ (void)_alertThreadEntryPoint:(id)__unused object {
    @autoreleasepool {
        [[NSThread currentThread] setName:@"JKAlert"];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }
}
 
+ (NSThread *)_getAlertThread {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _alertThread = [[NSThread alloc] initWithTarget:self selector:@selector(_alertThreadEntryPoint:) object:nil];
        [_alertThread start];
    });
    return _alertThread;
}

- (void)_lockWIthExecuteBlock:(ExecuteBlock)executeBlock {
        pthread_mutex_lock(&[JKAlertOperationManager shareManager]->_lock);
        dispatch_async(dispatch_get_main_queue(), ^{
              if (executeBlock) {
                  executeBlock();
              }
          });
}

+ (void)lock:(ExecuteBlock)executeBlock {
    [[JKAlertOperationManager shareManager] performSelector:@selector(_lockWIthExecuteBlock:) onThread:_alertThread withObject:executeBlock waitUntilDone:false ];
}

+ (void)unLock {
    pthread_mutex_unlock(&[JKAlertOperationManager shareManager]->_lock);
}


@end
