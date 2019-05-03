//
//  ViewController.m
//  MPMoviePlayerTest
//
//  Created by Caixing Wang on 2019/5/3.
//  Copyright © 2019 Caixing Wang. All rights reserved.
//

#import "ViewController.h"
#import "MediaPlayer/MediaPlayer.h"

@interface ViewController ()
{
    MPMoviePlayerController *_movieController;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"trailer" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    _movieController = [[MPMoviePlayerController alloc]initWithContentURL:url];
    _movieController.view.frame = CGRectMake(0, 0, 320, 300);
    [self.view addSubview:_movieController.view];
    [_movieController play];
    
}


@end
