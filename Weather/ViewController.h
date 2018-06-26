//
//  ViewController.h
//  Weather
//
//  Created by Varun Mamindla on 6/25/18.
//  Copyright © 2018 Varun Mamindla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,retain) NSDictionary *presentWeatherData;
@property (nonatomic,retain) NSDictionary *yesterdayWeatherData;
@property (nonatomic,retain) NSDictionary *tomorrowWeatherData;
@property (weak, nonatomic) IBOutlet UITextField *cityTxtField;
- (IBAction)goBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *Day1Min;
@property (weak, nonatomic) IBOutlet UILabel *Day1MAX;
@property (weak, nonatomic) IBOutlet UILabel *Day2Min;
@property (weak, nonatomic) IBOutlet UILabel *Day2Max;
@property (weak, nonatomic) IBOutlet UILabel *Day3Min;
@property (weak, nonatomic) IBOutlet UILabel *Day3Max;

-(void) DataRetrivedFromService:(NSArray *)weatherData;

@end

