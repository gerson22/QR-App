//
//  GenerateQrViewController.swift
//  qrreaderB
//
//  Created by Gerson Isaias on 16/03/21.
//

import UIKit

class GenerateQrViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = generateQRCode(from: "Hola Mundo en Swift")
        let imv = UIImageView(frame: CGRect(x: view.frame.width/2-125, y: view.frame.height/2-125, width: 250, height: 250))
        imv.image = image
        self.view.addSubview(imv)
        // Do any additional setup after loading the view.
    }
    

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
