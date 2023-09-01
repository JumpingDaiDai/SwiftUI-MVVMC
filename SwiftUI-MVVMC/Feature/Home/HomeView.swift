//
//  HomeView.swift
//  SwiftUIMVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeFlowCoordinator: HomeFlowCoordinator
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 50) {
                    Text(homeViewModel.homeModel?.homeInfo ?? "")
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color.gray)
                    
                    VStack (spacing: 20) {
                        Text("Go to User Page")
                            .onTapGesture {
                                homeFlowCoordinator.push(to: .userFlow)
                            }
                    }
                    
                    Button {
                        homeViewModel.fetchHomeData()
                    } label: {
                        Text("fetch home data")
                    }
                }
                
                bindingNavigation(to: .userFlow, selection: $homeFlowCoordinator.page, coordinator: homeFlowCoordinator)
            }
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

extension HomeView {
    
    @ViewBuilder
    private func bindingNavigation(to page: HomeFlowCoordinator.HomePage,
                                   selection:Binding<HomeFlowCoordinator.HomePage?>,
                                   coordinator: HomeFlowCoordinator) -> some View {
        
        NavigationLink(tag: page, selection: selection) {
            coordinator.build(page: page)
        } label: {
            EmptyView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(webService: WebService()))
            .environmentObject(HomeFlowCoordinator(webService: WebService()))
    }
}
