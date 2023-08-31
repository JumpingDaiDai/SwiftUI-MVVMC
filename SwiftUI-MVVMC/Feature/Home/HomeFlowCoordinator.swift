//
//  HomeFlowCoordinator.swift
//  SwiftUIMVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

final class HomeFlowCoordinator: ObservableObject {
    
    enum HomePage: Hashable {
        case home
        case userFlow
    }
    
    // Flow Coordinator
    @ObservedObject var userFlowCoordinator = UserFlowCoordinator()
    let webService: WebService
    
    // MARK: View Model
    lazy var homeViewModel = HomeViewModel(webService: webService)
    
    @Published var page: HomePage? = .home
    
    // MARK: init
    init(userFlowCoordinator: UserFlowCoordinator = UserFlowCoordinator(), webService: WebService, page: HomePage? = nil) {
        self.userFlowCoordinator = userFlowCoordinator
        self.webService = webService
        self.page = page
    }
    
    
    @ViewBuilder
    func build(page: HomePage = .home) -> some View {
        
        let _ = print("HomeFlowCoordinator.build: \(page)")
        switch page {
        case .home:
            homeView()
        case .userFlow:
            userFlow()
        }
    }
    
    // MARK: View Creation Methods
    @ViewBuilder
    private func homeView() -> some View {
        HomeView(homeViewModel: homeViewModel)
    }
}

// MARK: Flow Control Methods
extension HomeFlowCoordinator {
    
    @ViewBuilder
    private func userFlow() -> some View {
        userFlowCoordinator.build()
            .environmentObject(userFlowCoordinator)
    }
}
