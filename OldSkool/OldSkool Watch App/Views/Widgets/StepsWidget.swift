import SwiftUI

struct StepsWidget: TerminalWidget {
    let id = "steps"
    let label = "STEP"
    let title = "👣"
    @ObservedObject var service: HealthService
    @State var isLoading = false
    
    var value: String { 
        if isLoading { return "..." }
        return service.stepCount > 0 ? "\(service.stepCount)" : "--"
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