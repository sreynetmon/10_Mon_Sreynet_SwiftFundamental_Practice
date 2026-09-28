//
//  Practice_03.swift
//  practice_swift
//
//  Created by shuni on 28/9/26.
//

import Foundation

func runPractice03(){
    // Multiplication Table

    for number in 1...10 {
        print("7 x \(number) = \(7 * number)")
    }

    print()

    // Course Topics

    let topics = ["Variables", "Conditionals", "Loops", "Collections"]

    for index in 0..<topics.count {
        print("\(index + 1). \(topics[index])")
    }
    
    print()
    
    //Study Timer
    var totalMinutes = 0
    var sessionCount = 0
    
    while totalMinutes < 100{
        sessionCount += 1
        totalMinutes += 25
        
        print("Session \(sessionCount): \(totalMinutes) minutes")
    }
    print("Goal reached in \(sessionCount) sessions.")
    
    //Countdown
    var countdown = 3
    repeat{
        print("\(countdown)...")
        countdown -= 1
    }while countdown > 0
    print("Break time!")

}

