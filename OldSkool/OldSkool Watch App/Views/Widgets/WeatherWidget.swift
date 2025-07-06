import SwiftUI

struct WeatherWidget: TerminalWidget {
    let id = "weather"
    let label = "TEMP"
    let title = "🌡️"
    @ObservedObject var service: OldSkoolWeatherService
    
    var value: String { 
        if service.isLoading {
            return "..."
        }
        return service.temperature.isEmpty ? "--" : service.temperature
    }
    
    var isLoading: Bool { service.isLoading }
    
    var body: some View {
        TerminalWidgetRow(widget: self)
    }
    
    func refresh() async {
        await service.requestLocation()
    }
}