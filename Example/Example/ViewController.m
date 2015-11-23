//
//  ViewController.m
//  Example
//
//  Created by Terry Zhang on 15/11/7.
//  Copyright © 2015年 terry. All rights reserved.
//

#import "ViewController.h"

#import "QYSpotlightManager.h"
#import "SearchItemMappingFromExample.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *insertButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *delelteAllButton;

@property (nonatomic, assign) NSUInteger insertCount;
@property (nonatomic, strong) id<QYSpotlightSearchableMappingProtocol> mapping;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)insertButtonClicked:(id)sender {
   
    self.insertCount ++ ;
    
    NSDictionary *obj1 = @{@"title":[NSString stringWithFormat:@"test %lu",(unsigned long)self.insertCount * 3 + 0]
                           ,@"image":@"1"
                           ,@"desc":@"QYSearchable Example"
                           };
    NSDictionary *obj2 = @{@"title":[NSString stringWithFormat:@"test %lu",(unsigned long)self.insertCount * 3 + 1]
                           ,@"image":@"2"
                           ,@"desc":@"QYSearchable Example"
                           };
    NSDictionary *obj3 = @{@"title":[NSString stringWithFormat:@"test %lu",(unsigned long)self.insertCount * 3 + 2]
                           ,@"image":@"3"
                           ,@"desc":@"QYSearchable Example"
                           };
    
    [[QYSpotlightManager sharedInstance] addSpotlightSearchableItemsWithObjects:@[obj1, obj2, obj3] searchableMapping:self.mapping];
    
}

- (IBAction)deleteButtonClicked:(id)sender {
    
    NSDictionary *obj1 = @{@"title":[NSString stringWithFormat:@"test %lu",(unsigned long)self.insertCount * 3 + 0]
                           ,@"image":@"1"
                           ,@"desc":@"QYSearchable Example"
                           };
    NSDictionary *obj2 = @{@"title":[NSString stringWithFormat:@"test %lu",(unsigned long)self.insertCount * 3 + 1]
                           ,@"image":@"2"
                           ,@"desc":@"QYSearchable Example"
                           };
    NSDictionary *obj3 = @{@"title":[NSString stringWithFormat:@"test %lu",(unsigned long)self.insertCount * 3 + 2]
                           ,@"image":@"3"
                           ,@"desc":@"QYSearchable Example"
                           };
    
    [[QYSpotlightManager sharedInstance] deleteSpotlightSearchableItemsWithObjects:@[obj1, obj2, obj3] searchableMapping:self.mapping];
    
    self.insertCount --;

}

- (IBAction)deleteAllButtonClicked:(id)sender {
    self.insertCount = 0;
    
    [[QYSpotlightManager sharedInstance] deleteAllSpotlightSearchableItems];

}

- (id<QYSpotlightSearchableMappingProtocol>)mapping
{
    if (!_mapping) {
        _mapping = [SearchItemMappingFromExample new];
    }
    return _mapping;
}

@end
