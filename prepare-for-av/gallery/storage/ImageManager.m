//
//  ImageManager.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 04.01.21.
//

#import "ImageManager.h"

@implementation ImageManager

NSMutableArray * storage;

static NSString *const titleKey = @"title";
static NSString *const imageDataKey = @"imageData";
static NSString *const filename = @"Gallery.plist";

- (instancetype)init
{
    self = [super init];
    if (self) {
        storage = [NSMutableArray new];
    }
    return self;
}

+ (instancetype) loadFromDisk {
    ImageManager *manager = [ImageManager new];
    
    NSURL *path = [self getStoragePath];
    if ([NSFileManager.defaultManager fileExistsAtPath:path.path]){
        storage = [NSMutableArray arrayWithContentsOfURL:path];
    }
    
    return manager;
}

- (void) addImage:(UIImage *)image withTitle:(NSString *)title {
    NSData *imageData = UIImagePNGRepresentation(image);
    NSDictionary *element = [NSDictionary dictionaryWithObjects:@[title, imageData] forKeys:@[titleKey, imageDataKey]];
    [storage insertObject:element atIndex:0];
    [self writeStorageToFile];
}

- (NSUInteger) imageCount {
    return [storage count];
}

- (UIImage *) imageForIndex:(NSUInteger) index {
    NSDictionary *element = storage[index];
    NSData *imageData = element[imageDataKey];
    return [UIImage imageWithData:imageData];
}

- (NSString *) titleForIndex:(NSUInteger) index {
    NSDictionary *element = storage[index];
    return element[titleKey];
}

- (void) deleteAtIndex:(NSUInteger) index {
    [storage removeObjectAtIndex:index];
    [self writeStorageToFile];
}

- (void) writeStorageToFile {
    [storage writeToURL:[ImageManager getStoragePath] atomically:true];
}

+ (NSURL *) getStoragePath {
    NSURL *documentsDirectory = [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0];
    return [documentsDirectory URLByAppendingPathComponent:filename];
}

@end
