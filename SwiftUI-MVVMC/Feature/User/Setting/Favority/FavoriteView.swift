//
//  FavoriteView.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

struct FavoriteView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var favoriteViewModel: FavoriteViewModel
    @Binding var favorite: String
    
    var body: some View {
        ZStack {
            List {
                ForEach(favoriteViewModel.favoriteList, id: \.self) { text in
                    Button {
                        print("\(text) clicked")
                        favorite = text
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text(text)
                    }
                }

            }
        }
        .navigationBarTitle("Favorite", displayMode: .inline)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(favoriteViewModel: FavoriteViewModel(), favorite: .constant(""))
    }
}
