import SwiftUI
import WatchKit

class TimeHidingManager: ObservableObject {
    @Published var isTimeHidden = false
    
    func handleDigitalCrownRotation(_ value: Bool) {
        isTimeHidden = value
    }
}