//
//  SearchItemMappingFromExample.m
//  Example
//
//  Created by Terry Zhang on 15/11/23.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "SearchItemMappingFromExample.h"
#import <UIKit/UIKit.h>

@implementation SearchItemMappingFromExample

// 将数据对象映射到 CSSearchableItemAttributeSet
- (CSSearchableItemAttributeSet *)searchableItemAttributeSetMappingFromData:(id)data
{
    if (![data isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSDictionary *dic = data;
    CSSearchableItemAttributeSet *attr = [CSSearchableItemAttributeSet qyAttributeSet];
    
    attr.title = dic[@"title"];
    attr.contentDescription = dic[@"desc"];
    UIImage *image = [UIImage imageNamed:dic[@"image"]];
    NSData *imageData = [NSData dataWithData:UIImageJPEGRepresentation(image, 1)];
    attr.thumbnailData = imageData;
    
    return attr;
}

// 根据数据对象 拼接 搜索唯一的 Id,  Id推荐使用 UrlScheme 格式
- (NSString *)searchableIdentifierMappingFromData:(id)data
{
    if (![data isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSDictionary *dic = data;
    NSString *urlScheme = [NSString stringWithFormat:@"seachItem://title=%@",dic[@"title"]];
    
    return urlScheme;
}


@end
