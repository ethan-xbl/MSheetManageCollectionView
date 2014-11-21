//
//  LayoutDataSource.h
//  sheetManageCV
//
//  Created by maquan on 14/11/20.
//  Copyright (c) 2014年 maquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayoutData.h"

@protocol LayoutDataSource <NSObject>

- (id<LayoutData>)getCellLayOutData:(NSUInteger)index;

@end
