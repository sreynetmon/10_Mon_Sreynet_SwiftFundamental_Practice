//
//  lab2.swift
//  practice_swift
//
//  Created by shuni on 28/9/26.
//

import Foundation

func runLab2(){
    struct Course{
        let code: String
        let title: String
        let capacity: Int
        var enrolledStudents: [String] = []
        
        var seatsLeft: Int {
            capacity - enrolledStudents.count
        }
    }
    enum EnrollmentError: Error{
        case alreadyEnrolled
        case courseFull
    }
    var courses = [
        Course(code: "SWE101", title: "Swift Fundamentals", capacity: 2),
        Course(code: "UX110", title: "Intro to UX", capacity: 30)
    ]
    //create enrollment request
    let requests = [
        (student: "Dara", code: "SWE101"),
        (student: "Sok", code: "SWE101"),
        (student: "Dara", code: "SWE101"),
        (student: "Bopha", code: "SWE101"),
        (student: "Rithy", code: "CS999")
    ]
    func findCourseIndex(by code: String) -> Int? {
        courses.firstIndex { $0.code == code }
    }
    for request in requests {
        // Check course exists
        guard let index = findCourseIndex(by: request.code) else {
            print("Rejected \(request.student): \(request.code) does not exist")
            continue
        }
        // Check enrollment rules
        do {
            if courses[index].enrolledStudents.contains(request.student) {
                throw EnrollmentError.alreadyEnrolled
            }
            if courses[index].enrolledStudents.count >= courses[index].capacity {
                throw EnrollmentError.courseFull
            }
            // Update the course in the array
            courses[index].enrolledStudents.append(request.student)

            print("Enrolled \(request.student) in \(courses[index].code)")

        } catch EnrollmentError.alreadyEnrolled {
            print("Skipped: \(request.student) is already enrolled")
            } catch EnrollmentError.courseFull {
                print("Rejected \(request.student): \(courses[index].code) is full")
            } catch {
                print("Unexpected error")
            }
        }

        //Print final roster and seats left for SWE101
        if let index = findCourseIndex(by: "SWE101") {
            let course = courses[index]
            let roster = course.enrolledStudents.sorted()

            print("\n\(course.title): \(roster.joined(separator: ", "))")
            print("Seats left: \(course.seatsLeft)")
        }
}
