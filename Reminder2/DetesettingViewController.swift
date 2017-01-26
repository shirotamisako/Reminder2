//
//  DatesettingViewController.swift
//  reminder
//
//  Created by misako shirota on 2016/11/10.
//  Copyright © 2016年 misako shirota. All rights reserved.
//

import UIKit

import Social

class DatesettingViewController: UIViewController {
    
    var remindText: String = ""
    var dateText: String = ""
    
    
    @IBOutlet var datePicker: UIDatePicker!
    let now = NSDate()
    
    
    @IBAction func go(sender :UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss" // 日付フォーマットの設定
        
        print(dateFormatter.stringFromDate(datePicker.date)) // -> 2014/06/25 02:13:18
        dateText = dateFormatter.stringFromDate(datePicker.date)
        
        
        print(datePicker.date)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.date = now
        
        // Do any additional setup after loading the view.
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss" // 日付フォーマットの設定
        
        print(now)
        print(dateFormatter.stringFromDate(datePicker.date)) // -> 2014/06/25 02:13:18
        
        print(remindText)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func twitterBtn(sender: AnyObject) {
        var twitterVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        twitterVC.setInitialText(remindText+"を"+dateText+"までにやる！！")
        presentViewController(twitterVC,animated: true, completion: nil)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate!
        appDelegate.remindText = remindText
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
