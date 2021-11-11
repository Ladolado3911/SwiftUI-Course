//
//  VideoDetailView.swift
//  SwiftUI-List-Starter
//
//  Created by Lado Tsivtsivadze on 11/10/21.
//

import SwiftUI

struct VideoDetailView: View {
    
    var video: Video
    
    var body: some View {
        Image(video.imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 150)
            .cornerRadius(12)
        
    }
}
