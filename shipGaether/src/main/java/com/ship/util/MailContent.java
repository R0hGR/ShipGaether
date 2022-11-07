package com.ship.util;

public class MailContent {   
   
   public String makeSignUpContent(String usrName , String code){
      String content="<table align=\"center\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#ffffff\"\r\n" + 
            "    style=\"max-width:640px;margin:0 auto\">\r\n" + 
            "    <tbody>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"5\" colspan=\"3\" bgcolor=\"#34deeb\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"6%\" height=\"25\" bgcolor=\"#ffffff\"></td>\r\n" + 
            "            <td width=\"88%\" height=\"25\" bgcolor=\"#34deeb\"><img\r\n" + 
            "                    src=\"https://coresos-phinf.pstatic.net/a/34j739/8_hjhUd018svcnuzhs84pb59o_2hfh10.png?cors=band\"\r\n" + 
            "                    width=\"630\" height=\"150\" alt=\"kakao\" border=\"0\" style=\"display:block\" loading=\"lazy\"></td>\r\n" + 
            "            <td width=\"6%\" height=\"25\" bgcolor=\"#ffffff\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"5\" colspan=\"3\" bgcolor=\"#34deeb\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"35\" colspan=\"3\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "            <td width=\"88%\"\r\n" +  
            "                style=\"font-size:18px;line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;font-weight:bold;color:#1e1e1e;word-break:keep-all;\">\r\n" +
            usrName+" 님 안녕하세요.<br> SHIP-GAETHER 에서 회원가입을 위한 이메일 인증을 요청합니다."+"</td>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"35\" colspan=\"3\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "            <td width=\"88%\"\r\n" + 
            "                style=\"font-size:14px;line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;color:#1e1e1e\">\r\n" + 
            "                "
            + "안녕하세요. SHIP-GAETHER입니다."
            + "<br> "
            + "SHIP-GAETHER에 가입하려는 "
            + usrName
            +"님께 감사드리며,"
            + "<br> "
            + "이메일 인증을 완료하여 SHIP-GAETHER의 회원이 되어보세요!"
            + "\r\n" + 
            "            </td>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"15\" colspan=\"3\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "            <td width=\"88%\"\r\n" + 
            "                style=\"font-size:14px;line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;color:#1e1e1e\">\r\n" + 
            "                "
            + "아래 인증 코드를 통해 회원가입을 완료하여 더 많은 서비스를 이용하시길 바랍니다."
            + "</td>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"15\" colspan=\"3\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "            <td width=\"88%\">\r\n" + 
            "                <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#f8f8f8\"\r\n" + 
            "                    style=\"line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;color:#1e1e1e\">\r\n" + 
            "                    <tbody>\r\n" + 
            "                        <tr>\r\n" + 
            "                            <td width=\"100%\" height=\"13\" colspan=\"4\"></td>\r\n" + 
            "                        </tr>\r\n" +         
            "                        <tr>\r\n" + 
            "                            <td width=\"3%\"></td>\r\n" + 
            "                            <td valign=\"top\" width=\"2%\" style=\"font-size:14px\"></td>\r\n" + 
            "                            <td valign=\"top\" width=\"92%\" style=\"font-size:25px;line-height:100px\"><strong>"
            + "인증코드 : "+code
            + "</strong></td>\r\n" + 
            "                            <td width=\"3%\"></td>\r\n" + 
            "                        </tr>\r\n" + 
            "                        <tr>\r\n" + 
            "                            <td width=\"100%\" height=\"9\" colspan=\"4\"></td>\r\n" + 
            "                        </tr>\r\n" + 
            "                    </tbody>\r\n" + 
            "                </table>\r\n" + 
            "            </td>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 

            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"15\" colspan=\"3\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"35\" colspan=\"3\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "            <td width=\"88%\"\r\n" + 
            "                style=\"font-size:14px;line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;color:#1e1e1e\">\r\n" + 
            "                감사합니다.</td>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"60\" colspan=\"3\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"1\" colspan=\"3\" bgcolor=\"#e6e6e6\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "            <td width=\"88%\"\r\n" + 
            "                style=\"font-size:12px;line-height:18px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'돋움',Dotum;letter-spacing:-1px;color:#767676\">\r\n" + 
            "                본 메일은 SHIP-GAETHER 회원가입 확인용 메일이며, 발신전용입니다.<br>\r\n" + 
            "                Copyright © <a href=\"http://www.kakao.com/\" target=\"_blank\" style=\"color:#767676;text-decoration:none\"\r\n" + 
            "                    rel=\"noreferrer noopener\">SHIP-GAETHER Corp.</a> All rights reserved.\r\n" + 
            "            </td>\r\n" + 
            "            <td width=\"6%\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "        <tr>\r\n" + 
            "            <td width=\"100%\" height=\"16\" colspan=\"3\"></td>\r\n" + 
            "        </tr>\r\n" + 
            "    </tbody>\r\n" + 
            "</table>";            
      return content;
   }
   public String makeFindUsrInfoContent(String usrName , String code){
      
      return "";
   }
//   public static String content="<table align=\"center\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#ffffff\"\r\n" + 
//         "    style=\"max-width:640px;margin:0 auto\">\r\n" + 
//         "    <tbody>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"47\" colspan=\"3\" bgcolor=\"#34deeb\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"6%\" height=\"25\" bgcolor=\"#34deeb\"></td>\r\n" + 
//         "            <td width=\"88%\" height=\"25\" bgcolor=\"#34deeb\"><img\r\n" + 
//         "                    src=\"https://coresos-phinf.pstatic.net/a/34j739/8_hjhUd018svcnuzhs84pb59o_2hfh10.png?cors=band\"\r\n" + 
//         "                    width=\"630\" height=\"150\" alt=\"kakao\" border=\"0\" style=\"display:block\" loading=\"lazy\"></td>\r\n" + 
//         "            <td width=\"6%\" height=\"25\" bgcolor=\"#34deeb\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"46\" colspan=\"3\" bgcolor=\"#34deeb\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"35\" colspan=\"3\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "            <td width=\"88%\"\r\n" + 
//         "                style=\"font-size:18px;line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;font-weight:bold;color:#1e1e1e;word-break:keep-all;\">\r\n" + 
//         "                [카카오] 카카오 통합서비스약관, 카카오 서비스 약관 변경 안내</td>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"35\" colspan=\"3\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "            <td width=\"88%\"\r\n" + 
//         "                style=\"font-size:14px;line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;color:#1e1e1e\">\r\n" + 
//         "                안녕하세요. 카카오입니다.<br> 카카오 서비스를 이용해주시는 이용자 분들께 감사드리며,<br> '카카오 통합서비스약관', '카카오 서비스 약관' 개정 내용에 관해 안내드립니다.\r\n" + 
//         "            </td>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"15\" colspan=\"3\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "            <td width=\"88%\"\r\n" + 
//         "                style=\"font-size:14px;line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;color:#1e1e1e\">\r\n" + 
//         "                아래 변경 사항을 확인하시어, 서비스 이용에 참고하시기 바랍니다.</td>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"15\" colspan=\"3\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "            <td width=\"88%\">\r\n" + 
//         "                <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#f8f8f8\"\r\n" + 
//         "                    style=\"line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;color:#1e1e1e\">\r\n" + 
//         "                    <tbody>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"100%\" height=\"13\" colspan=\"4\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"3%\"></td>\r\n" + 
//         "                            <td valign=\"top\" width=\"2%\" style=\"font-size:14px;line-height:18px;font-weight:bold\">1.</td>\r\n" + 
//         "                            <td width=\"92%\" style=\"font-size:14px;line-height:18px;font-weight:bold\"> 변경 내용</td>\r\n" + 
//         "                            <td width=\"3%\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"100%\" height=\"8\" colspan=\"4\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"3%\"></td>\r\n" + 
//         "                            <td valign=\"top\" width=\"2%\" style=\"font-size:14px\"></td>\r\n" + 
//         "                            <td valign=\"top\" width=\"92%\" style=\"font-size:14px;line-height:18px\">&lt;카카오 통합서비스\r\n" + 
//         "                                약관&gt;<br>- 제 6 조 (다양한 서비스의 제공) 제 3항 수정<br>- 제 13 조 (이용계약 해지) 제 3항 수정</td>\r\n" + 
//         "                            <td width=\"3%\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"100%\" height=\"8\" colspan=\"4\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"3%\"></td>\r\n" + 
//         "                            <td valign=\"top\" width=\"2%\" style=\"font-size:14px\"></td>\r\n" + 
//         "                            <td valign=\"top\" width=\"92%\" style=\"font-size:14px;line-height:18px\">&lt;카카오 서비스 약관&gt;<br>-\r\n" + 
//         "                                원치 않으시면 해지할 수 있습니다 내용 수정</td>\r\n" + 
//         "                            <td width=\"3%\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"100%\" height=\"8\" colspan=\"4\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"3%\"></td>\r\n" + 
//         "                            <td valign=\"top\" width=\"2%\" style=\"font-size:14px;line-height:18px;font-weight:bold\">2.</td>\r\n" + 
//         "                            <td valign=\"top\" width=\"92%\" style=\"font-size:14px;line-height:18px;font-weight:bold\">변경 시기\r\n" + 
//         "                            </td>\r\n" + 
//         "                            <td width=\"3%\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"3%\"></td>\r\n" + 
//         "                            <td valign=\"top\" width=\"2%\" style=\"font-size:14px\">ㆍ</td>\r\n" + 
//         "                            <td valign=\"top\" width=\"92%\" style=\"font-size:14px;line-height:18px\"><strong>변경된 약관의 시행일은\r\n" + 
//         "                                    2022년 10월 12일입니다.</strong></td>\r\n" + 
//         "                            <td width=\"3%\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"100%\" height=\"9\" colspan=\"4\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                    </tbody>\r\n" + 
//         "                </table>\r\n" + 
//         "            </td>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "            <td width=\"88%\"\r\n" + 
//         "                style=\"font-size:14px;line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;color:#1e1e1e\">\r\n" + 
//         "                <br>약관의 자세한 변경 내용은 아래 <strong>[공지사항]</strong> 링크를 통해 확인할 수 있습니다.</td>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"15\" colspan=\"3\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"6%\" height=\"34\"></td>\r\n" + 
//         "            <td width=\"88%\" height=\"34\">\r\n" + 
//         "                <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"\r\n" + 
//         "                    style=\"line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;color:#1e1e1e\">\r\n" + 
//         "                    <tbody>\r\n" + 
//         "                        <tr>\r\n" + 
//         "                            <td width=\"31%\" height=\"34\"></td>\r\n" + 
//         "                            <td align=\"center\" width=\"38%\" height=\"34\" bgcolor=\"#5066aa\"\r\n" + 
//         "                                style=\"min-width:210px;font-size:14px;border-radius:4px;word-break:keep-all;\">\r\n" + 
//         "                                <a href=\"https://www.kakao.com/policy/notice/view?seq=2546&amp;lang=ko\" target=\"_blank\"\r\n" + 
//         "                                    style=\"display:block;color:#fff;line-:34px;text-decoration:none\"\r\n" + 
//         "                                    rel=\"noreferrer noopener\">공지사항 확인하기</a>\r\n" + 
//         "                            </td>\r\n" + 
//         "                            <td width=\"31%\" height=\"34\"></td>\r\n" + 
//         "                        </tr>\r\n" + 
//         "                    </tbody>\r\n" + 
//         "                </table>\r\n" + 
//         "            </td>\r\n" + 
//         "            <td width=\"6%\" height=\"34\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"35\" colspan=\"3\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "            <td width=\"88%\"\r\n" + 
//         "                style=\"font-size:14px;line-height:22px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'굴림',gulim;letter-spacing:-1px;color:#1e1e1e\">\r\n" + 
//         "                감사합니다.</td>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"60\" colspan=\"3\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"1\" colspan=\"3\" bgcolor=\"#e6e6e6\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "            <td width=\"88%\"\r\n" + 
//         "                style=\"font-size:12px;line-height:18px;font-family:'맑은고딕',Malgun Gothic,Apple SD Gothic Neo,sans-serif,'돋움',Dotum;letter-spacing:-1px;color:#767676\">\r\n" + 
//         "                본 메일은 2022년 8월 28일 기준 카카오계정 회원에게 발송되었으며, 발신전용입니다.<br>\r\n" + 
//         "                Copyright © <a href=\"http://www.kakao.com/\" target=\"_blank\" style=\"color:#767676;text-decoration:none\"\r\n" + 
//         "                    rel=\"noreferrer noopener\">Kakao Corp.</a> All rights reserved.\r\n" + 
//         "            </td>\r\n" + 
//         "            <td width=\"6%\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "        <tr>\r\n" + 
//         "            <td width=\"100%\" height=\"16\" colspan=\"3\"></td>\r\n" + 
//         "        </tr>\r\n" + 
//         "    </tbody>\r\n" + 
//         "</table>";
}