//
//  ViewController.swift
//  SimpleTimer
//
//  Created by Sun, Wesley on 2020-06-07.
//  Copyright © 2020 Wesley Sun. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController,   {

    // MARK: Properties
    
    
    var timeSaver = [Int]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Segue to childView
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
           //Inputting destination of segeu
           if let childController = segue.destination as?
            ChildViewController {

               // Register this controller, the parent, as something that can save books
            ChildViewController.delegate = self
               
           }
    
    
    
    
    
    
    
    @IBOutlet weak var amountOfTimeWorked: UILabel!
    
}
}

