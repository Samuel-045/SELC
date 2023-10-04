//
//  ContentView.swift
//  SELC
//
//  Created by StudentBackup01 on 22/09/23.
//



import SwiftUI


struct Noticias: View {
    
    @State private var modal = false
    @StateObject  var viewModel = SwiftUIView_Clima()
    let date = Date.now
    let formatter1 = DateFormatter()
    
    @State var aux : SelcNoticias = SelcNoticias(date: "", title: "", description: "", url: "", image: "")

    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .background(Color(red: 0.51, green: 0.84, blue: 0.94))
                .ignoresSafeArea().zIndex(0)
            
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    VStack {
                        Text("Noticias").foregroundColor(Color.white).bold()
                        Spacer().frame(width: 1, height: 10)
                        
                        VStack{
                            ForEach(viewModel.chars, id: \.self) { noticiasX in
                                
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 340, height: 300)
                                    .background(Color(red: 0.2, green: 0.41, blue: 0.47).opacity(0.24))
                                    .cornerRadius(12)
                                    .overlay(){
                                        VStack{
                                            
                                            ScrollView(.horizontal, showsIndicators: false){
                                                Text(noticiasX.title!).foregroundColor(Color.white).bold()
                                            }
                                            AsyncImage(url: URL(string: "\(noticiasX.image!)")!, scale: 2 ).frame(width: 290, height: 200).padding(5).cornerRadius(5)
                                            
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 300, height: 30)
                                                .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                                                .cornerRadius(12)
                                                .overlay(){
                                                    ScrollView(.horizontal, showsIndicators: false){
                                                        HStack{
                                                            Text("              ")
                                                            Spacer()
                                                           
                                                            Text("\(noticiasX.formattedTimestamp())")
                                                                ////AQUIIIIIIIIIIIIIIIIIII
                                                                .foregroundColor(Color.white)
                                                                .padding(5)
                                                            Spacer()
                                                            Text("    ")
                                                           
                                                            
                                                        }
                                                    }
                                                }
                                        }.onTapGesture(){
                                            aux = noticiasX
                                            
                                            
                                            print(aux)
                                            
                                            modal = true
                                        }
                                        
                                    }
                                    
                                
                            }
                        }
                        .sheet(isPresented: $modal){
                            
                            
                            //print(aux!)
                            
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .background(Color(red: 0.18, green: 0.39, blue: 0.46))
                                    .ignoresSafeArea().zIndex(0)
                                
                                VStack{
                                    Spacer()
                                    Text(aux.title!).bold().foregroundColor(Color.white)
                                        .bold()
                                        .padding(EdgeInsets(top: 10, leading: 1, bottom: 1, trailing: 1))
                                        .font(.title)
                                    AsyncImage(url: URL(string: "\(aux.image!)"), scale: 2 )
                                       
                                        .frame(width: 300, height: 200).padding(2).cornerRadius(15).padding(EdgeInsets(top: 20, leading: 1, bottom: 50, trailing: 1))
                                      
                                    
                                    Text(aux.description!).foregroundColor(Color.white).padding(EdgeInsets(top: 5, leading: 1, bottom: 1, trailing: 1))
                                        .bold()
                                        
                                    Text(aux.url!).bold().foregroundColor(Color.white)
                                        .padding(EdgeInsets(top: 10, leading: 1, bottom: 1, trailing: 1))
                                    
                                    Text(aux.date!).foregroundColor(Color.white)
                                        .bold()
                                        .padding(EdgeInsets(top: 5, leading: 1, bottom: 1, trailing: 1))
                                    
                                    Spacer()
                                    Text("")
                                    
                                }
                            }
                            
                            
                        }
                        
                    }.padding()
                    
                }
                
                

            }.onAppear(){
                
                viewModel.fetch()
            }
        }
    }
    
}
//}


struct Noticias_Previews: PreviewProvider {
    static var previews: some View {
        Noticias()
    }
}

