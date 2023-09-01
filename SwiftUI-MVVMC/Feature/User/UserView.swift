//
//  UserView.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

struct UserView: View {
    
    @EnvironmentObject var userFlowCoordinator: UserFlowCoordinator
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            Text("Go to Setting")
                .onTapGesture {
                    userFlowCoordinator.push(to: .setting)
                }
            
            bindingNavigation(to: .setting, selection: $userFlowCoordinator.page, coordinator: userFlowCoordinator)
        }
        .navigationBarTitle("User", displayMode: .inline)
    }
}

extension UserView {
    
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

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(userViewModel: UserViewModel())
            .environmentObject(UserFlowCoordinator())
    }
}
