
Pod::Spec.new do |s|


s.name         = 'CYStatusBarHUD'
s.version      = '0.0.2'
s.summary      = 'CYStatusBarHUD'
s.homepage     = 'https://github.com/CoderCYLee/CYStatusBarHUD'
s.license      = 'MIT'
s.author       = { 'Cyrill' => 'lichunyang@outlook.com' }
s.source       = { :git => 'https://github.com/CoderCYLee/CYStatusBarHUD.git', :tag => s.version }

s.platform     = :ios, '6.0'
s.requires_arc = true

s.source_files  = 'CYStatusBarHUD'
s.resource  = 'CYStatusBarHUD/CYStatusBarHUD.bundle'
s.framework = 'UIKit'


end
