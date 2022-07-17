//
//  EmployeeViewModel.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/12/22.
//

import Foundation
import UIKit
class EmployeeViewModel {
    var employees = [Employee]()
    var refreshPrompt: [String]? = ["Check connection", "When connected to refrsh button"]
    var isLoading: Bool = false
    
    func getEmployees(urlString: String, _ completed: @escaping () -> Void) {
        NetworkManager.shared.getData(urlString: urlString) { [weak self] data in
            let jsonDecoder = JSONDecoder()
            do {
                let json = try jsonDecoder.decode(EmployeeModel.self, from: data)
                self?.employees = json.employees
                completed()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
}
