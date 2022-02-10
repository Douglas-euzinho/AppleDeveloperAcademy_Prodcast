//
//  TeleprompterView.swift
//  ProdCast
//
//  Created by Douglas Figueirôa on 08/02/22.
//

import SwiftUI

//MARK: - VIEW MODIFIER BASED ON DEVICE
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
    
    //MARK: - PROPERTIES
    @State private var visualizacaoIndex = 0
    @State private var hideShowViewsWhenTapped: Bool = false
    @State private var isStopwatchActive: Bool = false
    @State private var buttonPlayPause: Bool = false
    
    @State private var timerRunning: Bool = false
    @State private var timeCount = 0.0
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let layoutHorizontal = [
        GridItem(.fixed(80)),
    ]
    let layoutVertical = [
        GridItem(.fixed(80))
    ]
    
    var body: some View {
        NavigationView{
            //MARK: - (MINIMIZE PART) TELEPROMPTER TEXT AND INTRODUCTION
            //CHECK IF IS IN "MINIMIZE" OR IN "MAXIMIZE"
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
                        //SHOW THE PROMPTER INTRODUCTION IN HORIZONTAL
                        ScrollView(.horizontal){
                            LazyHGrid(rows: layoutHorizontal, spacing: 10){
                                ForEach(0..<70){_ in
                                    TeleprompterViewIntroduction()
                                }
                            }
                        }
                    }
                    .frame(minWidth: 135, maxWidth: 950, minHeight: 110, maxHeight: 200, alignment: .center)
                    //SHOW THE PROMPTER TEXT IN VERTICAL
                    TeleprompterViewText()
                }
                //MARK: - INIT TOOLBAR
                .toolbar {
                    ToolbarItemGroup(placement: ToolbarItemPlacement.bottomBar) {
                        
                        //BUTTON THAT CREATE/REMOVE THE STOPWATCH WHEN TAPPED
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
                        
                        //BUTTON THAT START/STOP THE STOPWATCH COUNTDOWN
                        Button {
                            //Iniciar contagem cronometro e scrollview automático
                            self.buttonPlayPause.toggle()
                            self.timerRunning.toggle()
                            checkButtonToTimerCount()
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
                        
                        //BUTTON WHO CALLS UP THE CONFIG SCREEN
                        Button {
                            //Configurações
                        } label: {
                            VStack{
                                Image(systemName: "gearshape.fill")
                                Text("Configurações")
                            }
                            .foregroundColor(.black)
                        }
                    }
                    
                    //THE STOPWATCH VIEW IN THE TOP SCREEN VIEW
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
                }
                //MARK: - (MAXIMIZE PART) ONLY PROMPTER TEXT
            }else{
                VStack(alignment: .center){
                    //CHECK IF THE READ MODE IS ON/OFF
                    if(self.hideShowViewsWhenTapped == false){
                        Picker(selection: $visualizacaoIndex) {
                            Text("Minimizar").tag(0)
                            Text("Maximizar").tag(1)
                        } label: {
                            Text("Modificar visualização")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    //BUTTON THAT REMOVE/APPEAR THE VIEWS ON SCREEN
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
                    
                    //THE TELEPROMPTER TEXT VIEW
                    ScrollView(.vertical){
                        LazyVGrid(columns: layoutVertical) {
                            ForEach(0..<70){
                                Text("Item \($0)")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                    //BUTTON THAT PAUSES THE AUTOMATIC SCROLL TEXT
                    if(self.hideShowViewsWhenTapped == false){
                        Button {
                            //pausar
                        } label: {
                            Image(systemName: "pause.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                        }
                    }
                }
                .background(.black)
            }
        }
        //MODIFY THE LAYOUT ACCORDING TO SPECIFIC DEVICE
        .modify(if: UIDevice.current.userInterfaceIdiom == .pad, then: IPadNavigationViewStyle(), else: IPhoneNavigationViewStyle())
    }
    
    /// Description: Check the button state for stopwatch counting
    /// if the button is paused, the stopwatch pauses the count.
    /// if the button is played, the stopwatch start the count
    func checkButtonToTimerCount(){
        if self.buttonPlayPause{
            timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        }else{
            self.timer.upstream.connect().cancel()
        }
    }
    
    
}

struct TeleprompterView_Previews: PreviewProvider {
    static var previews: some View {
        TeleprompterView()
    }
}
