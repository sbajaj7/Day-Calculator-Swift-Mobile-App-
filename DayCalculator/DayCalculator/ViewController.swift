//
//  ViewController.swift
//  DayCalculator
//
//  Created by Sahib on 4/25/16.
//  Copyright © 2016 sahib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fromYear: UITextField!
    @IBOutlet weak var fromMonth: UITextField!
    @IBOutlet weak var fromDay: UITextField!
    
    
    @IBOutlet weak var toDay: UITextField!
    
    @IBOutlet weak var toMonth: UITextField!
    
    @IBOutlet weak var toYear: UITextField!
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    //For Non-Leap year
    var monthArray1:[Int] = [31,28,31,30,31,30,
                            31,31,30,31,30,31]
    
    //For Leap year
    var monthArray2:[Int] = [31,29,31,30,31,30,
                             31,31,30,31,30,31]
 
    @IBAction func buttonPressed(sender: UIButton) {
        
        print("Button is pressed")
        
        //print("The value of from day is \(fromDay.text!)")
        //print("The value of from month is \(fromMonth.text!)")
        //print("The value of from year is \(fromYear.text!)")
        
        //print("The value of to day is \(toDay.text!)")
        //print("The value of to month is \(toMonth.text!)")
        //print("The value of to year is \(toYear.text!)")
        
        //print((Int(fromYear.text!)!))
        //print((Int(fromMonth.text!)!))
        
        //print(countLeapYears1(2000))
        
        //print(monthArray1[Int(fromMonth.text!)!])
        
        //(Int(fromDay.text!)!) <= monthArray1[Int(fromMonth.text!)! - 1]
        
        
        let calc = Calculate()
        
        if fromDay.text! == "" || fromMonth.text! == "" || fromYear.text! == "" || toDay.text! == "" || toMonth.text! == "" || toYear.text! == "" {
            
            self.displayLabel.text = "Enter values of all fields."
            
        }
        
        else{
            
            if !isInputNumerical(fromMonth.text!) || !isInputNumerical(toMonth.text!) || !isInputNumerical(fromDay.text!) || !isInputNumerical(toDay.text!) || !isInputNumerical(fromYear.text!) || !isInputNumerical(toYear.text!)
            {
                self.displayLabel.text = "Please enter only numbers."
            }
           
            else{
        
        if (Int(fromMonth.text!)!) <= 12 && (Int(fromMonth.text!)!) > 0 && (Int(fromYear.text!)!) > 0 && (Int(fromDay.text!)!) > 0 && (Int(toMonth.text!)!) <= 12 && (Int(toMonth.text!)!) > 0 && (Int(toYear.text!)!) > 0 && (Int(toDay.text!)!) > 0
        {
        
        let diff = calc.getDifference((Int(fromDay.text!)!),fromMonth: (Int(fromMonth.text!)!),fromYear: (Int(fromYear.text!)!),toDay: (Int(toDay.text!)!),toMonth: (Int(toMonth.text!)!),toYear: (Int(toYear.text!)!))
        
            
            //self.displayLabel.text = "The Start Date is after the End Date."
        
        
        if diff >= 0
        {
            
            if ((Int(fromYear.text!)!) < 1582)
            {
                
                self.displayLabel.text = "Enter year of Gregorian Calendar."
            
            }
            else if ((Int(fromYear.text!)! == 1582) && (Int(fromMonth.text!)! == 10) &&  (Int(fromDay.text!)! < 15)){
                    self.displayLabel.text = "Enter date of Gregorian Calendar."
                    print("inside my if2")
                    
                }
                
            else if ((Int(fromYear.text!)! == 1582) && (Int(fromMonth.text!)! < 10))
                {
                    
                    self.displayLabel.text = "Enter date of Gregorian Calendar."
                    print("inside my if1")
                    
                }
                
            else{
                    self.displayLabel.text = "The difference is \(diff)"
                    //print("inside my else else")
                }
            
        }
        
        if diff < 0{
            
            self.displayLabel.text = "The Start Date is after the End Date."
        
        }
        
        
        
        
        //Validation for day in fromYear(Leap Year)
        if ((Int(fromYear.text!)! % 4 == 0) && (Int(fromYear.text!)! % 100 != 0) || (Int(fromYear.text!)! % 400 == 0)) && ((Int(fromDay.text!)!) > monthArray2[Int(fromMonth.text!)! - 1])
        {
            print("Starting Year is a leap year")
            self.displayLabel.text = "Please enter a valid date."
        }
        
        //Validation for day in fromYear(Non-Leap year)
        if (((Int(fromYear.text!)! % 4 == 0) && (Int(fromYear.text!)! % 100 != 0) || (Int(fromYear.text!)! % 400 == 0)) == false && (Int(fromDay.text!)!) > monthArray1[Int(fromMonth.text!)! - 1])
        {
            print("Starting Year is not a leap year")
            self.displayLabel.text = "Please enter a valid date."
        }
        
        //Validation for day in toYear(Leap year)
        if ((Int(toYear.text!)! % 4 == 0) && (Int(toYear.text!)! % 100 != 0) || (Int(toYear.text!)! % 400 == 0)) && ((Int(toDay.text!)!) > monthArray2[Int(toMonth.text!)! - 1])
        {
            print("Ending Year is a leap year")
            self.displayLabel.text = "Please enter a valid date."
        }
        
        //Validation for day in toYear(Non-Leap year)
        if (((Int(toYear.text!)! % 4 == 0) && (Int(toYear.text!)! % 100 != 0) || (Int(toYear.text!)! % 400 == 0)) == false && (Int(toDay.text!)!) > monthArray1[Int(toMonth.text!)! - 1])
        {
            print("Ending Year is not a leap year")
            self.displayLabel.text = "Please enter a valid date."
        }
        
        }
            
        else
        {
            print("Inside Main else condition ")
            
            self.displayLabel.text = "Please enter a valid date."
            
        }
                
            }
            
        }
            
        }
    
    func isInputNumerical(string : String) -> Bool {
        // Only allow numbers. Look for anything not a number.
        let range = string.rangeOfCharacterFromSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
        return (range == nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}