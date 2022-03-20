//
//  File.swift
//  KonturTestProject
//
//  Created by Даниил Ярмоленко on 16.03.2022.
//

import Foundation
class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    init() {}
    
    func rocketFetch(urlString: String, responce: @escaping (RocketModel?, Error?) -> Void){
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
                
            case .success(let data):
                do{
                    let rocketData = try JSONDecoder().decode(RocketModel.self, from: data)
                    responce(rocketData, nil)
                } catch let jsonError{
                    print("JSON prroblem", jsonError)
                }
                
            case .failure(let error):
                print("Error request data \(error)")
                responce(nil, error)
            }
        }
    }
    
    func launchFetch(urlString: String, responce: @escaping (LaunchModel?, Error?) -> Void){
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
                
            case .success(let data):
                do{
                    let launchData = try JSONDecoder().decode(LaunchModel.self, from: data)
                    responce(launchData, nil)
                } catch let jsonError{
                    print("JSON prroblem", jsonError)
                }
                
            case .failure(let error):
                print("Error request data \(error)")
                responce(nil, error)
            }
        }
    }
}
