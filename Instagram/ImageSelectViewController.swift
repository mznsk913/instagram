//
//  ImageSelectViewController.swift
//  Instagram
//
//  Created by Saki Mizuno on 2023/11/04.
//
//import CLImageEditor
import UIKit

class ImageSelectViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func handleLibraryButton(_ sender: Any) {
        // ライブラリ（カメラロール）を指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
        }
    }
    @IBAction func handleCameraButton(_ sender: Any) {
        // カメラを指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
        }
    }
    @IBAction func handleCancelButton(_ sender: Any) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    // 写真を撮影/選択したときに呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // UIImagePickerController画面を閉じる
        picker.dismiss(animated: true, completion: nil)
        // 画像加工処理
        if info[.originalImage] != nil {
            // 撮影/選択された画像を取得する
            let image = info[.originalImage] as! UIImage
            // CLImageEditorライブラリで加工する
            print("DEBUG_PRINT: image = \(image)")
            // CLImageEditorにimageを渡して、加工画面を起動する。
            // 投稿画面を開く
            let postViewController = self.storyboard?.instantiateViewController(withIdentifier: "Post") as! PostViewController
            postViewController.image = image
            self.present(postViewController, animated: true, completion: nil)

            //let editor = CLImageEditor(image: image)!
            //editor.delegate = self
            //self.present(editor, animated: true, completion: nil)
            
        }
    }
    // CLImageEditorで加工が終わったときに呼ばれるメソッド
    //func imageEditor(_ editor: CLImageEditor!, didFinishEditingWith image: UIImage!) {
        // 投稿画面を開く
    //    let postViewController = self.storyboard?.instantiateViewController(withIdentifier: "Post") as! //PostViewController
        //postViewController.image = image!
        //editor.present(postViewController, animated: true, completion: nil)
    //}
    // CLImageEditorの編集がキャンセルされた時に呼ばれるメソッド
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // UIImagePickerController画面を閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    

}
