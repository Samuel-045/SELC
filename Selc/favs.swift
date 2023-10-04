//
//  favs.swift
//  SELC
//
//  Created by StudentBackup01 on 25/09/23.
//

import SwiftUI
struct favoritos : Identifiable{
    var id =   UUID()
    var local : String
    var regiao : String
    var titulo : String
    var tempo : String
    var imagem : String
    var conteudo : String
}

struct favs: View {
    @State private var modalAdc1 = false
    @State private var modalAdc2 = false
    @State private var nomeLocal : String = ""
    @State var favs : [favoritos] = []
        //favoritos(local:"", regiao:"", titulo:"", tempo:"", imagem: "g", conteudo:"")
    
    
    @State var auxi : favoritos = favoritos( local:"", regiao:"",titulo:"", tempo:"", imagem:"", conteudo:"n")
    
    
    
    func addItem() {
        let newItem =  favoritos(local: nomeLocal, regiao: "", titulo: "", tempo: "", imagem: "", conteudo: "")
        favs.append(newItem)
    }
    @StateObject  var swiftUIView = Api_Iot()
    @State var aux : Iot = Iot(_id: "",_rev: "",temperature: 0.0,pressure: 0.0, dt: 0)
    

    
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(Color(red: 0.51, green: 0.84, blue: 0.94))
                .ignoresSafeArea().zIndex(0)
            
            VStack{
                Text("Favoritos").bold().foregroundColor(Color.white)
                
                
                Button(action: {
                    modalAdc1 = true
                }){
                    HStack(){
                        Text("").padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        Spacer()
                        Text("Adicionar")
                        Spacer()
                        Image(systemName: "cross.fill").foregroundColor(Color.white).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                    }
                }.frame(width: 320, height: 35).foregroundColor(Color.white).background(Color(red: 0.18, green: 0.39, blue: 0.46)).cornerRadius(40)
                
                Spacer().frame(height: 230)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 350, height: 200)
                    .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                    .cornerRadius(12)
                    .overlay(){
                        ScrollView(showsIndicators: false){
                            VStack{
                                
                                ForEach(favs) { fav in
                                    Button(action: {
                                        auxi = fav
                                        modalAdc2=true
                                        
                                    }){
                                        Text(fav.local).frame(width: 250,height: 50).foregroundColor(Color.white).background(Color(red: 0.18, green: 0.72, blue: 0.89)).cornerRadius(10).padding(EdgeInsets(top:20, leading: 0, bottom: 0, trailing: 0))
                                    }
                                }
                                
                            }
                            
                        }
                        
                    }
            }.onAppear(){
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in
                    swiftUIView.fetch2()
                }
            }.sheet(isPresented: $modalAdc2){
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                        .ignoresSafeArea().zIndex(0)
                    
                    VStack{
                        
                        HStack{
                            Text("Temperatura").foregroundColor(Color.white).bold().padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 10))
                            Spacer()
                            Text("\(aux.temperature!,specifier: "%.0f") cº").foregroundColor(Color.white).bold().font(.system(size:30))
                                
                            Spacer()
                            
                        }
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 320, height: 4)
                            .background(Color(red: 100, green: 100, blue: 100))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        
                        HStack{
                            Text("Pressao").foregroundColor(Color.white).bold().padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 10))
                            Spacer()
                            Text("\(aux.pressure!,specifier: "%.0f")").foregroundColor(Color.white).bold()
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 70))
                            
                        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                        
                    }
                    
                }
            }.sheet(isPresented: $modalAdc1){
                VStack{
                    //Rectangle()
                        
                       
                    
                    VStack{
                        Text("Adicione o seu local atual").bold().foregroundColor(Color.white).padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                        
                        
                        
                        TextField("Nome do seu local",text: $nomeLocal)
                            .background(Color(red: 0.51, green: 0.84, blue: 0.94))
                            .cornerRadius(4)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                            .frame(width: 350, height: 100)
                        
                        
                        
                        
                        
                        
                        
                      
                        HStack{
                            ScrollView{
                                
                                
                                
                            }
                        }
                    }
                    
                    
                    HStack{
                        ScrollView{
                            
                            ForEach(swiftUIView.iot, id: \._id){ iot2 in
                                Text("Temperaturaa").foregroundColor(Color.white).bold().padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                
                                Text("\(iot2.temperature!)").foregroundColor(Color.white).bold().font(.system(size:30))
                                Text("Pressao").foregroundColor(Color.white).bold().padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                Text("\(iot2.pressure!)").foregroundColor(Color.white).bold().font(.system(size:30))
                                Spacer()
                                Button("Adicionar"){
                                    self.addItem()
                                    aux = iot2
                                    
                                    
                                    print(aux)
                                    modalAdc1=false
                                }.frame(width: 190).frame(width: 130).background(Color(red: 0.51, green: 0.84, blue: 0.94)).foregroundColor(Color.white).cornerRadius(5).padding(8)
                            }
                            
                        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                        
                        
                        
                    }
                    
                } .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                    .ignoresSafeArea().zIndex(0)
                
            }
        }
    }
    
}

struct favs_Previews: PreviewProvider {
    static var previews: some View {
        favs()
    }
}

