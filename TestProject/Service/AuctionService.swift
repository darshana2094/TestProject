//
//  AuctionService.swift
//  TestProject
//
//  Created by AEIONE on 16/03/21.
//

import Foundation

enum NetworkError:String, Error {
    case badURL = "Invalid URL"
}

class AuctionService {
    static let shared = AuctionService()
    
    private init() { }


    func getAuction(completion: @escaping (Result<Auction,NetworkError>) -> Void) {
        guard let url = URL(string: Constants.url) else { return }
        let request = URLRequest(url: url)
      

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badURL))
                return
            }

            guard let data = data else {
               
                return
            }

            do {
                let auction = try JSONDecoder().decode(Auction.self, from: data)
                completion(.success(auction))
                
            } catch {
                completion(.failure(.badURL))
               
            }
        }.resume()
    }
    
    deinit {
            print("deinit")
        }
}
