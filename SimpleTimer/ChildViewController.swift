//
//  ChildViewController.swift
//  SimpleTimer
//
//  Created by Sun, Wesley on 2020-06-07.
//  Copyright © 2020 Wesley Sun. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    
    
    // MARK: - Properties
    
    //We created the variable task timer that is linked to the object timer
    var taskTimer = Timer()

    //We created a variable called time Elapsed where the initial time is set to 0 well since, the user hasn't pressed the button yet
    var timeElapsed: TimeInterval = 0
    
    
    // MARK: - Outlets
    
    //This is the label that will tell the seconds going up on the user interface
    @IBOutlet weak var labelTimeElapsed: UILabel!
    
    //Outlets for the enabling and disabling of the buttons
    @IBOutlet weak var startTaskOutlet: UIButton!
    @IBOutlet weak var stopTaskOutlet: UIButton!
    
    
    // MARK: - View Life Cycle Methods
    

    //Linking the delegate AKA parent view to do the protocol timeSaver or to save a new time
    var delegate: TimeSaver?
    
    // This method runs once when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTaskOutlet.isEnabled = true
        stopTaskOutlet.isEnabled = false
        
        // Do any additional setup after loading the view.
    }
    
    //We created a button that starts the task, this will trigger the folowing code below
    @IBAction func startTask(_ sender: UIButton) {
        
    //enabling and disalbing button
        startTaskOutlet.isEnabled = false
        stopTaskOutlet.isEnabled = true
        
        // essentially, we call back to the timer object which we clarfied as a variabl, .scheduled timer is the specifications of the timer which timer interval is count in seconds and we set it for 1 second going up, target? not quite sure what it means but it means when the timer is ticking, it referencing to iteslf? The selector not that confident about its function. But then afterwards, we claim that is referencing to the child view controller. .tick is the function that triggers the timer to go I supopse? the user info? again not too sure about its function. And finally repaet, well it is obvious it indicates that this timer may repeat itself and is in a loop and is only triggered when we press the START button
        taskTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChildViewController.tick), userInfo: nil, repeats: true)
    }
    
    //The stop button
    @IBAction func stopTask(_ sender: UIButton) {
        
        //Update button state
        startTaskOutlet.isEnabled = true
        stopTaskOutlet.isEnabled = false
        
        //Save the time that user stopped to parent view
        //self.delegate is reffering to the parent view.save then
        
        self.delegate?.save(new: TimeValue(interval: timeElapsed))
        
        // Stop the timer - .indvalidate is a function that stops a timer
        
        taskTimer.invalidate()
        timeElapsed = 0
        labelTimeElapsed.text = ("0:00:00")
    }
    
    // The Objc func is what is used to call back to the timer object and work with the function tick
    @objc func tick() {
    

    // Increment the time elapsed by 1 second
    timeElapsed += 1
        
    //Displaying the time in Hours, Minutes, Seconds
  
        // made a constant called differentTimes and is set as a Int and
        //floored is a double but we want a Int so we wrap it around () of the timeElapsed or "seconds going up"
        let timeCountUp = Int(floor(timeElapsed))

        //an hour has 3600 seconds so if you amount of seconds / 3600, you get hour
        let hour = timeCountUp / 3600
         
        //for minutes, you get the remainder value from the seconds count up remaindered to 3600 AKA an 1 hour. You then find then get the remainer of the value remainained from the seconds by hour to divide by 60 because there is 60 seconds in a minute
        let minute = (timeCountUp % 3600) / 60
        
        //we make a var for minute and will input the minute we did it through string interpolation
        var minuteString = "\(minute)"
        
        //we make an if statement for if the minute is less than 10, because if it is this is indicating that is it an hour, well in the textview's sense
        if minute < 10 {
            
        //we put the 0 there to indivate hour and the minute will run as one number
        minuteString = "0\(minute)"
    }
        
        //seconds is determined by finding the remainder of it in a hour then we find the so the seeconds counted up and then find the remainder of an hour then we find the remainder of that from 60 because well there is 60 seconds in a minute
        let seconds = (timeCountUp % 3600) % 60
       
        var secondsString = "\(seconds)"
        //making a if statement because if seconds is lessn than 10, it should say 09 instead of 10
        if seconds < 10 {
            secondsString = "0\(seconds)"
    }

        //Update the label by tapping into it with.text when we must change its property to string as it is a text and aswell to Int because it doesn't have to show 2 decimal places
        
        //labelTimeElapsed.text = String(Int(timeElapsed)) - this only showed seconds now it shows h, m , s
        //this label is aka outlet, we can tap into the text and use string interpolation to show the values
        labelTimeElapsed.text = "\(hour):\(minuteString):\(secondsString)"
        
    }
}





/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
