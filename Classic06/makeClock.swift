//
//  makeClock.swift
//  Classic06
//
//  Created by 暨大附中4 on 2021/9/26.
//

import SwiftUI

struct makeClock: View {
    
    @State var number = Date()
    @State var timeText = ""
    @State var timeText1 = ""
    @State var isColor = false
    @State var change = false
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            
            Rectangle()
                .linearGradientBackground(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))])
                .ignoresSafeArea()
            //按鈕
            Rectangle()
                .frame(width: 20, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .foregroundColor(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                .offset(x: -105, y: -110)
            Rectangle()
                .frame(width: 20, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .foregroundColor(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                .offset(x: -105, y: -70)
            //外誆
            Rectangle()
                .frame(width: 215, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(#colorLiteral(red: 0.6993972081, green: 0.3770530088, blue: 0.5051243357, alpha: 1)))
                .cornerRadius(20)
                .padding(.bottom,20)
                .padding(.leading,20)
            //錶帶
            Rectangle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 540, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .linearGradientBackground(colors: [Color(#colorLiteral(red: 0.1527006662, green: 0.1527006662, blue: 0.1527006662, alpha: 1)),Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))])
                .padding(.leading,20)
            Rectangle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 540, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .linearGradientBackground(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),Color(#colorLiteral(red: 0.1635554024, green: 0.1770850083, blue: 0.196740165, alpha: 1))])
            //外誆
            Rectangle()
                .frame(width: 215, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .linearGradientBackground(colors: [Color(#colorLiteral(red: 0.8702014594, green: 0.5965808076, blue: 0.4975448564, alpha: 1)),Color(#colorLiteral(red: 0.8119844543, green: 0.4304550272, blue: 0.5789689485, alpha: 1))])
                .cornerRadius(20)
                .padding(.bottom,30)
            Rectangle()
                .frame(width: 9, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(60)
                .offset(x: 112, y: 0)
            
            VStack {
                TabView{
                    ZStack{
                        Rectangle()
                            .frame(width: 200, height: 280, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .linearGradientBackground(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),Color(#colorLiteral(red: 0.3404959072, green: 0.3686623595, blue: 0.4095812183, alpha: 1))])
                            //.cornerRadius(10)
                            .padding(.bottom,30)
                        VStack {
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .frame(width: 0, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                    .cornerRadius(10)
                                    .overlay(Rectangle().stroke(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)),lineWidth: 6).frame(width: 170, height: 90).cornerRadius(2))
                                    .offset(x: 5, y: 5)
                                Rectangle()
                                    .frame(width: 0, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                    .cornerRadius(10)
                                    .overlay(Rectangle().stroke(Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)),lineWidth: 6).frame(width: 170, height: 90).cornerRadius(2))
                                    .offset(x: -5, y: -5)
                            }
                            Spacer()
                            Spacer()
                        }
                        
                        VStack {
                            Spacer()
                            Text(timeText)
                               /* .onReceive(timer){ input in
                                    number = input
                                    let dataformate = DateFormatter()
                                    dataformate.dateFormat = "YYYY/MM/dd"
                                    timeText = dataformate.string(from: input)
                                }*/
                                .font(.body)
                                .foregroundColor(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                            Text(timeText1)
                                .onReceive(timer){ input in
                                    number = input
                                    let dataformate = DateFormatter()
                                    dataformate.dateFormat = "HH:mm:ss"
                                    timeText1 = dataformate.string(from: input)
                                }.font(.largeTitle)
                                .foregroundColor(Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)))
                                .padding(.bottom,20)
                            Spacer()
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Oclock()
                            Spacer()
                            Spacer()
                        }
                    }
                    Talkview()
                    ZStack{
                        VStack{
                            HStack {
                                Text("身體狀況")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Button(action:{
                                        self.change.toggle() } ) {
                                    Image(systemName: "link.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                                }
                            }
                            ZStack {
                                sprotimage(useimage: "heart.circle" , imagecolors: .red,imagecolors2: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                Rectangle()
                                    .frame(width: change ? 60 : 0 )
                                    .frame(height:30)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                                    .offset(x: -13, y: 0)
                            }
                            ZStack {
                                sprotimage(useimage: "figure.walk.circle",imagecolors: .accentColor,imagecolors2:  Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                Rectangle()
                                    .frame(width:change ? 50 : 0 )
                                    .frame(height:30)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                                    .offset(x: -17, y: 0)
                                
                            }
                            ZStack {
                                sprotimage(useimage: "eye.circle",imagecolors: .green,imagecolors2:  Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                Rectangle()
                                    .frame(width:change ? 80 : 0 )
                                    .frame(height:30)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                                    .offset(x: -3, y: 0)

                            }
                            
                        }
                    }.frame(width: 200, height: 275, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color(#colorLiteral(red: 0.1386817893, green: 0.1340089271, blue: 0.1306299898, alpha: 1)))
                    .padding(.bottom,30)

                }.frame(width: 200, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                .tabViewStyle(PageTabViewStyle())
                
            }
        }
    }
}

struct makeClock_Previews: PreviewProvider {
    static var previews: some View {
        makeClock()
    }
}

extension View{
    func angularGradientGlow(colors: [Color]) -> some View {
        self.overlay(AngularGradient(gradient: Gradient(colors: colors), center: .center, angle: .degrees(0.0)))
            .mask(self)
    }
    
    func linearGradientBackground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
struct Oclock : View  {
 @State var talkbuttom = false
    var width = UIScreen.main.bounds.width
    var body: some View {
        
        HStack {
            Spacer()
            ZStack {
                Circle()
                    .fill(Color(talkbuttom ? .black : .white).opacity(0.3))
                    .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top,70)
                ForEach(0..<60,id: \.self){i in
                    Rectangle()
                        .fill(Color(talkbuttom ? .white : .black ))
                        .frame(width: 2.3, height: (i % 5) == 0 ? 7: 2.5)
                        .offset(y: (width - 240) / 2)
                        .rotationEffect(.init(degrees: Double(i) * 6))
                    Rectangle()
                        .fill(Color(talkbuttom ? .white : .black ))
                        .frame(width: 1.7, height: (width - 240) / 2)
                        .offset(y: -(width - 180) / 4)
                        
                    Rectangle()
                        .fill(Color(talkbuttom ? .white : .black ))
                        .frame(width: 1, height: (width - 200) / 2)
                        .offset(y: -(width - 200) / 4)
                       
                    Rectangle()
                        .fill(Color(talkbuttom ? .white : .black ))
                        .frame(width: 2, height: (width - 240) / 2)
                        .offset(y: -(width - 240) / 4)
                       
                    Circle()
                        .fill(Color(talkbuttom ? .white : .black ))
                        .frame(width: 5, height: 5)
                }.padding(.top,70)
            
            }
            Spacer()
            Spacer()
            VStack {
                Spacer()
                Spacer()
                Button(action: {self.talkbuttom.toggle()}){
                    Image(systemName:"moon.fill")
                        .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(talkbuttom ? .white : .black)
                        .padding()
                        .background(Color(talkbuttom ? .black : .white))
                        .cornerRadius(20)
                }
                .padding(.bottom,5)
                Button(action: {}){
                    Image(systemName:"person.circle")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                }.padding(.bottom,40)
                Spacer()
            }
            
            Spacer()
        }
    }
    
}
struct sprotimage : View {
    @State var useimage : String = " "
    @State var imagecolors : Color
    @State var imagecolors2 : Color
    var body: some View {
        HStack {
            Image(systemName: useimage)
                .resizable()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(imagecolors)
                .padding(.leading,10)
                .padding(.bottom,10)
            Rectangle()
                .frame(maxWidth:.infinity )
                .frame(height:30)
                .cornerRadius(10)
                .foregroundColor(imagecolors2)
        }.padding(.trailing,20)
        
    }
    
}
