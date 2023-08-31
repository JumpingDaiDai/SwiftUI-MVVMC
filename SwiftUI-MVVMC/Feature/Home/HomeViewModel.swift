//
//  HomeViewModel.swift
//  SwiftUIMVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    let webService: WebService
    
    @Published var homeModel: HomeModel? = nil
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func fetchHomeData() {
        webService.fetchHomeData { [weak self] model in
            self?.homeModel = model
        }
    }
}
