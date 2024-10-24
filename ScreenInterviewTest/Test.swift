protocol Person {
    var firstName: String? { get  }
    var middleName: String? { get }
    var lastName: String? { get }
}

// Output:
// Andrzej
// Andrzej Sebastian Nowak
// Andrzej Nowak

// For example class Student conforms to Person.
// Describe a simple solution to get fullName (space is the separator).

extension Person {
    var fullName: String {
        return [firstName, middleName, lastName]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}
class Student: Person {
    var firstName: String?
    
    var middleName: String?
    
    var lastName: String?
    
    init(firstName: String? = nil, middleName: String? = nil, lastName: String? = nil) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
    }
}

let person1 = Student(firstName: "Andrzej", middleName: nil, lastName: nil)
print(person1.fullName)
let person2 = Student(firstName: "Andrzej", middleName: "Sebastian", lastName: "Nowak")
print(person2.fullName)
let person3 = Student(firstName: "Andrzej", middleName: nil, lastName: "Nowak")
print(person3.fullName)

