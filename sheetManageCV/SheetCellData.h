//
//  SheetCellData.h
//  sheetManageCV
//
//  Created by maquan on 14/11/20.
//  Copyright (c) 2014年 maquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LayoutData.h"
@interface SheetCellData : NSObject<LayoutData>

@property (nonatomic, assign) BOOL isSelected;
//@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger titleIndex;
@property (nonatomic, assign) CGRect frame;

@end
