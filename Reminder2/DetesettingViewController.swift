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
    var  remindArray: [[String:String]] = []
    
    
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
        remindArray = NSUserDefaults.standardUserDefaults().arrayForKey("remindarray") as? [[String:String]] ?? []
        
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
        twitterVC.setInitialText(remindText+"を"+dateText)
        presentViewController(twitterVC,animated: true, completion: nil)
                setNotification()
        
        
        let alertController = UIAlertController(title: "", message: "ツイートが完了しました！", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            
            //画面遷移
            self.performSegueWithIdentifier("goHome", sender: nil)
        })
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)


    }
    
    @IBAction func save(){
        setNotification()
        let remindDictionary = ["Date": dateText,"tweet":remindText]
        //remindArrayにremindDictionaryを追加
        remindArray.append(remindDictionary)
        NSUserDefaults.standardUserDefaults().setObject(remindArray, forKey: "remindarray")
        
        
        let alertController = UIAlertController(title: "", message: "保存しました", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)

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
