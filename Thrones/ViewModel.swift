//
//  ViewModel.swift
//  Thrones
//
//  Created by Teboho Mohale on 2023/02/13.
//

import Foundation

class apiCall {
    func getUsers(completion:@escaping ([User]) -> ()) {
        guard let url = URL(string: "https://thronesapi.com/api/v2/Characters") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let users = try! JSONDecoder().decode([User].self, from: data!)
            DispatchQueue.main.async {
                completion(users)
            }
        }
        .resume()
    }
}
