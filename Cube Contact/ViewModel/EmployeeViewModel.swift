//
//  EmployeeViewModel.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/12/22.
//

import Foundation
class EmployeeViewModel {
    var employees = [Employee]()
    var pullToRefreshTxt = ["Please pull to refresh"]
    
    func getEmployees(urlString: String, _ completed: @escaping () -> Void) {
        NetworkManager.shared.getData(urlString: urlString) { data in
            let jsonDecoder = JSONDecoder()
            do {
                let json = try jsonDecoder.decode(EmployeeModel.self, from: data)
                print(type(of: json))
//                print(json.employees[0].biography)
                self.employees = json.employees
                completed()
            } catch {
//                NSLog(error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
    
    
}
