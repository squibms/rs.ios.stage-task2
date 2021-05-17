#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (nil == array)
         return @[];

     NSPredicate *predicateArray = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [NSArray class]];
     NSArray *filteredArray = [array filteredArrayUsingPredicate:predicateArray];

     if (filteredArray.count == 0)
         return @[];

     NSArray *valueArray = [array valueForKeyPath:@"@unionOfArrays.self"];
     NSPredicate *numberPredicate = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [NSNumber class]];
     NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [NSString class]];
     NSArray *filteredNumbers = [valueArray filteredArrayUsingPredicate:numberPredicate];

     if (filteredNumbers.count == valueArray.count || filteredNumbers.count == 0) {
         return [valueArray sortedArrayUsingSelector: @selector(compare:)];
     }
     else {
         NSArray *numbers = [filteredNumbers sortedArrayUsingSelector: @selector(compare:)];
         NSArray *filteredStrings = [valueArray filteredArrayUsingPredicate:stringPredicate];
         NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(compare:)];
         NSArray *strings = [filteredStrings sortedArrayUsingDescriptors:@[sortDescriptor]];
         return @[numbers, strings];
     }
}

@end
