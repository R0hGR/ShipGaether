package com.ship.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ship.domain.Usr;
import com.ship.mapper.UsrMapper;

@Service
public class UsrServiceImpl implements UsrService {
	@Autowired
	private UsrMapper usrMapper;

	@Override
	public List<Usr> selectAllS() {
		return usrMapper.selectAll();
	}

	@Override
	public Boolean checkExistEmailS(String usrEmail) {
		int countUsrEmail = usrMapper.checkExistEmail(usrEmail);

		if (countUsrEmail > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Boolean checkExistPhoneS(String usrPhone) {
		int countUsrPhone = usrMapper.checkExistPhone(usrPhone);

		if (countUsrPhone > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Boolean checkIdWithPhoneS(Usr findUsr) {
		int countUsr = usrMapper.checkIdWithPhone(findUsr);
		if (countUsr > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Boolean checkExistIdS(String usrId) {
		int countUsrEmail = usrMapper.checkExistId(usrId);

		if (countUsrEmail > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public Boolean checkExistSocialUsrS(Usr usr) {
		int countSocialUsrEmail = usrMapper.checkExistSocialUsr(usr);

		if (countSocialUsrEmail > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void insertNewUsrS(Usr newUsr) {
		usrMapper.insertNewUsr(newUsr);
	}

	@Override
	public void insertNewSNSUsrS(Usr newUsr) {
		usrMapper.insertNewSNSUsr(newUsr);
	}

	@Override
	public void updateUsrPwdS(Usr updateUsr) {
		usrMapper.updateUsrPwd(updateUsr);
	}

	@Override
	public Usr loginS(Usr loginUsr) {
		Usr usr = usrMapper.login(loginUsr);
		if (usr != null) {
			return usr;
		} else {
			return null;
		}
	}

	@Override
	public Usr usrInfoS(int usrNum) {
		return usrMapper.usrInfo(usrNum);
	}

	@Override
	public String findForgetIdS(Usr usr) {
		return usrMapper.findForgetId(usr);
	}
	
	@Override
	public String selectUsrNicknameS(int usrNum) {
		return usrMapper.selectUsrNickname(usrNum);
	}
	
	@Override
	public void updateUsrNameS(Usr usr) {
		usrMapper.updateUsrName(usr);
	}
	
	@Override
	public void updateUsrNicknameS(Usr usr) {
		usrMapper.updateUsrNickname(usr);
	}
	
	@Override
	public void updateMyUsrBirthS(Usr usr) {
		usrMapper.updateMyUsrBirth(usr);
	}
	
	@Override
	public void updateMyUsrGenderS(Usr usr) {
		usrMapper.updateMyUsrGender(usr);
	}
	@Override
	public void updateMyUsrEmailS(Usr usr) {
		usrMapper.updateMyUsrEmail(usr);
	}
	
	@Override
	public void updateMyUsrPhoneS(Usr usr) {
		usrMapper.updateMyUsrPhone(usr);
	}
	@Override
	public void updateMyUsrPwdS(Usr usr) {
		usrMapper.updateMyUsrPwd(usr);
	}
	@Override
	public void updateMyCityS(Usr usr) {
		usrMapper.updateMyCity(usr);
	}
	@Override
	public void updateUsrPhotoPathS(Usr usr) {
		usrMapper.updateUsrPhotoPath(usr);
	}
	
	@Override
	public List<Usr> select_Invite_UsrS(int shipNum) {
		return usrMapper.select_Invite_Usr(shipNum);
	}
}
