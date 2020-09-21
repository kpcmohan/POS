
import Foundation

// MARK: - FetchAllData
struct FetchAllData : Codable{
    var status: String?
    var data: AllData?
}

// MARK: - AllData
struct AllData : Codable{
    var banners: [Banner]?
    var categories: [Category]?
    var fresh_products: [FreshProduct]?
}

// MARK: - Banner
struct Banner : Codable{
    var name: String?
    var image: String?
    var title: String?
}

// MARK: - Category
struct Category : Codable{
    var category_id, name: String?
    var image: String?
    var parent_id, top: String?
}

// MARK: - FreshProduct
struct FreshProduct : Codable{
    var product_id, name, /*description*/ model: String?
    var quantity, sku, vsn, tax: String?
    var stock_status: String?
    //var image: String?
    var delivery_charge, manufacturer_id, manufacturer, price: String?
    var discount, date_available, sort_order, status: String?
}
