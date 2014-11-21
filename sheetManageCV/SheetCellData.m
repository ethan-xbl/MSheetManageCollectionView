//
//  SheetCellData.m
//  sheetManageCV
//
//  Created by maquan on 14/11/20.
//  Copyright (c) 2014年 maquan. All rights reserved.
//

#import "SheetCellData.h"

@interface SheetCellData()

@end

@implementation SheetCellData

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

//- (NSInteger)getCellIndex{
//    return self.index;
//}

- (BOOL)getCellIsSelected{
    return self.isSelected;
}

- (CGRect)getCellFrame{
    return self.frame;
}

@end
