//
//  TeleprompterView.swift
//  ProdCast
//
//  Created by Douglas Figueirôa on 08/02/22.
//

import SwiftUI

struct IPadNavigationViewStyle: ViewModifier {
    func body(content: Content) -> some View { content.navigationViewStyle(StackNavigationViewStyle()) }
}

struct IPhoneNavigationViewStyle: ViewModifier {
    func body(content: Content) -> some View { content.navigationViewStyle(DefaultNavigationViewStyle()) }
}

extension View {
    public func modify<T, U>(if condition: Bool, then modifierT: T, else modifierU: U) -> some View where T: ViewModifier, U: ViewModifier {
        Group {
            if condition {
                modifier(modifierT)
            } else {
                modifier(modifierU)
            }
        }
    }
}

struct TeleprompterView: View {
    
    @State var visualizacaoIndex = 0
    @State var hideShowViewsWhenTapped: Bool = false
    @State var isStopwatchActive: Bool = false
    @State var buttonPlayPause: Bool = false
    //@State var scrollText: Bool = false
    
    @State var timerRunning: Bool = false
    @State var timeCount = 0.0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    
    let layoutHorizontal = [
        GridItem(.fixed(80)),
    ]
    
    let layoutVertical = [
        GridItem(.fixed(80))
    ]
    
    var body: some View {
        NavigationView{
            if(self.visualizacaoIndex == 0){
                VStack(alignment: .center, spacing: 15){
                    Picker(selection: $visualizacaoIndex) {
                        Text("Minimizar").tag(0)
                        Text("Maximizar").tag(1)
                    } label: {
                        Text("Modificar visualização")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    VStack {
                        ScrollView(.horizontal){
                            LazyHGrid(rows: layoutHorizontal, spacing: 10){
                                ForEach(0..<70){_ in
                                    TeleprompterViewIntroduction()
                                }
                            } //fim LazyHGrid
                        }//fim ScrollView 1
                    }
                    .frame(minWidth: 170, maxWidth: 350, minHeight: 110, maxHeight: 200, alignment: .center)
                    TeleprompterViewText()
                } //fim VStack 1
                
                .toolbar {
                    ToolbarItemGroup(placement: ToolbarItemPlacement.bottomBar) {
                        Button {
                            self.isStopwatchActive.toggle()
                            self.timeCount = 0
                        } label: {
                            VStack{
                                Image(systemName: "stopwatch.fill")
                                Text("Cronômetro")
                            }
                            .foregroundColor(.black)
                        }
                        Spacer()
                        
                        Button {
                            //Iniciar contagem cronometro e scrollview automático
                            self.buttonPlayPause.toggle()
                            self.timerRunning.toggle()
                            
                            //TODO: criar método para o timer
                            if self.buttonPlayPause{
                                
                                timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
                            }else{
                                self.timer.upstream.connect().cancel()
                            }
                            
                        } label: {
                            VStack{
                                if self.buttonPlayPause{
                                    Image(systemName: "pause.fill")
                                    Text("Pausar")
                                }else{
                                    Image(systemName: "play.fill")
                                    Text("Iniciar")
                                }
                            }
                            .foregroundColor(.black)
                        }
                        Spacer()
                        
                        Button {
                            //Configurações
                        } label: {
                            VStack{
                                Image(systemName: "gearshape.fill")
                                Text("Configurações")
                            }
                            .foregroundColor(.black)
                        }
                    } //fim ToolbarItemGroup
                    
                    ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
                        if(isStopwatchActive == true){
                            ZStack{
                                Rectangle()
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                    .foregroundColor(.gray)
                                    .font(.title)
                                Text("\(String(format: "%.1f", self.timeCount))s")
                                    .onReceive(self.timer) { time in
                                        if timerRunning{
                                            timeCount += 0.1
                                        }
                                    }
                            }
                            .frame(width: 80, height:45)
                        }
                    }
                } //fim toolbar
            }else{ //Parte do Maximizar
                
                VStack(alignment: .center){
                    if(self.hideShowViewsWhenTapped == false){
                        Picker(selection: $visualizacaoIndex) {
                            Text("Minimizar").tag(0)
                            Text("Maximizar").tag(1)
                        } label: {
                            Text("Modificar visualização")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Button {
                        self.hideShowViewsWhenTapped.toggle()
                    } label: {
                        Group{
                            if(self.hideShowViewsWhenTapped == false){
                                Image(systemName: "eye")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                            }else{
                                Image(systemName: "eye.slash")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                            }
                        }
                        .frame(alignment: .top)
                    }
                    .padding()
                    
                    ScrollView(.vertical){
                        LazyVGrid(columns: layoutVertical) {
                            ForEach(0..<70){
                                Text("Item \($0)")
                                    .foregroundColor(.white)
                            }
                            /*
                             .frame(maxWidth: .infinity, maxHeight: .infinity)
                             .offset(y: scrollText ? 100 : -400)
                             .animation(Animation.linear(duration: 8))
                             .onAppear(){
                             self.scrollText.toggle()
                             }
                             */
                        } //fim LazyVGrid
                        
                        
                    } //fim ScrollView
                    
                    if(self.hideShowViewsWhenTapped == false){
                        Button {
                            //pausar
                        } label: {
                            Image(systemName: "pause.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                        }
                    }
                } //fim VStack
                .background(.black)
            } //fim else
        } //fim Nav. View
        .modify(if: UIDevice.current.userInterfaceIdiom == .pad, then: IPadNavigationViewStyle(), else: IPhoneNavigationViewStyle())
    }//fim body
}

struct TeleprompterView_Previews: PreviewProvider {
    static var previews: some View {
        TeleprompterView()
        TeleprompterView()
            .previewDevice("iPad mini (6th generation)")
        
    }
}
