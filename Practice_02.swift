//
//  Practice_02.swift
//  practice_swift
//
//  Created by shuni on 28/9/26.
//
import Foundation

func runPractice02(){
    let score = 82
    let attendance = 95
    let gpa = 3.6

    // 1. Determine grade
    var grade = ""

    if score >= 90 {
        grade = "A"
    } else if score >= 80 {
        grade = "B"
    } else if score >= 70 {
        grade = "C"
    } else if score >= 50 {
        grade = "D"
    } else {
        grade = "F"
    }

    // 2. Determine result
    var result = ""

    if score >= 50 {
        result = "Pass"
    } else {
        result = "Fail"
    }

    // 3. Determine message using switch
    var message = ""

    switch grade {
    case "A":
        message = "Excellent!"
    case "B", "C":
        message = "Good work, keep going!"
    case "D":
        message = "You passed. Aim higher next time."
    case "F":
        message = "Please see your instructor."
    default:
        message = "Invalid grade."
    }

    // 4. Determine scholarship status
    var scholarship = ""

    if gpa >= 3.5 && attendance >= 90 {
        scholarship = "Eligible"
    } else {
        scholarship = "Not eligible"
    }

    // 5. Determine warning
    var warning = ""

    if attendance < 75 || score < 50 {
        warning = "At risk"
    } else {
        warning = "None"
    }

    // 6. Print all results
    print("Score: \(score)")
    print("Grade: \(grade)")
    print("Result: \(result)")
    print("Message: \(message)")
    print("Scholarship: \(scholarship)")
    print("Warning: \(warning)")
    
}
func registerPractice02(name: String, age: Int, hasPaid: Bool) {

    // 1. Check if name is empty
    guard !name.isEmpty else {
        print("Error: Name is required.")
        return
    }

    // 2. Check if student is at least 16
    guard age >= 16 else {
        print("Error: \(name) is too young to register.")
        return
    }

    // 3. Check if student has paid
    guard hasPaid else {
        print("Error: \(name) has not paid the fee.")
        return
    }

    // 4. Success message — last line of the function
    print("\(name) is registered.")
}
func runRegisterPractice02(){
    registerPractice02(name: "Dara", age: 20, hasPaid: true)
    registerPractice02(name: "Sok", age: 15, hasPaid: true)
    registerPractice02(name: "Vicheka", age: 19, hasPaid: false)
    registerPractice02(name: "", age: 22, hasPaid: true)
    
}


