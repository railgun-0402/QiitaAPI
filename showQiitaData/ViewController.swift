//
//  ViewController.swift
//  showQiitaData
//
//  Created by 菅原大輝 on 2022/07/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    /* textField */
    @IBOutlet weak var articleText: UITextField!
    /* tableView */
    @IBOutlet weak var tableView: UITableView!
    
    // API接続url
    let url = "https://qiita.com/api/v2/items"
    
    // タイトルを管理する配列
    var titleArray:[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // ↓追加
        title = "Qiita記事Sample"
        
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getQiitaTitle()
    }
    
    // QiitaURLからデータ取得
    func getQiitaTitle() {
        
        let url: URL = URL(string: url)!
        
        // URLSessionを用いてリクエスト
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            print("data: \(String(describing: data))")
            print("response: \(String(describing: response))")
            print("error: \(String(describing: error))")
            
            do
            {
                // JSON変換
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Any]
                
                let articles = json.map {(article) -> [String: Any] in
                    return article as! [String: Any]
                }
                
                // 記事の総数をforで使う
                let count = articles.count
                
                // 各記事のtitleを追加
                for i in 0...count - 1 {
                    let title = articles[i]["title"] as! String
                    self.titleArray.append(title)
                    print(title)
                }
                
                // (G) TableView更新
                DispatchQueue.main.sync {
                    self.tableView.reloadData()
                }
            }
            
            catch
            {
                print(error)
            }
                        
        })
        task.resume()
    }
    
    // セルの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //cellの数
        return titleArray.count
        
    }
    
    // セルの内容を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        //titleArayはAny型の配列なのでString型にダウンキャストする
        cell.textLabel?.text = (titleArray[indexPath.row] )
        
        return cell
    }
    
    

}

