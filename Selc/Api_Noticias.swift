//
//  Api_Noticias.swift
//  Selc
//
//  Created by Student03 on 26/09/23.
//

//
//  SwiftUIView_Clima.swift
//  Codigo api clima
//
//  Created by Student03 on 26/09/23.
//
import Foundation


struct SelcNoticias: Decodable, Hashable{
    var date:String?
    var title:String?
    var description:String?
    var url:String?
    var image :String?
    
}

extension SelcNoticias {
    func formattedTimestamp() -> String {
        let isoDate = self.date ?? "2016-08-14T20:38:27.031-03:00"

        let dateFormatter = DateFormatter()
        // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale.init(identifier: "pt_BR")
        let date = dateFormatter.date(from:isoDate)
        
        
        let finalDate = date
        return (finalDate!.formatted(date: .abbreviated, time: .shortened))
    }
}

class SwiftUIView_Clima : ObservableObject {
    @Published var chars : [SelcNoticias] = []
    
    func fetch(){
        guard let url = URL(string: "https://netty.one/api/climatempo" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([SelcNoticias].self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed
                    
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    
   
}
