//
//  ViewController.swift
//  SimpleTimer
//
//  Created by Sun, Wesley on 2020-06-07.
//  Copyright © 2020 Wesley Sun. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController, TimeSaver {
    
    // MARK: Properties
    
    //make a new variable that then is related to the structure and starts off as a empty array
    var savedTimeValues: [TimeValue] = []
    
    
    //MARK Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //OUTLETS stored here
    @IBOutlet weak var timeSavedLabel: UILabel!
    @IBOutlet weak var timeAverageLabel: UILabel!
    @IBOutlet weak var timeDisplayedOfArray: UILabel!
    
    // Segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // a if let statement that delcares the destination of the segue to the childviewController
        if let childController = segue.destination as?
            ChildViewController {
            
            // setting the delegate to childviewController
            childController.delegate = self
        }
    }
    //The function that will save a new value as stored as a structure
    func save(new: TimeValue) {
        
        //.append which will make a new value in the empty array
        savedTimeValues.append(new)
        
        //this line of code is first going to the label tapping into its text property and then it is put into a string format where we will use a string literal for saveTimeValues.count which will display on the parent screen
        timeSavedLabel.text = "Number of times saved from your stopwatch is:  \(savedTimeValues.count)."
        
        //making it more organized and made a constant of the savedTimeValues.count
        var quantityTimeValue = savedTimeValues.count
        
        
        //Trying to resolve only showing seconds issue don't know how to fix it
            let hour = quantityTimeValue / 3600
        
            let minute = quantityTimeValue / 60
            if minute < 3600  {
            quantityTimeValue = minute
        
            if hour >= 3600 {
            quantityTimeValue = hour
        
        }
            let seconds = quantityTimeValue
            if seconds < 60 {
            quantityTimeValue = seconds
        }
        
    }
        
        
        //Displays the time on the screen by being implemented in the label and is displayed as a array
        //PROBLEM (only displays in seconds and is quite messy)
        timeDisplayedOfArray.text = "Your time:  \(quantityTimeValue) seconds"
        
        
        //What I want to happen
        // let timesAverage = (savedTimeValues) / (quantityTimeValue)
        
        //New var called totalAcrossTimes set to 0 because well no time is stored yet
        var totalAcrossOfTimes = 0
        //for time (defining a constant) in savedTimevalues AKA the array
        for time in savedTimeValues {
        //totalAcrossOfTimes will add the values of time of the intervals stored in the structure and we set it to a Int because intially it is a Doudble. time is the constant and we assign it to the interval from the structure
        totalAcrossOfTimes += Int(time.interval)
    }
        // Avoiding division of 0 with an if statement
        
        //initial set average times to 0
        var averageTime = 0
        //only will perform the equation when it is above 0
        if savedTimeValues.count > 0 {
        //average time is equal to times values in the array divided by the stored value of times in the array
        averageTime = totalAcrossOfTimes / savedTimeValues.count
            
            
//        //Trying to resolve only showing seconds issue, I tried my best, it is not working so I will keep it as seconds
//                let averageHour = averageTime / 3600
//
//                let averageMinute = averageTime / 60
//                if averageMinute < 3600  {
//                averageTime = averageMinute
//
//                if averageHour >= 3600 {
//                averageTime = averageHour
//
//            }
//                let averageSeconds = averageTime
//                if averageSeconds < 60 {
//                averageTime = averageSeconds
//            }
//
//        }

    //Displaying average time in the label with string interpolation
        timeAverageLabel.text = "Your Average of Time is: \(averageTime) seconds "
        
        

        
            
        
        

        }
    
    }
}
