package com.ship.mapper;

import java.util.List;

import com.ship.domain.Usr;

public interface UsrMapper {
	
	List<Usr> selectAll(); // ������ �׽�Ʈ��
	
	int checkExistEmail(String usrEmail); // ȸ������ and �α���
	int checkExistPhone(String usrPhone); // ȸ������ and �α���
	int checkIdWithPhone(Usr findUsr);
	int checkExistId(String usrId); // ȸ������ and �α���
	int checkExistSocialUsr(Usr usr);
	
	void insertNewUsr(Usr newUsr);	// ȸ������
	void insertNewSNSUsr(Usr newUsr); //īī��
	
	void updateUsrPwd(Usr updateUsr);
	
	Usr login(Usr loginUsr);	//�α���
	
	Usr usrInfo(int usrNum);
	
	String findForgetId(Usr usr);
	String selectUsrNickname(int usrNum);
	
	
	void updateUsrName(Usr usr);
	void updateUsrNickname(Usr usr);
	void updateMyUsrBirth(Usr usr);
	void updateMyUsrGender(Usr usr);
	void updateMyUsrEmail(Usr usr);
	void updateMyUsrPhone(Usr usr);
	void updateMyUsrPwd(Usr usr);
	void updateMyCity(Usr usr);
	void updateUsrPhotoPath(Usr usr);
	
	List<Usr> select_Invite_Usr(int shipNum);	
}
