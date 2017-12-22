package vo;

public class CommentVo {

	int c_idx,idx;
	String c_name,c_content,c_ip,c_pwd,c_regdate;
	
	public CommentVo(){}

	public CommentVo(int idx,String c_name, String c_content, String c_ip, String c_pwd) {
		super();
		this.idx = idx;
		this.c_name = c_name;
		this.c_content = c_content;
		this.c_ip = c_ip;
		this.c_pwd = c_pwd;
	}



	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_ip() {
		return c_ip;
	}
	public void setC_ip(String c_ip) {
		this.c_ip = c_ip;
	}
	public String getC_pwd() {
		return c_pwd;
	}
	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}
	public String getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(String c_regdate) {
		this.c_regdate = c_regdate;
	}
	
	
}
