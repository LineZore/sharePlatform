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
        properties.put("mail.transport.protocol", "smtp");// ����Э��
        properties.put("mail.smtp.host", "smtp.qq.com");// ������
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        
//        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
//        properties.put("mail.smtp.ssl.enable", "true");
//        properties.put("mail.debug", "true");
        Session session = Session.getInstance(properties);
        // ��ȡ�ʼ�����
        Message message = new MimeMessage(session);
        // ���÷����������ַ
        try {
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new InternetAddress(userEmail)});
	        message.setSubject("�����רҵ���Ϸ���ƽ̨:");
	        message.setText(context);//�������ǵ��ʼ�Ҫ���͵���Ϣ����

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // �����ռ��������ַ 
                // �õ��ʲ����
        Transport transport;
		try {
			transport = session.getTransport();
			transport.connect(from, token);// ����ΪQQ���俪ͨ��stmp�����õ��Ŀͻ�����Ȩ��,�����Լ��ļ���
	        // �����ʼ�
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
