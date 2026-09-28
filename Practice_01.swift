//
//  Practice_01.swift
//  practice_swift
//
//  Created by shuni on 28/9/26.
//

import Foundation

func runStudentProfile(){
    //declare student information
    let studentID = 1001
    let name = "Sreynet"
    let age: Int = 20
    var gpa: Double = 3.75
    let isActive = true

    //print
    print("========== STUDNENT PROFILE =======")
    print("")

    print("ID: \(studentID)")
    print("Name: \(name)")
    print("Age: \(age)")
    print("GPA: \(gpa)")
    print("Active: \(isActive)")
    
    gpa = 3.90
    print("Updated GPA: \(gpa)")
    
    
    let score1 = 80
    let score2 = 90
    let score3 = 85

    // Calculate total
    let total = score1 + score2 + score3

    // Calculate average with decimals
    let average: Double = Double(total) / 3.0

    // Convert average to a whole number
    let roundedAverage = Int(average)

    // Build label by joining strings
    let label = "Total: " + String(total)

    // Print results
    print("Total: \(total)")
    print("Average: \(average)")
    print("Rounded average: \(roundedAverage)")
    print("Label -> \(label)")

}

