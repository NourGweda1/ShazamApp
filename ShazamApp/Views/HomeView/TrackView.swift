//
//  TrackView.swift
//  ShazamApp
//
//  Created by Nour Gweda on 23/08/2023.
//

import SwiftUI
import Kingfisher
import UIImageColors

struct TrackView: View {

    //MARK: - Binding variables
    @Binding var track: Track?
    @Binding var firstColor: Color?
    @Binding var secondColor: Color?
    @Binding var thirdColor: Color?

    //MARK: - State variables
    @State private var internalImage: UIImage? = nil
    @State private var extractedColors: UIImageColors?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            Text("Welcome to SBN 🤟")
                .font(.title.bold())
                .foregroundColor(.customColors.lightBrown)
            
            PlaceHolderView()
                .padding(.top, 150)
                .isHidden(track != nil, remove: true)

            Group {
                HStack {
                    Spacer()
                    
                    KFImage(track?.artwork)
                        .onSuccess { result in
                            self.internalImage = result.image
                            let colors = internalImage?.getColors()
                            DispatchQueue.main.async {
                                self.extractedColors = colors
                                firstColor = Color(extractedColors?.primary ?? UIColor.red)
                                secondColor = Color(extractedColors?.secondary ?? UIColor.red)
                                thirdColor = Color(extractedColors?.background ?? UIColor.red)
                            }
                        }
                        .placeholder {
                            Circle()
                                .fill(Color.customColors.lightYellow.opacity(0.5))
                                .frame(width: 280, height: 300)
                                .overlay(
                                    Image(systemName: "music.note")
                                        .foregroundColor(.customColors.lightBrown)
                                )
                        }
                        .resizable()
                        .frame(width: 280, height: 300)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    
                    Spacer()
                }
                
                Text("\(track?.title ?? "") 🎶")
                    .font(.title.bold())
                    .foregroundColor(.customColors.lightBrown)
                    .padding(.top, 10)
                
                Text("By: \(track?.artist ?? "")")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Text("Genres: \(track?.genres.joined(separator: ", ") ?? "")")
                    .font(.title3)
                    .foregroundColor(.gray)
            }.isHidden(track == nil)

        }.frame(maxWidth: .infinity, alignment: .leading)
         .padding(.horizontal, 20)
    }
}
