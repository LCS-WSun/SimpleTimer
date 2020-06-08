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
    var taskTimer = Timer()
    var timeElapsed: TimeInterval = 0
    
    // MARK: - Outlets
    
    @IBOutlet weak var labelTimeElapsed: UILabel!
    
    // MARK: - View Life Cycle Methods

    // This method runs once when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func startTask(_ sender: UIButton) {
        
        // Start the timer ticking
        taskTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChildViewController.tick), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTask(_ sender: UIButton) {
        
        // Stop the timer
        taskTimer.invalidate()
    }
    
    // Show how many seconds have elapsed
    @objc func tick() {
        
        // Increment the time elapsed
        timeElapsed += 1
        
        //Update the label
        labelTimeElapsed.text = String(Int(timeElapsed))
        
        print(timeElapsed)
        
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
