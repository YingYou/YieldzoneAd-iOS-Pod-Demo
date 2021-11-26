//
//  YieldzoneSXAdConst.h
//  YieldzoneAdSDK
//
//  Created by Wei yang on 2021/2/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SXNativeExpressAdViewType) {
   /// Fixed height view, 100 points
    SXNativeExpressAdViewTypeGenericHeight100 = 1,

};

/**
 *  视频播放器状态
 *
 *  播放器只可能处于以下状态中的一种
 *
 */
typedef NS_ENUM(NSUInteger, SXMediaPlayerStatus) {
    
    SXPlayerPlayStateUnknown,
    SXPlayerPlayStatePlaying,
    SXPlayerPlayStatePaused,
    SXPlayerPlayStatePlayFailed,
    SXPlayerPlayStatePlayStopped
};

typedef NS_ENUM(NSInteger, JHVideoAutoPlayPolicy) {
    SXVideoAutoPlayPolicyWIFI = 0, // WIFI 下自动播放
    SXVideoAutoPlayPolicyAlways = 1, // 总是自动播放，无论网络条件
    SXVideoAutoPlayPolicyNever = 2, // 从不自动播放，无论网络条件
};


/// Represents the ad size.
struct SXAdSize {
    /// Internal size
    CGSize size;
};

/// Represents the ad size.
typedef struct SXAdSize SXAdSize;


FOUNDATION_EXPORT SXAdSize const  kSXAdSize320x50;

FOUNDATION_EXPORT SXAdSize const kSXAdSize320x90;

FOUNDATION_EXPORT SXAdSize const kSXAdSize320x100;

FOUNDATION_EXPORT SXAdSize const kSXAdSize300x250;

FOUNDATION_EXPORT SXAdSize const kSXAdSize468x60;

FOUNDATION_EXPORT SXAdSize const kSXAdSize728x90;

SXAdSize SXAdSizeFromCGSize(CGSize size);

NS_ASSUME_NONNULL_BEGIN

@interface YieldzoneSXAdConst : NSObject

@end

NS_ASSUME_NONNULL_END
