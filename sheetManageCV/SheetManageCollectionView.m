//
//  sheetManageCollectionView.m
//  sheetManageCV
//
//  Created by maquan on 14/11/20.
//  Copyright (c) 2014年 maquan. All rights reserved.
//

#import "SheetManageCollectionView.h"

@implementation SheetManageCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

@end
