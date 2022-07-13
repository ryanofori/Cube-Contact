//
//  ViewController.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/11/22.
//

import UIKit

class EmployeeVC: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView?
    
    private var employeeViewModel = EmployeeViewModel()
    
    let pullToRefresh = UIRefreshControl()
    var activityView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        PullingToRefresh()
//        networkCall()
        showSpinner()
        employeeViewModel.getEmployees(urlString: URLBuilder.employees.rawValue) {
            DispatchQueue.main.async {
                self.employeeTableView?.reloadData()
                self.hideSpinner()
            }
        }
    }
    
    func initTableView() {
        employeeTableView?.delegate = self
        employeeTableView?.dataSource = self
    }
    
    func PullingToRefresh() {
        pullToRefresh.attributedTitle = NSAttributedString(string: "")
        pullToRefresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        employeeTableView?.addSubview(pullToRefresh)
        
    }
    @objc func refresh() {
        print("I just pulled you")
//        networkCall()
        //        employeeTableView.reloadData()
        pullToRefresh.endRefreshing()
    }
    
    func showSpinner() {
        DispatchQueue.main.async {
            self.activityView.style = .large
            self.activityView.center = self.view.center
            self.view.addSubview(self.activityView)
            self.activityView.startAnimating()
        }
        
    }
    func hideSpinner() {
        DispatchQueue.main.async {
            self.activityView.stopAnimating()
        }
        
    }
}

extension EmployeeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeViewModel.employees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = employeeTableView?.dequeueReusableCell(withIdentifier: String(describing: EmployeeCell.self)) as? EmployeeCell else { return UITableViewCell() }
        cell.nameText?.text = employeeViewModel.employees[indexPath.row].fullName
        cell.teamText?.text = employeeViewModel.employees[indexPath.row].team
        cell.photoImage?.image = employeeViewModel.employees[indexPath.row].photoURLSmall?.toImage
        return cell
    }
    
    
}

extension EmployeeVC: UITableViewDelegate {

}
