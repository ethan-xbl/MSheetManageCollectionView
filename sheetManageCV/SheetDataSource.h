//
//  SheetDataSource.h
//  sheetManageCV
//
//  Created by maquan on 14/11/20.
//  Copyright (c) 2014年 maquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LayoutDataSource.h"
#import "SheetCellData.h"

typedef void (^Configure) (id index, id data);

@interface SheetDataSource : NSObject<UICollectionViewDataSource, LayoutDataSource>

- (instancetype)init:(NSString *)identifier withConfigure:(Configure)configure withDataArray:(NSMutableArray *)dataArray;

- (void)configureDataArray:(NSArray *)dataArray;

- (NSInteger)getDataCount;

//- (void)addCellData:(id)cellData;

//- (void)deleteCellData:(NSInteger)index;

@end
