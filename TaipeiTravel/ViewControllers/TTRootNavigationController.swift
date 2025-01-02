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

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let transition = CATransition()
        transition.duration = 0.5 // 動畫持續時間
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut) // 動畫速度曲線
        transition.type = .fade // 動畫類型
        self.view.layer.add(transition, forKey: nil)
        super.pushViewController(viewController, animated: false) // 關閉預設動畫
    }
}
