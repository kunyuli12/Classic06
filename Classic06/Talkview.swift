//
//  Talkview.swift
//  Classic06
//
//  Created by 暨大附中4 on 2021/9/27.
//

import SwiftUI

struct Talkview: View {
  //  @Binding var talkbuttom : Bool
    @State var damo = msgs
    @State var speak = ""
    @State var onoff = true
    var body: some View {
        ZStack {
            VStack {
                List(damo){
                    item in
                    if (item.ismytalk == false) || (item.speak.count > 10) {
                        LeftView(item: item.speak)
                    }else{
                        RightView(item: item.speak)
                    }
                }.frame(maxWidth:.infinity )
                .frame(height: 220)
                VStack {
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(maxWidth:.infinity )
                                .frame(height: 44)
                                .cornerRadius(10)
                                .foregroundColor(Color(#colorLiteral(red: 0.9795872848, green: 0.9403650732, blue: 1, alpha: 1)))
                                .padding(.leading,20)
                            TextField("內容", text: $speak)
                                .frame(maxWidth:.infinity )
                                .frame(height: 40)
                                .padding(.leading,35)
                        }
                        GradientButton() {
                            damo.append(msg(speak: speak,ismytalk:onoff))
                            onoff.toggle()
                            print("debeg")
                        }

                    }
                    Spacer()
                }
            }
        }.frame(width: 200, height: 270, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color(#colorLiteral(red: 0.8557078142, green: 0.902263975, blue: 1, alpha: 1)))
        .padding(.bottom,20)
        
        
    }
}

struct Talkview_Previews: PreviewProvider {
    static var previews: some View {
        Talkview()
    }
}


struct LeftView: View {
    var item : String
    
    var body: some View{
        HStack{
            Image("A2")
                .resizable()
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ZStack {
                contactview()
                Text("恐龍\(item)")
                    .font(.body)
            }
            Spacer()
        }.frame(maxWidth:.infinity )
        .background(Color.clear)
        
    }
}
struct RightView: View {
    var item : String
    var body: some View{
        HStack{
            Spacer()
            ZStack {
                contactviewTurn()
                Text("白熊\(item)")
                    .font(.body)
            }
            Image("A1")
                .resizable()
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }.frame(maxWidth:.infinity )
        .background(Color.clear)
        
    }
}
struct msg:Identifiable {
    var id = UUID()
    var speak : String
    var ismytalk =  false
    
}
// let 他宣告的東西不能改變(常數)
let msgs = [msg(speak:"你好啊～～")
]

struct GradientButton: View {
    
    
    var complete:()->Void
    
    var body: some View {
        Button(action: {
            complete()
            
        }, label: {
            VStack {
                Spacer()
                Image(systemName: "paperplane.circle")
                    .resizable()
                    .frame(width:40, height: 40)
                    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.9))
                    .cornerRadius(25)
                Spacer()
            }.foregroundColor(.black)
            .padding(.trailing,10)
        })
    }
}
