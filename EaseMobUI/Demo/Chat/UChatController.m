//
//  MainController.m
//  EaseMobUI
//
//  Created by 周玉震 on 15/7/1.
//  Copyright (c) 2015年 周玉震. All rights reserved.
//

#import "UChatController.h"
#import "UserCustomExtend.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>

@interface UChatController ()<EM_ChatControllerDelegate>

@end

@implementation UChatController

- (instancetype)initWithConversation:(EMConversation *)conversation{
    self = [super initWithConversation:conversation];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (instancetype)initWithOpposite:(EM_ChatOpposite *)opposite{
    self = [super initWithOpposite:opposite];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#define mark - EM_ChatControllerDelegate
- (void)extendForMessage:(EM_ChatMessageModel *)message{
    message.messageExtend.extendAttributes = @{@"a":@"不显示的属性"};
}

- (void)didActionSelectedWithName:(NSString *)name{
    
}

- (void)didAvatarTapWithChatter:(NSString *)chatter isOwn:(BOOL)isOwn{
    
}

- (void)didExtendTapWithUserInfo:(NSDictionary *)userInfo{
    
}

- (void)didExtendMenuSelectedWithUserInfo:(NSDictionary *)userInfo{
    
}

- (void)chatMessageAvatarImageView:(UIImageView *)avatar orignMessage:(EMMessage *)message{
    NSURL *url = [NSURL URLWithString:@"http://www.easemob.com/Public/theme/img/hx-qrcode.png"];
    [avatar setImageWithURLRequest:[NSURLRequest requestWithURL:url] placeholderImage:[UIImage imageNamed:@"buddy"] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        NSLog(@"头像设置完成");
        avatar.image = image;
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        NSLog(@"头像下载失败  error:%@",error);
    }];
}



@end