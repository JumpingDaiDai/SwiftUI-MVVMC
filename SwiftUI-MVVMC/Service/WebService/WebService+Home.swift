//
//  WebService+Home.swift
//  SwiftUI-MVVMC
//
//  Created by jason_chung on 2023/8/31.
//

import Foundation

extension WebService {
    
    func fetchHomeData(completion: @escaping (HomeModel) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let homeModel = HomeModel(homeInfo: "Home Info")
            completion(homeModel)
        }
    }
}
