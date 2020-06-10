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
        labelTimeElapsed.text = ("0")
        
        
 
               
        
        
        
        
    }
    
    
    
    
    
    
    // The Objc func is what is used to call back to the timer object and work with the function tick
    @objc func tick() {
        
        // Increment the time elapsed by 1 second
        timeElapsed += 1
        
        
        //Update the label by tapping into it with.text when we must change its property to string as it is a text and aswell to Int because it doesn't have to show 2 decimal places
        
        labelTimeElapsed.text = String(Int(timeElapsed))
        
    
    }
    
    
    /*
     
     
     
     
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
