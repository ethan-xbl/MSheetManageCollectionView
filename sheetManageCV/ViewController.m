//
//  ViewController.m
//  sheetManageCV
//
//  Created by maquan on 14/11/20.
//  Copyright (c) 2014年 maquan. All rights reserved.
//

#import "ViewController.h"
#import "SheetManageCollectionView.h"
#import "SheetManageLayout.h"
#import "SheetCellCollectionViewCell.h"
#import "SheetDataSource.h"

static NSString *identifier = @"cellIndentifier";

@interface ViewController () <UICollectionViewDelegate>
@property (retain, nonatomic) IBOutlet UIButton *addButton;
@property (retain, nonatomic) IBOutlet UIButton *deleteButton;

@property (retain, nonatomic) IBOutlet UIButton *tip;
@property (nonatomic, retain) SheetManageCollectionView *sheetManageCV;
@property (nonatomic, retain) SheetManageLayout *sheetManageLayout;
@property (nonatomic, retain) SheetDataSource *dataSource;

@property (nonatomic, retain) NSMutableArray *dataArray;//真正应该由内核提供

@end
static NSInteger titleMax = 19;

@implementation ViewController
- (IBAction)tipAction:(id)sender {
    //模拟点击
    
    NSInteger random = (arc4random() % self.dataArray.count) + 1;
    [self activeCell:random];

}

- (void)activeCell:(NSInteger)indexx{
//    [self.dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
//        SheetCellData *cellData = (SheetCellData *)obj;
//        cellData.isSelected = NO;
//        if (index == indexx) {
//            cellData.isSelected = YES;
//        }
//    }];
    
    for (NSInteger index = 0; index < self.dataArray.count; index++) {
        SheetCellData *cellData = (SheetCellData *)(self.dataArray[index]);
        cellData.isSelected = NO;
        if (index == indexx) {
            cellData.isSelected = YES;
        }

    }
    
    [self.dataSource configureDataArray:self.dataArray];
    [self.sheetManageLayout invalidateLayout];
}

- (IBAction)addAction:(id)sender {
        
    //模拟增加时的数据源，真正增加时应该是从内核返回数据，然后configureDataArray
    SheetCellData *cellData = [[[SheetCellData alloc] init] autorelease];
    cellData.titleIndex = ++titleMax;
    [self.dataArray insertObject:cellData atIndex:0];
    [self.dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
        SheetCellData *cellData = (SheetCellData *)obj;
        cellData.isSelected = NO;
        if (index == 0) {
            cellData.isSelected = YES;
        }
    }];
    
    [self.dataSource configureDataArray:self.dataArray];
    [self activeCell:0];
    [self.sheetManageCV performBatchUpdates:^{
        [self.sheetManageCV insertItemsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForItem:0 inSection:0], nil]];
    } completion:^(BOOL finish){
        [self.sheetManageCV reloadData];
    }];

}
- (IBAction)deleteAction:(id)sender {
    //  删除第8个，重新加载数据选中第8个
    [self.dataArray removeObjectAtIndex:2];
    
    [self.dataSource configureDataArray:self.dataArray];
    
    [self.sheetManageCV performBatchUpdates:^{
        //  删除前不要调整zIndex，删除过程中层次就不会乱
        [self.sheetManageCV deleteItemsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForItem:2 inSection:0], nil]];
    } completion:^(BOOL finish){
        
        //  等到删除完成之后，在重新设置选中的cell 利用reloadData 瞬间调整整体的zIndex
        [self.dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
            SheetCellData *cellData = (SheetCellData *)obj;
            cellData.isSelected = NO;
            if (index == 2) {
                cellData.isSelected = YES;
            }
        }];
        [self.dataSource configureDataArray:self.dataArray];
        
        [self.sheetManageCV reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self baseCreate];
}

- (void)baseCreate {
    Configure configureBlock = ^(id data, id cell){
        [((SheetCellCollectionViewCell *)cell) configuer:(SheetCellData *)data];
    };
    
    //模拟初始化时数据源
    self.dataArray = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++){
        SheetCellData *cellData = [[[SheetCellData alloc] init] autorelease];
//        cellData.index = index;
        cellData.titleIndex = index;
        cellData.isSelected = (index == 10) ? YES : NO;
        [self.dataArray addObject:cellData];
    }
    
    self.dataSource = [[SheetDataSource alloc] init:identifier withConfigure:configureBlock withDataArray:self.dataArray];
    
    self.sheetManageLayout = [[SheetManageLayout alloc] init];
    self.sheetManageCV = [[SheetManageCollectionView alloc] initWithFrame:CGRectMake(88, 64, self.view.frame.size.width - 88 * 2, 88) collectionViewLayout:self.sheetManageLayout];
    self.sheetManageCV.dataSource = self.dataSource;
    self.sheetManageCV.delegate = self;
    self.sheetManageLayout.dataSource = self.dataSource;
    [self.sheetManageCV registerClass:[SheetCellCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:self.sheetManageCV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_addButton release];
    [_deleteButton release];
    [_tip release];
    [super dealloc];
}
@end
