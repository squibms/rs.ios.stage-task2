#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSMutableArray *fullNumbersArray = [numbersArray mutableCopy];
    NSMutableString *ipAdress = [[NSMutableString alloc]initWithString:@""];
    
    if (numbersArray.count < 4) {
         for (int j=0; j < (4 - numbersArray.count); j++) {
             [fullNumbersArray addObject: @0];
         }
     }

         if (numbersArray == nil || numbersArray.count == 0) {
            [ipAdress setString:@""];
            return ipAdress;
         }

     for (int i=0; i < 4; i++) {

         if ([fullNumbersArray[i] intValue] > 255) {
             [ipAdress setString:@"The numbers in the input array can be in the range from 0 to 255."];
             return ipAdress;
         }
             if ([fullNumbersArray[i] intValue] < 0) {
             [ipAdress setString:@"Negative numbers are not valid for input."];
             return ipAdress;
         }
             [ipAdress appendString:[fullNumbersArray[i] stringValue]];
             [ipAdress appendString:@"."];

     }
    return [ipAdress substringToIndex:[ipAdress length] - 1];
}

    @end

    
