//
//  SplashScreen.swift
//  Selc
//
//  Created by Student03 on 29/09/23.
//
import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack{
            if self.isActive{
                MainView()
            }else{
                Rectangle()
                    .background(Color("CorFundo"))
                Image("SplashScreen")
                    .resizable()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
