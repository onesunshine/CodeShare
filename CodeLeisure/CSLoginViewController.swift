//
//  CSLoginViewController.swift
//  CodeLeisure
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 Mr. All rights reserved.
//

import UIKit
import SnapKit
import JKCategories
import Alamofire

class CSLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "登录"
        self.view.backgroundColor = UIColor.whiteColor()
        //创建并设置accounTextField
        let accounTextField = UITextField.init()
        accounTextField.placeholder = "请输入邮箱或手机号码"
        accounTextField.font = UIFont.systemFontOfSize(15)
        accounTextField.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(accounTextField)
        //accounTextField自适应
        accounTextField.snp_makeConstraints { (make) in
            make.right.left.equalTo(0)
            make.top.equalTo(100)
            make.height.equalTo(48)
        }
        //accounTextField类型
        accounTextField.layer.borderColor = UIColor.grayColor().CGColor
        accounTextField.layer.borderWidth = 1.0
        
        //设置输入框左边的图片，先给一个UIView
        let accountLeft = UIView.init()
        let accountLfImage = UIImageView.init(image: UIImage.init(named: "用户图标"))
        accountLeft.addSubview(accountLfImage)
        
        accountLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(56, 48))
        }
        accountLfImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        
        
        //创建并设置passWordTextField
        let passWordTextField = UITextField.init()
        passWordTextField.font = UIFont.systemFontOfSize(15)
        passWordTextField.backgroundColor = UIColor.whiteColor()
        passWordTextField.secureTextEntry = true
        self.view.addSubview(passWordTextField)
        passWordTextField.snp_makeConstraints { (make) in
            make.right.left.equalTo(0)
            make.top.equalTo(accounTextField.snp_bottom)
            make.height.equalTo(48)
        }
        passWordTextField.layer.borderColor = UIColor.grayColor().CGColor
        passWordTextField.layer.borderWidth = 1.0
        //设置输入框左边的图片，先给一个UIView
        let passWordLeft = UIView.init()
        let passWordRhImage = UIImageView.init(image: UIImage.init(named: "用户图标"))
        passWordLeft.addSubview(passWordRhImage)
        
        passWordLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(56, 48))
        }
        passWordRhImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        //忘记密码按钮
        let forgetPass = UIButton.init(type: UIButtonType.Custom)
        forgetPass.titleLabel?.font = UIFont.systemFontOfSize(15)
        forgetPass.setTitle("忘记密码?", forState: UIControlState.Normal)
        forgetPass.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        self.view.addSubview(forgetPass)
        forgetPass.snp_makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(passWordTextField.snp_bottom)
            make.width.equalTo(72)
            make.height.equalTo(56)
        }
        
        //创建登录按钮
        let login = UIButton.init(type: UIButtonType.Custom)
        login.titleLabel?.font = UIFont.systemFontOfSize(15)
        login.setTitle("登录", forState: UIControlState.Normal)
        //设置登录按钮的三种不同的状态下的背景颜色
      
        login.jk_setBackgroundColor(UIColor.greenColor(), forState: UIControlState.Normal)
    
        login.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        login.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: UIControlState.Disabled)
        //设置登录按钮的点击事件
        login.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) in
            Alamofire.request(.POST, "https://www.1000phone.tk", parameters: ["service":"User.Login","phone":accounTextField.text!,"password":passWordTextField.text!], encoding: ParameterEncoding.URLEncodedInURL, headers: nil).responseString(completionHandler: { (response) in
                if response.result.isSuccess{
                    self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
                }else{
                    print("就是任性没有网")
                }
            })
        }
        self.view.addSubview(login)
        login.snp_makeConstraints { (make) in
            make.right.left.equalTo(0)
            make.top.equalTo(forgetPass.snp_bottom).offset(100)
            make.height.equalTo(48)
        }
        
        //导航条上的按钮
        let backBtn = UIButton.init(type: UIButtonType.Custom)
        backBtn.setImage(UIImage.init(named: "返回按钮"), forState: UIControlState.Normal)
        let backBarBtn = UIBarButtonItem.init(customView: backBtn)
        self.navigationItem.leftBarButtonItem = backBarBtn
        
        backBtn.frame = CGRectMake(0, 0, 24, 32)
        let registerBtn = UIButton.init(type: UIButtonType.Custom)
        registerBtn.setTitle("注册", forState: UIControlState.Normal)
        registerBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        let registerBarBtn = UIBarButtonItem.init(customView: registerBtn)
        self.navigationItem.rightBarButtonItem = registerBarBtn
        registerBtn.frame = CGRectMake(0, 0, 44, 32)
        
        backBtn.addTarget(self, action: #selector(self.back), forControlEvents: UIControlEvents.TouchUpInside)
        registerBtn.addTarget(self, action: #selector(self.register), forControlEvents: UIControlEvents.TouchUpInside)

        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func back() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func register() {
        self.navigationController?.pushViewController(CSRegisterViewController.init(), animated: true)
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
