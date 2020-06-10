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
    
    //Creating variables total time and average time for calculating the average time later on (doesn't work..)
    var totalTime: Int = 0
    var averageTime: Int = 0
    
    
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
        let quantityTimeValue = savedTimeValues.count
        
        
        //Displays the time on the screen by being implemented in the label and is displayed as a array
        //PROBLEM (only displays in seconds and is quite messy)
        timeDisplayedOfArray.text = "Your time:  \(savedTimeValues) seconds"
        

        
        //What I want to happen
        // let timesAverage = (savedTimeValues) / (quantityTimeValue)
        
        //New var called totalAcrossTimes set to 0
        var totalAcrossOfTimes = 0
        //for time (defining a constant) in savedTimevalues AKA the array
        for time in savedTimeValues {
        //totalAcrossOfTimes will add the values of time of the intervals stored in the structure
        totalAcrossOfTimes += Int(time.interval)
        }
        
        // Avoiding division of 0
        //initial set average times to 0
        var averageTime = 0
        //only will perform the equation when it is above 0
        if savedTimeValues.count > 0 {
            averageTime = totalAcrossOfTimes / savedTimeValues.count
    }
    //Displaying average time in the label
        timeAverageLabel.text = "Your Average of Times is:  \(averageTime)"
        print("\(averageTime)")
    }
    
}
