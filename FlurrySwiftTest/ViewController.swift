//
//  ViewController.swift
//  FlurrySwiftTest
//
//  Created by Yubo Qin on 9/12/19.
//  Copyright © 2019 Flurry. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Flurry_iOS_SDK

class ViewController: UIViewController {
    
    @IBOutlet weak var logButton: UIButton!
    var count = 0
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Flurry.logEvent("Event0")
        
        logButton.rx
            .tap
            .subscribe(onNext: {
                self.count += 1
                Flurry.logEvent("Event \(self.count)")
            })
            .disposed(by: disposeBag)
    }

}

