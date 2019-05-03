//
//  ViewController.m
//  AVAudioPlayerTest
//
//  Created by Caixing Wang on 2019/5/3.
//  Copyright © 2019 Caixing Wang. All rights reserved.
//

#import "ViewController.h"
#import "AVFoundation/AVFoundation.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
{
    AVAudioPlayer * _player;
    __weak IBOutlet UILabel *timeLable;
    NSTimer * _timer;
    NSMutableDictionary *dict;
}
@end

@implementation ViewController
- (IBAction)volume:(UISlider *)sender {
    float value = sender.value;
    _player.volume = value;
}

- (IBAction)soundTrack:(UISlider *)sender {
    float value = (sender.value-0.5)*2;
    _player.pan = value;
}

- (IBAction)speed:(UISlider *)sender {
    float value = sender.value;
    _player.rate = value;
}

- (IBAction)play:(UIButton *)sender {
    if (_player.playing) {
        return;
    }
    [_player play];
}

- (IBAction)pause:(UIButton *)sender {
    if (_player.isPlaying) {
        [_player pause];
    }
}

- (IBAction)stop:(UIButton *)sender {
    if ([_player isPlaying]) {
        [_player stop];
    }
}

- (void) updateProgress {
    int current = _player.currentTime;
    int duration = _player.duration;
    timeLable.text = [NSString stringWithFormat:@"%02d:%02d/%02d:%02d", current/60, current%60, duration/60, duration%60];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL * url =[[NSURL alloc]initFileURLWithPath:[[NSBundle mainBundle]pathForResource:@"yunshuicanxin" ofType:@"mp3"]];
    _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    if ([_player prepareToPlay]) {
        [_player play];
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1/60 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
    
    //设置歌曲题目
    [dict setObject:@"云水禅心" forKey:MPMediaItemPropertyTitle];
    
    //设置歌手名
    [dict setObject:@"花山" forKey:MPMediaItemPropertyArtist];
    
    //设置专辑名
    [dict setObject:@"静心禅音" forKey:MPMediaItemPropertyAlbumTitle];
    
    //设置显示的图片
    UIImage *newImage = [UIImage imageNamed:@"yunshuichanxin.jpeg"];
    [dict setObject:[[MPMediaItemArtwork alloc] initWithImage:newImage] forKey:MPMediaItemPropertyArtwork];
    
    //设置歌曲时长
    [dict setObject:[NSNumber numberWithDouble:300] forKey:MPMediaItemPropertyPlaybackDuration];
    
    //设置已播放时长
    [dict setObject:[NSNumber numberWithDouble:150] forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    
    //更新字典
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:dict];
}

@end
