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
    
    @IBOutlet weak var timeDisplayedOfArray: UILabel!
    
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
        
    //this line of code is first going to the label tapping into its text property and then it is put into a string format where we will use a escape character for saveTimeValues.count which will display on the parent screen
        timeSavedLabel.text = "Number of times saved from your stopwatch is \(savedTimeValues.count)."
        
        
        timeDisplayedOfArray.text = "\(savedTimeValues)"
        
        
        
        
        
        
        
    //So I can see that it is working
    print("Number of times saved from your stopwatch is \(savedTimeValues.count).")
        
        
        
        
        

        
    }
}
