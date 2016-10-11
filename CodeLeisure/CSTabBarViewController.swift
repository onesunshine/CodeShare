//
//  CSTabBarViewController.swift
//  CodeLeisure
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 Mr. All rights reserved.
//

import UIKit

class CSTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
configureViewControllers()
        // Do any additional setup after loading the view.
    }
    func configureViewControllers() {
        // 如果新建一个控制器，需要什么东西
        let vcInfos = [
            [
                "title": "主页",
                "image": "tabbar_1",
                "class": "UIViewController",
            ],
            [
                "title": "消息",
                "image": "tabbar_1",
                "class": "UIViewController",
            ],
            [
                "title": "分享",
                "image": "tabbar_1",
                "class": "UIViewController",
            ],
            [
                "title": "我的",
                "image": "tabbar_1",
                "class": "UIViewController",
            ],
            ]
        
        
        var vcArr : [UINavigationController] = []
        
        for vcInfo in vcInfos {
            // swift 中，通过字符串获取一个类，需要在类名前加上工程名，还需要将类强转一下
            let vc = (NSClassFromString(vcInfo["class"]!) as! UIViewController.Type).init()
            vc.title = vcInfo["title"]
            vc.view.backgroundColor = UIColor.whiteColor()
            
            let navVC = UINavigationController.init(rootViewController: vc)
            vcArr.append(navVC)
            
        }
        self.viewControllers = vcArr
    }
    override func viewDidAppear(animated: Bool) {
        // 重写控制器的生命周期方法时，最好调用父类实现
        super.viewDidAppear(animated)
        let loginVC = UINavigationController.init(rootViewController: CSLoginViewController.init())
        self.presentViewController(loginVC, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
