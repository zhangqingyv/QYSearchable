//
//  QYSpotlightSearchable.h
//  Example
//
//  Created by Terry Zhang on 15/11/7.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface QYSpotlightSearchable : NSObject

+ (instancetype)sharedInstance;

/// 自定义设置 搜索域名, 默认为 应用的包名
- (void)setDomainIdentifier:(NSString *)domainIdentifier;

/// 删除该应用内所有相关搜索索引
- (void)deleteAllItemes;

/// 删除所有 指定域名相关 搜索索引
- (void)deleteAllItemesWithDomainIdentifier:(NSString *)domainIdentifier;

/// 添加 Searchable Item , uniqueIdentifier 建议使用 Url scheme ，这样就可以在首页拦截并跳转到指定页面
- (void)insertItemWithAttributeSet:(CSSearchableItemAttributeSet *)attributeSet uniqueIdentifier:(NSString *)uniqueIdentifier;

/// 更新 Searchable Item
- (void)updateItemWithAttributeSet:(CSSearchableItemAttributeSet *)attributeSet uniqueIdentifier:(NSString *)uniqueIdentifier;

/// 删除 Searchable Item
- (void)deleteItemsWithUniqueIdentifier:(NSString *)uniqueIdentifier;

@end

@interface CSSearchableItemAttributeSet (QY)

/// 快速创建 CSSearchableItemAttributeSet
+ (instancetype)qyAttributeSet;

@end