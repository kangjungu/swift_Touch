//
//  ViewController.swift
//  Touch
//
//  Created by JHJG on 2016. 7. 18..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var methodStatus: UILabel!
    @IBOutlet weak var touchStatus: UILabel!
    @IBOutlet weak var tapStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //사용자가 화면을 터치하면 퍼스트 리스폰더의  touchesBegan 메서드가 호출된다.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //화면을 터치한 손가락의 숫자
        let touchCount = touches.count
        //터치 객체를 얻는다.
        let touch = touches.first
        //터치객체들중 하나로부터 탭 개수를 얻는다.
        let tapCount = touch!.tapCount
        
        methodStatus.text = "touchesBegan"
        touchStatus.text = "\(touchCount) touches"
        tapStatus.text = "\(tapCount) taps"
    }
    
    //사용자가 화면을 접촉한 손가락을 움직이면 움직임이 멈춰질때 까지 이 메서드가 반복해서 호출된다.
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touchCount = touches.count
        let touch = touches.first
        let tapCount = touch!.tapCount
        
        methodStatus.text = "touchesMoved"
        touchStatus.text = "\(touchCount) touches"
        tapStatus.text = "\(tapCount) taps"
        
        //터치 예측 검사하기
        if let eventObj = event {
            //predicatedTouchesForTouch 메서드를 호출하기 전에 먼저 검사를하고
            for predictedTouch in eventObj.predictedTouchesForTouch(touch!)!{
                //반환된 배열 내의 각 터치 객채에 대하여, 에쌍된 터치 위치의 X좌표와 Y좌표를 콘솔에 출력한다.
                let point = predictedTouch.locationInView(self.view)
                print("Predicted location X = \(point.x) Y = \(point.y)")
            }
            print("============")
        }
        
        //모든 병합 터치 정보를 표시함. (아이패드 에어 2에서 가능)
        if let eventObj = event {
            for coalescedTouch in eventObj.coalescedTouchesForTouch(touch!)!{
                let point = coalescedTouch.locationInView(self.view)
                print("Coalesed loaction X = \(point.x), y= \(point.y)")
            }
            print("============")
        }
    }
    
    //사용자가 손가락을 떼면 이 메서드가 호출된다.
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touchCount = touches.count
        let touch = touches.first
        let tapCount = touch!.tapCount
        
        methodStatus.text = "touchesEnded"
        touchStatus.text = "\(touchCount) touches"
        tapStatus.text = "\(tapCount) taps"
        
        
        /*
         이런식으로 X,Y 좌표를 구할수 있다.
         let touch = touches.first
         let point = touch?.locationInView(self.view)
         
         let pointX = point?.x
         let pointY = point?.y
         */
    }
    
}

