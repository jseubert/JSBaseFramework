//
//  JSURLSession.m
//  SwingsForSwoll
//
//  Created by John  Seubert on 5/16/17.
//  Copyright © 2017 Club Beach Body. All rights reserved.
//

#import "JSURLSession.h"

@implementation JSURLSession

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark -
#pragma mark NSURLSession

+ (NSURLSession *)defaultURLSession {
    static NSURLSession *defaultURLSession = nil;
    if (!defaultURLSession) {
        defaultURLSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return defaultURLSession;
}

#pragma mark -
#pragma mark DataTask Methods

- (NSURLSessionDataTask *)dataTask:(NSMutableURLRequest *) request method:(NSString *) method resultCallback:(void (^)(NSData *data))resultCallback faultCallback:(void (^)(NSError *fault))faultCallback {
    //Set the method to GET, POST, or PUT
    request.HTTPMethod = method;
    NSURLSession *urlSession = [JSURLSession defaultURLSession];
    
    NSURLSessionDataTask *task = [urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                faultCallback(error);
            });
        } else {
            
            //Add extra stuff if it's not JSON but assume it is for now
            NSError *JSONError = nil;
            [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONError];
            if (JSONError) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    faultCallback(JSONError);
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    resultCallback(data);
                });
            }
        }
    }];
    
    [task resume];
    return task;
}

- (NSURLSessionDataTask *)getHTML:(NSMutableURLRequest *) request resultCallback:(void (^)(NSData *data))resultCallback faultCallback:(void (^)(NSError *fault))faultCallback {
    //Set the method to GET, POST, or PUT
    request.HTTPMethod = @"GET";
    NSURLSession *urlSession = [JSURLSession defaultURLSession];
    
    NSURLSessionDataTask *task = [urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                faultCallback(error);
            });
        } else {
            NSString *contentType = nil;
            if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                NSDictionary *headers = [(NSHTTPURLResponse *)response allHeaderFields];
                contentType = headers[@"Content-Type"];
            }
            /*            
             HTMLDocument *document = [HTMLDocument documentWithData:data
             contentTypeHeader:contentType];
             */
            dispatch_async(dispatch_get_main_queue(), ^{
                resultCallback(data);
            });
        }
    }];
    
    [task resume];
    return task;
}
//HTMLDocument *document = [HTMLDocument documentWithString:markup];

- (NSURLSessionDataTask *)postRequest:(NSMutableURLRequest *) request resultCallback:(void (^)(NSData *data))resultCallback faultCallback:(void (^)(NSError *fault))faultCallback {
    return [self dataTask:request method:@"POST" resultCallback:resultCallback faultCallback:faultCallback];
}

- (NSURLSessionDataTask *)putRequest:(NSMutableURLRequest *) request resultCallback:(void (^)(NSData *data))resultCallback faultCallback:(void (^)(NSError *fault))faultCallback {
    return [self dataTask:request method:@"PUT" resultCallback:resultCallback faultCallback:faultCallback];
}

- (NSURLSessionDataTask *)getRequest:(NSMutableURLRequest *) request resultCallback:(void (^)(NSData *data))resultCallback faultCallback:(void (^)(NSError *fault))faultCallback {
    return [self dataTask:request method:@"GET" resultCallback:resultCallback faultCallback:faultCallback];
}

@end

