//
//  sheetManageLayout.h
//  sheetManageCV
//
//  Created by maquan on 14/11/20.
//  Copyright (c) 2014年 maquan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LayoutDataSource.h"

@interface SheetManageLayout : UICollectionViewLayout

@property (nonatomic, assign) id<LayoutDataSource> dataSource;

@end
