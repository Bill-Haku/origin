//
//  main.swift
//  Student
//
//  iOS Training Program Task 2
//  Created by HakuBill on 2020/11/19.
//

import Foundation

class Human {
    var gender: String = "Female"
    var age: Int = 19
    var name: String = "Haku"
    func printHuman() {
        print("Human: \(hum.name)\nAge: \(hum.age)\nGender: \(hum.gender)\n")
    }
}

class student: Human {
    var college: String = "UESTC"
    var school: String = "SISE"
    var grade: Int = 1
    var classnum: Int = 20
    private var stunum: Int = 1
    func printStu() {
        print("Student: \(stu.name)\nAge: \(stu.age)\nGender: \(stu.gender)\nStudent number: \(stu.stunum)\nCollege: \(stu.college)\nSchool: \(stu.school)\nGrade: \(stu.grade)\nClass: \(stu.classnum)\n")
    }
}

let hum = Human()
let stu = student()
stu.gender = "Male"
stu.age = 18
stu.name = "Haku"

hum.printHuman()
stu.printStu()
