package com.ship.service;

import java.util.List;

import com.ship.domain.Usr;

public interface UsrService {
	List<Usr> selectAllS();
	Boolean checkExistEmailS(String usrEmail);
	Boolean checkExistPhoneS(String usrPhone);
	Boolean checkExistIdS(String usrId);
	Boolean checkIdWithPhoneS(Usr findUsr);
	Boolean checkExistSocialUsrS(Usr usr);
	
	
	
	void insertNewUsrS(Usr newUsr);		// ȸ������
	void insertNewSNSUsrS(Usr newUsr);	// īī���� ȸ������
	
	
	
	void updateUsrPwdS(Usr updateUsr);
	
	Usr loginS(Usr loginUsr);	
	Usr usrInfoS(int usrNum);
	String findForgetIdS(Usr usr);
	String selectUsrNicknameS(int usrNum);
	
	void updateUsrNameS(Usr usr);
	void updateUsrNicknameS(Usr usr);
	void updateMyUsrBirthS(Usr usr);
	void updateMyUsrGenderS(Usr usr);
	void updateMyUsrEmailS(Usr usr);
	void updateMyUsrPhoneS(Usr usr);
	void updateMyUsrPwdS(Usr usr);
	void updateMyCityS(Usr usr);
	void updateUsrPhotoPathS(Usr usr);
	
	List<Usr> select_Invite_UsrS(int shipNum);
}
