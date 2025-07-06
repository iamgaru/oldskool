import Foundation

@MainActor
class StockService: ObservableObject {
    @Published var stockPrice: String = "$2.45"
    @Published var stockSymbol: String = "QOR.AX"
    @Published var isLoading = false
    
    private let session = URLSession.shared
    
    func fetchStockPrice() async {
        isLoading = true
        
        guard let url = URL(string: "https://query1.finance.yahoo.com/v8/finance/chart/\(stockSymbol)") else {
            await MainActor.run {
                self.stockPrice = "error"
                self.isLoading = false
            }
            return
        }
        
        do {
            let (data, _) = try await session.data(from: url)
            let response = try JSONDecoder().decode(StockResponse.self, from: data)
            
            if let result = response.chart.result.first,
               let meta = result.meta,
               let price = meta.regularMarketPrice {
                
                await MainActor.run {
                    self.stockPrice = String(format: "%.2f", price)
                    self.isLoading = false
                }
            } else {
                await MainActor.run {
                    self.stockPrice = "--"
                    self.isLoading = false
                }
            }
        } catch {
            await MainActor.run {
                self.stockPrice = "error"
                self.isLoading = false
            }
        }
    }
}

struct StockResponse: Codable {
    let chart: Chart
}

struct Chart: Codable {
    let result: [StockResult]
}

struct StockResult: Codable {
    let meta: StockMeta?
}

struct StockMeta: Codable {
    let regularMarketPrice: Double?
}