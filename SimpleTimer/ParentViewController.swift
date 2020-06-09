//
//  ViewController.swift
//  SimpleTimer
//
//  Created by Sun, Wesley on 2020-06-07.
//  Copyright © 2020 Wesley Sun. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController, timeSaver {

    
    // MARK: Properties
    var timeSaved: [timeSaved] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Segue to childView
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
           //Inputting destination of segeu
           childController = segue.destination as?
        ChildViewController }

               // Register this controller, the parent, as something that can save books
            ChildViewController.delegate = self
               
           }
    
    
    
    
    
    
    
    @IBOutlet weak var amountOfTimeWorked: UILabel!
    
}
}

