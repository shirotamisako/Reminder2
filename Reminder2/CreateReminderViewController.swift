//
//  CreateremindViewController.swift
//  reminder
//
//  Created by misako shirota on 2016/11/10.
//  Copyright © 2016年 misako shirota. All rights reserved.
//

import UIKit
import Social
class CreateRemindViewController: UIViewController {
    @IBOutlet var remindTextView: UITextView!
    var remindText: String = ""
    var dateText: String = ""
    var  remindArray: [[String:String]] = []
    
    var onTwitter: Bool = false
    
    @IBOutlet var datePicker: UIDatePicker!
    let now = NSDate()
    
    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.date = now
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定(日本時間)
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss" // 日付フォーマットの設定
        
        print(dateFormatter.stringFromDate(datePicker.date)) // -> 2014/06/25 02:13:18
        dateText = dateFormatter.stringFromDate(datePicker.date)
        
        remindArray = NSUserDefaults.standardUserDefaults().arrayForKey("remindarray") as? [[String:String]] ?? []

        
        print(datePicker.date)


        // Do any additional setup after loading the view.
        
        
        saveButton.layer.cornerRadius = 10    //角のR設定
        saveButton.layer.masksToBounds = true
        
        
        remindTextView.layer.borderColor = UIColor.whiteColor().CGColor
        remindTextView.layer.borderWidth = 6.0
    }
    
    override func viewWillAppear(animated: Bool) {
        remindArray = NSUserDefaults.standardUserDefaults().arrayForKey("remindarray") as? [[String:String]] ?? []

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  //日付が選択された時
    @IBAction func go(sender :UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") // ロケールの設定(日本時間)
        dateFormatter.dateFormat = "MM/dd HH:mm" // 日付フォーマットの設定
        
        print(dateFormatter.stringFromDate(datePicker.date)) // -> 2014/06/25 02:13:18
        dateText = dateFormatter.stringFromDate(datePicker.date)
        
        
        print(datePicker.date)
        
    }
    
    @IBAction func twittergo(button: UIButton) {
       
        if onTwitter == true {
            onTwitter = false
            button.setBackgroundImage(UIImage(named: "twitter_on.png"), forState: .Normal)
             

        }else if onTwitter == false{
            onTwitter = true
            button.setBackgroundImage(UIImage(named: "twitter_off.png"), forState: .Normal)
            
        }
        
    }
    
    func setNotification(){
        //ローカル通知
        let notification = UILocalNotification()
        //ロック中にスライドで〜〜のところの文字
        notification.alertAction = "アプリを開く"
        print(remindText)
        //通知の本文
        notification.alertBody = remindText+""
        //通知される時間（とりあえず10秒後に設定）
        //notification.fireDate = NSDate(timeIntervalSinceNow:10)
        notification.fireDate = datePicker.date
        //通知音
        notification.soundName = UILocalNotificationDefaultSoundName
        //アインコンバッジの数字
        notification.applicationIconBadgeNumber = 1
        //通知を識別するID
        notification.userInfo = ["notifyID":"gohan"]
        //通知をスケジューリング
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }

    //保存するボタン
    @IBAction func save(){
        remindText = remindTextView.text

        if onTwitter == true{
            var twitterVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterVC.setInitialText(dateText+"までに"+remindText)
            presentViewController(twitterVC,animated: true, completion: nil)
        }
        setNotification()
        
        
                let remindDictionary = ["Date": dateText,"tweet":remindText]
        //remindArrayにremindDictionaryを追加
        remindArray.append(remindDictionary)
        NSUserDefaults.standardUserDefaults().setObject(remindArray, forKey: "remindarray")
        
        
        let alertController = UIAlertController(title: "", message: "保存しました", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
        
        remindTextView.text = ""
        remindText = ""
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        remindTextView.resignFirstResponder()
    }
    
}
