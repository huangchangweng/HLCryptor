Pod::Spec.new do |spec|

  spec.name         = "HLCryptor"
  spec.version      = "1.0.0"
  spec.summary      = "HLCryptor是处理iOS中AES、DES加/解密的工具类"

  # 描述
  spec.description  = <<-DESC
    HLCryptor支持：1.AES加/解密 2.DES加/解密
  DESC

  # 项目主页
  spec.homepage     = "https://github.com/huangchangweng/HLCryptor"
 
  # 开源协议
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  
  # 作者
  spec.author             = { "黄常翁" => "599139419@qq.com" }
  
  # 支持平台
  spec.platform     = :ios, "9.0"

  # git仓库，tag
  spec.source       = { :git => "git@github.com:huangchangweng/HLCryptor.git", :tag => "1.0.0" }

  # 资源路径
  spec.source_files  = "HLCryptor/HLCryptor/*.{h,m}"

  # 依赖系统库
  spec.frameworks = "Foundation", "UIKit"

end
