//
//  Practice_04.swift
//  practice_swift
//
//  Created by shuni on 28/9/26.
//

import Foundation
func runPractice04(){

    //Create an array
    var students = ["Dara", "Sok", "Bopha"]
    //add rithy to the end
    students.append("Rithy")

    // Put Vicheka at the front (index 0)
    students.insert("Vicheka", at: 0)

    print("All Data: \(students)")
    print("Count: \(students.count)")
    print("First: \(students[0])")

    students.remove(at: 2)
    print("After removing: \(students)")

    //Check Dara is still in the array
    print("Has Dara: \(students.contains("Dara"))")

    let sortedStudents = students.sorted()
    print("Sorted: \(sortedStudents)")
    
    print("==========================")
    
    //create two sets
    var codingClub: Set<String> = [
        "Dara", "Sok", "Bopha"
    ]
    let mathClub: Set<String> = [
        "Sok", "Rithy", "Bopha"
    ]
    
    //add Dara again
    codingClub.insert("Dara")
    print("Coding club size: \(codingClub.count)")
    
    //find students in both club
    let bothClubs = codingClub.intersection(mathClub)
    print("In both clubs: \(bothClubs.sorted())")

    //find all students
    let allMembers = codingClub.union(mathClub)
    print("All members: \(allMembers.sorted())")
    
    print("===========================")
    
    //create a dictionary
    var grades: [String: Int] = [
        "Dara": 88,
        "Sok": 74
    ]
    grades["Bopha"] = 91
    //update
    grades["Sok"] = 79
    //remove
    grades.removeValue(forKey: "Dara")
    
    print("Bopha: \(grades["Bopha", default: 0])")
    print("Rithy: \(grades["Rithy", default: 0])")

    //Print number of entries
    print("Entries: \(grades.count)")

    //Loop all names and scores
    for (name, score) in grades {
        print("\(name) -> \(score)")
    }
}
