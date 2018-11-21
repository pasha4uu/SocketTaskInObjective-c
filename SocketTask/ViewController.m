//
//  ViewController.m
//  SocketTask
//
//  Created by PASHA on 21/11/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
   NSURL* url = [[NSURL alloc] initWithString:@"http://192.168.1.11:1100"];
  self.socket = [[SocketManager alloc] initWithSocketURL:url config:@{@"log": @YES, @"compress": @YES}];
  self.socketClient = [self.socket defaultSocket];
  [self.socketClient on:@"connect" callback:^(NSArray* data, SocketAckEmitter* ack) {
    NSLog(@"socket connected");
  }];
  [self.socketClient on:@"message" callback:^(NSArray* data, SocketAckEmitter* ack) {
    NSString * name = [[data objectAtIndex:0]objectForKey:@"text"];
    NSDictionary * dict = @{@"text":self.dataTF.text};
    NSArray * aa = [[NSArray alloc]initWithObjects:dict, nil];
    NSLog(@"my data is :%@",name);
    [[self.socketClient emitWithAck:@"message" with:aa] timingOutAfter:10 callback:^(NSArray* data) {
    }];
    [ack with:@[@"message", @"dude"]];
  }];
  [self.socketClient connect];
  // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sendDataTap:(id)sender {
  NSDictionary * dict = @{@"text":self.dataTF.text};
  NSArray * aa = [[NSArray alloc]initWithObjects:dict, nil];
  NSLog(@"SEND data is :%@",aa);
  [self.socketClient emit:@"message" with:aa];
}
- (IBAction)disconnectServerTap:(id)sender {
  [self.socketClient disconnect];
}

- (IBAction)connectServerTap:(id)sender {
   [self.socketClient connect];
}
@end
