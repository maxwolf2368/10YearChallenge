//
//  ViewController.swift
//  10YearChallenge
//
//  Created by 林瑋哲 on 2019/7/30.
//  Copyright © 2019 林瑋哲. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var yearSlider: UISlider!
    //宣告常數
    let dateFormatter = DateFormatter()
    let photoImage = ["1992","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019"]
    //宣告變數
    var dateString:String = ""
    var timer:Timer?
    var photoCount = 0
    var sliderValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time()
        DatePicker.locale = Locale(identifier: "zh_TW")
        dateFormatter.dateFormat = "yyyy/MM/dd"
    }

    func compare(){
        if photoCount >= photoImage.count{
            photoCount = 0
            chooseImage(num2:photoCount)
            photoImageView.image = UIImage(named: photoImage[photoCount])
        }else{
            chooseImage(num2:photoCount)
            photoImageView.image = UIImage(named: photoImage[photoCount])
        }
        
        yearSlider.value = Float(photoCount)
        photoCount += 1
    }
    
    func time(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(timer)in self.compare()}
    }
    
    func chooseImage(num2:Int){
        switch num2 {
        case 0:
            dateString = "1992/02/03"
        case 1:
            dateString = "2009/02/03"
        case 2:
            dateString = "2010/02/03"
        case 3:
            dateString = "2011/02/03"
        case 4:
            dateString = "2012/02/03"
        case 5:
            dateString = "2013/02/03"
        case 6:
            dateString = "2014/02/03"
        case 7:
            dateString = "2015/02/03"
        case 8:
            dateString = "2016/02/03"
        case 9:
            dateString = "2017/02/03"
        case 10:
            dateString = "2018/02/03"
        default:
            dateString = "2019/08/09"
        }
        let date = dateFormatter.date(from: dateString)
        DatePicker.date = date!
    }
    
    @IBAction func chnageImageDatePicker(_ sender: UIDatePicker) {
        let ImageDate = DatePicker.date
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: ImageDate)
        
        var photo = dateComponents.month!
        photo -= 1
        photoImageView.image = UIImage(named: photoImage[photo])
    }
    
    @IBAction func changeValueSlider(_ sender: UISlider) {
        sender.value.round()
        sliderValue = Int(sender.value)
        photoImageView.image = UIImage(named: photoImage[sliderValue])
        print(sliderValue)
        chooseImage(num2: sliderValue)
    }
    
    @IBAction func autoPlaySwitch(_ sender: UISwitch) {
        if sender .isOn{
            time()
            photoCount = sliderValue
            yearSlider.value = Float(photoCount)
        }else{
            timer?.invalidate()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }

}

