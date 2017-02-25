//
//  CreateremindViewController.swift
//  reminder
//
//  Created by misako shirota on 2016/11/10.
//  Copyright © 2016年 misako shirota. All rights reserved.
//

import UIKit

class CreateremindViewController: UIViewController {
    @IBOutlet var remindTextView: UITextView!
    var remindText: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        remindText = remindTextView.text
        // if (segue.identifier == "totextDatesetting") {
        // SecondViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
        let secondView : DatesettingViewController = segue.destinationViewController as! DatesettingViewController
        // secondView（バンドルされた変数）に受け取り用の変数を引数とし_paramを渡す（_paramには渡したい値）
        // この時DatesettingViewControllerにて受け取る同型の変数を用意しておかないとエラーになる
        secondView.remindText = remindTextView.text
        //}
    }
    
    @IBAction func back() {
        
        dismissViewControllerAnimated(true, completion: nil)
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
