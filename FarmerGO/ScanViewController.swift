
import UIKit
import Foundation
import AVFoundation
import SwiftSoup

class ScanViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {

    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var qrCodeFrameView: UIView?
    
    let userDefaults:UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var Q: UIImageView!
    
    @IBOutlet weak var W: UIButton!
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var cameraBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 52/255, green: 150/255, blue: 240/255, alpha: 1.0)
        self.navigationController?.navigationBar.topItem?.title = "產銷履歷商品掃描"
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        
        
        
        captureSession = AVCaptureSession()

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }

        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        

        let metadataOutput = AVCaptureMetadataOutput()

        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = self.view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        self.view.layer.addSublayer(previewLayer)

        captureSession.startRunning()
        
        
        qrCodeFrameView = UIView()

        if let qrCodeFrameView = qrCodeFrameView {
            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            cameraBackgroundView.addSubview(qrCodeFrameView)
            cameraBackgroundView.bringSubviewToFront(qrCodeFrameView)
        }
        
        
        self.view.bringSubviewToFront(cameraBackgroundView)
        self.view.bringSubviewToFront(Q)
        self.view.bringSubviewToFront(W)
        
       // let mask = CALayer();
        //mask.backgroundColor = UIColor.black.cgColor
        
        
    }
    
    
//    let maskLayer = CAShapeLayer()
//    maskLayer.frame = cameraBackgroundView.frame
//
//    print(cameraBackgroundView.frame)
//    print(UIScreen.main.bounds)
//    maskLayer.fillColor = UIColor.black.cgColor
//
//    // Create the frame for the circle.
//    let radius: CGFloat = 50.0
//    let rect = CGRect(x: cameraBackgroundView.frame.midX, y: cameraBackgroundView.frame.midY, width: 2 * radius, height: 2 * radius)
//
//
//
//
//    // Create the path.
//    let path = UIBezierPath(rect: cameraBackgroundView.bounds)
//    maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
//
//    // Append the circle to the path so that it is subtracted.
//    path.append(UIBezierPath(ovalIn: rect))
//    maskLayer.path = path.cgPath
//
//    // Set the mask of the view.
//    cameraBackgroundView.layer.mask = maskLayer
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        let maskLayer = CAShapeLayer()
        maskLayer.frame = CGRect(x: 0, y: 0, width: cameraBackgroundView.frame.width, height: cameraBackgroundView.frame.height)
        
        print(cameraBackgroundView.frame)
        
        
        maskLayer.fillColor = UIColor.black.cgColor
        
        
        
        
        
        // Create the frame for the circle.
        let rect = CGRect(x: cameraBackgroundView.frame.midX-100, y: UIScreen.main.bounds.midY-250, width: 200, height: 200)


        // Create the path.
        let path = UIBezierPath(rect: cameraBackgroundView.bounds)
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd

        // Append the circle to the path so that it is subtracted.
        path.append(UIBezierPath(rect: rect))
        maskLayer.path = path.cgPath

        // Set the mask of the view.
        cameraBackgroundView.layer.mask = maskLayer
        
        let blueCorner1 = UIImageView(frame: CGRect(x: cameraBackgroundView.frame.midX-100, y: UIScreen.main.bounds.midY-164, width: 50, height: 50))
        blueCorner1.image = UIImage(named: "左上藍角")
        
        let blueCorner2 = UIImageView(frame: CGRect(x: cameraBackgroundView.frame.midX+50, y: UIScreen.main.bounds.midY-164, width: 50, height: 50))
        blueCorner2.image = UIImage(named: "藍角右上")
        
        
        let blueCorner3 = UIImageView(frame: CGRect(x: cameraBackgroundView.frame.midX-100, y: UIScreen.main.bounds.midY-10, width: 50, height: 50))
        blueCorner3.image = UIImage(named: "藍角左下")
        

        let blueCorner4 = UIImageView(frame: CGRect(x: cameraBackgroundView.frame.midX+50, y: UIScreen.main.bounds.midY-10, width: 50, height: 50))
        blueCorner4.image = UIImage(named: "藍角右下")
        
        self.view.addSubview(blueCorner1)
        self.view.addSubview(blueCorner2)
        self.view.addSubview(blueCorner3)
        self.view.addSubview(blueCorner4)
        
        
        let label = UILabel(frame: CGRect(x: cameraBackgroundView.frame.midX-65, y: UIScreen.main.bounds.midY+60, width: 50, height: 50))
        label.text = "請對準欲掃描的行動條碼"
        label.textColor = .white
        label.sizeToFit()
        label.font = UIFont(name: "PingFangTC-Medium", size: 12)
        self.view.addSubview(label)
        
        
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            
            let barCodeObject = previewLayer?.transformedMetadataObject(for: readableObject)
            qrCodeFrameView?.frame = barCodeObject!.bounds
        
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }

        //dismiss(animated: true)
    }

    
    let callApi = Global();
    
    func found(code: String) {
        userDefaults.set("gotoScaned", forKey: "nowState")
        print(code)
        let myURLString = code
        
        print(myURLString)
        
        guard URL(string: myURLString) != nil else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        userDefaults.set("500", forKey: "dollar")
        userDefaults.set(myURLString, forKey: "getHTMLURL")
        self.dismiss(animated: true, completion: nil)
    }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    
}


class ScanViewController2: UIViewController{
    
    
    let callApi = Global();
    
    let userDefaults:UserDefaults = UserDefaults.standard
    @IBOutlet weak var qTotalBackgroundView: UIView!
    @IBOutlet weak var questionBackgroundView: UIView!
    @IBOutlet weak var answerBackgroundView: UIView!
    
    @IBOutlet weak var answerImageView: UIImageView!
    
    
    @IBOutlet weak var closeBtn1: UIButton!
    @IBOutlet weak var optionBtn1: UIButton!
    @IBOutlet weak var optionBtn2: UIButton!
    @IBOutlet weak var optionBtn3: UIButton!
    @IBOutlet weak var optionBtn4: UIButton!
    @IBOutlet weak var closeBtn2: UIButton!
    @IBOutlet weak var closeBtn3: UIButton!
    
    
    @IBOutlet weak var 動畫ImageView: UIImageView!
    @IBOutlet weak var 動畫BackgroundView: UIView!
    
    
    @IBOutlet weak var challengeBtn: UIButton!
    
    @IBAction func btnDown(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "綠鈕 下壓"), for: .normal)
    }
    
    @IBAction func btnOutside(_ sender: UIButton) {
        sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
    }
    
    
    @IBAction func first(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "seedPage3") as! SeedViewController3
        vc.whichImage = "農作物的小知識"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func second(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "seedPage3") as! SeedViewController3
        vc.whichImage = "營養價值報你知"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func third(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "seedPage3") as! SeedViewController3
        vc.whichImage = "美食料理小廚房"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func answerTrueOrWrong(isTrue:Bool){
        if(isTrue){
            answerImageView.image = UIImage(named: "小農知識王 答對")
            var dollar = userDefaults.value(forKey: "dollar") as! String
            dollar = String(Int(dollar)!+500)
            userDefaults.set(dollar, forKey: "dollar")
        }else{
            answerImageView.image = UIImage(named: "小農知識王 失敗")
        }
        
        
        questionBackgroundView.isHidden = true;
        answerBackgroundView.isHidden = false;
        
        
        
        // make the square not visible and scale it to 0.5x
        answerBackgroundView.alpha = 0
        answerBackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        // Finally the animation!
        UIView.animate(
            withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.answerBackgroundView.transform = .identity
                self.answerBackgroundView.alpha = 1
        }, completion: nil)
    }
    
    
    
    
    
    func showQuestionPopIn(){
        qTotalBackgroundView.isHidden = false;
        questionBackgroundView.isHidden = false;
        answerBackgroundView.isHidden = true;
        
        
        
        // make the square not visible and scale it to 0.5x
        qTotalBackgroundView.alpha = 0
        qTotalBackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        // Finally the animation!
        UIView.animate(
            withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.qTotalBackgroundView.transform = .identity
                self.qTotalBackgroundView.alpha = 1
        }, completion: nil)
    }
    
    
    @IBAction func btnInside(_ sender: UIButton) {
        switch sender {
        case challengeBtn:
            sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
            showQuestionPopIn();
            break;
        case optionBtn1:
            sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
            break;
        case optionBtn2:
            sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
            break;
        case optionBtn3:
            sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
            answerTrueOrWrong(isTrue: true);
            break;
        case optionBtn4:
            sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
            break;
        case closeBtn1:
            dismissToHome();
            break;
        case closeBtn2:
            sender.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
            dismissToHome();
            break;
        case closeBtn3:
            dismissToHome();
            break;
        default:
            break;
        }
    }
    func dismissToHome(){
        userDefaults.set("getSeed", forKey: "nowState")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func closeToRoot(_ sender: Any) {
        dismissToHome();
    }
    
    
    let LoadingimageArray:[UIImage] = [
        UIImage(named: "Comp 1_00000")!,
                                        UIImage(named: "Comp 1_00001")!,
                                        UIImage(named: "Comp 1_00002")!,
                                        UIImage(named: "Comp 1_00003")!,
                                        UIImage(named: "Comp 1_00004")!,
                                        UIImage(named: "Comp 1_00005")!,
                                        UIImage(named: "Comp 1_00006")!,
                                        UIImage(named: "Comp 1_00007")!]
    var myHTMLString:String!;
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        myHTMLString = userDefaults.value(forKey: "HTMLString") as! String
            //userDefaults.set(myHTMLString, forKey: "HTMLString")
        
        do {
            let doc: Document = try SwiftSoup.parse(myHTMLString)
            let link: Elements = try doc.select("td")

            var 農產資料:[String] = [];

            for i in 0..<7{
                let doc1:Document = try SwiftSoup.parse(link[i].text())
                let link1: Element = try doc1.select("body").first()!
                農產資料.append(try link1.text())

            }

            let encode = "蕹菜".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)

            let 菜價資訊Api = "https://data.coa.gov.tw/Service/OpenData/FromM/FarmTransData.aspx?$top=1000&$skip=0&Crop=" + encode!

            callApi.HttpGetAsyncWithAccessToken(name: 菜價資訊Api, completionBlock: {
                (data) in
                print(String(data: data, encoding: .utf8))
            })

            //http://data.coa.gov.tw/Service/OpenData/FromM/FarmTransData.aspx?Crop=%E8%95%B9%E8%8F%9C

            print(農產資料.count)
            print(農產資料)
        } catch Exception.Error(let type, let message) {
            print(message)
        } catch {
            print("error")
        }
        
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
