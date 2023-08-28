//
//  PlaceHolderView.swift
//  ShazamApp
//
//  Created by Nour Gweda on 27/08/2023.
//

import SwiftUI

struct PlaceHolderView: View {
    var body: some View {
        
        VStack(alignment: .center) {
            Image(systemName: "music.note.list")
                .font(Font.system(size: 50))
                .foregroundColor(.gray)
                .padding()

            Text("Record Now, know the song you are listining to !")
                .font(.title3)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 30)

        }.frame(maxWidth: .infinity, alignment: .center)
    }
}

struct PlaceHolderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceHolderView()
    }
}
