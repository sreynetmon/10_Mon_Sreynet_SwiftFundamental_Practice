//
//  Practice_06.swift
//  practice_swift
//
//  Created by shuni on 28/9/26.
//

import Foundation

struct Student{
    let id: Int
    var name: String
    var gpa: Double
    func summary() -> String{
        return "\(id) - \(name) (GPA \(gpa))"
    }
    mutating func updateGPA(to newGPA:Double){
        gpa = newGPA
    }
}
func runPracticeStruct() {
    let original = Student(id: 1001, name: "Dara", gpa: 3.75)
    var copy = original

    copy.updateGPA(to: 3.90)

    print("Original: \(original.summary())")
    print("Copy: \(copy.summary())")
}



class Person{
    var name: String
    
    init(name: String) {
        self.name = name
    }
    func introduce() -> String{
        return "Hi, I'm \(name)."
    }
}

class Teacher: Person{
    var subject: String
    
    init (name:String, subject:String){
        self.subject = subject
        super.init(name: name)
    }
    override func introduce() -> String {
        return "Hi, I'm \(name) and I teach \(subject)."
    }
}

func runPracticeClass(){
    //create teacher
    let teacherA = Teacher(name: "Sophea", subject: "swift")
    //share the same teacher instance
    let teacherB = teacherA
    //change name
    teacherB.name = "Ms.Sophea"

    print(teacherA.introduce())
    print(teacherB.introduce())

}
