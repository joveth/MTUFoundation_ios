//
//  MainViewController.m
//  FirstDemo
//
//  Created by jov jov on 5/27/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "HomeViewController.h"
#import "Common.h"
#import "SWServiceCell.h"
#import "SWServiceDefine.h"
#import "SWServiceButton.h"
#import "SWDefine.h"
#import "CommonData.h"

@interface HomeViewController ()
{
    NSMutableArray *serviceList;
    NSArray *_respArray;
}
@end

@implementation HomeViewController

- (IBAction)onClick:(id)sender {
    UIButton *btn = sender;
    if(btn.tag==0){
        [self performSegueWithIdentifier:@"showNewsId" sender:self];
    }else if(btn.tag==1){
        [self performSegueWithIdentifier:@"showRecentDonateId" sender:self];
    }else if(btn.tag==2){
        [self performSegueWithIdentifier:@"showDonateId" sender:self];
    }else if(btn.tag==3){
        [self performSegueWithIdentifier:@"showAccountId" sender:self];
    }else if(btn.tag==4){
        [self performSegueWithIdentifier:@"showContactId" sender:self];
    }else if(btn.tag==5){
        [self performSegueWithIdentifier:@"showMyDonateId" sender:self];
    }else if(btn.tag==6){
        [self performSegueWithIdentifier:@"showDonateWayId" sender:self];
    }else if(btn.tag==7){
        [self performSegueWithIdentifier:@"showAboutId" sender:self];
    }else if(btn.tag==8){
        [CommonData shareInstance].title=@"捐赠说明";
        [CommonData shareInstance].url=@"http://edf.shmtu.edu.cn/donate/brief.htm";
        [self performSegueWithIdentifier:@"showDonateDescId" sender:self];
    }else if(btn.tag==9){
        [self performSegueWithIdentifier:@"showMoreId" sender:self];
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    [self initViewControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)initView{
//    CGRect screen = [ UIScreen mainScreen ].applicationFrame;
//    CGRect statusBar = [[UIApplication sharedApplication] statusBarFrame];
//    
//    CGFloat avgWidth,marginSize=2.0f,avgHeight;
//    avgWidth = (screen.size.width-marginSize*3)/2;
//    avgHeight= (screen.size.height-marginSize*6-100.0f)/5;
//    NSLog(@"height %f",avgHeight);
//    UIImageView *topImage =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_bg.png"]];
//    [topImage setFrame:CGRectMake(0, statusBar.size.height, screen.size.width, 100.0f)];
//    
//    
//    UIButton *balBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    balBtn.backgroundColor=[Common colorWithHexString:@"#0da4d6"];
//    [balBtn setFrame:CGRectMake(2.0f, statusBar.size.height+102.0f, avgWidth, avgHeight)];
//    
//    [balBtn setTag:10];
//    [balBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [balBtn setImage:[UIImage imageNamed:@"news_logo.png"] forState:UIControlStateNormal];
//    [balBtn setImageEdgeInsets:UIEdgeInsetsMake(2,- 5, 2, 0)];
//    [balBtn setTintColor:[UIColor whiteColor]];
//    [balBtn setTitle:@"新闻公告" forState:UIControlStateNormal];
//    [balBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    balBtn.titleLabel.font = [UIFont systemFontOfSize:20.0f];
//    [balBtn titleRectForContentRect:CGRectMake(avgWidth-50, balBtn.frame.size.height/2+10, balBtn.frame.size.width/2, balBtn.frame.size.height/2)];
//    balBtn.titleLabel.textAlignment = NSTextAlignmentRight;
//    
//    UIButton *cardLostBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    cardLostBtn.backgroundColor=[Common colorWithHexString:@"#E0620D"];
//    [cardLostBtn setFrame:CGRectMake(4.0f+avgWidth,statusBar.size.height+102.0f, avgWidth, avgHeight)];
//    [cardLostBtn setTag:11];
//    [cardLostBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [cardLostBtn setImage:[UIImage imageNamed:@"recent_logo.png"] forState:UIControlStateNormal];
//    [cardLostBtn setImageEdgeInsets:UIEdgeInsetsMake(10,0, 10, 0)];
//    [cardLostBtn setTintColor:[UIColor whiteColor]];
//    [cardLostBtn setTitle:@"最新捐赠" forState:UIControlStateNormal];
//    [cardLostBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//     cardLostBtn.titleLabel.font = [UIFont systemFontOfSize:20.0f];
//    [cardLostBtn titleRectForContentRect:CGRectMake(4.0f+avgWidth*2-50, cardLostBtn.frame.size.height/2+10, cardLostBtn.frame.size.width/2, cardLostBtn.frame.size.height/2)];
//     cardLostBtn.titleLabel.textAlignment = NSTextAlignmentRight;
//    UIButton *donateBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    donateBtn.backgroundColor=[Common colorWithHexString:@"#f51f03"];
//    [donateBtn setFrame:CGRectMake(2.0,statusBar.size.height+104.0f+avgHeight, avgWidth, avgHeight*2)];
//    [donateBtn setTag:11];
//    [donateBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [donateBtn setImage:[UIImage imageNamed:@"iconfont_love.png"] forState:UIControlStateNormal];
//    [donateBtn setImageEdgeInsets:UIEdgeInsetsMake(-20,20, 10, 20)];
//    [donateBtn setTintColor:[UIColor whiteColor]];
//    [donateBtn setTitle:@"我要捐赠" forState:UIControlStateNormal];
//    [donateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    donateBtn.titleLabel.font = [UIFont systemFontOfSize:20.0f];
//    
//    [donateBtn titleRectForContentRect:CGRectMake(2.0f, balBtn.frame.size.height-avgHeight/2, avgWidth, avgHeight/2)];
//
//    donateBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
//    [donateBtn setTitleEdgeInsets:UIEdgeInsetsMake(donateBtn.frame.size.height-avgHeight/2, -10, 0, 0)];
//
//    
//    [self.view addSubview:topImage];
//    [self.view addSubview:balBtn];
//    [self.view addSubview:cardLostBtn];
//    [self.view addSubview:donateBtn];
    
    
    
}

-(void)initViewControl
{
    //    CGFloat leftSpaceWidth = 4;
    //    CGFloat rightSpaceWidth = leftSpaceWidth;
    CGFloat buttonSpace = 3;
    CGFloat topSpaceHeight  = 20;
    CGFloat bottomHeight = 49;
    CGFloat adhight = self.view.frame.size.height/5;
    //    CGFloat frameHeight = self.view.frame.size.height - topSpaceHeight - bottomHeight;
    CGFloat buttonWidth = (self.view.frame.size.width - 5*buttonSpace)/4.0f;
    CGFloat buttonHeight = (self.view.frame.size.height - bottomHeight - topSpaceHeight - adhight-buttonSpace*6)/5.0f;
    CGRect frame = CGRectMake(0,topSpaceHeight ,self.view.frame.size.width ,adhight);
    UIImageView *pTemImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_bg.png"]];
    pTemImageView.frame =frame;
    [self.view insertSubview:pTemImageView atIndex:0];
    //    CGFloat start_x = 0;
    CGFloat start_y = topSpaceHeight + adhight +buttonSpace;
    //L1,L2,R1,R2
    //    NSLog(@"count:%i",[serviceList count]);
    for (NSUInteger i=0; i<[serviceList count]; i++) {
        CGFloat x = 0;
        CGFloat y = 0;
        SWServiceDefine *service = serviceList[i];
        //        const char * pos = [service.positon UTF8String];
        if([service.position isEqualToString:@"L1"])
        {
            x =  buttonSpace;
        }
        else if ([service.position isEqualToString:@"L2"])
        {
            x = buttonSpace*2 +buttonWidth;
        }
        else if([service.position isEqualToString:@"R1"])
        {
            x = buttonWidth*2 + buttonSpace*3;
        }
        else
        {
            x = buttonWidth*3 +buttonSpace*4;
        }
        y = start_y + service.row * (buttonHeight + buttonSpace);
        CGFloat width = buttonWidth * service.width +(service.width-1)*buttonSpace;
        CGFloat height = buttonHeight * service.height + (service.height-1) * buttonSpace;
        frame=CGRectMake(x, y, width, height);
        BOOL alignRight = NO ;
        BOOL alignBottom = NO ;
        NSInteger imageStyle = IMG_NORMAL;
        if (service.width>1 ) {
            if(service.height>1)
            {
                imageStyle = IMG_BIG;
            }
            else
            {
                if(i==8||i==9){
                    alignRight = NO ;
                    alignBottom = YES;
                }else{
                    alignRight = YES;
                }
                
            }
        }
        SWServiceButton *btn = [[SWServiceButton alloc]initWithFrame:frame andTitle:service.serviceTitle andAlignRight:alignRight withImageStyle:imageStyle andBottomm:alignBottom];
        
        //    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        //         UIImage *adImage = [UIImage imageNamed: @"yue.png"];
        //    button.frame = frame;
        //        [btn setImage:[UIImage imageNamed:service.serviceIcon] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:service.serviceIcon] forState:UIControlStateNormal];
        //        [btn setTitle:service.serviceTitle forState:UIControlStateNormal];
        btn.backgroundColor = [Common colorWithHexString:service.backColor];
        btn.tag = service.serviceId;
        [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
}
- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    [tableView setTableFooterView:view];
}


- (void) loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ServiceDefine" ofType:@"plist"];
    NSArray *list = [NSArray arrayWithContentsOfFile:path];
    if (!list) {
        NSLog(@"加载功能列表文件失败");
        return;
    }
    //    NSLog(@"load data begin count:%li",[list count]);
    serviceList = [NSMutableArray arrayWithCapacity:[list count]];
    //    [list enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    //    NSDictionary *dict = (NSDictionary*)obj;
    for (NSUInteger i= 0;i <[list count];i++)    {
        NSDictionary *dict = [list objectAtIndex:i];
        //        NSLog(@"dict %@",dict);
        SWServiceDefine *button = [[SWServiceDefine alloc] init];
        button.position = dict[@"position"];
        //      button.position = [dict objectForKey:@"position"];
        button.width = (NSInteger)[[dict objectForKey:@"width"] intValue];
        button.height= (NSInteger)[dict[@"height"] intValue];
        button.serviceId = (NSInteger)[dict[@"service_id"] intValue];
        button.serviceIcon = dict[@"service_icon"];
        button.serviceTitle = dict[@"service_title"];
        button.backColor = dict[@"back_color"];
        button.row = (NSInteger)[dict[@"row"] intValue];
        [serviceList addObject:button];
    }
    //    NSLog(@"load data ok");
}

@end
