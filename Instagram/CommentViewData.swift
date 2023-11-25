//
//  CommentData.swift
//  Instagram
//
//  Created by Saki Mizuno on 2023/11/24.
//


import UIKit
import FirebaseAuth
import FirebaseFirestore

class CommentViewData: UIViewController {
    @IBOutlet weak var CommentTextField: UITextField!
    @IBOutlet weak var CommentSendButton: UIButton!

    // 受け取るためのプロパティ（変数）を宣言しておく
    var postData:PostData?
    
    // 送信ボタンをタップしたときに呼ばれるメソッド
    @IBAction func cmtSendButton(_ sender: Any) {
        print("DEBUG_PRINT: コメントボタンがタップされました。")

        // コメントを更新する
        // 更新データを作成する
        let commentText = CommentTextField.text!
        let name = Auth.auth().currentUser!.displayName!
        let comment = "\(name) : \(commentText)"
        
        let updateValue = FieldValue.arrayUnion([comment])
        
        // コメントに更新データを書き込む
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData!.id)
        postRef.updateData(["comment": updateValue])
        
        //閉じる
        self.dismiss(animated: true, completion: nil)
    }

    
}
