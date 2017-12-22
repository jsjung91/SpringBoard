package util;

public class Paging {
	public static String getPaging(String pageURL, int nowPage, int rowTotal, int blockList, int blockPage) {

		int totalPage, startPage, endPage;

		boolean isPrevPage, isNextPage;
		StringBuffer sb; 
		isPrevPage = isNextPage = false;

		totalPage = (int) (rowTotal / blockList);
		if (rowTotal % blockList != 0)
			totalPage++;

		if (nowPage > totalPage)
			nowPage = totalPage;

		startPage = (int) (((nowPage - 1) / blockPage) * blockPage + 1);
		endPage = startPage + blockPage - 1; //

		if (endPage > totalPage)
			endPage = totalPage;
		
		if (endPage < totalPage)
			isNextPage = true;
		
		if (startPage > 1)
			isPrevPage = true;

		sb = new StringBuffer();
		
		// --------------------------------------------------------------------------------------------
		if (isPrevPage) {
			sb.append("<a href ='" + pageURL + "?page=");
			sb.append(nowPage - blockPage);
			sb.append("'>��</a>");
		} else
			sb.append("��");

		// -------------------------------------------------------------------------------------------------
		
		sb.append("|");
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage)
				break;
			if (i == nowPage) { 
				sb.append("&nbsp;<b><font color='#91b72f'>");
				sb.append(i);
				sb.append("</font></b>");
			} else {
				sb.append("&nbsp;<a href='" + pageURL + "?page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		} // end for

		sb.append("&nbsp;|");

		// ----------------------------------------------------------------------------------------------
		if (isNextPage) {
			sb.append("<a href='" + pageURL + "?page=");
			if (nowPage + blockPage > totalPage)
				nowPage = totalPage;
			else
				nowPage = nowPage + blockPage;
			sb.append(nowPage);
			sb.append("'>��</a>");
		} else
			sb.append("��");
		// ---------------------------------------------------------------------------------------------------------------------

		return sb.toString();
	}

	public static String getPaging(String pageURL, String search_param, int nowPage, int rowTotal, int blockList,
			int blockPage) {

		int totalPage, startPage, endPage;

		boolean isPrevPage, isNextPage;
		StringBuffer sb; 
		isPrevPage = isNextPage = false;

		totalPage = (int) (rowTotal / blockList);
		if (rowTotal % blockList != 0)
			totalPage++;

		if (nowPage > totalPage)
			nowPage = totalPage;

		startPage = (int) (((nowPage - 1) / blockPage) * blockPage + 1);
		endPage = startPage + blockPage - 1; 

		if (endPage > totalPage)
			endPage = totalPage;

		if (endPage < totalPage)
			isNextPage = true;

		if (startPage > 1)
			isPrevPage = true;

		sb = new StringBuffer();
		// --------------------------------------------------------------------------------------------
		if (isPrevPage) {
			sb.append("<a href ='" + pageURL + "?page=");
			sb.append(nowPage - blockPage);
			sb.append("&");
			sb.append(search_param);
			sb.append("'>��</a>");
		} else
			sb.append("��");

		// -------------------------------------------------------------------------------------------------
		sb.append("|");
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage)
				break;
			if (i == nowPage) { 
				sb.append("&nbsp;<b><font color='#91b72f'>");
				sb.append(i);
				sb.append("</font></b>");
			} else {
				sb.append("&nbsp;<a href='" + pageURL + "?page=");
				sb.append(i);
				sb.append("&");
				sb.append(search_param); //search=name&search_text=1
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		} // end for

		sb.append("&nbsp;|");

		// ----------------------------------------------------------------------------------------------
		if (isNextPage) {
			sb.append("<a href='" + pageURL + "?page=");
			if (nowPage + blockPage > totalPage)
				nowPage = totalPage;
			else
				nowPage = nowPage + blockPage;
			sb.append(nowPage);
			
			sb.append("&");
			sb.append(search_param);
			
			sb.append("'>��</a>");
		} else
			sb.append("��");
		// ---------------------------------------------------------------------------------------------------------------------

		return sb.toString();
	}

}