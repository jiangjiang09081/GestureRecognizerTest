//
//  ViewController.m
//  GestureRecognizerTest
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *firstImgV;
@property (nonatomic) CGFloat currentScale;
@property (nonatomic, strong) UIView *imgView;

@property (nonatomic, strong) UIView *secondView;
@property (nonatomic, strong) UIImageView *secondImageV;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *sccondScrollview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *imgView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    imgView.backgroundColor = [UIColor redColor];
    _imgView = imgView;
    [self.view addSubview:imgView];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    //设置内容大小
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*1.001, _scrollView.frame.size.height*1.001);
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.bouncesZoom = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.minimumZoomScale = 1;
    _scrollView.maximumZoomScale = 3;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.numberOfTapsRequired=2;
    [_scrollView addGestureRecognizer:tapGesture];
    [_imgView addSubview:_scrollView];
    _firstImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _firstImgV.backgroundColor = [UIColor whiteColor];
    _firstImgV.image = [UIImage imageNamed:@"huahuagongzhu12.jpg"];
    [_scrollView addSubview:_firstImgV];
    
    _secondView = [[UIView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(_imgView.frame) + 50, 200, 200)];
    _secondView.backgroundColor = [UIColor whiteColor];
    _secondView.clipsToBounds = YES;
    [self.view addSubview:_secondView];
    _sccondScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    //设置内容大小
    _sccondScrollview.contentSize = CGSizeMake(_sccondScrollview.frame.size.width*1.001, _sccondScrollview.frame.size.height*1.001);
    _sccondScrollview.delegate = self;
    _sccondScrollview.bounces = NO;
    _sccondScrollview.bouncesZoom = NO;
    _sccondScrollview.showsVerticalScrollIndicator = NO;
    _sccondScrollview.showsHorizontalScrollIndicator = NO;
    _sccondScrollview.minimumZoomScale = 1;
    _sccondScrollview.maximumZoomScale = 3;
    UITapGestureRecognizer *secondtapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    secondtapGesture.numberOfTapsRequired=2;
    [_sccondScrollview addGestureRecognizer:secondtapGesture];
    [_secondView addSubview:_sccondScrollview];
    _secondImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _secondImageV.image = [UIImage imageNamed:@"huahuagongzhu08.jpg"];
    [_sccondScrollview addSubview:_secondImageV];
    // Do any additional setup after loading the view, typically from a nib.
}

//放大缩小
-(void)handleTapGesture:(UIGestureRecognizer*)sender
{
    if (sender.view == _scrollView) {
        if(_scrollView.zoomScale > 1.0){
            [_scrollView setZoomScale:1.0 animated:YES];
            [_sccondScrollview setZoomScale:1.0 animated:YES];
        }else{
            [_scrollView setZoomScale:3.0 animated:YES];
            [_sccondScrollview setZoomScale:3.0 animated:YES];
        }
    }
    if (sender.view == _sccondScrollview) {
        if(_sccondScrollview.zoomScale > 1.0){
            [_scrollView setZoomScale:1.0 animated:YES];
            [_sccondScrollview setZoomScale:1.0 animated:YES];
        }else{
            [_scrollView setZoomScale:3.0 animated:YES];
            [_sccondScrollview setZoomScale:3.0 animated:YES];
        }
    }
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView) {
      return _firstImgV;
    }
    if (scrollView == _sccondScrollview) {
        return _secondImageV;
    }
    return nil;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    if (scrollView == _scrollView) {
        _sccondScrollview.zoomScale = scrollView.zoomScale;
        _sccondScrollview.contentOffset = scrollView.contentOffset;
    }
    if (scrollView == _sccondScrollview) {
        _scrollView.zoomScale = scrollView.zoomScale;
        _scrollView.contentOffset = scrollView.contentOffset;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _scrollView) {
        _sccondScrollview.contentOffset = scrollView.contentOffset;
    }
    if (scrollView == _sccondScrollview) {
        _scrollView.contentOffset = scrollView.contentOffset;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
