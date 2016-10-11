//
//  CSRegisterViewController.swift
//  CodeLeisure
//
//  Created by 千锋 on 16/10/11.
//  Copyright © 2016年 Mr. All rights reserved.
//

import UIKit
import Alamofire
class CSRegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "注册"
        // Do any additional setup after loading the view.
        
        let username = UITextField.init()
        username.font = UIFont.systemFontOfSize(15)
        username.placeholder = "输入邮箱或手机号码"
        username.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(username)
        username.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(100)
            make.height.equalTo(48)
        }
        
        let leftView = UIView.init()
        let leftImage = UIImageView.init(image: UIImage.init(named: "手机邮箱图标"))
        leftView.addSubview(leftImage)
        leftImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        username.leftView = leftView
        username.leftViewMode = UITextFieldViewMode.Always
        leftView.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(42, 42))
        }
        
        let password = UITextField.init()
        password.font = UIFont.systemFontOfSize(15)
        password.placeholder = "输入密码"
        password.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(password)
        password.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(48)
            make.top.equalTo(username.snp_bottom)
        }
        
        let leftPass = UIView.init()
        let leftPassImage = UIImageView.init(image: UIImage.init(named: "密码图标"))
        password.leftView = leftPass
        password.leftViewMode = UITextFieldViewMode.Always
        leftPass.addSubview(leftPassImage)
        leftPass.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(42, 42))
        }
        leftPassImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        
        let code = UITextField.init()
        code.font = UIFont.systemFontOfSize(15)
        code.placeholder = "输入验证码"
        code.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(code)
        code.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(password.snp_bottom).offset(16)
            make.height.equalTo(48)
        }
        
        let codeLeft = UIView.init()
        let codeLeftImage = UIImageView.init(image: UIImage.init(named: "验证信息图标"))
        code.leftView = codeLeft
        code.leftViewMode = UITextFieldViewMode.Always
        codeLeft.addSubview(codeLeftImage)
        codeLeftImage.snp_makeConstraints { (make) in
            make.center.equalTo(0)
        }
        codeLeft.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(42, 42))
        }
        
        let codeRight = UIView.init()
        let codeRightBtn = UIButton.init(type: UIButtonType.Custom)
        codeRightBtn.setTitle("获取验证码", forState: UIControlState.Normal)
        codeRightBtn.titleLabel?.font = UIFont.systemFontOfSize(13)
        codeRightBtn.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        codeRightBtn.layer.borderColor = UIColor.lightGrayColor().CGColor
        codeRightBtn.layer.borderWidth = 1.0
        // 设置视图的圆角
        codeRightBtn.layer.cornerRadius = 3.0
        // 设置让背景颜色范围在视图范围内
        codeRightBtn.layer.masksToBounds = true
        codeRightBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
        codeRightBtn.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: UIControlState.Highlighted)
        codeRightBtn.jk_setBackgroundColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        code.rightView = codeRight
        code.rightViewMode = UITextFieldViewMode.Always
        codeRight.snp_makeConstraints { (make) in
            make.height.equalTo(48)
            make.width.equalTo(120)
        }
        codeRight.addSubview(codeRightBtn)
        codeRightBtn.snp_makeConstraints { (make) in
            make.center.equalTo(0)
            //			make.left.equalTo(8)
            //			make.top.equalTo(4)
            make.right.equalTo(-8)
            make.top.equalTo(4)
        }
        
        username.layer.borderWidth = 1.0
        username.layer.borderColor = UIColor.lightGrayColor().CGColor
        password.secureTextEntry = true
        password.layer.borderColor = UIColor.lightGrayColor().CGColor
        password.layer.borderWidth = 1.0
        code.layer.borderWidth = 1.0
        code.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
        let registerBtn = UIButton.init(type: UIButtonType.Custom)
        registerBtn.setTitle("注册", forState: UIControlState.Normal)
        registerBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        registerBtn.jk_setBackgroundColor(UIColor.greenColor(), forState: UIControlState.Normal)
        registerBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        registerBtn.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: UIControlState.Disabled)
        self.view.addSubview(registerBtn)
        registerBtn.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(48)
            make.top.equalTo(code.snp_bottom).offset(100)
        }
        // 注册
//        		service=User.Register&phone=18192517406&password=111111&verificationCode=1234
      registerBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) in
            Alamofire.request(.POST, "https://www.1000phone.tk", parameters: [
                "service": "User.Register",
                "phone": username.text!,
                "password": password.text!,
                "verificationCode": code.text!,
                ], encoding: ParameterEncoding.URLEncodedInURL, headers: nil).responseJSON(completionHandler: { (response) in
                    // 如果请求成功
                    if response.result.isSuccess {
                        print(response.result.value!)
                        
                        self.navigationController?.popViewControllerAnimated(true)
                    }else {
                        print("网络不给力，请稍后再试")
                        
                    }
                })
        }
        

        // Do any additional setup after loading the view.
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
