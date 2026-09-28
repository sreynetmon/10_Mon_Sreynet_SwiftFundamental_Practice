//
//  Practice_07.swift
//  practice_swift
//
//  Created by shuni on 28/9/26.
//

import Foundation

func runPractice07(){
    struct Student {
        let name: String
        let email: String?  // Email can be missing
    }

    let dara = Student(
        name: "Dara",
        email: "dara@school.edu"
    )

    let sok = Student(
        name: "Sok",
        email: nil
    )

    // Store in an array
    let students = [dara, sok]

    // Print each student's contact details
    for student in students {
        let contact = student.email ?? "no email on file"
        print("\(student.name): \(contact)")
    }

    // Print Sok's contact using a different fallback
    print("Sok's contact: \(sok.email ?? "not provided")")

    // print Dara's email length
    print("Dara's email length: \(dara.email?.count ?? 0)")

    // Send reminder only if email exists
    func sendReminder(to student: Student) {
        guard let email = student.email else {
            print("Cannot remind \(student.name): missing email.")
            return
        }

        print("Reminder sent to \(email).")
    }
    sendReminder(to: dara)
    sendReminder(to: sok)
    
    print("=======================")
    
    enum ScoreError: Error{
        case notANumber
        case negative
        case above100
    }
    // Convert text into a valid score
    func parseScore(_ input: String) throws -> Int {
        // Convert String to Int
        guard let score = Int(input) else {
            throw ScoreError.notANumber
        }
        // Check if score is negative
        if score < 0 {
            throw ScoreError.negative
        }

        // Check if score is above 100
        if score > 100 {
            throw ScoreError.above100
        }
        return score
    }

    // Inputs to validate
    let inputs = ["88", "-4", "120", "ninety"]
    // Validate each input
    for input in inputs {
        do {
            let score = try parseScore(input)
            print("Saved score: \(score)")
            
        } catch ScoreError.notANumber {
            print("Error: \"\(input)\" is not a number.")
            
        } catch ScoreError.negative {
            print("Error: \(input) is negative.")
            
        } catch ScoreError.above100 {
            print("Error: \(input) is above 100.")
            
        } catch {
            print("Unexpected error: \(error)")
        }
    }
}
