//
//  SheetDataSource.m
//  sheetManageCV
//
//  Created by maquan on 14/11/20.
//  Copyright (c) 2014年 maquan. All rights reserved.
//

#import "SheetDataSource.h"

@interface SheetDataSource ()

@property (nonatomic, copy) Configure configure;
@property (nonatomic, retain) NSString* indetifier;

//  模拟数据数组
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation SheetDataSource

- (instancetype)init:(NSString *)identifier withConfigure:(Configure)configure withDataArray:(NSMutableArray *)dataArray
{
    self = [super init];
    if (self) {
        self.indetifier = identifier;
        self.configure = configure;
        self.dataArray = dataArray;
    }
    return self;
}

- (void)configureDataArray:(NSArray *)dataArray {
    self.dataArray = dataArray;
}

- (NSInteger)getDataCount{
    return self.dataArray.count;
}

//- (void)addCellData:(id)cellData{
//    [self.dataArray addObject:cellData];
//}

//- (void)deleteCellData:(NSInteger)index{
//    [self.dataArray removeObjectAtIndex:index];
//}

#pragma mark - 
#pragma mark - LayOutDataSource
- (id<LayoutData>)getCellLayOutData:(NSUInteger)index
{
    return self.dataArray[index];
}

#pragma mark -
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.indetifier forIndexPath:indexPath];
    
    id data = self.dataArray[indexPath.item];
    self.configure(data, cell);
    return cell;
}

@end
