//
//  SwiftUI_MVVMCApp.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import SwiftUI

@main
struct SwiftUI_MVVMCApp: App {
    
    @StateObject var homeFlowCoordinator = HomeFlowCoordinator(webService: WebService())
    
    var body: some Scene {
        WindowGroup {
            homeFlowCoordinator.build()
                .environmentObject(homeFlowCoordinator)
        }
    }
}
