//
//  UserFlowCoordinator.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

class UserFlowCoordinator: ObservableObject {
    
    enum UserPage: Hashable {
        case user
        case setting
        case favorite
    }
    
    // MARK: View Model
    let userViewModel = UserViewModel()
    @ObservedObject var settingViewModel = SettingViewModel()
    let favoriteViewModel = FavoriteViewModel()
    
    @Published var page: UserPage? = .user
    
    @ViewBuilder
    func build(page: UserPage = .user) -> some View {
        
        let _ = print("UserFlowCoordinator.build: \(page)")
        switch page {
        case .user:
            userView()
        case .setting:
            settingView()
        case .favorite:
            favoriteView()
        }
    }
    
    // MARK: View Creation Methods
    @ViewBuilder
    private func userView() -> some View {
        UserView(userViewModel: userViewModel)
    }
    
    @ViewBuilder
    private func settingView() -> some View {
        SettingView(settingViewModel: settingViewModel)
            .environmentObject(self)
    }
    
    @ViewBuilder
    private func favoriteView() -> some View {
        FavoriteView(favoriteViewModel: favoriteViewModel, favorite: $settingViewModel.favorite)
    }
}
