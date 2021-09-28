//
//  Clock.swift
//  Classic06
//
//  Created by 暨大附中4 on 2021/9/26.
//

import SwiftUI

struct Clock: View {
   @State var isBlack = false
    var body: some View {
        NavigationView{
           homeview(isBlack: $isBlack)
            .navigationBarHidden(true)
            .preferredColorScheme(isBlack ? .dark : .light)
        }
    }
}

struct Clock_Previews: PreviewProvider {
    static var previews: some View {
        Clock()
    }
}
struct homeview: View {
    @Binding var isBlack : Bool
    var width = UIScreen.main.bounds.width
    @State var curreantTime = Time(min: 0, sec: 0, hour: 0)
    @State var receiver = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                Text("Clock")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                Spacer(minLength: 0)
                Button(action: {isBlack.toggle()}){
                    Image(systemName: isBlack ? "sun.min.fill" : "moon.fill")
                        .font(.system(size:22))
                        .foregroundColor(isBlack ? .black : .white)
                        .padding()
                        .background(Color.primary)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
            }
            .padding()
            Spacer(minLength: 0)
            ZStack{
                Circle()
                    .fill(Color(isBlack ? .white : .black).opacity(0.1))
                ForEach(0..<60,id: \.self){i in
                    Rectangle()
                        .fill(Color.primary)
                        .frame(width: 2, height: (i % 5) == 0 ? 15: 5)
                        .offset(y: (width - 110) / 2)
                        .rotationEffect(.init(degrees: Double(i) * 6))
                }
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 2, height: (width - 180) / 2)
                    .offset(y: -(width - 180) / 4)
                    .rotationEffect(.init(degrees: Double(curreantTime.sec) * 6))
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 4, height: (width - 200) / 2)
                    .offset(y: -(width - 200) / 4)
                    .rotationEffect(.init(degrees: Double(curreantTime.min) * 6))
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 4.5, height: (width - 240) / 2)
                    .offset(y: -(width - 240) / 4)
                    .rotationEffect(.init(degrees: Double(curreantTime.hour + (curreantTime.min / 60)) * 30))
                Circle()
                    .fill(Color.primary)
                    .frame(width: 15, height: 15)
            }
                .frame(width: width - 80, height: width - 80)
            Text(Locale.current.localizedString(forRegionCode: Locale.current.regionCode!) ?? "")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top,35)
            Text(getTime())
                .font(.system(size: 45))
                .fontWeight(.heavy)
                .padding(.top,10)
            Spacer(minLength: 0)
        }
        .onAppear(perform: {
            let calender = Calendar.current
            let min = calender.component(.minute,from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour,from: Date())
            
            withAnimation(Animation.linear(duration: 0.1)){
                self.curreantTime = Time(min: min, sec: sec, hour: hour)
            }
        })
        .onReceive(receiver){ (_)in
            let calender = Calendar.current
            let min = calender.component(.minute,from: Date())
            let sec = calender.component(.second, from: Date())
            let hour = calender.component(.hour,from: Date())
            
            withAnimation(Animation.linear(duration: 0.1)){
                self.curreantTime = Time(min: min, sec: sec, hour: hour)
            }
            
            
        }
        
    }
    func getTime() -> String {
        let format = DateFormatter()
        format.dateFormat = "hh,mm a"
        return format.string(from: Date())
       }
    }

struct Time {
    var min : Int
    var sec : Int
    var hour : Int
    
}
