
#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [NUISettings init];
        
        // Or use this call to use a specific stylesheet
     //  [NUISettings initWithStylesheet:@"Route.NUI"];
        
        // If you uncomment this and set the path to your .nss file, you can modify your .nss
        // file at runtime
        //[NUISettings setAutoUpdatePath:@"/path/to/Style.nss"];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }

}
