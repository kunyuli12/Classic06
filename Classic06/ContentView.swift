//
//  ContentView.swift
//  Classic06
//
//  Created by 暨大附中4 on 2021/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var number = 0
    var body: some View {
        VStack{
            OldVIew()
                .padding()
            NewVIew()
                .padding()
            Text("view\(number)")
            Button(action: {
                number = number + 1
            }, label: {
                Text("按鈕")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//舊版用法
struct OldVIew : View {
    
    @ObservedObject var age = Age()
    
    var body: some View{
        VStack {
            Text("ss")
            
            Text("Age:\(age.number)")
            
            HStack{
                Button(action: {
                    age.number += 1
                }, label: {
                    Text("Age + 1")
                })
                Image(systemName:
                        "heart.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(age.ONOFF ? Color(.red) : Color(.gray))
                    .onTapGesture {
                        age.ONOFF.toggle()
                    }
            }
            
        }
    }
}
//新版用法
struct NewVIew : View {
    @StateObject var age = Age()
    var body: some View{
        VStack {
            Text("ss")
            Text("Age:\(age.number)")
            HStack{
                Button(action: {
                    age.number += 1
                }, label: {
                    Text("Age + 1")
                })
                
                Image(systemName: "heart.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(age.ONOFF ? Color(.red) : Color(.gray))
                    .onTapGesture {
                        age.ONOFF.toggle()
                    }
            }
        }
    }
}
