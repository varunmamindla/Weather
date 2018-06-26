//
//  WeatherTests.m
//  WeatherTests
//
//  Created by Varun Mamindla on 6/25/18.
//  Copyright © 2018 Varun Mamindla. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface WeatherTests : XCTestCase

@end

@implementation WeatherTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testJSONParserData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"document" ofType:@"json"];
    
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *weatherData =  [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        ViewController *vc = [[ViewController alloc] init];
        
        [vc DataRetrivedFromService:weatherData];
        
        float Present_min_value = [[vc.presentWeatherData valueForKey:@"temp_min"] floatValue];
        NSString *minvalue = [NSString stringWithFormat:@"%.2f",Present_min_value];
        XCTAssertEqualObjects(minvalue,@"87.58");
    
}

@end
