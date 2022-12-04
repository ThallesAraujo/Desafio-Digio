// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   var productList = try? newJSONDecoder().decode(ProductList.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ProductList: Codable {
    var spotlight: [Spotlight]
    var products: [Product]
    var cash: Cash
}

// MARK: - Cash
struct Cash: Codable {
    var title: String
    var bannerURL: String
    var cashDescription: String

    enum CodingKeys: String, CodingKey {
        case title, bannerURL
        case cashDescription = "description"
    }
    
    func asProduct() -> Product{
        return Product(name: self.title, imageURL: self.bannerURL, productDescription: self.cashDescription, productType: .digioCash)
    }
}

// MARK: - Product
struct Product: Codable, Hashable {
    var name: String
    var imageURL: String
    var productDescription: String
    var productType: ProductType = .product

    enum CodingKeys: String, CodingKey {
        case name, imageURL
        case productDescription = "description"
    }
}

// MARK: - Spotlight
struct Spotlight: Codable, Hashable {
    var name: String
    var bannerURL: String
    var spotlightDescription: String

    enum CodingKeys: String, CodingKey {
        case name, bannerURL
        case spotlightDescription = "description"
    }
    
    func asProduct() -> Product{
        return Product(name: self.name, imageURL: self.bannerURL, productDescription: self.spotlightDescription, productType: .spotlight)
    }
}

