//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 서지민 on 11/15/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelUI()
        buttonUI()
    }
    
    private func labelUI() {
        view.backgroundColor = .black
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(200)
            $0.height.equalTo(100)
        }
    }
    
    func buttonUI() {
        let button7 = createButton(title: "7", backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        let button8 = createButton(title: "8", backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        let button9 = createButton(title: "9", backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        let buttonPlus = createButton(title: "+", backgroundColor: .orange)
        let button4 = createButton(title: "4", backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        let button5 = createButton(title: "5", backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        let button6 = createButton(title: "6", backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        let buttonMinus = createButton(title: "-", backgroundColor: .orange)
        let button1 = createButton(title: "1", backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        let button2 = createButton(title: "2", backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        let button3 = createButton(title: "3", backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        let buttonMulti = createButton(title: "*", backgroundColor: .orange)
        let buttonReset = createButton(title: "AC", backgroundColor: .orange)
        let button0 = createButton(title: "0", backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        let buttonEqual = createButton(title: "=", backgroundColor: .orange)
        let buttonDivide = createButton(title: "/", backgroundColor: .orange)
        
        let stackView1 = makeHorizontalStackView([button7, button8, button9, buttonPlus])
        let stackView2 = makeHorizontalStackView([button4, button5, button6, buttonMinus])
        let stackView3 = makeHorizontalStackView([button1, button2, button3, buttonMulti])
        let stackView4 = makeHorizontalStackView([buttonReset, button0, buttonEqual, buttonDivide])

        let verticalStackView = UIStackView(arrangedSubviews: [stackView1, stackView2, stackView3, stackView4])
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        view.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints {
            $0.width.height.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }

    }
    
    func createButton(title: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()     // 전역변수로 선언했더니 마지막 버튼인 +버튼만 생성됨. 독립적으로 버튼을 생성하려면 안에 써야함
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 40    // 버튼을 원형으로 만들때는 한 변 길이의 절반으로 cornerRadius 값 설정하면 됨
        button.frame.size.height = 80
        button.frame.size.width = 80
//        button.snp.makeConstraints {     // SnapKit 버전
//            $0.width.height.equalTo(80)
//        }
        return button
    }
    
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
}

