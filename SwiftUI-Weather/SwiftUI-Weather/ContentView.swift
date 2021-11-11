//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Lado Tsivtsivadze on 11/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack() {
            BackgroundView(isNight: $isNight)
            
            VStack {
                HeadlineTextView(headlineText: "Cupertino, CA")
                
                VStack(spacing: 10) {
                    MainWeatherView(isNight: $isNight, temperature: 76)
                    
                    .padding(.bottom, 40)
                    
                    HStack(spacing: UIScreen.main.bounds.width * 0.3 / 6) {
                        WeatherDayView(dayOfWeek: "MON",
                                       iconName: "sun.max.fill",
                                       temperature: 76)
                        
                        WeatherDayView(dayOfWeek: "TUE",
                                       iconName: "cloud.sun.fill",
                                       temperature: 70)
                        
                        WeatherDayView(dayOfWeek: "WED",
                                       iconName: "cloud.sun.fill",
                                       temperature: 71)
                        
                        WeatherDayView(dayOfWeek: "THU",
                                       iconName: "cloud.fill",
                                       temperature: 65)
                        
                        WeatherDayView(dayOfWeek: "FRI",
                                       iconName: "cloud.rain.fill",
                                       temperature: 60)
                    }
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(weatherText: "Change Day Time")
                }
                Spacer()
            }
        }
    }
}

struct WeatherDayView: View {
    
    let imageSize = UIScreen.main.bounds.width * 0.14
    
    var dayOfWeek: String
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize, height: imageSize)
            
            Text("\(temperature)°")
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    var color1: Color {
        isNight ? .black : .blue
    }
    var color2: Color {
        isNight ? .gray : Color("lightblue")
    }
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [color1, color2]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct HeadlineTextView: View {
    
    var headlineText: String
    
    var body: some View {
        Text(headlineText)
            .font(.custom("Arial", size: 32))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    @Binding var isNight: Bool
    var iconName: String {
        isNight ? "moon.stars.fill" : "cloud.sun.fill"
    }
    var temperature: Int
    
    var body: some View {
        Image(systemName: iconName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
    }
}
