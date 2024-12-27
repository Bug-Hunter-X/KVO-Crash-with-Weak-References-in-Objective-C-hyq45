The solution involves ensuring that the observation is removed before the observed object is deallocated.  This can be achieved by either using a strong reference (though this needs careful management to avoid retain cycles) or by removing the observer in the `dealloc` method of the observed object.   A more robust solution often involves using blocks to manage observation and cleanup.

```objectivec
@interface ObservedObject : NSObject
@property (nonatomic, strong) NSString *observedProperty;
@end

@implementation ObservedObject
- (void)dealloc {
    [self removeObserver:self forKeyPath:@"observedProperty"];
    NSLog(@"ObservedObject deallocated");
}
@end

@interface ObserverObject : NSObject
@end

@implementation ObserverObject
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@