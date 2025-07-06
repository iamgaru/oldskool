import SwiftUI

struct ActivityWidget: TerminalWidget {
    let id = "activity"
    let label = "ACTV"
    let title = "🏃"
    @ObservedObject var service: HealthService
    @State var isLoading = false
    
    var value: String { 
        if isLoading {
            return "..."
        }
        return "\(service.activeEnergyBurned)/\(service.exerciseMinutes)/\(service.standHours)"
    }
    
    var body: some View {
        TerminalWidgetRow(widget: self)
    }
    
    func refresh() async {
        isLoading = true
        await service.fetchAllData()
        isLoading = false
    }
}