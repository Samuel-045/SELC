//
//  Api_Iot.swift
//  Selc
//
//  Created by Student03 on 27/09/23.
//
import MapKit
import Foundation

struct Iot : Decodable ,Hashable{
        var _id: String?
        var _rev: String?
        var temperature:Double?
        var  pressure: Double?
        var dt : Int?
    
}

class Api_Iot: ObservableObject {
    @Published var iot : [Iot] = []
    
    func fetch2(){
        guard let url = URL(string: "http://192.168.128.237:1880/iotread" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Iot].self, from: data)
                
                DispatchQueue.main.async {
                    self?.iot = parsed.sorted(by: {$0.dt! < $1.dt!})
                    
                    var aux = self?.iot.last
                    self?.iot.removeAll()
                    self?.iot.append(aux!)
                    
                    print(self?.iot)
                    
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    
    
}
