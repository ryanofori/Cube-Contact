//
//  ViewController.swift
//  Cube Contact
//
//  Created by Ryan Ofori on 7/11/22.
//

import UIKit

class EmployeeVC: UIViewController {
    
    @IBOutlet weak var refreshButton: UIBarButtonItem?
    @IBOutlet weak var employeeTableView: UITableView?
    
    private var employeeViewModel = EmployeeViewModel()
    
    var activityView = UIActivityIndicatorView()
    
    var imageLoader = ImageLoader()
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        getEmployeeWithSpinner()
        //        employeeViewModel.getEmployees(urlString: URLBuilder.employees.rawValue) {
        //            DispatchQueue.main.async {
        //                self.employeeViewModel.refreshPrompt = nil
        //                self.employeeTableView?.reloadData()
        //                self.view.activityStopAnimating()
        //                //                self.spinnerView.activityStopAnimating()
        //                //                self.view.activityStopAnimating()
        //            }
        //        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        
        self.view.activityStartAnimating()
        getEmployeeWithSpinner()
        //        employeeViewModel.getEmployees(urlString: URLBuilder.employees.rawValue) {
        //            defer { DispatchQueue.main.async {self.view.activityStopAnimating() }}
        //            DispatchQueue.main.async {
        //                self.employeeViewModel.refreshPrompt = nil
        //                self.employeeTableView?.reloadData()
        //                self.showSpinner(false)
        //
        //            }
        //        }
        //        employeeViewModel.getEmployees1(urlString: "") { result in
        //            switch result {
        //            case .success(
        //                    self.employeeTableView?.reloadData()
        //                    self.showSpinner(false)
        //                )
        //            case .failure(self.view.activityStopAnimating())
        //            }
        //        }
    }
    
    func showSpinner(_ showSpinner: Bool) {
        if showSpinner {
            return view.activityStartAnimating()
        } else {
            return view.activityStopAnimating()
        }
    }
    
    func initTableView() {
        employeeTableView?.delegate = self
        employeeTableView?.dataSource = self
    }
    
    func getEmployeeWithSpinner() {
        NetworkManager.shared.getData(urlString: URLBuilder.employees.rawValue) { data in
            
            let jsonDecoder = JSONDecoder()
            do {
                let json = try jsonDecoder.decode(EmployeeModel.self, from: data)
                self.employeeViewModel.employees = json.employees
                self.employeeViewModel.refreshPrompt = nil
                DispatchQueue.main.async {
                    self.employeeTableView?.reloadData()
                    self.view.activityStopAnimating()
                }
            } catch {
                DispatchQueue.main.async {
                    self.view.activityStopAnimating()
                }
                print(error.localizedDescription)
            }
        }
    }
    
    
//    func showSpinner() {
//        DispatchQueue.main.async {
//            self.activityView.style = .large
//            self.activityView.center = self.view.center
//            self.view.addSubview(self.activityView)
//            self.activityView.startAnimating()
//        }
//        
//    }
//    func hideSpinner() {
//        DispatchQueue.main.async {
//            self.activityView.stopAnimating()
//        }
//    }
}

extension EmployeeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if employeeViewModel.refreshPrompt == nil {
            return employeeViewModel.employees.count
        } else {
            return employeeViewModel.refreshPrompt?.count ?? 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = employeeTableView?.dequeueReusableCell(withIdentifier: String(describing: EmployeeCell.self)) as? EmployeeCell else { return UITableViewCell() }
        if employeeViewModel.refreshPrompt != nil {
            cell.fullNameText?.text = employeeViewModel.refreshPrompt?[indexPath.row]
            cell.teamText?.text = ""
            cell.photoImage?.image = UIImage()
        } else {
            cell.fullNameText?.text = employeeViewModel.employees[indexPath.row].fullName
            cell.teamText?.text = employeeViewModel.employees[indexPath.row].team
            cell.photoImage?.image = employeeViewModel.employees[indexPath.row].photoURLSmall?.toImage
        }
        return cell
    }
}

extension EmployeeVC: UITableViewDelegate {
    
}
