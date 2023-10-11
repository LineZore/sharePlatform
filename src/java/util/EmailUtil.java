package util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailUtil {
	public void sendVerificationEmail(String userEmail,String context) {
		String from ="2649883212@qq.com";
		String token="vmdjfvgdpqgudigi";
		
		Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");// 连接协议
        properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        
//        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
//        properties.put("mail.smtp.ssl.enable", "true");
//        properties.put("mail.debug", "true");
        Session session = Session.getInstance(properties);
        // 获取邮件对象
        Message message = new MimeMessage(session);
        // 设置发件人邮箱地址
        try {
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new InternetAddress(userEmail)});
	        message.setSubject("计算机专业资料分享平台:");
	        message.setText(context);//这是我们的邮件要发送的信息内容

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // 设置收件人邮箱地址 
                // 得到邮差对象
        Transport transport;
		try {
			transport = session.getTransport();
			transport.connect(from, token);// 密码为QQ邮箱开通的stmp服务后得到的客户端授权码,输入自己的即可
	        // 发送邮件
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();
		} catch (NoSuchProviderException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
}
