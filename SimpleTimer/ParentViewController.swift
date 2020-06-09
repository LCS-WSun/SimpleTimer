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
    var savedTimeValues: [TimeValue] = []
    
    
    //MARK Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var timeSavedLabel: UILabel!
    // Segue function
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // What is the destination of this segue?
        if let childController = segue.destination as?
            ChildViewController {
            
            // setting the delegate to the childview
            childController.delegate = self
            
        }
        
        
        
        
        
        
    }
    
    func save(new: TimeValue) {
        savedTimeValues.append(new)
        print("Number of values in saved time values is \(savedTimeValues.count)")
    }
    
}
