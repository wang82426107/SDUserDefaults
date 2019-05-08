@version = '1.0.6'
Pod::Spec.new do |s|
s.name = 'SDUserDefaults'
s.version = '1.0.6'
s.license = "Copyright (c) 2015年 Lisa. All rights reserved."
s.summary = '利用NSUserDefaults,runtime和归档快速存储偏好设置数据'
s.homepage = 'https://github.com/wang82426107/SDUserDefaults'
s.authors = { '神经骚栋' => '676758285@qq.com' }
s.source = { :git => 'https://github.com/wang82426107/SDUserDefaults.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '9.0'
s.source_files = 'SDUserDefaults/*.{h,m}'
end
