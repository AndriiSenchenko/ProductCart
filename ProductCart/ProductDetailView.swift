//
//  ProductDetailView.swift
//  ProductCart
//
//  Created by Andrii on 07.10.2023.
//

import SwiftUI

import SwiftUI

struct ProductDetailView: View {
    var product: Product

    var body: some View {
        VStack {
            Text("Название продукта: \(product.name)")
            Text("Калории: \(product.calories)")
            Text("Содержание жира: \(product.fatTotalGrams) г")
            // Добавьте другие свойства продукта по аналогии

            Spacer()
        }
        .navigationTitle("Детали продукта")
    }
}


