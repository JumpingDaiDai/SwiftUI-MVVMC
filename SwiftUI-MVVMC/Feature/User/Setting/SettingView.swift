//
//  SettingView.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var userFlowCoordinator: UserFlowCoordinator
    @ObservedObject var settingViewModel: SettingViewModel
    
    @State var action: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    userFlowCoordinator.push(to: .favorite)
                } label: {
                    Text((settingViewModel.favorite != "") ? settingViewModel.favorite : "Choose Favorite")
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
            }

            bindingNavigation(to: .favorite, selection: $userFlowCoordinator.page, coordinator: userFlowCoordinator)
        }
        .navigationBarTitle("Setting", displayMode: .inline)
    }
}

extension SettingView {
    
    @ViewBuilder
    private func bindingNavigation(to page: UserFlowCoordinator.UserPage,
                                   selection:Binding<UserFlowCoordinator.UserPage?>,
                                   coordinator: UserFlowCoordinator) -> some View {
        
        NavigationLink(tag: page, selection: selection) {
            coordinator.build(page: page)
        } label: {
            EmptyView()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(settingViewModel: SettingViewModel())
            .environmentObject(UserFlowCoordinator())
    }
}
