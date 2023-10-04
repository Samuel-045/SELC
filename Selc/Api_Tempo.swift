//
//  Api_Tempo.swift
//  Selc
//
//  Created by Student03 on 26/09/23.
//
import MapKit
import Foundation

struct Clima : Decodable ,Hashable{

    let _id : String?
    let _rev : String?
    let weather: String?
    let    detail: String?
    let     icon: String?
    let    tempk: Double?
    let   tempc: Double?
    let   temp_maxc: Double?
    let  temp_minc: Double?
    let  humidity: Int?
    let  pressure: Double?
    let  maxtemp: Double?
    let  mintemp: Double?
    let   windspeed: Double?
    let    winddirection: Int?
    let   location: String?
    let   sunrise: Int?
    let  sunset: Int?
    let  clouds: Int?
    let description: String?
    let dt : Int
}

class Api_Tempo: ObservableObject {
    @Published var chars : [Clima] = []
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.237:1880/selccREAD" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Clima].self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed.sorted(by: {$0.dt < $1.dt})
                    
                    var aux = self?.chars.last
                    self?.chars.removeAll()
                    self?.chars.append(aux!)
                    
                    print(self?.chars)
                    
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    
    
}

class LocationManager: NSObject, ObservableObject {
    
   private let locationManager = CLLocationManager()
    @Published var location : CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}
extension LocationManager: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.last else {
            return
        }
        self.location = location
        
    }
    
}

struct Geo : Codable{
    var Latitude : Double
    var Longitude : Double
}

class Post : ObservableObject{
    
    func MandaPost(geo : Geo){
        
        guard let url = URL(string: "http://127.0.0.1:1880/selctesteePOST" ) else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print(geo)
        
        let data = try? JSONEncoder().encode(geo)
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                print("ERRO: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Erro ao Salvar")
                return
            }
            
            if httpResponse.statusCode == 200{
                print("FOOOOI POORRA \(httpResponse.description)")
            }else{
                print("FOOOOI POORRA NENHUMA")
            }
        }
        task.resume()
        
    }
}
