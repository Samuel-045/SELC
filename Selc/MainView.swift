//
//  MainView.swift
//  Selc
//
//  Created by Student25 on 25/09/23.
//

import SwiftUI
import CoreLocation

struct MainView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemCyan
    }
    
    @ObservedObject private var locationManager = LocationManager()
     
     @StateObject var post = Post()
     @State var geo : Geo = Geo(Latitude: -19.9023176, Longitude: -44.1288607)
     
     var body: some View {
         
         let coordinate = self.locationManager.location != nil ?
         self.locationManager.location!.coordinate : CLLocationCoordinate2D()

        let customTabColor = Color(red: 0.18, green: 0.39, blue: 0.46)
        TabView{
            
            Noticias()
                .tabItem{
                    Label("Noticias" , systemImage: "newspaper.fill")
                }
            ContentView()
                .tabItem(){
                    Label("Temparatura" , systemImage: "thermometer.sun.fill")
                }
            favs()
                .tabItem(){
                    Label("Locais" , systemImage: "star.fill")
                }
        }.onAppear(){
           
           
           
        }
        
        .background(customTabColor)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
