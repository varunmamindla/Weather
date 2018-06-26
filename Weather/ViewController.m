//
//  ViewController.m
//  Weather
//
//  Created by Varun Mamindla on 6/25/18.
//  Copyright © 2018 Varun Mamindla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) DataRetrivedFromService:(NSArray *)weatherData {
    NSArray *details = (NSArray *)[weatherData valueForKey:@"list"];
    
    self.presentWeatherData = [[details objectAtIndex:0] valueForKey:@"main"];
    self.yesterdayWeatherData = [[details objectAtIndex:1] valueForKey:@"main"];
    self.tomorrowWeatherData = [[details objectAtIndex:2] valueForKey:@"main"];
}

-(void) UpdateUI {
    self.Day1Min.text = [NSString stringWithFormat:@"%.2f",[[_presentWeatherData valueForKey:@"temp_min"] floatValue]];
    self.Day1MAX.text = [NSString stringWithFormat:@"%.2f",[[_presentWeatherData valueForKey:@"temp_max"] floatValue]];
    self.Day2Min.text = [NSString stringWithFormat:@"%.2f",[[_yesterdayWeatherData valueForKey:@"temp_min"] floatValue]];
    self.Day2Max.text = [NSString stringWithFormat:@"%.2f",[[_yesterdayWeatherData valueForKey:@"temp_max"] floatValue]];
    self.Day3Min.text = [NSString stringWithFormat:@"%.2f",[[_tomorrowWeatherData valueForKey:@"temp_min"] floatValue]];
    self.Day3Max.text = [NSString stringWithFormat:@"%.2f",[[_tomorrowWeatherData valueForKey:@"temp_max"] floatValue]];
}

- (IBAction)goBtnClicked:(id)sender {
    
    NSString *baseURL = @"http://api.openweathermap.org/data/2.5/forecast?q=";
    NSString *appID = @"&units=Imperial&appid=788533b4e173db71af6e75119d061835";
    //NSMutableString *teststring = [[NSMutableString alloc]init];
    NSString *city = [NSString stringWithFormat:@"%@,us",_cityTxtField.text];
    NSString *dataURL = [NSString stringWithFormat:@"%@%@%@",baseURL,city,appID];
    NSURL *url = [NSURL URLWithString:dataURL];
    NSLog(@"%@",url);
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSArray *weatherData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self DataRetrivedFromService:weatherData];
            [self UpdateUI];
        });
        
        
    }];
    
    [downloadTask resume];
}
@end
