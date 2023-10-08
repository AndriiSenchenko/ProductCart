import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
 
    @Published var searchText: String = "" {
        didSet {
           
        }
    }

 

    func removeProductFromCart(product: Product) {
        if let index = products.firstIndex(of: product) {
            products.remove(at: index)
        }
    }
    
    func fetchNutritionData(for searchText: String) {
        APIService.shared.fetchNutritionData(for: searchText) { result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products.append(contentsOf: products)
                }
            case .failure(let error):
                print("Ошибка при загрузке данных: \(error.localizedDescription)")
            }
        }
    }
}
