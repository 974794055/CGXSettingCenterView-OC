Pod::Spec.new do |s|
    s.name         = "CGXSettingCenterViewOC"    #存储库名称
    s.version      = "0.0.1"      #版本号，与tag值一致
    s.summary      = "CGXSettingCenterViewOC是基于UITableView封装的项目设置页面的轻量级库"  #简介
    s.description  = "CGXSettingCenterViewOC是基于UITableView封装的项目设置页面的轻量级库，实现了左侧图文组合、右侧头像、开关、富文本显示效果"  #描述
    s.homepage     = "https://github.com/974794055/CGXSettingCenterView-OC"      #项目主页，不是git地址
    s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
    s.author             = { "974794055" => "974794055@qq.com" }  #作者
    s.platform     = :ios, "9.0"                  #支持的平台和版本号
    s.source       = { :git => "https://github.com/974794055/CGXSettingCenterView-OC.git", :tag => s.version }         #存储库的git地址，以及tag值
    s.requires_arc = true #是否支持ARC
    s.frameworks = 'UIKit','Foundation'
    s.static_framework = true
    s.ios.deployment_target = '9.0'
    #需要托管的源代码路径
    s.source_files = 'CGXSettingCenterViewOC/**/*.{h,m}'
    #开源库头文件
    s.public_header_files = 'CGXSettingCenterViewOC/**/*.{h,m}'
    
    s.subspec 'CustomModel' do |ss|
        ss.source_files = 'CGXSettingCenterViewOC/CustomModel/**/*.{h,m}'
    end
    s.subspec 'CustomView' do |ss|
        ss.source_files = 'CGXSettingCenterViewOC/CustomView/**/*.{h,m}'
        ss.dependency 'CGXSettingCenterViewOC/CustomModel'
    end
end




