//
//  ListViewController.swift
//  reminder
//
//  Created by misako shirota on 2016/11/10.
//  Copyright © 2016年 misako shirota. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    //題名？を入れるための配列
    var riminderNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデータベースメソッドはViewControllerクラスに書くよ、トイう設定
        table.dataSource = self
        //テーブルビューのデリケートメソッドはViewControllerクラスに書くよという設定
        table.delegate = self
        
        //riminderNameArrayに題名を入れていく
        riminderNameArray = ["う","え","おおおお"]
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を設定する
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        //セルの数をriminderNameArrayの要素の数にする
        return riminderNameArray.count
    }
    
    //IDつきのセルを取得してセル付属のtextLabelに「テスト」と表示させてみる
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        //セルにriminderNameArrayの題名を表示する
        cell?.textLabel?.text = riminderNameArray[indexPath.row]
        cell?.textLabel?.text = "テスト"
        
        return cell!
    }
    
    //cellが押されたときの呼ばれるメソッド
    func tableView(tableView: UITableView,didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("%@が選ばれました",riminderNameArray[indexPath.row])
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
