//
//  JSURLSession.h
//  SwingsForSwoll
//
//  Created by John  Seubert on 5/16/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSURLSession : NSObject
+ (instancetype)sharedInstance;
- (NSURLSessionDataTask *)postRequest:(NSMutableURLRequest *) request resultCallback:(void (^)(NSData *data))resultCallback faultCallback:(void (^)(NSError *fault))faultCallback;
- (NSURLSessionDataTask *)putRequest:(NSMutableURLRequest *) request resultCallback:(void (^)(NSData *data))resultCallback faultCallback:(void (^)(NSError *fault))faultCallback;
- (NSURLSessionDataTask *)getRequest:(NSMutableURLRequest *) request resultCallback:(void (^)(NSData *data))resultCallback faultCallback:(void (^)(NSError *fault))faultCallback;
- (NSURLSessionDataTask *)getHTML:(NSMutableURLRequest *) request resultCallback:(void (^)(NSData *data))resultCallback faultCallback:(void (^)(NSError *fault))faultCallback;
@end
