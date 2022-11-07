package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Usr {
	private int usrNum; // ȸ����ȣ
	private String usrId; // ȸ�����̵�
	private String usrEmail; // �̸���
	private String usrPhone; // ȸ���޴�����ȣ
	private String usrPwd; // ��й�ȣ
	private String usrName; // ȸ���̸�
	private String usrNickname; // �г���
	private Date usrBirth; // �������
	private String usrGender; // ���� īī�� ���� ���̹� ���� male female �̷��� �����༭ String����
	private int usrCity; // ȸ������
	private int usrTown; // ȸ������
	private int usrPhoto; // ���� ��뿩�� 0=�⺻���� 1= �ڱ����
	private String usrPhotoPath;// ���� src �ּ�(���)

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone = "Asia/Seoul")
	private Date usrRdate; // ���Գ�¥
	
	private String updateThing;

	// ȸ�������Ҷ�
	public Usr(String usrId, String usrEmail, String usrPhone, String usrPwd, String usrName, String usrNickname,
			Date usrBirth, String usrGender, int usrCity, int usrTown) {
		this.usrId = usrId;
		this.usrPhone = usrPhone;
		this.usrEmail = usrEmail;
		this.usrPwd = usrPwd;
		this.usrName = usrName;
		this.usrNickname = usrNickname;
		this.usrBirth = usrBirth;
		this.usrGender = usrGender;
		this.usrCity = usrCity;
		this.usrTown = usrTown;
	}

	// ���̵�+�ڵ��� ���� ��й�ȣã����
	public Usr(String usrId, String usrPwd) {
		this.usrId = usrId;
		this.usrPwd = usrPwd;
	}
	
	public Usr(int usrNum, Integer usrCity, Integer usrTown) {
		this.usrNum = usrNum;
		this.usrCity = usrCity;
		this.usrTown = usrTown;
	}
	// īī�� �α���
	public Usr(String usrId,String usrEmail,String usrNickname,String usrGender,String usrPhotoPath,String usrFrom) {
		this.usrId = usrId;
		this.usrEmail = usrEmail;
		this.usrPwd = usrFrom;		
		this.usrPhone = "77777777777";
		this.usrNickname = usrNickname;
		this.usrGender = usrGender;
		this.usrPhotoPath = usrPhotoPath;
	}
	
	public Usr(int usrNum , String updateThing){
		this.usrNum=usrNum;
		this.updateThing=updateThing;		
	}

}
