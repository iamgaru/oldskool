import SwiftUI
import WatchKit

struct SystemWidget: TerminalWidget {
    let id = "system"
    let label = "SYS "
    let title = "💻"
    @State private var systemInfo = ""
    @State var isLoading = false
    
    var value: String { systemInfo }
    
    var body: some View {
        TerminalWidgetRow(widget: self)
            .onAppear {
                updateSystemInfo()
            }
    }
    
    private func updateSystemInfo() {
        let device = WKInterfaceDevice.current()
        let version = device.systemVersion
        systemInfo = "wOS\(version)"
    }
    
    func refresh() async {
        updateSystemInfo()
    }
}