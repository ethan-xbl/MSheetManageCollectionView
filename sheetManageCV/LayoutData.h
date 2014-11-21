//
//  LayoutData.h
//  sheetManageCV
//
//  Created by maquan on 14/11/20.
//  Copyright (c) 2014年 maquan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LayoutData <NSObject>

- (BOOL)getCellIsSelected;

//- (NSInteger)getCellIndex;

- (CGRect)getCellFrame;

@end
