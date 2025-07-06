import SwiftUI

struct HeartRateWidget: TerminalWidget {
    let id = "heartrate"
    let label = "BEAT"
    let title = "❤️"
    @ObservedObject var service: HealthService
    @State var isLoading = false
    
    var value: String { 
        if isLoading { return "..." }
        return service.heartRate > 0 ? "\(service.heartRate)bpm" : "--"
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