//
//  QYSpotlightSearchableMappingProtocol.h
//  Example
//
//  Created by Terry Zhang on 15/11/20.
//  Copyright © 2015年 terry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreSpotlight/CoreSpotlight.h>

@protocol QYSpotlightSearchableMappingProtocol

@required

// 将数据对象映射到 CSSearchableItemAttributeSet
- (CSSearchableItemAttributeSet *)searchableItemAttributeSetMappingFromData:(id)data;

// 根据数据对象 拼接 搜索唯一的 Id,  Id推荐使用 UrlScheme 格式
- (NSString *)searchableIdentifierMappingFromData:(id)data;

@end
