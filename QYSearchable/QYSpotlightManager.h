//
//  QYSpotlightManager.h
//  Example
//
//  Created by Terry Zhang on 15/11/20.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYSpotlightSearchableMapping.h"

typedef void(^LSSearchableOperationComplete)(NSError *error);


@interface QYSpotlightManager : NSObject

/// 单例
+ (instancetype)sharedInstance;

/// 后台添加 spotlight searchable Item
- (void)addSpotlightSearchableItemsWithObjects:(NSArray *)objects searchableMapping:(id<QYSpotlightSearchableMappingProtocol>)mapping completeBlk:(LSSearchableOperationComplete)complete;

/// 后台更新 spotlight searchable Item
- (void)updateSpotlightSearchableItemsWithObjects:(NSArray *)objects searchableMapping:(id<QYSpotlightSearchableMappingProtocol>)mapping  completeBlk:(LSSearchableOperationComplete)complete;

/// 根据数据后台，删除指定的 spotlight searchable Item
- (void)deleteSpotlightSearchableItemsWithObjects:(NSArray *)objects searchableMapping:(id<QYSpotlightSearchableMappingProtocol>)mapping  completeBlk:(LSSearchableOperationComplete)complete;

/// 删除所有的 spotlight searchable Item
- (void)deleteAllSpotlightSearchableItemsWithCompleteBlk:(LSSearchableOperationComplete)complete;

@end
