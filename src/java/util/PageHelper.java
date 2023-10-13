package util;

public class PageHelper {

	private int pageNo;
	private int pageSize;
	private int dataCount;
	private int pageCount;//每一页数量
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getDataCount() {
		return dataCount;
	}
	public void setDataCount(int dataCount) {
		this.dataCount = dataCount;
	}
	public int getPageCount() {
		if(this.getDataCount()%this.getPageSize()==0) {
			this.pageCount=this.dataCount/this.pageSize;
		}else {
			this.pageCount=this.dataCount/this.pageSize+1;
		}
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
	
}
