#import <Foundation/Foundation.h>

%hook CoreTelephonyClient

- (id)context:(id)cont getCarrierBundleValue:(NSArray *)key error:(id*)err {
	if(key.count==1&&[key[0] isKindOfClass:[NSString class]]&&memcmp([key[0] UTF8String], "ShowTTY", 8)==0) {
		return [NSNumber numberWithBool:1];
	}
	return %orig;
}

%end