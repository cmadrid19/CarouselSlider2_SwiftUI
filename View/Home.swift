//
//  Home.swift
//  CustomCarouselSlider2
//
//  Created by Maxim Macari on 23/4/21.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab: Trip = trips[0]
    
    //disable bounces
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack(){
            //to get screen size for image
            GeometryReader{ proxy in
                let frame = proxy.frame(in: .global)
                
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height, alignment: .center)
                    //why is using corner radius
                    //because image in swiftui using fill will require cornerradius or clipshape to cut the image
                    .cornerRadius(0)
            }
            .ignoresSafeArea()
            
            //Custom carousel
            
            VStack{
                Text("Let's go with")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text("Pocotrip")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                //Carouseel
                VStack {
                    GeometryReader{ geo in
                        let frame = geo.frame(in: .global)
                        
                        TabView(selection: $selectedTab,
                                content:  {
                                    
                                    ForEach(trips){ trip in
                                        Image(trip.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: frame.width - 10, height: frame.height, alignment: .center)
                                            .cornerRadius(4)
                                            .tag(trip)
                                            
                                    }
                                })
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    }
                    //max limit
                    //half of th escreeen
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    Text("\(selectedTab.title)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding(.bottom)
                    
                    //Pagee control from UIKit
                    PageControl(maxPages: trips.count, currentPage: getIndex())
                }
                .padding(.top)
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                //customShape
                .background(Color.white.clipShape(CustomShape()).cornerRadius(10))
                .padding(.horizontal, 18)
                
                Button(action: {
                    
                }, label: {
                    Text("GET STARTED")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                })
                .padding(.top, 30)
                .padding(.horizontal)
            }
            .padding()
        }
    }
    
    //get current page
    func getIndex() -> Int{
        let index = trips.firstIndex{ trip -> Bool in
            return selectedTab.id == trip.id
        } ?? 0
        
        return index
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
