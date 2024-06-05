//
//  ViewController.swift
//  Products
//
//  Created by pradeephcl on 05/13/2024.
//  Copyright (c) 2024 pradeephcl. All rights reserved.
//

import UIKit
import SwiftUI
import Products

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func button(_ sender: Any) {
        let productView = Products.ProductListView<LaunchManager, Any>(userName: "")
        let hostView = UIHostingController(rootView: productView)
        self.navigationController?.pushViewController(hostView, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
}

struct LaunchManager: ProductManagerDelegate {
    func dismissProductsView() {
    }
}
