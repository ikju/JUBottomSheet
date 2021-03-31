//
//  ViewController.swift
//  JUBottomSheet
//
//  Created by ikjus1@naver.com on 03/31/2021.
//  Copyright (c) 2021 ikjus1@naver.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionAlert(_ sender: Any) {
        if #available(iOS 13.0, *) {
                    JUBottomSheet(title: "와 이게 되네", confirm: "확인버튼도 커스텀할 수 있네") {
                        print("completion handler 까지!?!")
                    }.show(in: self.view)
                } else {
                    // Fallback on earlier versions
                }
    }
}

