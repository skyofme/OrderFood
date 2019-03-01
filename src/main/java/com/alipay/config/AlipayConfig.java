package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
	//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

			// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
			public static String app_id = "2016091800540969";
			
			// 商户私钥，您的PKCS8格式RSA2私钥
		    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCLqWHglQ9XpkKjZ3XgekxKX+EfxveLlDDAnw1tu92qcW52ItKBKLYr3bLcAUTGqjSNc5i+LbpnZ3crWjnSYTc039ctLtCzbAMHVAJrFARmzG5zsUn5QcjNbra8FhOO9P9IJvrtfh72VxTCEHTZT1PoRs2ZLDc5GrG/wDVXO8BfARgRcP32TO1oT2d9Ssbw0kcjco1scqbkrk1xT03QGZnlYgC+Z9111OXCqd4Sp0DyQU7wHRxdIIYfK0vU+4Af2nTMB77lXG/u0evHetaXArhMBIjDuFRr5NiDzsfy/fzGrVCSwnkLYQScl/EWc22gpPyzqoQmE9HFzJn/CFkQRxVNAgMBAAECggEALeTbZRGWmRbpjwjQk5OcvlQDho27iwKHgsTBhO3XScs8oVWQFyFpu8B+pg1ErIQCAPmbl+Mu/gvh/T0JAzkvCxEDhLV9n3g/Bol0wfsx9xX2tc3soRwdAGUBZ41ZoACiYvNsQd7QDeNPzvXZcA/BYvLhXRRKkVlUT865uJDKBm25P3hL8sCmnGvC29YSR6f0MIuq2yOod8nWBQzPnT9sm411VTvJ0RrIjiMRvt25y1yZUq5ydo87GO3/+sY9DxKRo+3dl5YPS4ZCnueygAC4zxgVm7wiBV8CbzzWo59FBLNFw9wqI6CI9eUceIbK0SNWOmRxzMuJ2axnsYXewWuwAQKBgQDEOrKekRQ6v5UxKYtLCTh1W0G04VAGg1qxKKyuYzUYzPz5tb5NUA1+Y4UNj1ACCIsCTCQioriuaxeeHK9bZC12Pu/lkXMsdMMFSm15N27ygJX0FueALy9RsPH6Tl9n1jzVxl0zeDpM2g8T/PCcqmvHdcTYqAF4J1OODWrClchAIQKBgQC2M7rQPSGSvc+FvNGTIqEYn329EyQa6zBzZ8sUFZr4+gjF9K3CNI8ulorCam6JXFKVHNfSG8OvqnWFrM/ar1FQERfUssYvrYjWEgp+wX0I714rEoxi3ThJaYEPccSEiRDg2OznPdFclLiS89BgFT804220CVMgf8cCdXLKgTffrQKBgQC5WTREgIbaIwI56KLQoon4l9UNlFDxhfsRIXlSUxThMya0e02gW0ATpM8Visuo0Ab1iZQMPyUwYqlxSGj+azZh3XrdnbBrSnK3OaEEAS9D0d9SKpxKQMdyYy99HbASNZNK3U5FgoeW9dWOLLndUT/yrDPd7XtN0d+jatrvp2j54QKBgQCzaSq6JIfrq/YttakUXhQNX/d7d96klxRlfz3sL/4izmpXKsDyq7iV4m0OVak0nvE+nWEzJl3Bm3MPxwQBTYMe+UXjDoqypglI6gjlmfdaFgI/HYuZSkZDm50XLSqaazFwhop4hVmj9VnuciCsjB9qH8yFbG0rYkb/d9Ep8KWpHQKBgQCECQJQQ8+LOQoosOQ491rtZGzA3+093lrgOfR89l54AMgHhewe1HJIz9XbfH/nM27XTd+A4KZqEzj5Lfxi9DTU9SOI4tIHaIatIeDMyOKoz7MdQKI1y8/OWB04Mg9TT1kg8WV0KmBGWLKXfKYx9x7CGg8OYOs+qMgsjwoVe9o4VQ==";
			// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
		    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzs37XVFgnWGpC+49Pb7lDxwNzcc7g+Wo/yd8xK49Js3Ax/W1vPXDhJtwXWA6/hcnQOxmTTjVsF052TobhrWnrYVEPyP3TUwWNLRcKg1JEydvil5AxMeJoE8ML+sy8RZkUAfrGXd0rc9L5dPS3zEc1P3zR4VDi6sRECYCY02YqwTqmtdLOk0HUTYm+3Xb3Wywl/vZqxaLDbYL3UmzRzbElgg4+keLCPHgwmYPS1gWPFXtMhYO8YHGYbimjKmyDU+DQd3C1ikPidRDTtc00z/StTedEX6OrcKSe4aDxKoeJxpNNSEEc936VynyHJb0YcHl0o5cVK90If2xGp9/Mytc5wIDAQAB";
			// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
			public static String notify_url = "http://localhost:8080/OrderFood/alipay/alipayNotifyNotice.action";

			// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
			public static String return_url = "http://localhost:8080/OrderFood/alipay/alipayReturnNotice.action";

			// 签名方式
			public static String sign_type = "RSA2";
			
			// 字符编码格式
			public static String charset = "utf-8";
			
			// 支付宝网关
			public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
			
			// 支付宝网关
			public static String log_path = "d:\\";


		//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

		    /** 
		     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
		     * @param sWord 要写入日志里的文本内容
		     */
		    public static void logResult(String sWord) {
		        FileWriter writer = null;
		        try {
		            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
		            writer.write(sWord);
		        } catch (Exception e) {
		            e.printStackTrace();
		        } finally {
		            if (writer != null) {
		                try {
		                    writer.close();
		                } catch (IOException e) {
		                    e.printStackTrace();
		                }
		            }
		        }
		    }
}
