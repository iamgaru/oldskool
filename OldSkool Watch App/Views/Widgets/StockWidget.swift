import SwiftUI

struct StockWidget: TerminalWidget {
    let id = "stock"
    let label = "QOR "
    let title = "📈"
    @ObservedObject var service: StockService
    
    var value: String { 
        if service.isLoading {
            return "..."
        }
        return service.stockPrice == "?" ? "?" : "$\(service.stockPrice)"
    }
    
    var isLoading: Bool { service.isLoading }
    
    var body: some View {
        TerminalWidgetRow(widget: self)
    }
    
    func refresh() async {
        await service.fetchStockPrice()
    }
}