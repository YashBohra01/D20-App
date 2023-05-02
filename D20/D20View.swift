//
//  ContentView.swift
//  D20
//
//  Created by Yash Bohra on 22/03/23.
//

import SwiftUI
import AVKit

struct D20View: View {
    @State var n=20;
    @State private var isD20 = true
    @State private var isD6 = false
    @State private var isD12 = false
    @State private var D20img = "d20 black"
    @State private var D12img = "d12 black"

    @State var WhichBckGrnd:String="background-wood-grain";
    @State var currBckGrnd=1;
    @State var sound=1;
    @State var rollValue=5;
    @State var rollImage="5.circle.fill"
    @State var soundIcon="speaker.wave.3.fill"
    
    var Dice:[Die]=[Die(name: "D20",n:20,imageName: "d20"),
                    Die(name: "D6",n: 6,imageName: "d20")]
    
    var BckGrnds:[String]=["background-cloth",
                           "background-plain",
                           "background-wood-cartoon",
                           "background-wood-grain"]
    var body: some View {
        ZStack{
            Image(WhichBckGrnd)
                .resizable()
                .ignoresSafeArea()
            Spacer()
            VStack {

                Spacer()
                HStack{
                    Spacer()
                    Button {
                        changeBckGrnd()
                    } label : {
                        Image(systemName: "paintpalette")
                    }
                    Spacer()
                    Spacer()
                    Button {
                        soundChange()
                    } label: {
                        Image(systemName: soundIcon)
                    }
                    Spacer()
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                .font(.caption)
                
                Spacer()
                VStack {
                    Text("Dice Roll: ")
                    Image(systemName: rollImage)
                        .font(.system(size: 200))
                }.foregroundColor(.white)
        
                Spacer()
                VStack{
                    Text("Pick Dice")
                    HStack{
                        Spacer()
                        SelectButton(isSelected: $isD20, color: .blue, text: "D20", img1: "D20 black", img2: "D20 blue")
                            .onTapGesture {
                                isD20.toggle()
                                if isD20 {
                                    n=20
                                    isD6=false
                                    isD12=false
                                }
                            }
                        SelectButton(isSelected: $isD6, color: .blue, text: "D6", img1: "D12 black", img2: "D12 blue")
                            .onTapGesture {
                                isD6.toggle()
                                if isD6 {
                                    n=6
                                    isD20=false
                                    isD12=false
                                }
                            }
                        SelectButton(isSelected: $isD12, color: .blue, text: "D12", img1: "D12 black", img2: "D12 blue")
                            .onTapGesture {
                                isD12.toggle()
                                if isD12{
                                    n=12
                                    isD20=false
                                    isD6=false
                                }
                            }
                        Spacer()
                    }
                }

                Spacer()
                
                Button{
                    rollDice()
                    if(sound==1)
                    {
                        AudioManager.shared.StartPlayer(track: ("roll"+String(Int.random(in: 1...2))))
                    }
                    
                }label: {
                   Image("button")
                }
                Spacer()
                }
            }
        }
    
    func changeBckGrnd()
    {
        currBckGrnd+=1;
        if(currBckGrnd>BckGrnds.count) {
            currBckGrnd=0;
    }
        WhichBckGrnd=BckGrnds[currBckGrnd]
    }
    
    func rollDice() {
        rollValue=Int.random(in: 1...n)
        rollImage=String(rollValue)+".circle.fill"
    }
    
    func soundChange() {
        if((sound) != 0){
            sound=0;
            soundIcon="speaker.slash.fill"
        }
        else
        {
            sound=1;
            soundIcon="speaker.wave.3.fill"
        }
    }
}



struct D20View_Previews: PreviewProvider {
    static var previews: some View {
        D20View()
    }
}
