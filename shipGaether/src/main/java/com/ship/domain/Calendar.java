package com.ship.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Calendar{
	private int CalendarId;
	private String CalendarGroupId;
	private Integer shipNum;
	private Integer usrNum;
	private String CalendarTitle;
	private String CalendarWriter;
	private String CalendarContent;
	private String CalendarStart;
	private String CalendarEnd;
    private boolean CalendarAllDay;
	private String CalendarTextColor;
	private String CalendarBackgroundColor;
	private String CalendarBorderColor;
}
