//
//  Calculate.swift
//  DayCalculator
//
//  Created by Sahib on 4/27/16.
//  Copyright © 2016 sahib. All rights reserved.
//

import Foundation

class Calculate{
    
    var monthArray:[Int] = [31,28,31,30,31,30,
                            31,31,30,31,30,31]
    
    func countLeapYears1(Year: Int) -> Int {
        
        var year1 = Year
        year1 = year1 - 1
        
        return year1/4 - year1/100 + year1/400
    }
    
    func countLeapYear2(Year: Int) -> Int {
        let year2  = Year
        
        return year2/4 - year2/100 + year2/400
    }

    
    func getDifference(fromDay:Int, fromMonth:Int, fromYear:Int,
                       toDay:Int,toMonth:Int,toYear:Int) -> Int {
        
        var n1 = (fromYear*365)
        n1 = n1 + (fromDay)
        
        
        for i in 0 ..< (fromMonth) {
            n1 = n1 + monthArray[i]
            
        }
        
        if fromMonth <= 2 {
            n1 = n1 + countLeapYears1(fromYear)
        }
        
        if fromMonth > 2{
            n1 = n1 + countLeapYear2(fromYear)
        }
        
        print("The no. of days till start date are \(n1)")
        
        var n2 = (toYear*365)
        n2 = n2 + (toDay)
        
        
        for i in 0 ..< (toMonth) {
            n2 = n2 + monthArray[i]
            
        }
        
        if (toMonth) <= 2 {
            n2 = n2 + countLeapYears1(toYear)
            print("The count of number of leap years when month <= 2 is \(n2)")
        }
        
        if (toMonth) > 2{
            n2 = n2 + countLeapYear2(toYear)
            print("The count of number of leap years when month >2 is \(n2)")
        }
        
        print("The no. of days till end date are \(n2)")
        
        //self.displayLabel.text = "The difference is \(n2 - n1)"
        
        print("The difference is between start & end date is \(n2-n1)")
        
        return (n2-n1)
    }
    
}