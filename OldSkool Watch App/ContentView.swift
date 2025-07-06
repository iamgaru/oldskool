import SwiftUI
import WatchKit

struct ContentView: View {
    @StateObject private var healthService = HealthService()
    @StateObject private var weatherService = OldSkoolWeatherService()
    @StateObject private var stockService = StockService()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: TerminalTheme.lineSpacing) {
                    TerminalWidgetRow(widget: TimeWidget())
                    TerminalWidgetRow(widget: DateWidget())
                    TerminalWidgetRow(widget: BatteryWidget())
                    TerminalWidgetRow(widget: WeatherWidget(service: weatherService))
                    TerminalWidgetRow(widget: StepsWidget(service: healthService))
                    TerminalWidgetRow(widget: HeartRateWidget(service: healthService))
                    TerminalWidgetRow(widget: ActivityWidget(service: healthService))
                    TerminalWidgetRow(widget: StockWidget(service: stockService))
                    TerminalWidgetRow(widget: SystemWidget())
                }
                .padding(.horizontal, 8)
                Spacer()
            }
        }
        .ignoresSafeArea(.all)
        .persistentSystemOverlays(.hidden)
        .onAppear {
            Task {
                await refreshAllWidgets()
            }
        }
    }
    
    private func refreshAllWidgets() async {
        await healthService.requestPermissions()
        await weatherService.requestLocation()
        await stockService.fetchStockPrice()
    }
}