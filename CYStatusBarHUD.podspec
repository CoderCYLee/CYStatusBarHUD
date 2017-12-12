
Pod::Spec.new do |s|


s.name         = 'CYStatusBarHUD'
s.version      = '0.1.0'
s.summary      = 'CYStatusBarHUD'
s.homepage     = 'https://github.com/cywd/CYStatusBarHUD'
s.license      = 'MIT'
s.author       = { 'Cyrill' => 'lichunyang@outlook.com' }
s.source       = { :git => 'https://github.com/cywd/CYStatusBarHUD.git', :tag => s.version }

s.platform     = :ios, '6.0'
s.requires_arc = true

s.source_files  = 'CYStatusBarHUD/*.{h,m}'
s.resource  = 'CYStatusBarHUD/CYStatusBarHUD.bundle'
s.framework = 'UIKit'


end
