//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Lado Tsivtsivadze on 11/10/21.
//

import SwiftUI

struct WeatherButton: View {
    
    var weatherText: String
    
    var body: some View {
        Text(weatherText)
            .frame(width: 280, height: 50)
            .background(.white)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
