//
// CollectionsViewController.swift
// ESPMReminders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 06/12/18
//

import Foundation
import SAPFiori
import SAPOData

protocol EntityUpdaterDelegate {
    func entityHasChanged(_ entity: EntityValue?)
}

protocol EntitySetUpdaterDelegate {
    func entitySetHasChanged()
}

class CollectionsViewController: FUIFormTableViewController {
    private var collections = CollectionType.all

    // Variable to store the selected index path
    private var selectedIndex: IndexPath?

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")

    var isPresentedInSplitView: Bool {
        return !(self.splitViewController?.isCollapsed ?? true)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)

        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeSelection()
    }

    override func viewWillTransition(to _: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            let isNotInSplitView = !self.isPresentedInSplitView
            self.tableView.visibleCells.forEach { cell in
                // To refresh the disclosure indicator of each cell
                cell.accessoryType = isNotInSplitView ? .disclosureIndicator : .none
            }
            self.makeSelection()
        })
    }

    // MARK: - UITableViewDelegate

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.collections.count
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = self.collections[indexPath.row].rawValue
        cell.accessoryType = !self.isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        self.collectionSelected(at: indexPath)
    }

    // CollectionType selection helper

    private func collectionSelected(at: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard
        var masterViewController: UIViewController!
        switch self.collections[at.row] {
        case .stock:
            let stockStoryBoard = UIStoryboard(name: "Stock", bundle: nil)
            masterViewController = stockStoryBoard.instantiateViewController(withIdentifier: "StockMaster")
            (masterViewController as! StockMasterViewController).entitySetName = "Stock"
            func fetchStock(_ completionHandler: @escaping ([Stock]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.espmContainer!.fetchStock(matching: query) { stock, error in
                        if error == nil {
                            completionHandler(stock, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! StockMasterViewController).loadEntitiesBlock = fetchStock
            masterViewController.navigationItem.title = "Stock"
        case .salesOrderItems:
            let salesOrderItemStoryBoard = UIStoryboard(name: "SalesOrderItem", bundle: nil)
            masterViewController = salesOrderItemStoryBoard.instantiateViewController(withIdentifier: "SalesOrderItemMaster")
            (masterViewController as! SalesOrderItemMasterViewController).entitySetName = "SalesOrderItems"
            func fetchSalesOrderItems(_ completionHandler: @escaping ([SalesOrderItem]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.espmContainer!.fetchSalesOrderItems(matching: query) { salesOrderItems, error in
                        if error == nil {
                            completionHandler(salesOrderItems, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! SalesOrderItemMasterViewController).loadEntitiesBlock = fetchSalesOrderItems
            masterViewController.navigationItem.title = "SalesOrderItem"
        case .suppliers:
            let supplierStoryBoard = UIStoryboard(name: "Supplier", bundle: nil)
            masterViewController = supplierStoryBoard.instantiateViewController(withIdentifier: "SupplierMaster")
            (masterViewController as! SupplierMasterViewController).entitySetName = "Suppliers"
            func fetchSuppliers(_ completionHandler: @escaping ([Supplier]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.espmContainer!.fetchSuppliers(matching: query) { suppliers, error in
                        if error == nil {
                            completionHandler(suppliers, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! SupplierMasterViewController).loadEntitiesBlock = fetchSuppliers
            masterViewController.navigationItem.title = "Supplier"
        case .productCategories:
            let productCategoryStoryBoard = UIStoryboard(name: "ProductCategory", bundle: nil)
            masterViewController = productCategoryStoryBoard.instantiateViewController(withIdentifier: "ProductCategoryMaster")
            (masterViewController as! ProductCategoryMasterViewController).entitySetName = "ProductCategories"
            func fetchProductCategories(_ completionHandler: @escaping ([ProductCategory]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.espmContainer!.fetchProductCategories(matching: query) { productCategories, error in
                        if error == nil {
                            completionHandler(productCategories, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! ProductCategoryMasterViewController).loadEntitiesBlock = fetchProductCategories
            masterViewController.navigationItem.title = "ProductCategory"
        case .products:
            let productStoryBoard = UIStoryboard(name: "Product", bundle: nil)
            masterViewController = productStoryBoard.instantiateViewController(withIdentifier: "ProductMaster")
            (masterViewController as! ProductMasterViewController).entitySetName = "Products"
            func fetchProducts(_ completionHandler: @escaping ([Product]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.espmContainer!.fetchProducts(matching: query) { products, error in
                        if error == nil {
                            completionHandler(products, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! ProductMasterViewController).loadEntitiesBlock = fetchProducts
            masterViewController.navigationItem.title = "Product"
        case .purchaseOrderHeaders:
            let purchaseOrderHeaderStoryBoard = UIStoryboard(name: "PurchaseOrderHeader", bundle: nil)
            masterViewController = purchaseOrderHeaderStoryBoard.instantiateViewController(withIdentifier: "PurchaseOrderHeaderMaster")
            (masterViewController as! PurchaseOrderHeaderMasterViewController).entitySetName = "PurchaseOrderHeaders"
            func fetchPurchaseOrderHeaders(_ completionHandler: @escaping ([PurchaseOrderHeader]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.espmContainer!.fetchPurchaseOrderHeaders(matching: query) { purchaseOrderHeaders, error in
                        if error == nil {
                            completionHandler(purchaseOrderHeaders, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! PurchaseOrderHeaderMasterViewController).loadEntitiesBlock = fetchPurchaseOrderHeaders
            masterViewController.navigationItem.title = "PurchaseOrderHeader"
        case .purchaseOrderItems:
            let purchaseOrderItemStoryBoard = UIStoryboard(name: "PurchaseOrderItem", bundle: nil)
            masterViewController = purchaseOrderItemStoryBoard.instantiateViewController(withIdentifier: "PurchaseOrderItemMaster")
            (masterViewController as! PurchaseOrderItemMasterViewController).entitySetName = "PurchaseOrderItems"
            func fetchPurchaseOrderItems(_ completionHandler: @escaping ([PurchaseOrderItem]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.espmContainer!.fetchPurchaseOrderItems(matching: query) { purchaseOrderItems, error in
                        if error == nil {
                            completionHandler(purchaseOrderItems, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! PurchaseOrderItemMasterViewController).loadEntitiesBlock = fetchPurchaseOrderItems
            masterViewController.navigationItem.title = "PurchaseOrderItem"
        case .salesOrderHeaders:
            let salesOrderHeaderStoryBoard = UIStoryboard(name: "SalesOrderHeader", bundle: nil)
            masterViewController = salesOrderHeaderStoryBoard.instantiateViewController(withIdentifier: "SalesOrderHeaderMaster")
            (masterViewController as! SalesOrderHeaderMasterViewController).entitySetName = "SalesOrderHeaders"
            func fetchSalesOrderHeaders(_ completionHandler: @escaping ([SalesOrderHeader]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.espmContainer!.fetchSalesOrderHeaders(matching: query) { salesOrderHeaders, error in
                        if error == nil {
                            completionHandler(salesOrderHeaders, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! SalesOrderHeaderMasterViewController).loadEntitiesBlock = fetchSalesOrderHeaders
            masterViewController.navigationItem.title = "SalesOrderHeader"
        case .productTexts:
            let productTextStoryBoard = UIStoryboard(name: "ProductText", bundle: nil)
            masterViewController = productTextStoryBoard.instantiateViewController(withIdentifier: "ProductTextMaster")
            (masterViewController as! ProductTextMasterViewController).entitySetName = "ProductTexts"
            func fetchProductTexts(_ completionHandler: @escaping ([ProductText]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.espmContainer!.fetchProductTexts(matching: query) { productTexts, error in
                        if error == nil {
                            completionHandler(productTexts, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! ProductTextMasterViewController).loadEntitiesBlock = fetchProductTexts
            masterViewController.navigationItem.title = "ProductText"
        case .customers:
            let customerStoryBoard = UIStoryboard(name: "Customer", bundle: nil)
            masterViewController = customerStoryBoard.instantiateViewController(withIdentifier: "CustomerMaster")
            (masterViewController as! CustomerMasterViewController).entitySetName = "Customers"
            func fetchCustomers(_ completionHandler: @escaping ([Customer]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.espmContainer!.fetchCustomers(matching: query) { customers, error in
                        if error == nil {
                            completionHandler(customers, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! CustomerMasterViewController).loadEntitiesBlock = fetchCustomers
            masterViewController.navigationItem.title = "Customer"
        case .none:
            masterViewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }

    // MARK: - Handle highlighting of selected cell

    private func makeSelection() {
        if let selectedIndex = selectedIndex {
            self.tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            self.tableView.scrollToRow(at: selectedIndex, at: .none, animated: true)
        } else {
            self.selectDefault()
        }
    }

    private func selectDefault() {
        // Automatically select first element if we have two panels (iPhone plus and iPad only)
        if self.splitViewController!.isCollapsed || self.appDelegate.espmContainer == nil {
            return
        }
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        self.collectionSelected(at: indexPath)
    }
}
