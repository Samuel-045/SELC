//
//  ContentView.swift
//  Selc
//
//  Created by Student25 on 22/09/23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject  var swiftUIView = Api_Tempo()
    @StateObject  var viewModel = SwiftUIView_Clima()
    @ObservedObject private var locationManager = LocationManager()
     
     @StateObject var post = Post()
     @State var geo : Geo = Geo(Latitude: -23.6446491, Longitude: -46.7242456)
     
     var body: some View {
         
        let coordinate = self.locationManager.location != nil ?
        self.locationManager.location!.coordinate : CLLocationCoordinate2D()
         
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.51, green: 0.84, blue: 0.94))
                .ignoresSafeArea()
            
            VStack {
                ForEach(swiftUIView.chars, id: \._id){ clima in
                    
                        Text("Santo Amaro")
                            .foregroundColor(Color.white)
                            .font(Font.custom("Inter", size: 24))
                            .bold()
                        Text(Date().formatted(date:.long, time: .omitted))
                            .foregroundColor(Color.white)
                    
                    
                }
                ForEach(viewModel.chars, id: \.self){ clima in
                    Text("\(clima.date!)")
                        .foregroundColor(Color.white)
                        .font(Font.custom("Inter", size: 16))
                        .bold()
                }
                Spacer()
                
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 200, height: 180)
                        .foregroundColor(Color(red: 0.18, green: 0.39, blue: 0.46))
                    
                        .overlay {
                           
                            
                                ForEach(swiftUIView.chars, id: \._id){ clima in
                                    VStack(alignment: .leading) {
                                        
                                            Text("Santo Amaro")
                                                .font(Font.custom("Inter", size: 27))
                                                .foregroundColor(.white)
                                        
                                        Text("\(clima.tempc!,specifier: "%.0f") cº")
                                            .font(Font.custom("Inter", size: 50))
                                            .foregroundColor(.white)
                                        
                                        
                                        HStack {
                                            Text("\(clima.temp_maxc!,specifier: "%.0f") cº")
                                                .font(Font.custom("Inter", size: 20))
                                                .foregroundColor(.white)
                                            
                                            Text("\(clima.temp_minc!,specifier: "%.0f") cº")
                                                .font(Font.custom("Inter", size: 20))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                           
                            
                        }
                        .padding()
                    Spacer()
                }
                Spacer()
                HStack {
                    
                    Spacer()
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 30) {
                            VStack(alignment: .leading) {
                                Text("Sabado")
                                    .foregroundColor(.white)
                                Image("chuva")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 45)
                                    .clipped()
                                HStack{
                                    Text("28ºc")
                                        .foregroundColor(.white)
                                    Text("18ºc")
                                        .foregroundColor(.white)
                                }
                                
                                
                            }.frame(width: 100, height: 150)
                                .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                            
                            VStack(alignment: .leading) {
                                Text("Domingo")
                                    .foregroundColor(.white)
                                Image("chuva")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 45)
                                    .clipped()
                                HStack{
                                    Text("23ºc")
                                        .foregroundColor(.white)
                                    Text("17ºc")
                                        .foregroundColor(.white)
                                }
                                
                                
                            }.frame(width: 100, height: 150)
                                .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                            
                            VStack(alignment: .leading) {
                                Text("Segunda")
                                    .foregroundColor(.white)
                                Image("nuvem2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 45)
                                    .clipped()
                                HStack{
                                    Text("22ºc")
                                        .foregroundColor(.white)
                                    Text("17ºc")
                                        .foregroundColor(.white)
                                }
                                
                                
                            }.frame(width: 100, height: 150)
                                .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                            
                            VStack(alignment: .leading) {
                                Text("Terça")
                                    .foregroundColor(.white)
                                Image("sol")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 45)
                                    .clipped()
                                HStack{
                                    Text("28ºc")
                                        .foregroundColor(.white)
                                    Text("19ºc")
                                        .foregroundColor(.white)
                                }
                                
                                
                            }.frame(width: 100, height: 150)
                                .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                            
                            VStack(alignment: .leading) {
                                Text("Quarta")
                                    .foregroundColor(.white)
                                Image("chuva")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 45)
                                    .clipped()
                                HStack{
                                    Text("28ºc")
                                        .foregroundColor(.white)
                                    Text("21ºc")
                                        .foregroundColor(.white)
                                }
                                
                                
                            }.frame(width: 100, height: 150)
                                .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                            
                            VStack(alignment: .leading) {
                                Text("Quinta")
                                    .foregroundColor(.white)
                                Image("chuva")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 45)
                                    .clipped()
                                HStack{
                                    Text("26ºc")
                                        .foregroundColor(.white)
                                    Text("17ºc")
                                        .foregroundColor(.white)
                                }
                                
                                
                            }.frame(width: 100, height: 150)
                                .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                            
                            VStack(alignment: .leading) {
                                Text("Sexta")
                                    .foregroundColor(.white)
                                Image("chuva")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 45)
                                    .clipped()
                                HStack{
                                    Text("22ºc")
                                        .foregroundColor(.white)
                                    Text("17ºc")
                                        .foregroundColor(.white)
                                }
                                
                                
                            }.frame(width: 100, height: 150)
                                .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                        }
                    }
                    
                    Spacer()
                }
                Spacer()
                
                
            }.onAppear(){
                swiftUIView.fetch()
                
                post.MandaPost(geo: geo)
                
                Timer.scheduledTimer(withTimeInterval: 10, repeats: true){ _ in
                    if(coordinate.latitude  != 0 && coordinate.longitude != 0){
                        geo.Latitude = coordinate.latitude
                        geo.Longitude = coordinate.longitude
                    }
                    
                    print(geo.Latitude)
                    
                    if(geo.Latitude != -19.9023176){
                        post.MandaPost(geo: geo)
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

