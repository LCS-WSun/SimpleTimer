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
    
    @IBOutlet weak var timeSavedLabel: UILabel!
    
    // Segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // a if let statement that delcares the destination of the segue to the childviewController
        if let childController = segue.destination as?
            ChildViewController {
            
            // setting the delegate to childview
            childController.delegate = self
            
        }
        
}
    //The function that will save a new value as stored as a structure
    func save(new: TimeValue) {
        
    //.append which will make a new value in the array
    savedTimeValues.append(new)
        

    //this print statement will say the saved time value in the command tab but I will link it to the label on the parent view controller. we then put the actual value AKA not a string in \() where we put the words .count to count the number of things stored in the array

        timeSavedLabel.text = "Number of times saved from your stopwatch is \(savedTimeValues.count)."
        
        
        print("Number of values in saved time values is \(savedTimeValues.count)")
        
    }
    
}
