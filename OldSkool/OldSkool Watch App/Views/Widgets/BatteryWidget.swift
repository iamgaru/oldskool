import SwiftUI
import WatchKit

struct BatteryWidget: TerminalWidget {
    let id = "battery"
    let label = "BATT"
    let title = "🔋"
    @State private var batteryLevel = ""
    @State var isLoading = false
    
    var value: String { batteryLevel }
    
    var body: some View {
        TerminalWidgetRow(widget: self)
            .onAppear {
                updateBatteryLevel()
                Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { _ in
                    updateBatteryLevel()
                }
            }
    }
    
    private func updateBatteryLevel() {
        let device = WKInterfaceDevice.current()
        device.isBatteryMonitoringEnabled = true
        
        let batteryValue = device.batteryLevel
        let level = batteryValue >= 0 ? Int(batteryValue * 100) : 100
        let state = device.batteryState
        
        var stateString = ""
        switch state {
        case .charging:
            stateString = " (charging)"
        case .full:
            stateString = " (full)"
        case .unplugged:
            stateString = ""
        case .unknown:
            stateString = " (?)"
        @unknown default:
            stateString = ""
        }
        
        batteryLevel = "\(level)%\(stateString)"
    }
    
    func refresh() async {
        updateBatteryLevel()
    }
}