//
//  ViewController.m
//  HLCryptor
//
//  Created by JJB_iOS on 2022/4/7.
//

#import "ViewController.h"
#import "HLCryptor/HLCryptor.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *algSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (weak, nonatomic) IBOutlet UITextField *keyTextField;
@property (weak, nonatomic) IBOutlet UITextField *ivTextField;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:YES];
}

#pragma mark - Response Event

- (IBAction)submitAction:(UIButton *)sender {
    NSString *content = self.contentTextField.text;
    NSString *key = self.keyTextField.text;
    NSString *iv = self.ivTextField.text;
    
    if ([content isEqualToString:@""]) {
        NSLog(@"请输入加/解密内容");
        return;
    }
    
    if ([key isEqualToString:@""]) {
        NSLog(@"请输入加/解密密钥");
        return;
    }
    
    CCOperation op = self.typeSegmentedControl.selectedSegmentIndex == 0 ? kCCEncrypt : kCCDecrypt;
    CCAlgorithm alg = self.algSegmentedControl.selectedSegmentIndex == 0 ? kCCAlgorithmAES : kCCAlgorithmDES;
    
    NSString *resultStr = [HLCryptor cryptor:content
                                         key:key
                                          iv:iv
                                          op:op
                                         alg:alg];
    
    self.resultTextView.text = resultStr ? : @"无结果";
}

@end
