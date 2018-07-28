//
//  XZImgPreviewView.m
//  jianke
//
//  Created by yanqb on 2016/11/17.
//  Copyright © 2016年 xianshijian. All rights reserved.
//

#import "XZImgBrowser.h"

#define ImageViewH 200
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface XZImgBrowser () <UIScrollViewDelegate>{
    NSMutableArray *_imageViewArr;
}

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, assign) CGRect oldFrame;
@property (nonatomic, weak) UIPageControl *pageCtrl;
@property (nonatomic, copy) NSArray<UIImage *> *imgArr;

@end

@implementation XZImgBrowser

- (instancetype)initWithFrame:(CGRect)frame WithImaArr:(NSArray *)imgArr{
    self = [super initWithFrame:frame];
    if (self) {
        _imageViewArr =  [NSMutableArray array];
        self.backgroundColor = [UIColor blackColor];
        self.imgArr = [imgArr valueForKey:@"image"];
        [self setupViews];
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tapGes];
    }
    return self;
}

+ (void)showViewWithArray:(NSArray<UIImageView *> *)imgArr beginWithIndex:(NSInteger)index{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    XZImgBrowser *preView = [[XZImgBrowser alloc] initWithFrame:[UIScreen mainScreen].bounds WithImaArr:imgArr];
    [[UIApplication sharedApplication].keyWindow addSubview:preView];
    preView.oldFrame = [[imgArr objectAtIndex:index] convertRect:[imgArr objectAtIndex:index].bounds toView:preView];
    [preView showWithIndex:index];
}

- (void)setupViews{
    //uiscrollview
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.frame.size.width * self.imgArr.count, self.frame.size.height - 1);
    scrollView.pagingEnabled = YES;
    
    _scrollView = scrollView;
    UIImageView *imageView = nil;
    for (NSInteger index = 0; index < self.imgArr.count; index++) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width * index, (self.frame.size.height - ImageViewH) / 2, self.frame.size.width, ImageViewH)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = self.imgArr[index];
        [scrollView addSubview:imageView];
        [_imageViewArr addObject:imageView];
    }
    [self addSubview:scrollView];
}

- (void)showWithIndex:(NSInteger)index{
    if (self.imgArr.count > 1) {
        self.scrollView.delegate = self;
        
        //pagectrl
        UIPageControl *pageCtrl = [[UIPageControl alloc] init];
        pageCtrl.numberOfPages = self.imgArr.count;
        pageCtrl.currentPage = index;
        pageCtrl.pageIndicatorTintColor = [UIColor grayColor];
        pageCtrl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageCtrl = pageCtrl;
        [self addSubview:pageCtrl];
//        [pageCtrl mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self);
//            make.width.height.equalTo(@1);
//            make.bottom.equalTo(self).offset(-30);
//        }];
        CGPoint point = CGPointMake(self.bounds.size.width/2, self.bounds.size.height - 30);
        pageCtrl.frame = CGRectMake(0, 0, 1, 1);
        pageCtrl.center = point;
        
    }
    
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0)];
    
    UIImageView *imageView = [_imageViewArr objectAtIndex:index];
    CGRect tmpFrame = self.oldFrame;
    tmpFrame.origin = CGPointMake(SCREEN_WIDTH * index + tmpFrame.origin.x, tmpFrame.origin.y);
    self.oldFrame = tmpFrame;
    imageView.frame = self.oldFrame;
    
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        imageView.frame = CGRectMake(self.frame.size.width * index, (self.frame.size.height - ImageViewH) / 2, self.frame.size.width, ImageViewH);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)tapAction:(UITapGestureRecognizer *)ges{
    [self dismiss];
}

#pragma mark - uiscrollview delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger currentPage = scrollView.contentOffset.x / SCREEN_WIDTH;
    self.pageCtrl.currentPage = currentPage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
