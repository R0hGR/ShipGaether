package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Note {
   private int noteNum;       //       ȣ
   private int noteSender;    //         foreign
   private int noteReceiver;    //  ޴»   foreign
   private String noteContent; //         
   private int noteStatus;    //      Ȯ ο   
   
   @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
   private Date noteWdate;      //      ۼ   ¥
      
   private int crewNum;       // ũ   ȣ
   private int usrNum;       // ȸ    ȣ foreign
   private int shipNum;       //    ӹ ȣ foreign   
   private String crewRole;    //             
   private int crewBookmark;   //    ã       
   
   @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
   private Date crewJdate;      //    Գ ¥
   private String crewNickname;    //             
   private String crewPhoto;    //             
   
   private String shipName;    //             
}