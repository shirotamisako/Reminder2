//
//  ListViewController.swift
//  reminder
//
//  Created by misako shirota on 2016/11/10.
//  Copyright © 2016年 misako shirota. All rights reserved.
//

import UIKit

var remindText: String = ""
//var deleteindex: NSIndexPath = remindArray[indexPath.row]
class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    //題名？を入れるための配列
    var riminderNameArray = [String]()
    
    var  remindArray: [[String:String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        //テーブルビューのデータベースメソッドはViewControllerクラスに書くよ、トイう設定
        table.dataSource = self
        //テーブルビューのデリケートメソッドはViewControllerクラスに書くよという設定
        table.delegate = self
        
        
        
        // Do any additional setup after loading the view.
        
        
        
        super.viewDidLoad()
        
        // 右側に編集ボタン追加
        self.navigationItem.rightBarButtonItem = editButtonItem()
        
        // ボタンの色を変更
        // self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        remindArray = NSUserDefaults.standardUserDefaults().arrayForKey("remindarray") as? [[String:String]] ?? []
        table.reloadData()
    }
    
    
    @IBAction func back() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    let ud = NSUserDefaults.standardUserDefaults()
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            remindArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            
            ud.setObject(remindArray, forKey: "remindarray")
            ud.synchronize()
            
        }
    }
    
    
    
    //セルの数を設定する
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        //セルの数をriminderNameArrayの要素の数にする
        return remindArray.count
    }
    
    //IDつきのセルを取得してセル付属のtextLabelに「テスト」と表示させてみる
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        //セルにriminderNameArrayの題名を表示する
        cell?.textLabel?.text = remindArray[indexPath.row]["tweet"]
        
        return cell!
    }
    
    //cellが押されたときの呼ばれるメソッド
    func tableView(tableView: UITableView,didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@が選ばれました",remindArray[indexPath.row])
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
