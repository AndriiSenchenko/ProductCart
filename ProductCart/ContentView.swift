//
//  ContentView.swift
//  ProductCart
//
//  Created by Andrii on 07.10.2023.
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ProductViewModel

    var body: some View {
            ProductSelectionView(viewModel: viewModel)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ProductViewModel())
    }
}
