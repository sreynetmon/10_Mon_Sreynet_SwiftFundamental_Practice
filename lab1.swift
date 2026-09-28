//
//  labs.swift
//  practice_swift
//
//  Created by shuni on 28/9/26.
//

import Foundation
func runLab1(){
    struct Student{
        let name: String
        let score: Int
    }
    let students = [
        Student(name: "Dara", score: 88),
        Student(name: "Sok", score: 45),
        Student(name: "Bopha", score: 92),
        Student(name: "Rithy", score: 67),
        Student(name: "Vicheka", score: 73),
        Student(name: "Sophea", score: 39)
    ]
    
    print("====== SCORE ANALYZE =======")
    print("Students: \(students.count)")
    
    if students.isEmpty{
        print("Class average: N/A")
    }else{
        let total = students.reduce(0) {$0 + $1.score}
        let average = Double(total) / Double(students.count)
        print("Class average: \(String(format: "%.2f", average))")
    }
    print("\n--- Results ---")
    for student in students {
        let result = student.score >= 50 ? "PASS" : "FAIL"
        print("\(student.name): \(student.score) \(result)")
    }
    // Highest and lowest
    if let highest = students.max(by: { $0.score < $1.score }),
       let lowest = students.min(by: { $0.score < $1.score }) {
        print("\nHighest: \(highest.name) (\(highest.score))")
        print("Lowest: \(lowest.name) (\(lowest.score))")
    } else {
        print("\nNo students to analyze")
    }
    // Passing students
    let passing = students.filter { $0.score >= 50 }
    let passingNames = passing.map { $0.name }
    print("\nPassing: \(passingNames.joined(separator: ", "))")

    // Ranking
    print("\n--- Ranking ---")

    let ranking = students.sorted { $0.score > $1.score }

    for (index, student) in ranking.enumerated() {
        print("\(index + 1). \(student.name) - \(student.score)")
    }
    
}
