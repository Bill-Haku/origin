//
//  main.swift
//  Student
//
//  Created by HakuBill on 2020/11/19.
//

import Foundation

class Human {
    var gender: Int
    var age: Int
    var name: String
    init(name: String, gender: Int, age: Int) {
        self.name = name
        self.age = age
        self.gender = gender
    }
}

class student: Human {
    var college: String
    var school: String
    var grade: Int
    var classnum: Int
    private var stunum: Int
    init(college: String, school: String, grade: Int, classnum: Int, stunum: Int) {
        super.init(name: name, gender: gender, age: age)
        self.college = college
        self.school = school
        self.grade = grade
        self.classnum = classnum
        self.stunum = stunum
    }
}

let hum = Human(name: "Bill", gender: 1, age: 18)
let stu = student(college: "UESTC", school: "SISE", grade: 1, classnum: 20, stunum: 1)
stu.gender = 0
stu.age = 18
stu.name = "Haku"

print("Hello, World!")

