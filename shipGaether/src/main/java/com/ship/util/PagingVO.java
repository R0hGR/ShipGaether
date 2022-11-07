package com.ship.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class PagingVO {
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;	
	private String order;
	private String category;
	private String keyword;
	private String theme;
	private int usrNum;

	private int cntPage = 5; // 페이징 갯수 << 1 2 3 4 5 >>
//	private int cntPage = 10; // 페이징 갯수 << 1 2 3 4 5 6 7 8 9 10 >>
	
	public PagingVO(int total,int nowPage, int cntPerPage ) {
				
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		System.out.println(" # PagingVO  calcStartEndPage 후");
		calcStartEnd(getNowPage(), getCntPerPage());		
	}
	
	public PagingVO(int total,int nowPage, int cntPerPage ,int usrNum) {
		this.usrNum=usrNum;
		
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		System.out.println(" # PagingVO  calcStartEndPage 후");
		calcStartEnd(getNowPage(), getCntPerPage());		
	}
	
	public PagingVO(int totalK,int nowPage, int cntPerPage ,int usrNum, String category, String keyword) {
		this.usrNum=usrNum;
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(totalK);		
		
		setCategory(category);
		setKeyword(keyword);
		
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());		
	}
	
	public PagingVO(int totalK,int nowPage, int cntPerPage ,int usrNum, String category, String keyword, String theme) {		
		this.usrNum=usrNum;
		this.theme=theme;
		
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(totalK);		
		
		setCategory(category);
		setKeyword(keyword);
		
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());		
	}
	
	public PagingVO(int totalK,int nowPage, int cntPerPage , String category, String keyword ,String order) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(totalK);
		setOrder(order);
		
		setCategory(category);
		setKeyword(keyword);
		
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());		
	}
	
	
	
	
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	
	
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}

	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}

	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + "]";
	}	
	
}
