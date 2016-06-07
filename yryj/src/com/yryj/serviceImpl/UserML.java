package com.yryj.serviceImpl;

import java.util.Calendar;
import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import com.yryj.dao.UserDao;
import com.yryj.daoImpl.UserDL;
import com.yryj.model.MyAuthenticator;
import com.yryj.model.User;
import com.yryj.pub.Format;
import com.yryj.sercvice.UserManager;

public class UserML implements UserManager{
private UserDao userDao=null;

	public void save(User user) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		userDao.save(user);
	}

	@Override
	public void delete(long id) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		userDao.delete(id);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		userDao.update(user);
	}

	@Override
	public User find(long id) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		return userDao.find(id);
	}

	@Override
	public User checkLogin(User user) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		return userDao.findByName(user.getName());
	}

	@Override
	public User findUserByEmail(User user) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		return userDao.findByEmail(user.getEmail());
	}

	@Override
	public User findUserByPhone(User user) {
		// TODO Auto-generated method stub
		userDao=new UserDL();
		return userDao.findByPhone(user.getPhone());
	}

	@Override
	public void findPassword(User user) {
		// TODO Auto-generated method stub
		Properties props = new Properties();
		props.put("mail.smtp.host", Format.smtpHost);
		props.put("mail.smtp.starttls.enable","true");//使用 STARTTLS安全连接
		props.put("mail.transport.protocol", "smtp");// 发送邮件的协议
		props.put("mail.smtp.port", Format.hostPort);			 //google使用465或587端口
		//props.setProperty("mail.smtp.socketFactory.port", "25");
		props.put("mail.smtp.auth", "true");		// 使用验证
		props.put("mail.debug", "true");
		javax.mail.Session mailSession = javax.mail.Session.getInstance(props,new MyAuthenticator( Format.from, Format.fromUserPassword));
		
		try {
		InternetAddress fromAddress = new InternetAddress(Format.from);
		InternetAddress toAddress = new InternetAddress(user.getEmail());

		MimeMessage message = new MimeMessage(mailSession);

		message.setFrom(fromAddress);
		message.addRecipient(RecipientType.TO, toAddress);

		message.setSentDate(Calendar.getInstance().getTime());
		message.setSubject( Format.subject);
		String messageText=Format.messageStart+"?id="+user.getId()+Format.messageEnd;
		message.setContent(messageText,  Format.messageType);
		
		Transport transport = mailSession.getTransport("smtp");
		transport.connect(Format.smtpHost,Format.fromName,Format.fromUserPassword);
		transport.send(message, message.getRecipients(RecipientType.TO));
		transport.close();
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


}
