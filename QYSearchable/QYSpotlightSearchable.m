//
//  QYSpotlightSearchable.m
//  Example
//
//  Created by Terry Zhang on 15/11/7.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "QYSpotlightSearchable.h"
#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

/// 域名
static NSString *QYSpotlightSearchable_DomainIdentifier = @"";

@implementation QYSpotlightSearchable

+ (instancetype)sharedInstance;
{
    static QYSpotlightSearchable *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9")) {
            instance = [[QYSpotlightSearchable alloc] init];
        }
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        QYSpotlightSearchable_DomainIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    }
    return self;
}

- (void)setDomainIdentifier:(NSString *)domainIdentifier
{
    QYSpotlightSearchable_DomainIdentifier = domainIdentifier;
}

- (void)deleteAllItemes
{
    if (![CSSearchableIndex isIndexingAvailable]) {
        return;
    }
    [[CSSearchableIndex defaultSearchableIndex] deleteAllSearchableItemsWithCompletionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"All items deleted");
        }
    }];
}

- (void)deleteAllItemesWithDomainIdentifier:(NSString *)domainIdentifier
{
    if (![CSSearchableIndex isIndexingAvailable]) {
        return;
    }
    [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithDomainIdentifiers:@[QYSpotlightSearchable_DomainIdentifier] completionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"Items deleted");
        }
    }];
}

- (void)insertItemWithAttributeSet:(CSSearchableItemAttributeSet *)attributeSet uniqueIdentifier:(NSString *)uniqueIdentifier;
{
    if (![CSSearchableIndex isIndexingAvailable]) {
        return;
    }
    
    // 初始化一个可检索的条目
    CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:uniqueIdentifier domainIdentifier:QYSpotlightSearchable_DomainIdentifier attributeSet:attributeSet];
    // 添加入口
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[item] completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Search item(title:%@ identifier%@) failed to be indexed", attributeSet.title, uniqueIdentifier);
        }
    }];
}

- (void)deleteItemsWithUniqueIdentifier:(NSString *)uniqueIdentifier;
{
    if (![CSSearchableIndex isIndexingAvailable]) {
        return;
    }
    
    [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithIdentifiers:@[uniqueIdentifier] completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Search item(identifier%@) failed to be deleted", uniqueIdentifier);
        }
    }];
}

- (void)updateItemWithAttributeSet:(CSSearchableItemAttributeSet *)attributeSet uniqueIdentifier:(NSString *)uniqueIdentifier;
{
    if (![CSSearchableIndex isIndexingAvailable]) {
        return;
    }
    // 由于没有更新接口，所以只是先删除 在从新添加
    [self deleteItemsWithUniqueIdentifier:uniqueIdentifier];
    [self insertItemWithAttributeSet:attributeSet uniqueIdentifier:uniqueIdentifier];
}

@end