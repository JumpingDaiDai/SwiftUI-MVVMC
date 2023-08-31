//
//  FavoriteViewModel.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    
    @Published var favoriteList = ["Dog", "Cat", "Bird"]
}
