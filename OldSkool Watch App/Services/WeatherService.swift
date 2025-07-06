import Foundation
import WeatherKit
import CoreLocation

@MainActor
class OldSkoolWeatherService: NSObject, ObservableObject {
    @Published var temperature: String = "72°F"
    @Published var condition: String = ""
    @Published var isLoading = false
    
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() async {
        isLoading = true
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    private func fetchWeather() async {
        guard let location = currentLocation else { return }
        
        do {
            let weather = try await WeatherKit.WeatherService.shared.weather(for: location)
            
            let formatter = MeasurementFormatter()
            formatter.numberFormatter.maximumFractionDigits = 0
            
            let tempString = formatter.string(from: weather.currentWeather.temperature)
            
            await MainActor.run {
                self.temperature = tempString
                self.condition = weather.currentWeather.condition.description
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.temperature = "?"
                self.condition = "unavailable"
                self.isLoading = false
            }
        }
    }
}

extension OldSkoolWeatherService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        currentLocation = location
        
        Task {
            await fetchWeather()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Task { @MainActor in
            self.temperature = "?"
            self.condition = "location error"
            self.isLoading = false
        }
    }
}