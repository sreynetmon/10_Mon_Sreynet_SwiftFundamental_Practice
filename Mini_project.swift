//
//  Mini_project.swift
//  practice_swift
//
//  Created by shuni on 28/9/26.
//

import Foundation

func runMiniProject(){
    struct Student {
        let id: Int
        var name: String
        var age: Int
        var email: String?
        var scores: [Int] = []

        // Calculate average
        var average: Double? {
            if scores.count == 0 {
                return nil
            }
            var total = 0
            for score in scores {
                total += score
            }
            return Double(total) / Double(scores.count)
        }

        // Calculate grade
        var grade: String {
            if let average = average {
                if average >= 90 {
                    return "A"
                } else if average >= 80 {
                    return "B"
                } else if average >= 70 {
                    return "C"
                } else if average >= 50 {
                    return "D"
                } else {
                    return "F"
                }
            }
            return "—"
        }
    }
    //Student Storage
    var students: [Student] = []
    //input Functions
    func readText(_ prompt: String) -> String? {
        while true {
            print(prompt, terminator: "")
            if let input = readLine() {
                let answer = input.trimmingCharacters(
                    in: .whitespacesAndNewlines
                )
                if answer != "" {
                    return answer
                }
                print("Error: This field cannot be empty.")
            } else {
                return nil
            }
        }
    }
    func readNumber(_ prompt: String, minimum: Int, maximum: Int, errorMessage: String ) -> Int? {
        while true {
            print(prompt, terminator: "")
            if let input = readLine() {
                let answer = input.trimmingCharacters(
                    in: .whitespacesAndNewlines
                )
                if let number = Int(answer) {
                    if number >= minimum && number <= maximum {
                        return number
                    } else {
                        print("Error: \(errorMessage)")
                    }
                } else {
                    print("Error: Please enter a whole number.")
                }
            } else {
                return nil
            }
        }
    }
    //Find Student by ID
    func findStudentIndex(id: Int) -> Int? {
        for index in 0..<students.count {
            if students[index].id == id {
                return index
            }
        }
        return nil
    }
    //Display Student
    func showStudent(_ student: Student) {
        print("ID: \(student.id)")
        print("Name: \(student.name)")
        print("Age: \(student.age)")
        print("Email: \(student.email ?? "not provided")")

        if student.scores.count == 0 {
            print("Scores: —")
        } else {
            print("Scores: ", terminator: "")
            for score in student.scores {
                print(score, terminator: " ")
            }
            print()
        }
        if let average = student.average {
            print("Average: \(String(format: "%.2f", average))")
        } else {
            print("Average: —")
        }
        print("Grade: \(student.grade)")
    }

    //View All Students
    func viewStudents() {
        print("\n--- All Students ---")
        if students.count == 0 {
            print("No students yet.")
            return
        }
        print("ID\tName\t\tAverage\tGrade")
        for student in students {
            let averageText: String
            if let average = student.average {
                averageText = String(format: "%.2f", average)
            } else {
                averageText = "—"
            }
            print("\(student.id)\t\(student.name)\t\t\(averageText)\t\(student.grade)")
        }
    }
    //Add Student
    func addStudent() {
        print("\n--- Add Student ---")
        var id: Int
        while true {
            if let newID = readNumber(
                "Student ID: ",
                minimum: 1,
                maximum: Int.max,
                errorMessage: "ID must be greater than 0."
            ) {
                if findStudentIndex(id: newID) != nil {
                    print("Error: ID \(newID) already exists.")
                } else {
                    id = newID
                    break
                }
            } else {
                return
            }
        }
        guard let name = readText("Name: ") else {
            return
        }
        guard let age = readNumber(
            "Age: ",
            minimum: 16,
            maximum: 60,
            errorMessage: "Age must be between 16 and 60."
        ) else {
            return
        }
        var email: String? = nil
        while true {
            print("Email (optional): ", terminator: "")
            if let input = readLine() {
                let answer = input.trimmingCharacters(
                    in: .whitespacesAndNewlines
                )
                if answer == "" {
                    email = nil
                    break
                } else if answer.contains("@") {
                    email = answer
                    break
                } else {
                    print("Error: Email must contain @.")
                }
            } else {
                return
            }
        }
        let newStudent = Student(
            id: id,
            name: name,
            age: age,
            email: email,
            scores: []
        )
        students.append(newStudent)
        print("Student added.")
    }
    //Search Student
    func searchStudent() {
        print("\n--- Search Student ---")
        guard let search = readText("Enter ID or name: ") else {
            return
        }
        if let id = Int(search) {
            if let index = findStudentIndex(id: id) {
                showStudent(students[index])
            } else {
                print("Not found.")
            }
            return
        }
        var found = false
        for student in students {
            if student.name.lowercased().contains(search.lowercased()) {
                showStudent(student)
                print()
                found = true
            }
        }
        if !found {
            print("Not found.")
        }
    }
    //Update Student
    func updateStudent() {
        print("\n--- Update Student ---")
        guard let id = readNumber(
            "Student ID: ",
            minimum: 1,
            maximum: Int.max,
            errorMessage: "ID must be greater than 0."
        ) else {
            return
        }
        guard let index = findStudentIndex(id: id) else {
            print("Not found.")
            return
        }
        print("Press Enter to keep the current value.")
        print("Name [\(students[index].name)]: ", terminator: "")
        if let input = readLine() {
            let newName = input.trimmingCharacters(
                in: .whitespacesAndNewlines
            )
            if newName != "" {
                students[index].name = newName
            }
        } else {
            return
        }
        while true {
            print("Age [\(students[index].age)]: ", terminator: "")
            if let input = readLine() {
                let answer = input.trimmingCharacters(
                    in: .whitespacesAndNewlines
                )
                if answer == "" { break }
                if let newAge = Int(answer) {
                    if newAge >= 16 && newAge <= 60 {
                        students[index].age = newAge
                        break
                    } else {
                        print("Error: Age must be between 16 and 60.")
                    }
                } else {
                    print("Error: Please enter a whole number.")
                }
            } else { return }
        }
        while true {
            let currentEmail = students[index].email ?? "not provided"
            print("Email [\(currentEmail)] (Enter = keep, - = remove): ", terminator: "")
            if let input = readLine() {
                let answer = input.trimmingCharacters(
                    in: .whitespacesAndNewlines
                )
                if answer == "" {
                    break
                } else if answer == "-" {
                    students[index].email = nil
                    break
                } else if answer.contains("@") {
                    students[index].email = answer
                    break
                } else {
                    print("Error: Email must contain @.")
                }
            } else {
                return
            }
        }
        print("Student updated.")
    }

    //Delete Student
    func deleteStudent() {
        print("\n--- Delete Student ---")
        guard let id = readNumber(
            "Student ID: ",
            minimum: 1,
            maximum: Int.max,
            errorMessage: "ID must be greater than 0."
        ) else {
            return
        }
        guard let index = findStudentIndex(id: id) else {
            print("Not found.")
            return
        }
        while true {
            print("Delete \(students[index].name)? (y/n): ", terminator: "")
            if let answer = readLine() {
                switch answer.lowercased() {
                case "y":
                    students.remove(at: index)
                    print("Student deleted.")
                    return
                case "n":
                    print("Deletion cancelled.")
                    return
                default:
                    print("Please enter y or n.")
                }
            } else {
                return
            }
        }
    }
    //Add Score

    func addScore() {
        print("\n--- Add Score ---")
        guard let id = readNumber(
            "Student ID: ",
            minimum: 1,
            maximum: Int.max,
            errorMessage: "ID must be greater than 0."
        ) else {
            return
        }
        guard let index = findStudentIndex(id: id) else {
            print("Not found.")
            return
        }
        guard let score = readNumber(
            "Score: ",
            minimum: 0,
            maximum: 100,
            errorMessage: "Score must be between 0 and 100."
        ) else {
            return
        }
        students[index].scores.append(score)
        print("Score added.")
    }
    //Class Report
    func classReport() {
        print("\n--- Class Report ---")
        if students.count == 0 {
            print("No students yet.")
            print("Class average: —")
            return
        }
        viewStudents()
        var total = 0
        var numberOfScores = 0

        for student in students {
            for score in student.scores {
                total += score
                numberOfScores += 1
            }
        }
        if numberOfScores == 0 {
            print("\nClass average: —")
        } else {
            let average = Double(total) / Double(numberOfScores)
            print("\nClass average: \(String(format: "%.2f", average))")
        }
    }
    //Filter by Grade
    func filterByGrade() {
        print("Enter grade (A, B, C, D, F): ", terminator: "")
        guard let input = readLine() else {
            return
        }
        let grade = input.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).uppercased()
        if grade != "A" && grade != "B" && grade != "C"
            && grade != "D" && grade != "F" {
            print("Error: Enter A, B, C, D, or F.")
            return
        }
        var found = false
        for student in students {
            if student.grade == grade {
                showStudent(student)
                print()
                found = true
            }
        }
        if !found {
            print("No students found for grade \(grade).")
        }
    }

    //Filter Passing or Failing
    func filterPassFail(passing: Bool) {
        var found = false
        if passing {
            print("\n--- Passing Students ---")
        } else {
            print("\n--- Failing Students ---")
        }
        for student in students {
            if let average = student.average {
                if passing && average >= 50 {
                    showStudent(student)
                    print()
                    found = true
                } else if !passing && average < 50 {
                    showStudent(student)
                    print()
                    found = true
                }
            }
        }
        if !found {
            print("No matching students.")
        }
    }

    // Sort by Name
    func sortByName() {
        var sortedStudents = students
        // nested-loop sorting
        if sortedStudents.count > 1 {
            for i in 0..<(sortedStudents.count - 1) {
                for j in (i + 1)..<sortedStudents.count {
                    if sortedStudents[i].name.lowercased()
                        > sortedStudents[j].name.lowercased() {
                        let temp = sortedStudents[i]
                        sortedStudents[i] = sortedStudents[j]
                        sortedStudents[j] = temp
                    }
                }
            }
        }
        print("\n--- Sorted by Name (A-Z) ---")
        if sortedStudents.count == 0 {
            print("No students yet.")
        } else {
            for student in sortedStudents {
                showStudent(student)
                print()
            }
        }
    }
    //Sort by Average
    func sortByAverage() {
        var sortedStudents = students
        if sortedStudents.count > 1 {
            for i in 0..<(sortedStudents.count - 1) {
                for j in (i + 1)..<sortedStudents.count {
                    let first = sortedStudents[i].average
                    let second = sortedStudents[j].average
                    var shouldSwap = false
                    if let firstAverage = first {
                        if let secondAverage = second {
                            if firstAverage < secondAverage {
                                shouldSwap = true
                            }
                        }
                    } else if second != nil {
                        // Students with no scores go last
                        shouldSwap = true
                    }
                    if shouldSwap {
                        let temp = sortedStudents[i]
                        sortedStudents[i] = sortedStudents[j]
                        sortedStudents[j] = temp
                    }
                }
            }
        }
        print("\n--- Sorted by Average (High-Low) ---")
        if sortedStudents.count == 0 {
            print("No students yet.")
        } else {
            for student in sortedStudents {
                showStudent(student)
                print()
            }
        }
    }
    //Filter and Sort Menu
    func filterAndSort() {
        var backToMenu = false
        while !backToMenu {
            print("""
            --- Filter & Sort ---
            1. Filter by grade
            2. Show passing students
            3. Show failing students
            4. Sort by name (A-Z)
            5. Sort by average (high-low)
            0. Back to main menu
            """)
            print("Choose an option: ", terminator: "")

            guard let choice = readLine() else {
                return
            }

            switch choice {
            case "1": filterByGrade()
            case "2": filterPassFail(passing: true)
            case "3": filterPassFail(passing: false)
            case "4": sortByName()
            case "5": sortByAverage()
            case "0": backToMenu = true
            default: print("Invalid option.")
            }
        }
    }

    //Main Menu
    func runAcademicManager() {
        var running = true
        while running {
            print("""
            ===== ACADEMIC MANAGER =====
            1. Add student
            2. View all students
            3. Search student
            4. Update student
            5. Delete student
            6. Add score
            7. Class report
            8. Filter & sort
            0. Exit
            """)
            print("Choose an option: ", terminator: "")

            guard let choice = readLine() else {
                print("\nGoodbye!")
                break
            }
            switch choice {
            case "1": addStudent()
            case "2": viewStudents()
            case "3": searchStudent()
            case "4": updateStudent()
            case "5": deleteStudent()
            case "6": addScore()
            case "7": classReport()
            case "8": filterAndSort()
            case "0": print("Goodbye!")
                running = false
            default:
                print("Invalid option.")
            }
        }
    }
    runAcademicManager()
}
