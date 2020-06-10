//
//  Protocol.swift
//  SimpleTimer
//
//  Created by Sun, Wesley on 2020-06-09.
//  Copyright © 2020 Wesley Sun. All rights reserved.
//


//Creating a protocol that saves the time which is linked to the structure timeSaved
protocol TimeSaver {
    
    //Protocol to save TimeValue aka the structure value 
    func save(new: TimeValue)
}
