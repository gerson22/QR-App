//
//  GenerateQrViewController.swift
//  qrreaderB
//
//  Created by Gerson Isaias on 16/03/21.
//

import UIKit

class GenerateQRViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonObj = ["message":"Hola mundo en Swift","token":"=6787DFGSTSJJW828293838292J"]
        //
        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObj, options: .prettyPrinted) else {fatalError("json data error")}
        guard let jsonString = String.init(data: jsonData, encoding: String.Encoding.ascii) else {return}
        //
        let qrImage:UIImage? = self.generateQRCode(from: jsonString)
        let imv = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        imv.center = view.center
        imv.image = qrImage
        view.addSubview(imv)
        
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)//58bytes

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

}
