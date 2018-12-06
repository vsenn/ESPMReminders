//
//  CustomerViewController.swift
//  ESPMReminders
//
//  Created by Валерий Семичев on 06/12/2018.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation
import SAPFoundation
import SAPOData
import SAPFiori
import SAPCommon

class CustomerViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var myServiceClass: ESPMContainer<OnlineODataProvider> {
        return self.appDelegate.espmContainer
    }
    
    private var entities: [Customer] = [Customer]( )
    private let logger = Logger.shared(named: "CustomerViewControllerLogger")
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var loadingIndicator: FUILoadingIndicatorView?
    
    private var activities = [FUIActivityItem.phone, FUIActivityItem.email, FUIActivityItem.detail]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 98
        self.updateTable()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.entities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! FUIContactCell
        
        let customer = self.entities[indexPath.row]
        
        cell.headlineText = "\(customer.firstName!) \(customer.lastName!)"
        cell.subheadlineText = "\(customer.city!), \(customer.country!)"
        
        cell.descriptionText = customer.phoneNumber
        cell.splitPercent = CGFloat(0.3) // Default is 30%
        
        cell.activityControl.addActivities(activities)
        cell.activityControl.maxVisibleItems = 4
        cell.onActivitySelectedHandler = { activityItem in
            switch activityItem {
            case FUIActivityItem.phone:
                guard let number = URL(string: "tel://" + customer.phoneNumber!) else { return }
                if UIApplication.shared.canOpenURL(number) {
                    UIApplication.shared.open(number)
                }
            case FUIActivityItem.message:
                guard let sms = URL(string: "sms:" + customer.phoneNumber!) else { return }
                if UIApplication.shared.canOpenURL(sms) {
                    UIApplication.shared.open(sms)
                }
            case FUIActivityItem.detail:
                // self.createReminder(customer: customer)
                break
            default:
                break
            }
        }
        cell.detailImage = #imageLiteral(resourceName: "PersonPlaceholder")

        
        return cell
    }

    // MARK: - Data accessing
    
    func requestEntities(completionHandler: @escaping (Error?) -> Void) {
        // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
        let query = DataQuery().selectAll().top(20)
        self.myServiceClass.fetchCustomers(matching: query) { customers, error in
            guard let customers = customers else {
                completionHandler(error!)
                return
            }
            self.entities = customers
            completionHandler(nil)
        }
    }
    
    // MARK: - Table update
    
    func updateTable() {
        self.showFioriLoadingIndicator()
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                self.hideFioriLoadingIndicator()
            }
        })
    }
    
    private func loadData(completionHandler: @escaping () -> Void) {
        self.requestEntities { error in
            defer {
                completionHandler()
            }
            if let error = error {
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorLoadingData", value: "Loading data failed!", comment: "XTIT: Title of loading data error pop up."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                self.logger.error("Could not update table. Error: \(error)", error: error)
                return
            }
            OperationQueue.main.addOperation({
                self.tableView.reloadData()
                self.logger.info("Table updated successfully!")
            })
        }
    }
    
    @objc func refresh() {
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                OperationQueue.main.addOperation({
                    self.refreshControl?.endRefreshing()
                })
            }
        })
    }


}
