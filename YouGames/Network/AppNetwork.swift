//
//  AppNetwork.swift
//  YouGames
//
//  Created by sona setiana on 19/06/22.
//

import Foundation

struct AppNetwork{

    static func listRequest<T: Decodable>(
         endPoint: String,
         resultType: T,
         onSuccess: @escaping (ListResponse<T>) -> Void,
         onError: @escaping (String) -> Void
    ){
         request(
            endPoint: endPoint,
            onResponse: { (data, response, _) in
                if response?.statusCode == 200 {
                    let decoder = JSONDecoder()
                    guard let result = try? decoder.decode(ListResponse<T>.self, from: data!) else { return }
                    DispatchQueue.main.async {
                        onSuccess(result)
                    }
                }else {
                    DispatchQueue.main.async {
                        onError("There is an error. Please try again later.")
                    }
                }
            }
         )
    }
    
    static func objectRequest<T: Decodable>(
         endPoint: String,
         resultType: T,
         onSuccess: @escaping (T) -> Void,
         onError: @escaping (String) -> Void
     ){
         request(
            endPoint: endPoint,
            onResponse: { (data, response, _) in
                if response?.statusCode == 200 {
                    let decoder = JSONDecoder()
                    guard let result = try? decoder.decode(T.self, from: data!) else { return }
                    DispatchQueue.main.async {
                        onSuccess(result)
                    }
                }else {
                    DispatchQueue.main.async {
                        onError("There is an error. Please try again later.")
                    }
                }
            }
         )
     }
    
    private static func request(
        endPoint: String,
        onResponse: @escaping (Data?, HTTPURLResponse?, Error?) -> Void
    ){
        guard let url = URL(string: AppConfigs.BASE_URL+endPoint) else {
            onResponse(nil, nil, nil)
            return
        }
        print("Request: ",url.absoluteString)
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = true
        config.waitsForConnectivity = true
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url){ (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            onResponse(data, response, error)
        }
            
        task.resume()
    }
}
