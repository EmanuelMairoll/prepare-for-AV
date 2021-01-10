//
//  User.h
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 31.12.20.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface User : JSONModel

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *website;

@end



NS_ASSUME_NONNULL_END
