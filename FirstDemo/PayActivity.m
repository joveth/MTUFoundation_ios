//
//  PayActivity.m
//  FirstDemo
//
//  Created by jov jov on 6/9/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "PayActivity.h"
#import "Common.h"
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "DataSigner.h"


@interface PayActivity ()
@property (weak, nonatomic) IBOutlet UITableViewCell *zyCell;

@property (weak, nonatomic) IBOutlet UITableViewCell *aliCell;

@end

@implementation PayActivity{
    NSInteger selected;
    //BOCMZFiPhoneEntry * entry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
   self.tableView.tableFooterView=[[UIView alloc]init];
   self.tableView.backgroundColor = [Common colorWithHexString:@"e0e0e0"];
    selected  =1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
}

//secltion head
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *myHeader = [[UIView alloc] init];
    if(section==0){
        return [[UIView alloc] init];
    }
    UILabel *myLabel = [[UILabel alloc] init];
    [myLabel setFrame:CGRectMake(8, 0, 200, 20)];
    [myLabel setTag:101];
    [myLabel setAlpha:0.5];
    [myLabel setFont: [UIFont fontWithName:@"Arial" size:14]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myHeader setBackgroundColor:[Common colorWithHexString:@"#e0e0e0"]];
    [myLabel setText:[NSString stringWithFormat:@" "]];
    if(section==1){
        [myLabel setText:[NSString stringWithFormat:@"选择支付方式"]];    }
    
    [myHeader addSubview:myLabel];
    
    return myHeader;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *myHeader = [[UIView alloc] init];
    [myHeader setBackgroundColor:[Common colorWithHexString:@"#e0e0e0"]];
    return myHeader;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        
    }else if(indexPath.section==1){
        if(indexPath.row==0){
            _zyCell.accessoryType = UITableViewCellAccessoryCheckmark;
            _aliCell.accessoryType=UITableViewCellAccessoryNone;
            selected=0;
        }else{
            _zyCell.accessoryType = UITableViewCellAccessoryNone;
            _aliCell.accessoryType=UITableViewCellAccessoryCheckmark;
            selected=1;
        }
        
        
    }else if(indexPath.section==2){
        if(indexPath.row==0){
            if(selected==0){
                [self tip];
            }else {
                [self doAliClientPay];
            }
        }
        
       
    }else if(indexPath.section==3){
        
        
    }
    //消除cell选择痕迹
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.1f];
}
- (void)deselect{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    
}

-(void)doAliClientPay{
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = @"2088711150346785";
    NSString *seller = @"wenjuan.guan@supwisdom.com";
    NSString *privateKey = @"MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAOAP0mEvYCibofJxHTdPUK0kPXdqY0tTvfIMt9lSaU7nIPTAhSAsw20OaGiDCosp3I0RObv2sroJ4LLQozLKzxIhN6Q4wur3a+jAU3HXsedYmPksMQRpP/JA010T0qMmsvvOPqfAswcueXzwwAsNinIpqVx+QXYvjdbg2WOnPbgvAgMBAAECgYEAnglq2ROCXoIPgyJXehiejdD+7ciDSrFBS4W+8zEWiAmsDBXykBQirzw3Vmf/OtMG9hUNRM+nlmK7M0THp163F/d+Tu4wHeOz+Ou/s7+jECQQD9zlSJxm9AbIVSOLBoZtiHRGiK/DtAAJAA+GrUOzASkK7Lea+qRGkNVQXsb39Fk3QtB/t8RN1veXvHRnh/mtJJAkEA4f+rBRt4TvkAg838TfQJlo+CiL5BlSDqDg/XesvLBLTrAd2qyUb5Wq3GpRxmfZ9WRCHeLDuWcqN3S7GuDYY2twJAODla9OJmhskDh8FTIu2VjfGTjyZtIbJ+NBjT4YvzDEnMzvp39aoN84wgMc5JTWpq1AbuqQrAWw94Yh60VuA/MQJBAJGN2ba7X3v1cThylTobn4VBvn+VkaWbgkM2PsDOul24q9cSzik+NeEKJPM4XGYyFhxhd7cjVZ1V3MJ6mDALrfcCQQDAUCy0ZqZRit9jk6+8eQnXnNI5ffMWUJAR2umJ/7Uy7aCUZRUizWSUPqa+aSQemBlHbW+FX9eIeO4TcX+jjiaA";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.productName = @"海大基金会捐赠"; //商品标题
    order.productDescription = @"为上海海事大学基金会捐款"; //商品描述
    order.amount = [NSString stringWithFormat:@"%.2f",0.01]; //商品价格
    order.notifyURL =  @"http://edf.shmtu.edu.cn"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"aliformtu";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }

}


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

- (void)tip
{
    NSLog(@"进入");
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(callback:) name:@"BOCZFCallBack" object:nil];
    
    //entry = [BOCMZFiPhoneEntry shareBOCMZFiPhoneEntry];
    NSString * str = @"message={\"orderAmount\":\"104.12\",\"mNormalData\":\"{c=123, d=456}\",\"merchantNo\":\"104360153000003\",\"orderUrl\":\"http://www.baidu.com\",\"orderTime\":\"20130321132413\",\"orderNo\":\"234\",\"curCode\":\"001\",\"orderNote\":\"怎\",\"tranType\":\"01\",\"custTranId\":\"12\",\"signature\":\"MIIEBgYJKoZIhvcNAQcCoIID9zCCA/MCAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCCAwYwggMCMIIB6qADAgECAgUQADVScTANBgkqhkiG9w0BAQUFADAbMQswCQYDVQQGEwJDTjEMMAoGA1UEChMDQk9DMB4XDTEzMTEyOTAwMzkwMVoXDTE1MTEyOTAwMzkwMVowYjELMAkGA1UEBhMCY24xDDAKBgNVBAoTA0JPQzEQMA4GA1UECxMHQk9DLVRQQzEYMBYGA1UECxMPT3JnYW5pemF0aW9uYWwyMRkwFwYDVQQDExA5NTU2NlNaMDAwMDAwNzI3MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEInUYfrsOpciy7odOtTRGenYaBmhD5f4F75O7glKC6IbTRyLDBTPrH4nNAj4WFyWEg7cUIdWDrSH+odXatp81a8DqTHXFr0Hli5i1YfI7BJaRVOM9Z99wTN+cYmP35fIa15lS4WVcXbslceAqQoWJ1QG1zlfFO9/6/8WWFmlSaQIDAQABo4GJMIGGMB8GA1UdIwQYMBaAFM9wnWHrnXwuuPfLAkD3CZ3+M3SAMDcGA1UdHwQwMC4wLKAqoCiGJmh0dHA6Ly91Y3JsLmNmY2EuY29tLmNuL1JTQS9jcmw1MTkuY3JsMAsGA1UdDwQEAwIGwDAdBgNVHQ4EFgQUZ6tOCYFq2/NF5rgvQRG1iMB2wtAwDQYJKoZIhvcNAQEFBQADggEBADFC8K9zXu9aTBwdphoMcWeJ8xFjkbIXzPkXroNZXJHmv3MBkqbrZl6EoXuG4MhsOYKF9FIiI5Ig0NV7HtsO2nWM3w/LMvhVldpvSj/Xc1i2xw3UzZwaJp/y7k6W9yf2p3QamoXrBYoswU/a/PgqCKqParUCxo+essWNwqLyDD/ypEOnGPgKl3E7KtAt/zndZlwg44XtW4XnmQQqyMenbFrZB8o0IuXpFoH/+OrWkWDldFL8u4qyjY3rTDr+k+9c0wXaVJptqmM47Zili4VtP9z2uFCE9EbsTlN9qTVKwbFxoUlKYUcmBneZu70NTOnPv2h0Uo8DZ+/18OFOu2uVxlQxgckwgcYCAQEwJDAbMQswCQYDVQQGEwJDTjEMMAoGA1UEChMDQk9DAgUQADVScTAJBgUrDgMCGgUAMA0GCSqGSIb3DQEBAQUABIGAwdvsCtEFs2k1J2iAb1kcpXxWVXdd28waPZsmf2DaHrMcRXY8n9sc8IIOL2n7xg2qdzx1Bzz7MsyU8nYuv737rWhlUgxV4eL5EPdTuRg/YuzgIFweiGntAMhu/nY/g85eLoLt3atCOjWHnkljDtpaJODiBw0Q3z7f/axhFb9Xx/w=\",\"mSignData\":\"{planCode=IP01, planNumber=12}\"}&payType=0&isBewPay=1";
    
    
    NSString * mes =[NSString stringWithFormat:@"message={\"orderAmount\":\"0.01\",\"mNormalData\":\"{c=123, d=456}\",\"merchantNo\":\"104110070118888\",\"orderUrl\":\"http://www.baidu.com\",\"orderTime\":\"%@\",\"orderNo\":\"234123qwe11111\",\"curCode\":\"001\",\"orderNote\":\"怎\",\"tranType\":\"01\",\"custTranId\":\"12123qweqwe2222\",\"signature\":\"MIIEBgYJKoZIhvcNAQcCoIID9zCCA/MCAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCCAwYwggMCMIIB6qADAgECAgUQADVScTANBgkqhkiG9w0BAQUFADAbMQswCQYDVQQGEwJDTjEMMAoGA1UEChMDQk9DMB4XDTEzMTEyOTAwMzkwMVoXDTE1MTEyOTAwMzkwMVowYjELMAkGA1UEBhMCY24xDDAKBgNVBAoTA0JPQzEQMA4GA1UECxMHQk9DLVRQQzEYMBYGA1UECxMPT3JnYW5pemF0aW9uYWwyMRkwFwYDVQQDExA5NTU2NlNaMDAwMDAwNzI3MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEInUYfrsOpciy7odOtTRGenYaBmhD5f4F75O7glKC6IbTRyLDBTPrH4nNAj4WFyWEg7cUIdWDrSH+odXatp81a8DqTHXFr0Hli5i1YfI7BJaRVOM9Z99wTN+cYmP35fIa15lS4WVcXbslceAqQoWJ1QG1zlfFO9/6/8WWFmlSaQIDAQABo4GJMIGGMB8GA1UdIwQYMBaAFM9wnWHrnXwuuPfLAkD3CZ3+M3SAMDcGA1UdHwQwMC4wLKAqoCiGJmh0dHA6Ly91Y3JsLmNmY2EuY29tLmNuL1JTQS9jcmw1MTkuY3JsMAsGA1UdDwQEAwIGwDAdBgNVHQ4EFgQUZ6tOCYFq2/NF5rgvQRG1iMB2wtAwDQYJKoZIhvcNAQEFBQADggEBADFC8K9zXu9aTBwdphoMcWeJ8xFjkbIXzPkXroNZXJHmv3MBkqbrZl6EoXuG4MhsOYKF9FIiI5Ig0NV7HtsO2nWM3w/LMvhVldpvSj/Xc1i2xw3UzZwaJp/y7k6W9yf2p3QamoXrBYoswU/a/PgqCKqParUCxo+essWNwqLyDD/ypEOnGPgKl3E7KtAt/zndZlwg44XtW4XnmQQqyMenbFrZB8o0IuXpFoH/+OrWkWDldFL8u4qyjY3rTDr+k+9c0wXaVJptqmM47Zili4VtP9z2uFCE9EbsTlN9qTVKwbFxoUlKYUcmBneZu70NTOnPv2h0Uo8DZ+/18OFOu2uVxlQxgckwgcYCAQEwJDAbMQswCQYDVQQGEwJDTjEMMAoGA1UEChMDQk9DAgUQADVScTAJBgUrDgMCGgUAMA0GCSqGSIb3DQEBAQUABIGAgStps3a4HxFiIk/Ly4m7dxAQTLDSxfyHVFqZZwAzioNzfv6TlaqfTFwl3nSxylpjgGr4fZaelSwCAaiSMXKxniuq6dm5E5ArbutkORrBn7I+LoksOpWG/SINmRVGHC3mYUqzIGksP+Lhwb55mpYa5ExUpHSbKf6P8oTblPsxRZs=\",\"mSignData\":\"\"}&payType=0&isBewPay=1",[Common getNowDate]];
    
    //[entry viewController:self merchantMessage:mes];
}

- (void)callback:(id)notice
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"BOCZFCallBack" object:nil];
    //NSLog(@"支付成功返回信息：%@",entry.backToMerchantMessage);
}
@end
