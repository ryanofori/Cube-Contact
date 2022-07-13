//
//  EmployeeParse.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/11/22.
//

import Foundation
struct EmployeeModel: Codable {
    var employees: [Employee]
}
struct Employee: Codable {
    var uuid: String
    var fullName: String
    var phoneNumber: String?
    var emailAddress: String
    var biography: String?
    var photoURLSmall: String?
    var photoURLLarge: String?
    var team: String
    var employeeType: EmployeeType
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case biography
        case photoURLSmall = "photo_url_small"
        case photoURLLarge = "photo_url_large"
        case team
        case employeeType = "employee_type"
    }
}

enum EmployeeType: String, Codable {
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
    case contractor = "CONTRACTOR"
}
