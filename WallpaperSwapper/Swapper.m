//
//  Swapper.m
//  WallpaperSwapper
//
//  Created by Michal Moskala on 06.02.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

#import "Swapper.h"

@implementation Swapper

- (void)setWallpaperImage:(UIImage *)image {
//    NSAssert([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized, @"access to photos is needed to set the wallpaper");
    
    NSString *path;
#if TARGET_OS_SIMULATOR
    path = @"/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/PrivateFrameworks/PhotoLibrary.framework";
#else
    path = @"/System/Library/PrivateFrameworks/PhotoLibrary.framework";
#endif
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    [bundle load];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    // Instantiate the controller.
    id class = NSClassFromString(@"PLStaticWallpaperImageViewController");
    id controller = [[class alloc] performSelector:@selector(initWithUIImage:) withObject:image];
    
    // Select what wallpaper mode.
    // 0 - Both lock screen and home screen.
    // 1 - Home screen only.
    // 2 - Lock screen only.
    int wallpaperMode = 0;
    [controller setValue:@(wallpaperMode) forKey:@"wallpaperMode"];
    
    // Tell the controller to save the data.
    [controller setValue:@YES forKey:@"saveWallpaperData"];
    
    // Save the photo.
    [controller performSelector:@selector(_savePhoto) withObject:nil];
    
#pragma clang diagnostic pop
    
}

@end
