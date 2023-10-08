//
//  Product.swift
//  ProductCart
//
//  Created by Andrii on 07.10.2023.
//

import Foundation


struct Product: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var calories: Double
    var servingSizeGrams: Double
    var fatTotalGrams: Double
    var fatSaturatedGrams: Double
    var proteinGrams: Double
    var sodiumMg: Double
    var potassiumMg: Double
    var cholesterolMg: Double
    var carbohydratesTotalGrams: Double
    var fiberGrams: Double
    var sugarGrams: Double
}
