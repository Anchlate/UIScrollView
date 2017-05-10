//
//  ViewController.m
//  ScalScrollView
//
//  Created by Qianrun on 16/11/23.
//  Copyright © 2016年 qianrun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIImageView *imageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor blueColor];
    scrollView.maximumZoomScale=5.0;//图片的放大倍数
    scrollView.minimumZoomScale=1.0;//图片的最小倍率
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*1.5, self.view.bounds.size.height*1.5);
    scrollView.delegate=self;
    
    
    imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"a"];
    
    [scrollView addSubview:imageView];
    [self.view addSubview:scrollView];
    imageView.userInteractionEnabled=YES;//注意:imageView默认是不可以交互,在这里设置为可以交互
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage:)];
    tap.numberOfTapsRequired=1;//单击
    tap.numberOfTouchesRequired=1;//单点触碰
    [imageView addGestureRecognizer:tap];
    
    
    UITapGestureRecognizer *doubleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
    doubleTap.numberOfTapsRequired=2;//避免单击与双击冲突
    [tap requireGestureRecognizerToFail:doubleTap];
    [imageView addGestureRecognizer:doubleTap];
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView  //委托方法,必须设置  delegate
{
    return imageView;//要放大的视图
}

-(void)doubleTap:(id)sender
{
    scrollView.zoomScale=2.0;//双击放大到两倍
}

- (void)tapImage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];//单击图像,关闭图片详情(当前图片页面)
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
- (UIScrollView *)scallview {
    
    if (!_scallview) {
        _scallview = [UIScrollView new];
        _scallview.backgroundColor = [UIColor redColor];
        _scallview.frame = self.view.bounds;
        _scallview.maximumZoomScale = 3;
        _scallview.minimumZoomScale = 1;
        _scallview.contentSize = CGSizeMake(100, 100);
        
    }
    
    return _scallview;
}

- (UIImageView *)imgView {
    
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.backgroundColor = [UIColor blueColor];
        _imgView.frame = CGRectMake(0, 0, 100, 100);
        _imgView.center = self.view.center;
        _imgView.userInteractionEnabled = YES;
    }
    return _imgView;
}
*/
@end
