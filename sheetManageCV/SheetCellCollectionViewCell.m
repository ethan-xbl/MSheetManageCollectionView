//
//  sheetCellCollectionViewCell.m
//  sheetManageCV
//
//  Created by maquan on 14/11/20.
//  Copyright (c) 2014年 maquan. All rights reserved.
//

#import "SheetCellCollectionViewCell.h"

@interface SheetCellCollectionViewCell()

@property (nonatomic, retain) UILabel *label;

@end

@implementation SheetCellCollectionViewCell

- (void)dealloc
{
    self.label = nil;
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor brownColor];
        self.label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.layer.borderWidth = 2;
        self.layer.cornerRadius = 22;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        [self addSubview:self.label];
    }
    return self;
}

- (void)configuer:(SheetCellData *)data
{
    self.label.frame = CGRectMake(10, 0, self.frame.size.width - 20, self.frame.size.height);
    self.label.text = [NSString stringWithFormat:@"%d", data.titleIndex];
}

@end
