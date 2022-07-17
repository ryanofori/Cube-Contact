//
//  EmployeeVCTests.swift
//  Cube ContactTests
//
//  Created by Ryan Ofori on 7/15/22.
//

import XCTest
@testable import Cube_Contact
class EmployeeVCTests: XCTestCase {
    
    var systemUnderTest: EmployeeVC!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        systemUnderTest = storyboard.instantiateViewController(withIdentifier: "EmployeeVC") as? EmployeeVC
        systemUnderTest.loadViewIfNeeded()
    }
    
    func testRefreshButton() throws {
        let refreshButton: UIBarButtonItem = systemUnderTest.refreshButton ?? UIBarButtonItem()
        XCTAssertNotNil(refreshButton, "View Controller doesn't have bar button item properly connected")
        let refreshButtonAction = refreshButton.action
        XCTAssertTrue(refreshButton.isEnabled)
    }
    
    func testTableViewCell() {
    }
    
    
    //    func testTableViewHasDataSource() {
    //        XCTAssertNotNil(systemUnderTest.employeeTableView?.dataSource)
    //    }
    //    func testTableViewHasDelegeate() {
    //        XCTAssertNotNil(systemUnderTest.employeeTableView?.delegate)
    //    }
    
    override  func tearDown() {
        systemUnderTest = nil
    }
    
}
