//
//  JKAlertOperationManager.h
//  JKAlertRelated
//
//  Created by Jekin on 3/23/20.
//  Copyright © 2020 zhangjie. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ExecuteBlock)(void);
NS_ASSUME_NONNULL_BEGIN
@interface JKAlertOperationManager : NSObject

+ (nullable instancetype)shareManager;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@property (nonatomic, strong, nonnull) dispatch_queue_t  operationQueue;
/**
 弹窗显示的代码写进BLOCK块内
 @param executeBlock <#executeBlock description#>
 */
+ (void)lock:(ExecuteBlock)executeBlock;
/**
 弹窗显示完毕调用
 
 */
+ (void)unLock;
@end

NS_ASSUME_NONNULL_END
