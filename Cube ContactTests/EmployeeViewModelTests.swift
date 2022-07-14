//
//  Cube_ContactTests.swift
//  Cube ContactTests
//
//  Created by Ryan Ofori on 7/11/22.
//

import XCTest
@testable import Cube_Contact

class EmployeeViewModelTests: XCTestCase {
    
    var employeeViewModel = EmployeeViewModel()
    
    var systemUnderTest: EmployeeModel!
    
    override func setUpWithError() throws {
        let data = try getData(fromJSON: "Employees")
        systemUnderTest = try JSONDecoder().decode(EmployeeModel.self, from: data)
    }
    
    func testShowJSON() throws -> Void {
        
        let firstEmplyee = systemUnderTest.employees.first
        XCTAssertEqual(firstEmplyee?.fullName, "Justine Mason")
        XCTAssertEqual(firstEmplyee?.team, "Point of Sale")
        let firstImage = "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg"
        XCTAssertEqual(firstEmplyee?.photoURLSmall, firstImage)
        
//        let bundle = Bundle(for: type(of: self))
//
//        guard let employeePath = bundle.path(forResource: "Employees", ofType: "json") else {
//            XCTFail("Missing file: Employees.json")
//            return
//        }
//        print(employeePath.)
//        print(type(of: employeePath))
        
//        guard let jsonData = employeePath.data(using: .utf8) else { return print("no data") }
        
//        do {
//            let json = try JSONDecoder().decode(EmployeeModel.self, from: jsonData)
//        } catch {
////                NSLog(error.localizedDescription)
//            print(error.localizedDescription)
//        }

//        guard let jsonData = readLocalFile(forName: "Employees") else {return print("Do data here")}
//        print("before")
//        let employeeData2 = try JSONDecoder().decode(EmployeeModel.self, from: jsonData)
//        print("catter")
//        print(employeeData2.employees[0].fullName)
//        XCTAssertEqual(employeeData2.employees[0].fullName, "Jsdohn")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }
    
    func localFileToData(filename name: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        do {
            if let bundlePath = bundle.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                    return jsonData
                }
        } catch {
            print(error.localizedDescription)
            print("Cannot find filename \(name)")
        }
        return nil
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func getData(fromJSON fileName: String) throws -> Data {
      let bundle = Bundle(for: type(of: self))
      guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
        XCTFail("Missing File: \(fileName).json")
//        throw Error.fileNotFound
          return Data()
      }
      do {
        let data = try Data(contentsOf: url)
        return data
      } catch {
        throw error
      }
    }
    override func tearDownWithError() throws {
        systemUnderTest = nil
        super.tearDown()
    }

}
