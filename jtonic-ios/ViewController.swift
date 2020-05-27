//
//  ViewController.swift
//  jtonic-ios
//
//  Created by Antonel Pazargic on 26/05/2020.
//  Copyright © 2020 Antonel Pazargic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: Actions
    @IBAction func onTouchInside(_ sender: UIButton) {
        txtMessage.text = "Fox team is the best!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

