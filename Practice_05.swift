//
//  Practice_05.swift
//  practice_swift
//
//  Created by shuni on 28/9/26.
//

import Foundation

func runPractice05(){
    func average(of scores: [Int]) -> Double{
        let total = scores.reduce(0, +)
        return Double(total)/Double(scores.count)
    }
    
    func letterGrade(for average: Double) -> String{
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
    
    func printReport (_ name: String, scores: [Int]){
        let avg = average(of: scores)
        let grade = letterGrade(for: avg)
        print("\(name): average \(avg), grade \(grade)")
    }
    printReport("Dara", scores: [80, 90, 85])
    printReport("Sok", scores: [60, 70, 65])
    
    print("=========================")
    
    let scores = [72, 45, 90, 61, 38, 85]
    
    let passing = scores.filter{$0 >= 50}
    print("Passing: \(passing)")
    
    //add 5 bonus point
    let bonusScores = scores.map{$0 + 5}
    print("Add 5 bonus points to every score: \(bonusScores)")
    
    //Sort from highest to lowest
    let sortedScores = scores.sorted { $0 > $1 }
    print("Sort Highest first: \(sortedScores)")

    // Store a passing rule using full closure syntax
    let isPassing: (Int) -> Bool = { (score: Int) -> Bool in
        return score >= 50
    }

    // Count the passing scores using the rule
    let passingCount = scores.filter(isPassing).count
    print("Passing count: \(passingCount)")
}
