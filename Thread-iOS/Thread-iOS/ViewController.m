//
//  ViewController.m
//  Thread-iOS
//
//  Created by ZD on 2017/8/7.
//  Copyright © 2017年 JIXING. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加UIButton调用以下对应线程的事件即可查看效果
    
}

- (IBAction)press_start:(id)sender{
    
    /*1，并行全局队列，调用主线程刷新UI*/
    //    NSLog(@"开始GCD...");
    //    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    //        [NSThread sleepForTimeInterval:1.5];
    //        NSLog(@"开始耗时操作...");
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            NSLog(@"返回主线程刷新UI...");
    //        });
    //    });
    
    /*2，第一个参数是设置优先级*/
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
    //        NSLog(@"task 1");
    //    });
    //
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    //        NSLog(@"task 2");
    //    });
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //        NSLog(@"task 3");
    //    });
    
    
    /*3，queue的用法
     创建“并行”和“串行”队列
     DISPATCH_QUEUE_SERIAL：串行（默认）
     DISPATCH_QUEUE_CONCURRENT：并行
     tips:串行注意所有队列是在同一个线程内，打印出来的线程ID相同
     并行所有队列在不同线程内，打印出来的线程ID不同
     */
    //    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    //    dispatch_async(queue, ^{
    //        NSLog(@"task...1");
    //    });
    //    dispatch_async(queue, ^{
    //        NSLog(@"task...2");
    //    });
    //    dispatch_async(queue, ^{
    //        NSLog(@"task...3");
    //    });
    //    dispatch_async(queue, ^{
    //        NSLog(@"task...4");
    //    });
    //    dispatch_async(queue, ^{
    //        NSLog(@"task...5");
    //    });
    
    /*4，group的用法
     dispatch_group_notify在异步线程中，被系统默认分配到最近的一条线程中，而不是重新开启一条线程
     
     */
    
    //    dispatch_queue_t queue = dispatch_queue_create("com.zd.queue", DISPATCH_QUEUE_CONCURRENT);
    //
    //    dispatch_group_t group = dispatch_group_create();
    //
    //    dispatch_group_async(group, queue, ^{
    //        NSLog(@"任务1开始...");
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"任务1结束...");
    //    });
    //    dispatch_group_async(group, queue, ^{
    //        NSLog(@"任务2开始...");
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"任务2结束...");
    //    });
    //    dispatch_group_async(group, queue, ^{
    //        NSLog(@"任务3开始...");
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"任务3结束...");
    //    });
    //
    //    dispatch_group_notify(group, queue, ^{
    //        NSLog(@"所有任务执行完成...");
    //    });
    
    /* 5，group_enter/leave（成对出现，获取线程的持有权）
     如果在dispatch_group_async里面执行异步线程，需要先将该异步线程持有，获取持有权之后才能保证程序执行正常
     */
    
    //    dispatch_group_t group = dispatch_group_create();
    //    dispatch_queue_t queue = dispatch_queue_create("MyQueue", DISPATCH_QUEUE_CONCURRENT);
    //
    //    dispatch_group_enter(group);
    //    [self sendRequest1:^{
    //        NSLog(@"捕获到网络请求1完成...");
    //        dispatch_group_leave(group);
    //    }];
    //
    //    dispatch_group_enter(group);
    //    [self sendRequest2:^{
    //        NSLog(@"捕获到网络请求2完成...");
    //        dispatch_group_leave(group);
    //    }];
    //
    //
    //
    //    dispatch_group_notify(group, queue, ^{
    //        NSLog(@"刷新UI完成");
    //    });
    
    
    /* 6，GCD信号量
     dispatch_semaphore_create(a)  a:表示最多几个资源同时访问
     */
    //    dispatch_queue_t queue = dispatch_queue_create("queue_signal", DISPATCH_QUEUE_CONCURRENT);
    //    /*同时可访问资源的线程数*/
    //    int a = 1;
    //
    //    dispatch_semaphore_t semaphore = dispatch_semaphore_create(a);
    //
    //    dispatch_async(queue, ^{
    //        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    //        NSLog(@"run task 1");
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"end task 1");
    //        dispatch_semaphore_signal(semaphore);
    //    });
    //    dispatch_async(queue, ^{
    //        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    //        NSLog(@"run task 2");
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"end task 2");
    //        dispatch_semaphore_signal(semaphore);
    //    });
    //    dispatch_async(queue, ^{
    //        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    //        NSLog(@"run task 3");
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"end task 3");
    //        dispatch_semaphore_signal(semaphore);
    //    });
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-1");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-2");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-3");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-4");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-5");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-6");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-7");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-8");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-9");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-10");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-11");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-12");
    });
    dispatch_barrier_async(concurrentQueue, ^(){
        NSLog(@"dispatch-barrier");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-a");
    });
    dispatch_async(concurrentQueue, ^(){
        NSLog(@"dispatch-b");
    });
}

/*模拟网络请求异步线程1*/
- (void)sendRequest1:(void (^)()) block{
    
    dispatch_barrier_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"网络请求1开始....");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"网络请求1结束...");
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
    });
    
}

/*模拟网络请求异步线程2*/
- (void)sendRequest2:(void (^)()) block{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"网络请求2开始....");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"网络请求2结束...");
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
    });
}


@end
