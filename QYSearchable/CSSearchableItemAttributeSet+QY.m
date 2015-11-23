//
//  CSSearchableItemAttributeSet+QY.m
//  Example
//
//  Created by Terry Zhang on 15/11/23.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "CSSearchableItemAttributeSet+QY.h"

@implementation CSSearchableItemAttributeSet (QY)

+ (instancetype)qyAttributeSet
{
    return [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeData];
}

@end
