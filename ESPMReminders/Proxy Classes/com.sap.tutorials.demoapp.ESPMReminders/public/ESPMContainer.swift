// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

open class ESPMContainer<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = ESPMContainerMetadata.document
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCustomers")
    open func customers(query: DataQuery = DataQuery()) throws -> Array<Customer> {
        return try self.fetchCustomers(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchCustomers")
    open func customers(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Customer>?, Error?) -> Void) {
        self.fetchCustomers(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    open func fetchCustomer(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Customer {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<Customer>.from(self.executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.customers), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchCustomer(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Customer?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Customer = try self.fetchCustomer(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchCustomers(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<Customer> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try Customer.array(from: self.executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.customers), headers: var_headers, options: var_options).entityList())
    }

    open func fetchCustomers(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<Customer>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<Customer> = try self.fetchCustomers(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProduct(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Product {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<Product>.from(self.executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.products), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchProduct(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Product?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Product = try self.fetchProduct(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductCategories(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<ProductCategory> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try ProductCategory.array(from: self.executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.productCategories), headers: var_headers, options: var_options).entityList())
    }

    open func fetchProductCategories(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<ProductCategory>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<ProductCategory> = try self.fetchProductCategories(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductCategory(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProductCategory {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<ProductCategory>.from(self.executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.productCategories), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchProductCategory(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (ProductCategory?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: ProductCategory = try self.fetchProductCategory(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductText(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ProductText {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<ProductText>.from(self.executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.productTexts), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchProductText(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (ProductText?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: ProductText = try self.fetchProductText(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProductTexts(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<ProductText> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try ProductText.array(from: self.executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.productTexts), headers: var_headers, options: var_options).entityList())
    }

    open func fetchProductTexts(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<ProductText>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<ProductText> = try self.fetchProductTexts(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchProducts(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<Product> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try Product.array(from: self.executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.products), headers: var_headers, options: var_options).entityList())
    }

    open func fetchProducts(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<Product>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<Product> = try self.fetchProducts(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderHeader {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<PurchaseOrderHeader>.from(self.executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.purchaseOrderHeaders), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchPurchaseOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (PurchaseOrderHeader?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: PurchaseOrderHeader = try self.fetchPurchaseOrderHeader(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderHeaders(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<PurchaseOrderHeader> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try PurchaseOrderHeader.array(from: self.executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.purchaseOrderHeaders), headers: var_headers, options: var_options).entityList())
    }

    open func fetchPurchaseOrderHeaders(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<PurchaseOrderHeader>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<PurchaseOrderHeader> = try self.fetchPurchaseOrderHeaders(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PurchaseOrderItem {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<PurchaseOrderItem>.from(self.executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.purchaseOrderItems), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchPurchaseOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (PurchaseOrderItem?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: PurchaseOrderItem = try self.fetchPurchaseOrderItem(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPurchaseOrderItems(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<PurchaseOrderItem> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try PurchaseOrderItem.array(from: self.executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.purchaseOrderItems), headers: var_headers, options: var_options).entityList())
    }

    open func fetchPurchaseOrderItems(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<PurchaseOrderItem>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<PurchaseOrderItem> = try self.fetchPurchaseOrderItems(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SalesOrderHeader {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<SalesOrderHeader>.from(self.executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.salesOrderHeaders), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchSalesOrderHeader(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (SalesOrderHeader?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: SalesOrderHeader = try self.fetchSalesOrderHeader(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderHeaders(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<SalesOrderHeader> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try SalesOrderHeader.array(from: self.executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.salesOrderHeaders), headers: var_headers, options: var_options).entityList())
    }

    open func fetchSalesOrderHeaders(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<SalesOrderHeader>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<SalesOrderHeader> = try self.fetchSalesOrderHeaders(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SalesOrderItem {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<SalesOrderItem>.from(self.executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.salesOrderItems), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchSalesOrderItem(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (SalesOrderItem?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: SalesOrderItem = try self.fetchSalesOrderItem(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSalesOrderItems(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<SalesOrderItem> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try SalesOrderItem.array(from: self.executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.salesOrderItems), headers: var_headers, options: var_options).entityList())
    }

    open func fetchSalesOrderItems(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<SalesOrderItem>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<SalesOrderItem> = try self.fetchSalesOrderItems(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchStock(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<Stock> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try Stock.array(from: self.executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.stock), headers: var_headers, options: var_options).entityList())
    }

    open func fetchStock(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<Stock>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<Stock> = try self.fetchStock(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchStock1(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Stock {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<Stock>.from(self.executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.stock), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchStock1(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Stock?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Stock = try self.fetchStock1(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSupplier(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Supplier {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<Supplier>.from(self.executeQuery(query.fromDefault(ESPMContainerMetadata.EntitySets.suppliers), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchSupplier(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Supplier?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Supplier = try self.fetchSupplier(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSuppliers(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<Supplier> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try Supplier.array(from: self.executeQuery(var_query.fromDefault(ESPMContainerMetadata.EntitySets.suppliers), headers: var_headers, options: var_options).entityList())
    }

    open func fetchSuppliers(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<Supplier>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<Supplier> = try self.fetchSuppliers(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func generateSamplePurcharOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try BooleanValue.unwrap(self.executeQuery(var_query.invoke(ESPMContainerMetadata.ActionImports.generateSamplePurcharOrders, ParameterList.empty), headers: var_headers, options: var_options).result)
    }

    open func generateSamplePurcharOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Bool?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Bool = try self.generateSamplePurcharOrders(query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func generateSampleSalesOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try BooleanValue.unwrap(self.executeQuery(var_query.invoke(ESPMContainerMetadata.ActionImports.generateSampleSalesOrders, ParameterList.empty), headers: var_headers, options: var_options).result)
    }

    open func generateSampleSalesOrders(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Bool?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Bool = try self.generateSampleSalesOrders(query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductCategories")
    open func productCategories(query: DataQuery = DataQuery()) throws -> Array<ProductCategory> {
        return try self.fetchProductCategories(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductCategories")
    open func productCategories(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ProductCategory>?, Error?) -> Void) {
        self.fetchProductCategories(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductTexts")
    open func productTexts(query: DataQuery = DataQuery()) throws -> Array<ProductText> {
        return try self.fetchProductTexts(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProductTexts")
    open func productTexts(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ProductText>?, Error?) -> Void) {
        self.fetchProductTexts(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProducts")
    open func products(query: DataQuery = DataQuery()) throws -> Array<Product> {
        return try self.fetchProducts(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchProducts")
    open func products(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Product>?, Error?) -> Void) {
        self.fetchProducts(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrderHeaders")
    open func purchaseOrderHeaders(query: DataQuery = DataQuery()) throws -> Array<PurchaseOrderHeader> {
        return try self.fetchPurchaseOrderHeaders(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrderHeaders")
    open func purchaseOrderHeaders(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<PurchaseOrderHeader>?, Error?) -> Void) {
        self.fetchPurchaseOrderHeaders(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrderItems")
    open func purchaseOrderItems(query: DataQuery = DataQuery()) throws -> Array<PurchaseOrderItem> {
        return try self.fetchPurchaseOrderItems(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchPurchaseOrderItems")
    open func purchaseOrderItems(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<PurchaseOrderItem>?, Error?) -> Void) {
        self.fetchPurchaseOrderItems(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: ESPMContainerMetadataParser.options)
            ESPMContainerMetadataChanges.merge(metadata: self.metadata)
        }
    }

    open func resetSampleData(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try BooleanValue.unwrap(self.executeQuery(var_query.invoke(ESPMContainerMetadata.ActionImports.resetSampleData, ParameterList.empty), headers: var_headers, options: var_options).result)
    }

    open func resetSampleData(query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Bool?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Bool = try self.resetSampleData(query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderHeaders")
    open func salesOrderHeaders(query: DataQuery = DataQuery()) throws -> Array<SalesOrderHeader> {
        return try self.fetchSalesOrderHeaders(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderHeaders")
    open func salesOrderHeaders(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SalesOrderHeader>?, Error?) -> Void) {
        self.fetchSalesOrderHeaders(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderItems")
    open func salesOrderItems(query: DataQuery = DataQuery()) throws -> Array<SalesOrderItem> {
        return try self.fetchSalesOrderItems(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSalesOrderItems")
    open func salesOrderItems(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SalesOrderItem>?, Error?) -> Void) {
        self.fetchSalesOrderItems(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchStock")
    open func stock(query: DataQuery = DataQuery()) throws -> Array<Stock> {
        return try self.fetchStock(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchStock")
    open func stock(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Stock>?, Error?) -> Void) {
        self.fetchStock(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSuppliers")
    open func suppliers(query: DataQuery = DataQuery()) throws -> Array<Supplier> {
        return try self.fetchSuppliers(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSuppliers")
    open func suppliers(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Supplier>?, Error?) -> Void) {
        self.fetchSuppliers(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    open func updateSalesOrderStatus(id: String, newStatus: String, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Bool {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try BooleanValue.unwrap(self.executeQuery(var_query.invoke(ESPMContainerMetadata.ActionImports.updateSalesOrderStatus, ParameterList(capacity: (2 as Int)).with(name: "id", value: StringValue.of(id)).with(name: "newStatus", value: StringValue.of(newStatus))), headers: var_headers, options: var_options).result)
    }

    open func updateSalesOrderStatus(id: String, newStatus: String, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Bool?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Bool = try self.updateSalesOrderStatus(id: id, newStatus: newStatus, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }
}
