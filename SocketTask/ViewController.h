//
//  ViewController.h
//  SocketTask
//
//  Created by PASHA on 21/11/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketIO-Swift.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *ipTF;
@property (weak, nonatomic) IBOutlet UITextField *portTF;
@property (weak, nonatomic) IBOutlet UITextField *dataTF;
- (IBAction)disconnectServerTap:(id)sender;
- (IBAction)connectServerTap:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *displayTFV;


- (IBAction)sendDataTap:(id)sender;
@property SocketManager * socket;
@property SocketIOClient * socketClient;
@end

