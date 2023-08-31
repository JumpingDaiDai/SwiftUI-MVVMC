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
                                self.homeFlowCoordinator.page = .userFlow
                            }
                    }
                    
                    Button {
                        homeViewModel.fetchHomeData()
                    } label: {
                        Text("fetch home data")
                    }
                }
                
                NavigationLink(tag: HomeFlowCoordinator.HomePage.userFlow, selection: $homeFlowCoordinator.page) {
                    homeFlowCoordinator.build(page: .userFlow)
                } label: {
                    EmptyView()
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel(webService: WebService()))
            .environmentObject(HomeFlowCoordinator(webService: WebService()))
    }
}
