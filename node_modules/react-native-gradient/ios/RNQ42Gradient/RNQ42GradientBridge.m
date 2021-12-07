//
//  RNQ42GradientBridge.m
//  RNQ42Gradient
//
//  Created by Jasper Haggenburg on 20/07/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(RNQ42GradientManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(type, NSString)
RCT_EXPORT_VIEW_PROPERTY(colors, NSArray<UIColor>)
RCT_EXPORT_VIEW_PROPERTY(locations, NSArray<NSNumber>)
RCT_EXPORT_VIEW_PROPERTY(radialCenter, NSArray<NSNumber>)
RCT_EXPORT_VIEW_PROPERTY(radialRadius, NSNumber)

@end
