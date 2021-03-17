//
//  ViewController.swift
//  TestProject
//
//  Created by AEIONE on 15/03/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        AuctionService.shared.getAuction { result in
            
            switch result {
            
            case .success(let auction):
                print("the auction is test \(String(describing: auction.description))")
            case .failure(let error):
                print("the error is test \(String(describing: error.localizedDescription))")
            }
            
        }
        
    }


}

