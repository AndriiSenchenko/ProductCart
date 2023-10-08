//
//  ProductSelectionView.swift
//  ProductCart
//
//  Created by Andrii on 07.10.2023.
//

import SwiftUI

struct ProductSelectionView: View {
    @State private var text = ""
    @ObservedObject var viewModel: ProductViewModel
    @State private var selectedProduct: Product? = nil


    var body: some View {
        NavigationView {
            VStack {
                TextField("Введите название продукта", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                        viewModel.fetchNutritionData(for: text)
                    }
                    .padding()

                List(viewModel.products.filter {
                    viewModel.searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(viewModel.searchText)
                }) { product in
                    HStack {
                        Text(product.name)
                        Spacer()
                        Button(action: {
                            viewModel.removeProductFromCart(product: product)
                        }) {
                            Image(systemName: "minus.circle.fill")
                        }
                        .foregroundColor(.red)
                    }
                    .contentShape(Rectangle()) // Определяем форму ячейки
                        .onTapGesture {
                            selectedProduct = product // Устанавливаем выбранный продукт
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Выбор продукта")
            .sheet(item: $selectedProduct) { product in
                NavigationView {
                    ProductDetailView(product: product) // Открываем ProductDetailView
                }
            }
        }
    }
}




struct ProductSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ProductViewModel())
    }
}
