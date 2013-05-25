//
//  ViewController.m
//  MultiThreadTest
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)tapped:(id)sender
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Process has been finished."
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // サブスレッドでUI操作
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//        unsigned long long i = 0;
//        
//        // 重たい処理
//        for ( i = 0; i < 1000000000; i++ );
//        
//        // サブスレッド内でUI操作をすると落ちる／(^o^)＼
//        [alert show];
//        
//    });

    
    // サブスレッドで処理した結果を元にメインスレッドでUI操作
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        unsigned long long i = 0;
        
        // 重たい処理
        for ( i = 0; i < 1000000000; i++ );
        
        // メインスレッドでUI操作
        dispatch_async(dispatch_get_main_queue(), ^{
            // 問題なし＼(^o^)／
            [alert show];
        });
        
    });

}
@end
