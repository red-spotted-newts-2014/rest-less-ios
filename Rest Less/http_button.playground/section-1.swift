// Button tester

import UIKit

var str = "Hello, playground"

var v = UIView(frame: CGRectMake(0,0,200,200))

var b = UIButton(frame: CGRectMake(0,0, 100, 32))


b.setTitle("Test", forState: UIControlState.Normal);


b.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)

v.addSubview(b)

v