//
//  ProductCartApp.swift
//  ProductCart
//
//  Created by Andrii on 07.10.2023.
//

import SwiftUI

@main
struct ProductCartApp: App {
    
    @StateObject var viewModel = ProductViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
