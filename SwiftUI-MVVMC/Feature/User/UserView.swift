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
                    self.userFlowCoordinator.page = .setting
                }
            
            NavigationLink(tag: UserFlowCoordinator.UserPage.setting, selection: $userFlowCoordinator.page) {
                userFlowCoordinator.build(page: .setting)
            } label: {
                EmptyView()
            }
        }
        .navigationBarTitle("User", displayMode: .inline)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(userViewModel: UserViewModel())
            .environmentObject(UserFlowCoordinator())
    }
}
