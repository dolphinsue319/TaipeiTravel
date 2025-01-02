//
//  TTRootNavigationController.swift
//  TaipeiTravel
//
//  Created by Kedia on 2024/12/30.
//

import UIKit

class TTRootNavigationController: UINavigationController {

    required init?(coder aDecoder: NSCoder) {
        super.init(rootViewController: TTAttractionsViewController())
        self.view.backgroundColor = .systemBackground
    }
}
