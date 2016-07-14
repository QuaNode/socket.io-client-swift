//
//  SocketObjectiveCTest.m
//  Socket.IO-Client-Swift
//
//  Created by Erik Little on 3/25/16.
//
//  Merely tests whether the Objective-C api breaks
//

#import <XCTest/XCTest.h>
@import SocketIOClientSwift;

@interface SocketObjectiveCTest : XCTestCase

@property SocketIOClient* socket;

@end

@implementation SocketObjectiveCTest

- (void)setUp {
    [super setUp];
    NSURL* url = [[NSURL alloc] initWithString:@"http://localhost"];
    self.socket = [[SocketIOClient alloc] initWithSocketURL:url
                                                    options:@{@"handleQueue": dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL)}];
}

- (void)testOnSyntax {
    [self.socket on:@"someCallback" callback:^(NSArray* data, SocketAckEmitter* ack) {
        [ack with:@[@1]];
    }];
}

- (void)testEmitSyntax {
    [self.socket emit:@"testEmit" with:@[@YES]];
}

- (void)testEmitWithAckSyntax {
    [self.socket emitWithAck:@"testAckEmit" with:@[@YES]](0, ^(NSArray* data) {
        
    });
}

- (void)testOffSyntax {
    [self.socket off:@"test"];
}

- (void)testSocketManager {
    SocketClientManager* manager = [SocketClientManager sharedManager];
    [manager addSocket:self.socket labeledAs:@"test"];
    [manager removeSocketWithLabel:@"test"];
}

@end
