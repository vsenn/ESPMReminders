//
// CollectionType.swift
// ESPMReminders
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 06/12/18
//

import Foundation

enum CollectionType: String {
    case stock = "Stock"
    case salesOrderItems = "SalesOrderItems"
    case suppliers = "Suppliers"
    case productCategories = "ProductCategories"
    case products = "Products"
    case purchaseOrderHeaders = "PurchaseOrderHeaders"
    case purchaseOrderItems = "PurchaseOrderItems"
    case salesOrderHeaders = "SalesOrderHeaders"
    case productTexts = "ProductTexts"
    case customers = "Customers"
    case none = ""

    static let all = [
        stock, salesOrderItems, suppliers, productCategories, products, purchaseOrderHeaders, purchaseOrderItems, salesOrderHeaders, productTexts, customers,
    ]
}
