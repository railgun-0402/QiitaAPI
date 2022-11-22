//
//  searchArticleViewController.swift
//  showQiitaData
//
//  Created by 菅原大輝 on 2022/11/22.
//

import UIKit


/*
 記事検索画面
 */
class searchArticleViewController: UIViewController {

    /* 記事検索入力テキスト */
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /* TextField以外の部分をタップすると、キーボードを閉じる */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /* returnすると、キーボードを閉じる */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    /* 検索するボタン押下時処理 */
    @IBAction func searchButton(_ sender: Any) {
        // 押下時処理
        
        // キーボードを閉じる
        searchTextField.endEditing(true)
    }
}
