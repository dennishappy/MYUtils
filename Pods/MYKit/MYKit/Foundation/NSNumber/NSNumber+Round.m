//
//  NSNumber+Round.m
//  MYUtils
//
//  Created by sunjinshuai on 2017/8/28.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "NSNumber+Round.h"

@implementation NSNumber (Round)

#pragma mark - Display
- (NSString *)toDisplayNumberWithDigit:(NSInteger)digit
{
    NSString *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:digit];
    result = [formatter stringFromNumber:self];
    if (result == nil) {
        return @"";
    }
    return result;
}

- (NSString *)toDisplayPercentageWithDigit:(NSInteger)digit
{
    NSString *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterPercentStyle];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:digit];
    //NSLog(@"percentage target:%@ result:%@",number,[formatter  stringFromNumber:number]);
    result = [formatter  stringFromNumber:self];
    return result;
}

#pragma mark - ceil , round, floor
- (NSNumber *)doRoundWithDigit:(NSUInteger)digit
{
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:digit];
    [formatter setMinimumFractionDigits:digit];
    //NSLog(@"round target:%@ result:%@",number,[formatter  stringFromNumber:number]);
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}

- (NSNumber *)doCeilWithDigit:(NSUInteger)digit
{
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundCeiling];
    [formatter setMaximumFractionDigits:digit];
    //NSLog(@"ceil target:%@ result:%@",number,[formatter  stringFromNumber:number]);
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}

- (NSNumber *)doFloorWithDigit:(NSUInteger)digit
{
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundFloor];
    [formatter setMaximumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    //NSLog(@"prev:%@, result:%@",number, result);
    return result;
}

@end
