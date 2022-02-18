//
//  User.swift
//  LoginApp
//
//  Created by Даниил Смирнов on 17.02.2022.
//

import Foundation

struct User {
    let userName: String
    let password: String
    let person: Person

    static func getInfo() -> User {
        User(
            userName: "User",
            password: "Password",
            person: Person.getInfoAboutPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let dateOfBirthday: String
    let image: String
    let hobbies: [Hobby]

    var fullname: String {
        "\(name) \(surname)"
    }

    static func getInfoAboutPerson() -> Person {
        Person(
            name: "Даниил",
            surname: "Смирнов",
            age: 25,
            dateOfBirthday: "18.06.1996",
            image: "userImage",
            hobbies: [
                Hobby.walk,
                Hobby.study,
                Hobby.sleep,
                Hobby.eat
            ])
    }
}

enum Hobby: String {
    case study = "Учиться разработке на swift"
    case eat = "Вкусно кушать"
    case sleep = "Спатеньки люблю"
    case walk = "Гулять с песелем"
}
