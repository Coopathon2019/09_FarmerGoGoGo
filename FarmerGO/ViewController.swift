
import UIKit

class ViewController: UIViewController,ModalDelegate {
    func changeValue(value: String) {
        print(value)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "couponPage1")
        self.present(controller, animated: true, completion: nil)
        userDefaults.set("1", forKey: "nowState")
    }
    var timer = Timer()
    var isTimerRunning = false //This will be used to make sure only one
       
       
       func runTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
       }
       
       @objc func updateTimer() {
        let new水 = String(Int(水Label.text!)! + 1);
        水Label.text = new水;
        userDefaults.set(new水, forKey: "water")
       }
    
    @IBOutlet weak var 金錢Label: UILabel!
    
    @IBOutlet weak var 水Label: UILabel!
    

    @IBOutlet weak var seedBtn: UIButton!
    @IBOutlet weak var archievementBtn: UIButton!
    @IBOutlet weak var scanBtn: UIButton!
    @IBOutlet weak var shopBtn: UIButton!
    @IBOutlet weak var toolBtn: UIButton!
    
    @IBOutlet weak var toolBackgroundView: UIView!
    @IBOutlet weak var 鋤地按鈕: UIButton!
    @IBOutlet weak var 澆水按鈕: UIButton!
    @IBOutlet weak var 施肥按鈕: UIButton!
    @IBOutlet weak var 除蟲按鈕: UIButton!
    @IBOutlet weak var 關閉工具按鈕: UIButton!
    
    @IBOutlet weak var selectedBtn: UIButton!
    
    @IBOutlet weak var animeImageView: UIImageView!
    @IBOutlet weak var hintImageView: UIImageView!
    
    
    @IBOutlet weak var 收成按鈕: UIButton!
    
    @IBOutlet weak var 能量imageView: UIImageView!
    
    
    @IBOutlet weak var 每日成就彈窗BackgroundView: UIView!
    
    
    @IBOutlet weak var 動畫BackgroundView: UIView!
    
    @IBOutlet weak var 動畫ImageView: UIImageView!
    
    
    var 鋤地imageArray:[UIImage] = [
                                    UIImage(named: "鋤地0")!,
                                    UIImage(named: "鋤地1")!,
                                    UIImage(named: "鋤地2")!,
                                    UIImage(named: "鋤地3")!,
                                    UIImage(named: "鋤地4")!,
                                    UIImage(named: "鋤地5")!,
                                    UIImage(named: "鋤地6")!]
    
    var 澆花imageArray:[UIImage] = [
                                    UIImage(named: "澆花0")!,
                                    UIImage(named: "澆花1")!,
                                    UIImage(named: "澆花2")!,
                                    UIImage(named: "澆花3")!,
                                    UIImage(named: "澆花4")!,
                                    UIImage(named: "澆花5")!,
                                    UIImage(named: "澆花6")!]
    
    var 施肥imageArray:[UIImage] = [
                                    UIImage(named: "施肥0")!,
                                    UIImage(named: "施肥1")!,
                                    UIImage(named: "施肥2")!,
                                    UIImage(named: "施肥3")!,
                                    UIImage(named: "施肥4")!,
                                    UIImage(named: "施肥5")!,
                                    UIImage(named: "施肥6")!]
    
    var 除蟲imageArray:[UIImage] = [
                                    UIImage(named: "除蟲0")!,
                                    UIImage(named: "除蟲1")!,
                                    UIImage(named: "除蟲2")!,
                                    UIImage(named: "除蟲4")!,
                                    UIImage(named: "除蟲5")!,
                                    UIImage(named: "除蟲6")!,
                                    UIImage(named: "除蟲7")!,
                                    UIImage(named: "除蟲8")!,
                                    UIImage(named: "除蟲9")!,
                                    UIImage(named: "除蟲10")!,
                                    UIImage(named: "除蟲11")!,
                                    UIImage(named: "除蟲12")!,
    UIImage(named: "除蟲13")!,
    UIImage(named: "除蟲14")!,
    UIImage(named: "除蟲15")!]
    
    var nowState = "";
    let userDefaults:UserDefaults = UserDefaults.standard
    
    
    
    
    
    @IBOutlet var otherLandViews: [UIView]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults.set("1", forKey: "nowState")
        
        userDefaults.set("0", forKey: "dollar")
        
        let 水 = userDefaults.value(forKey: "water") as? String
        
        if(水 == nil){
            userDefaults.set("0", forKey: "water")
            水Label.text = "0"
        }else{
            水Label.text = 水
        }
        
        runTimer();
        
        
        //Call 自己的Api 去取得今日成就 以更換每日任務成就
        
        
        
        
        每日成就彈窗BackgroundView.isHidden = false;
        
        
        // make the square not visible and scale it to 0.5x
        每日成就彈窗BackgroundView.alpha = 0
        每日成就彈窗BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        // Finally the animation!
        UIView.animate(
            withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.每日成就彈窗BackgroundView.transform = .identity
                self.每日成就彈窗BackgroundView.alpha = 1
        }, completion: nil)
        
        
        
    }
    
    
    @IBAction func close每日成就彈窗(_ sender: Any) {
        
        UIView.animate(
            withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.每日成就彈窗BackgroundView.alpha = 0
                self.每日成就彈窗BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: {result -> Void in
            self.每日成就彈窗BackgroundView.isHidden = true;
        })
        
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
    

    override func viewDidAppear(_ animated: Bool) {
        
        if(nowState == "gotoScaned"){
            動畫BackgroundView.isHidden = false;
            
            let myURL = userDefaults.value(forKey: "getHTMLURL") as! String
            
            do {
                let myHTMLString = try String(contentsOf: URL(string: myURL)!, encoding: .utf8)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "scanPage2")
                
                userDefaults.set(myHTMLString, forKey: "HTMLString")
//                controller?.myHTMLString = myHTMLString;
                self.動畫BackgroundView.isHidden = true;
                self.present(controller, animated: true, completion: nil)
            }catch{
                print("Catch")
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        nowState = userDefaults.value(forKey: "nowState") as! String
        
        let dollar = userDefaults.value(forKey: "dollar") as! String
        
        
        金錢Label.text = dollar
        
        
        
        if(nowState == "getSeed"){
            hintImageView.image = UIImage(named: "除草提示")
            //setYellowShape();
        }
        
        if(nowState == "useSeed"){
            hintImageView.image = UIImage(named: "種子提示")
            setYellowShape();
        }
        
        if(nowState == "gotoScaned"){
            動畫BackgroundView.isHidden = false;
            動畫ImageView.animationImages = LoadingimageArray
            動畫ImageView.animationDuration = 1.0
            動畫ImageView.startAnimating();
        }
        
    }
    
    @IBAction func goToScanQRCode(_ sender: Any) {
         let vc = self.storyboard?.instantiateViewController(withIdentifier: "page2") as! ScanViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBOutlet weak var 瞭解Btn: UIButton!
    
    
    
    @IBAction func btnDown(_ sender: UIButton) {
        switch sender {
        case seedBtn:
            seedBtn.setImage(UIImage(named:"作物 下壓"), for: .normal)
            break;
        case archievementBtn:
            archievementBtn.setImage(UIImage(named:"成就 下壓"), for: .normal)
            break;
        case scanBtn:
            scanBtn.setImage(UIImage(named:"掃描 下壓"), for: .normal)
            break;
        case shopBtn:
            shopBtn.setImage(UIImage(named:"商店 下壓"), for: .normal)
            break;
        case toolBtn:
            toolBtn.setImage(UIImage(named:"工具 下壓"), for: .normal)
            break;
        case 鋤地按鈕:
            鋤地按鈕.setImage(UIImage(named:"鋤地 下壓"), for: .normal)
            break;
        case 澆水按鈕:
            澆水按鈕.setImage(UIImage(named:"澆水 下壓"), for: .normal)
            break;
        case 施肥按鈕:
            施肥按鈕.setImage(UIImage(named:"施肥 下壓"), for: .normal)
            break;
        case 除蟲按鈕:
            除蟲按鈕.setImage(UIImage(named:"除蟲 下壓"), for: .normal)
            break;
        case selectedBtn:
            //selectedBtn.setImage(UIImage(named:"第二塊土地下壓"), for: .normal)
            if(nowState == "除蟲"){
                selectedBtn.setImage(UIImage(named:"土地 施肥後"), for: .normal)
            }
            break;
        case 收成按鈕:
            收成按鈕.setBackgroundImage(UIImage(named: "綠鈕 下壓"), for: .normal)
            break;
        case 至優惠券查看按鈕:
            至優惠券查看按鈕.setBackgroundImage(UIImage(named: "綠鈕 下壓"), for: .normal)
            break;
        case 瞭解Btn:
            瞭解Btn.setBackgroundImage(UIImage(named: "綠鈕 下壓"), for: .normal)
            break;
        default:
            break;
        }
        
    }

        
    func setYellowShape(){
        for otherLandView in otherLandViews{
            
           otherLandView.layer.borderColor = UIColor.yellow.cgColor
            
            otherLandView.layer.borderWidth = 1;
            
            otherLandView.layer.cornerRadius = 6
        }
        
        selectedBtn.layer.borderColor = UIColor.yellow.cgColor
        selectedBtn.layer.borderWidth = 1;
        selectedBtn.layer.cornerRadius = 6
    }
    
    
    func clearYellowShape(){
        for otherLandView in otherLandViews{
            otherLandView.layer.borderColor = UIColor.clear.cgColor
            otherLandView.layer.borderWidth = 0;
        }
        selectedBtn.layer.borderColor = UIColor.clear.cgColor
        selectedBtn.layer.borderWidth = 0;
    }
    
    
    @IBAction func btnUp(_ sender: UIButton) {
        switch sender {
        case seedBtn:
            seedBtn.setImage(UIImage(named:"作物"), for: .normal)
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "seedPage1") as! SeedViewController
//            self.navigationController?.pushViewController(vc, animated: true)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "seedPage1")
            self.present(controller, animated: true, completion: nil)
            break;
        case archievementBtn:
            archievementBtn.setImage(UIImage(named:"成就"), for: .normal)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "archievePage1")
            self.present(controller, animated: true, completion: nil)
            break;
        case scanBtn:
            scanBtn.setImage(UIImage(named:"掃描"), for: .normal)
            print("掃描")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "page2")
            self.present(controller, animated: true, completion: nil)
            break;
        case shopBtn:
            shopBtn.setImage(UIImage(named:"商店"), for: .normal)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "shopPage1")
            self.present(controller, animated: true, completion: nil)
            break;
        case toolBtn:
            if(toolBackgroundView.isHidden){
                toolBackgroundView.isHidden = false
            }else{
                toolBackgroundView.isHidden = true
                toolBtn.setImage(UIImage(named:"工具"), for: .normal)
            }
            break;
        case 鋤地按鈕:
            鋤地按鈕.setImage(UIImage(named:"鋤地"), for: .normal)
            nowState = "鋤地"
            userDefaults.set("鋤地", forKey: "nowState")
            setYellowShape();
            toolBackgroundView.isHidden = true
            toolBtn.setImage(UIImage(named:"工具"), for: .normal)
            
            break;
        case 澆水按鈕:
            澆水按鈕.setImage(UIImage(named:"澆水"), for: .normal)
            nowState = "澆水"
            userDefaults.set("澆水", forKey: "nowState")
            setYellowShape();
            toolBackgroundView.isHidden = true
            toolBtn.setImage(UIImage(named:"工具"), for: .normal)
            break;
        case 施肥按鈕:
            施肥按鈕.setImage(UIImage(named:"施肥"), for: .normal)
            nowState = "施肥"
            userDefaults.set("施肥", forKey: "nowState")
            setYellowShape();
            toolBackgroundView.isHidden = true
            toolBtn.setImage(UIImage(named:"工具"), for: .normal)
            break;
        case 除蟲按鈕:
            除蟲按鈕.setImage(UIImage(named:"除蟲"), for: .normal)
            nowState = "除蟲"
            userDefaults.set("除蟲", forKey: "nowState")
            setYellowShape();
            toolBackgroundView.isHidden = true
            toolBtn.setImage(UIImage(named:"工具"), for: .normal)
            break;
        case 關閉工具按鈕:
            toolBackgroundView.isHidden = true
            toolBtn.setImage(UIImage(named:"工具"), for: .normal)
            break;
        case selectedBtn:
            if(nowState == "getSeed"){
                clearYellowShape();
                selectedBtn.setImage(UIImage(named:"土地"), for: .normal)
                userDefaults.set("1", forKey: "nowState")
            }
            
            if(nowState == "鋤地"){
                print("鋤地")
                clearYellowShape();

                animeImageView.animationImages = 鋤地imageArray
                animeImageView.animationDuration = 1.0
                animeImageView.animationRepeatCount = 2
                animeImageView.startAnimating();
                
                nowState = "useSeed"
                userDefaults.set("useSeed", forKey: "nowState")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    // Put your code which should be executed with a delay here\
                    self.selectedBtn.setImage(UIImage(named:"第二塊土地下壓"), for: .normal)
                    self.hintImageView.image = UIImage(named: "種子提示")
                }
                break;
            }
            
            
            if(nowState == "澆水"){
                clearYellowShape();
                animeImageView.frame.origin.x = animeImageView.frame.origin.x + 30
                animeImageView.animationImages = 澆花imageArray
                animeImageView.animationDuration = 1.0
                animeImageView.animationRepeatCount = 2
                animeImageView.startAnimating();
                nowState = "施肥"
                userDefaults.set("施肥", forKey: "nowState")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    // Put your code which should be executed with a delay here\
                    self.hintImageView.image = UIImage(named: "施肥提示")
                    self.selectedBtn.setImage(UIImage(named:"土地 澆水後"), for: .normal)
                    self.能量imageView.image = UIImage(named: "植物能量條3")
                }
                
                break;
            }
            
            
            if(nowState == "施肥"){
                print("施肥")
                clearYellowShape();
                animeImageView.animationImages = 施肥imageArray
                animeImageView.animationDuration = 1.0
                animeImageView.animationRepeatCount = 2
                animeImageView.startAnimating();
                nowState = "除蟲"
                userDefaults.set("除蟲", forKey: "nowState")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    // Put your code which should be executed with a delay here\
                    self.hintImageView.image = UIImage(named: "除蟲提示")
                    self.selectedBtn.setImage(UIImage(named:"土地 施肥後"), for: .normal)
                    self.能量imageView.image = UIImage(named: "植物能量條5")
                }
                break;
            }
            
            if(nowState == "除蟲"){
                print("除蟲")
                clearYellowShape();
                animeImageView.frame.origin.x = animeImageView.frame.origin.x - 42.5
                animeImageView.frame.origin.y = animeImageView.frame.origin.y + 20.5
                animeImageView.animationImages = 除蟲imageArray
                animeImageView.animationDuration = 1.0
                animeImageView.animationRepeatCount = 1
                animeImageView.startAnimating();
                nowState = "收成"
                userDefaults.set("收成", forKey: "nowState")
                hintImageView.image = UIImage(named: "收成")
                
//                UIView.animate(withDuration: 2, delay: 2, usingSpringWithDamping: .zero, initialSpringVelocity: .zero, options: .curveEaseIn, animations: {
//
//                }, completion: {(result) in
//                    self.selectedBtn.setImage(UIImage(named:"土地 除蟲後"), for: .normal)
//                })
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    // Put your code which should be executed with a delay here
                    self.selectedBtn.setImage(UIImage(named:"土地 除蟲後"), for: .normal)
                    self.能量imageView.image = UIImage(named: "植物能量條6")
                }
                
                break;
            }
            print("colin")
            print(nowState)
            if(nowState == "收成"){
                print("收成")
                selectedBtn.setImage(nil, for: .normal)
                能量imageView.image = nil
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let controller = storyboard.instantiateViewController(withIdentifier: "收成教學") as? LearningViewController
                controller?.delegate = self
                
                
                self.present(controller!, animated: true, completion: nil)
                
                
                break;
            }
            
            
            
            if(nowState == "useSeed"){
                print("使用種子")
                clearYellowShape();
                selectedBtn.setImage(UIImage(named:"土地 播種後"), for: .normal)
                nowState = "澆水"
                userDefaults.set("澆水", forKey: "nowState")
                hintImageView.image = UIImage(named: "澆水提示")
                能量imageView.image = UIImage(named: "植物能量條1")
                break;
            }
            
            
            break;
        case 收成按鈕:
            收成按鈕.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
            show種出優惠券PopIn();
            break;
        case 至優惠券查看按鈕:
            break;
        case 瞭解Btn:
            瞭解Btn.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
            UIView.animate(
                withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
                options: .curveEaseOut, animations: {
                    self.每日成就彈窗BackgroundView.alpha = 0
                    self.每日成就彈窗BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }, completion: {result -> Void in
                self.每日成就彈窗BackgroundView.isHidden = true;
            })
            break;
        default:
            break;
        }
    }

        
    @IBAction func btnUpOutside(_ sender: UIButton) {
        switch sender {
        case seedBtn:
            seedBtn.setImage(UIImage(named:"作物"), for: .normal)
            break;
        case archievementBtn:
            archievementBtn.setImage(UIImage(named:"成就"), for: .normal)
            break;
        case scanBtn:
            scanBtn.setImage(UIImage(named:"掃描"), for: .normal)
            break;
        case shopBtn:
            shopBtn.setImage(UIImage(named:"商店"), for: .normal)
            break;
        case toolBtn:
            toolBtn.setImage(UIImage(named:"工具"), for: .normal)
            break;
        case 鋤地按鈕:
            鋤地按鈕.setImage(UIImage(named:"鋤地"), for: .normal)
            break;
        case 澆水按鈕:
            澆水按鈕.setImage(UIImage(named:"澆水"), for: .normal)
            break;
        case 施肥按鈕:
            施肥按鈕.setImage(UIImage(named:"施肥"), for: .normal)
            break;
        case 除蟲按鈕:
            除蟲按鈕.setImage(UIImage(named:"除蟲"), for: .normal)
            break;
        case selectedBtn:
            selectedBtn.setImage(UIImage(named:""), for: .normal)
            break;
        case 收成按鈕:
            收成按鈕.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
            break;
        case 至優惠券查看按鈕:
            至優惠券查看按鈕.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
        break;
        case 瞭解Btn:
            瞭解Btn.setBackgroundImage(UIImage(named: "綠鈕"), for: .normal)
            break;
        default:
            break;
        }
    }
    
    
    @IBOutlet weak var 收成BackgroundView: UIView!
    
    
    
    @IBOutlet weak var 至優惠券查看按鈕: UIButton!
    @IBOutlet weak var 種出優惠券BackgroundView: UIView!
    
    
    @IBAction func close查看優惠券(_ sender: Any) {
        UIView.animate(
            withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.種出優惠券BackgroundView.alpha = 0
                self.種出優惠券BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: {result -> Void in
            self.種出優惠券BackgroundView.isHidden = true;
        })
    }
    
    
    
}


extension ViewController{
    func show收成PopIn(){
        selectedBtn.setImage(nil, for: .normal)
        能量imageView.image = nil
        
        
        收成BackgroundView.isHidden = false;
        // make the square not visible and scale it to 0.5x
        收成BackgroundView.alpha = 0
        收成BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        // Finally the animation!
        UIView.animate(
            withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.收成BackgroundView.transform = .identity
                self.收成BackgroundView.alpha = 1
        }, completion: nil)
    }
    
    func show種出優惠券PopIn(){
        收成BackgroundView.isHidden = true;
        種出優惠券BackgroundView.isHidden = false;
        
        // make the square not visible and scale it to 0.5x
        種出優惠券BackgroundView.alpha = 0
        種出優惠券BackgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        // Finally the animation!
        UIView.animate(
            withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.55, initialSpringVelocity: 3,
            options: .curveEaseOut, animations: {
                self.種出優惠券BackgroundView.transform = .identity
                self.種出優惠券BackgroundView.alpha = 1
        }, completion: nil)
    }
}


class Global{
    func HttpGetAsyncWithAccessToken(name:String,completionBlock:@escaping (Data)->Void)->Void{
            //var received:NSData = NSData();

            
            
        
            var session:URLSession!
            let session_config = URLSessionConfiguration.default;
            session_config.requestCachePolicy = .reloadIgnoringLocalCacheData
            session_config.urlCache = nil
            session_config.timeoutIntervalForRequest = 30
            session = URLSession(configuration: session_config)
            //let session = URLSession.shared
        
            session.dataTask(with: URL(string: name)!, completionHandler: {(data, response, error) -> Void in
                print(String(data: data!, encoding: .utf8))
//                completionBlock(data!)
            }).resume()
        }
    
}
